
import json
import urllib
import uuid
import logging
from threading import Thread

class MsgId(uuid.UUID):
	def __hash__(self):
		return self.int

	@classmethod
	def new(klass):
		return klass(uuid.uuid4().hex)

class Computation(object):
	WAITING  = 0 # A task is waiting when it has not been sent to the shell 
	RUNNING  = 1 # A task is runnnig if it was sent to shell and has not finished.
	FINISHED = 2 # A task is finished if shell got a status message

	def __init__(self,code):
		self.query = code
		self.status = self.WAITING


	def attach(self,kernel):
		self.kernel = kernel
		self.head = mkExecute(self.kernel.user, MsgId.new())
		self.retCode = None

	def __str__(self):
		return "Computation %s for: %s" % (self.headId, self.query)

	def run(self):
		assert self.status == self.WAITING
		request = dict(header= self.head,
			metadata= {},	
			content= mkContent(self.query),
			parent_header= {})
		self.kernel.shell.send(json.dumps(request))
		self.status = self.RUNNING
		tId = self.headId
		assert not self.kernel.running.has_key(tId)
		logging.debug("%s now running (%s)", tId, self.query)
		self.kernel.running[tId] = self

	def __hash__(self):
		return uuid.UUID('{%s}'% self.headId.int)

	def cmp(self, other):
		return (self.count, other.count)

	@property
	def headId(self):
		return self.head['msg_id']

	def failed(self):
		return self.retCode == 'error'

	def finish(self,code):
		assert self.status == self.RUNNING
		self.status = self.FINISHED
		self.retCode = code
				

class EmptyComp(Computation):

	def finish(self,code):
		Computation.finish(self,code)
		assert self.isDone
		logging.debug("%s done.", self.headId)

	@property
	def answer(self):
		return None

	@property
	def isDone(self):
		if self.failed(): return True
		return self.status == self.FINISHED


class ReturnComp(Computation):
	def __init__(self, *args):
		Computation.__init__(self,*args)
		self._answer = None

	def set(self,content):
		assert self.status in (self.FINISHED, self.RUNNING)
		self._answer = str(content['data']['text/plain'])
		logging.debug('%s answer set to "%s"', self.headId, self._answer)

	@property
	def isDone(self):
		if self.failed(): return True
		if self.status != self.FINISHED: return False
		return (self._answer != None)
		
	def finish(self,code):
		Computation.finish(self,code)
		if self.isDone:
			logging.debug("%s done (Result: %s)", self.headId, self._answer)
		else:
			logging.debug("%s finished while expecting result.", self.headId)

	@property
	def answer(self):
		return self._answer







class Kernel():
	BURST = True
	def __init__(self, username='', host='localhost:8888'):
		self.host = host
		self.user = username
		self.status = None
		self.kernel = json.loads(urllib.urlopen("http://%s/kernel"%self.host, data="").read())
		self.running = {}


	def _getTask(self,tId):
		return self.running[tId]
		

	def wait(self):
		done = False
		while not done:
			running = self.running.values()
			done = all(t.isDone for t in running)
			#if any(t.retCode == 'error' for t in running):
			#	break
		return running


	def _open(self, name):
		from websocket import create_connection
		prefix = "%(ws_url)skernel/%(kernel_id)s/" % self.kernel
		logging.debug("Connecting to " + prefix + name)
		return create_connection(prefix + name)

	def evaluate(self, *cmds):
		if self.status == 'dead':
			raise RuntimeError, "Kernel is dead"

		self.iopub = self._open('iopub')
		self.shell = self._open('shell')
		sh_t = Thread(target=self._shell_worker)
		io_t = Thread(target=self._iopub_worker)
		sh_t.daemon = io_t.daemon = True
		if self.BURST: # Use just 1 Sage command
			querySeq = '; '.join(c.query for c in cmds)
			cmd = cmds[-1].__class__(querySeq)
			cmd.attach(self)
			cmd.run()
		else: # Use several
			for c in cmds:
				if not c: continue # None is noop
				c.attach(self)
				c.run()
				
		sh_t.start()
		io_t.start()
		tasks = self.wait()
		if any(t.failed() for t in tasks):
			raise ValueError, "Sage computation failed"
		tasks.sort() # by execution order
		return tasks
		#self.shell.close()
		#self.iopub.close()
		
	def _shell_worker(self):
		log = logging.getLogger('shell')
		##log.addHandler(self.log)
		while self.running:
			response = json.loads(self.shell.recv())
			status = response['metadata']['status']
			log.info("Status " + status)
			ph = response.get('parent_header')
			task = ph and self._getTask(ph['msg_id'])
			if task and not task.isDone:
				log.debug("%s marked to end with status '%s'", task.headId, status)
				task.finish(status)
			
	def _iopub_worker(self):
		log = logging.getLogger('iopub')
		##log.addHandler(self.log)
		while self.running:
			answer = json.loads(self.iopub.recv())
			if answer.get('msg_type') == 'pyout':
				log.info("Out[%(execution_count)d] = %(data)s", answer['content'])
				pId = answer['parent_header']['msg_id']
				task = self._getTask(pId)
				if not task.isDone:
					log.debug("Got match for %s", pId)
					task.set(answer['content'])
			elif answer.get('msg_type') == 'pyin':
				log.info("In[%(execution_count)d] = %(code)s" % answer['content'])
				self.count = int(answer['content']['execution_count'])
			elif answer.get('msg_type') == 'status':
				self.status = answer['content']['execution_state']
				log.debug("Status " + self.status)
			elif answer.get('msg_type') == 'pyerr':
				content = answer['content']
				log.error("Sage ERROR: " + content.get('evalue'))
				for l in content.get('traceback'):
					log.error(l)
			elif answer.get('msg_type') == 'stream':
				log.info(answer['content']['data'])
			elif answer.get('content') and answer.get('content').get('execution_state') == 'dead':
				log.debug("Kernel is dead")
				self.status = 'dead'
				return
			else:
				log.debug("Got " + answer)


def mkExecute(username,session):
	return dict(msg_id=str(MsgId.new()),
				username=username,
				session=str(session),
				msg_type="execute_request")


#host = 'http://sagecell.sagemath.org/kernel'

def mkContent(code):
	uExpr = {'_sagecell_files': "sys._sage_.new_files()"}
	return dict(code=code,
				silent=False,
				user_variables=[],
				user_expressions=uExpr,
				allow_stdin=False)



if __name__ == '__main__':
	logging.basicConfig(level=logging.INFO,
		format="%(levelname)s:%(name)s - %(message)s")
	k = Kernel()
	result = k.evaluate(EmptyComp('x = factorial(3)'),
				EmptyComp('IT = None'),
				EmptyComp('y = factor(2013)'),
				ReturnComp('x * y'))
	for r in result:
		print r.query, '=>', r.answer

	