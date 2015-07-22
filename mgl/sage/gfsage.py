from kernel import Kernel, EmptyComp, ReturnComp
import logging
from gf import GF, commandsLex, readPGF


preludePath = "nlgf/prelude.sage"

class ContextStack(list):
	"""Stack for embedded contexts"""

	def new(self,name):
		self.push(Context(name))
	
	def update(self, **kv):
		"""Extend a variable dict by walking the contexts"""
		binds = {}
		for s in self:
			binds.update(s.vars)
		binds.update(kv)
		return binds

	@property 
	def top(self):
		return self[-1]

	def push(self,context):
		self.append(context)

	def pop(self):
		if len(self) <= 1:
			raise IndexError, "Already at toplevel"
		return list.pop(self)

	def syncPrompt(self):
		logging.info("Context is '%s'", self.top.name)
		self.gf1.prompt = ':'.join(c.name for c in self if c.name != 'toplevel')

	def eval(self,*cmds):
		variables = self.update(IT=self.it())
		allCmds = [EmptyComp("%s = %s"%kv) for kv in variables.items()]
		allCmds.extend(cmds)
		logging.debug("In context '%s', evaluating: %s", self.top.name, cmds)
		return self.kernel.evaluate(*allCmds)[-(len(cmds)):]

	def _unwrap(self, s):
		return s.strip("' ")

	def Assign(self,v,exp):
		self.top.vars[v] = self.eval(ReturnComp(exp))[0].answer
		logging.info("Local vars: %s", self.top.vars)
		return None
		
	def Compute(self,exp,kind):
		assert kind in self.top.kinds
		rs = self.eval(ReturnComp(exp))
		self.kind = kind 
		r = rs[0].answer
		self.top.last[kind] = r
		return r and self._unwrap(r)

	def IsAppEqual(self,exp1,exp2):
		from math import log
		test = "float((%s) - (%s))"%(exp1,exp2)
		logging.debug("Testing %s", test)
		rs = self.eval(ReturnComp(test))
		dxy = abs(float(rs[0].answer))
		if dxy == 0.0: return `True`
		d = -int(log(dxy, 10))
		if d <=0: return `False`
		return `(True, d)`
	
	def it(self):
		c = self.top
		return c.last[c.kind]

	def assume(self,p):
		assume(p)
		self.asms.append(p)
		
	def Approximate(self,exp):
		r = self.eval(ReturnComp('(%s).n()'%exp))[0].answer
		# Truncating digits: This is a hack to cope with GF inability to
		# correctly parse floats with long fractional parts.
		return r and self._unwrap(r)[:8]

	def ApproximateTo(self,exp,d) :
		r = self.eval(ReturnComp('(%s).n(digits=%d)'%(exp,d)))[0].answer
		return r and self._unwrap(r)

	def begin_block(self, name):
		name = name.strip()
		self.new(name)
		self.syncPrompt()
		return 'BEGIN %s' % name

	def end_block(self, name):
		name = name.strip()
		assert name == self.top.name, "Attempt to pop invalid context"
		c = self.pop()
		assert name == c.name, "Attempt to pop out-of-sequence context"
		self.syncPrompt()
		return 'END %s' % name
   
	



class Context:
	kinds = 'Num Tensor Fun Set'.split()

	def __init__(self,name,vars={},asms=[]):
		#self.locals = dict(locals())
		self.asms = list(asms) # copy
		self.vars = dict(vars) # copy
		self.name = name
		self.last = dict([(k,None) for k in self.kinds])
		self.kind = 'Num'
		
	def __repr__(self):
		return "<gf context '%s'>" % self.name


class GFSage(object):
	def __init__(self,pgf,args):
		self.voice = None
		iLang = args.input.capitalize()
		oLang = args.output.capitalize()
		self.gf1 = GF(pgf, iLang,'Sage', 'Command',lexer=commandsLex)
		self.gf2 = GF(pgf, 'Sage', oLang, 'Answer') 
		self.args = args
		self.environment = ContextStack()
		self.environment.new('toplevel')
		self.environment.gf1 = self.gf1 # From prompt to change
		self.environment.kernel = None # to be set on evaluation
	

	def evaluate(self,command):
		"""Pass command to Sagecell"""
		mainCmd = command.rstrip(' ;')
		self.environment.kernel = Kernel('gfsage')
		return eval("self.environment." + mainCmd)
		
	def say(self,text):
		if self.voice:
			self.voice.say(text)

	def run(self):
		def loop(text):
			ps = self.parseQuery(text)
			if len(ps)>1:
				for j,p in enumerate(ps):
					logging.info("Parsing %d: %s", j, p)
				# raise ValueError, "Ambiguous command (%d parsings)" % len(ps)
				logging.info("! Ambiguous command (%d parsings)", len(ps))
			elif not ps:
				raise ValueError, "No parse for '%s'"%text
			query = ps.pop()
			cmd = self.gf1.linearize(query)
			lastQueryVal = computeQuery(query)
			logging.debug(cmd)
			try:
				result = self.evaluate(cmd)
			except ValueError:
				logging.error("Computation failed")
				return
			if result:
				logging.info("Result is %s", result)
				for a in self.parseAnswer(result, lastQueryVal):
					logging.debug(a)
					text = self.gf2.linearize(a)
					print text
					self.say(text)
			else:
				logging.info("No result for '%s'", text)
		self.gf1.interact(loop)

	def parseQuery(self, a):
		return {e for e in self.gf1.parse(a, compute=lambda t:mockCompute(purgeRationals(purgeFloats(t))))}

	def parseAnswer(self, a, queryVal):
		parsed = {e for e in self.gf2.parse(a) if e.unpack()[0] in  ('Simple','Yes','No','YesApprox')}
		purged = {purgeFloats(e) for e in parsed}
		rationals = {purgeRationals(e) for e in purged}
		return {completeReturn(e,queryVal,self.args.feedback) for e in rationals}
		



## Transfer functions to reduce the ambiguity and paraphrase the Sage code



def purgeRationals(expr):
	"""Convert all quotients of integers to fun 'rational'."""
	from pgf import Expr
	uExp = expr.unpack()
	def mkIntLiteral(expr):
		uExp = expr.unpack()
		if type(uExp) == tuple and uExp[0] == 'float2num' and int(uExp[1][0]) == uExp[1][0]:
			return Expr('int2num', uExp[1])
		else:
			return expr
	if type(uExp) == tuple:
		(h,args) = uExp
		if h in ("quotient", "divide", "bin_over"):
			return Expr('nums1_rational', map(mkIntLiteral, args))
		elif not h:
			return expr
		else:
			return Expr(h, map(purgeRationals, args))
	else:
		return expr


def mockCompute(e):
	"""A hack to mimick the GF compute action
	on the 'def' judgements of the "Commands" module."""
	from pgf import Expr
	fromNum = lambda e: Expr('fromNum', [e])
	num = Expr('Num',[])
	compute = lambda e: Expr('Compute', [num, fromNum(e)])
	baseValNum = lambda x,y: Expr('BaseValNum', [x,y])
	uExp = e.unpack()
	if type(uExp) == tuple:
		(head,args) = uExp
		if len(args)==2:
			x,y = args
			if head == 'addTo':
				return compute(Expr('plus', [baseValNum(x,y)]))
			elif head == 'subtractFrom':
				return compute(Expr('minus', [y, x]))
			elif head == 'multiplyBy':
				return compute(Expr('times', [baseValNum(x,y)]))
			elif head == 'divideBy':
				return compute(Expr('divide', [x, y]))
	return e


def purgeFloats(expr):
	from pgf import Expr
	uExp = expr.unpack()
	if type(uExp) == tuple:
		(s,args) = uExp
		if s == 'float2num':
			x = args[0].unpack()
			if type(x) != float:
				raise TypeError, "float2num: Must be float"
			i = int(x)
			if i == x:
				return Expr('int2num',[Expr(i)])
			else:
				return expr
		elif not s:  # Metavariable ?
			return expr
		else:
			return Expr(s, map(purgeFloats, args))
	else:
		return expr


def computeQuery(e):
	from pgf import Expr
	(head,args) = e.unpack()
	if head == 'Compute':
		return args[1]
	elif head == 'Approximate' or head == 'ApproximateTo':
		return Expr('fromNum', args)
	else:
		return e

def completeReturn(e, queryVal, feedback=False):
	from pgf import Expr
	(head,args) = e.unpack()
	if head == 'Simple':
		(kind,ansVal) = args
		if feedback:
			return Expr('FeedBack', [kind,queryVal,ansVal])
		else:
			return e
	return e



def printLanguages(pgf):
	"""Print the natural languages only"""
	n = len("Commands")
	for l in pgf.languages:
		if l.endswith('Sage'): continue
		print l[n:]

	

if __name__ == '__main__':
	import argparse
	from voice import getVoice

	DefLang = 'Eng'
	ap = argparse.ArgumentParser(description='GF/Sage interoperation')
	ap.add_argument('-i','--input',
		action='store', default=DefLang,
		help='Query in LANG', metavar='LANG')
	ap.add_argument('-o', '--output',
		action='store', default=None,
		help='Get answers in LANG', metavar='LANG')
	ap.add_argument('--log', metavar='LEVEL',
		action='store', default='WARN',
		help='Set the information LEVEL')
	ap.add_argument('--list-langs', action='store_true',
		help='List available languages')
	ap.add_argument('-F', '--feedback',
		action='store_true',
		help='Restate the query in the answer')
	ap.add_argument('-v', '--speech',
		action='append', nargs='?',
		help='Use spoken output (VOICE=? means ', metavar='VOICE')

	args = ap.parse_args()
	if not args.output:
		args.output = args.input

	pgf = readPGF("lib/Commands.pgf")

	if args.list_langs:
		printLanguages(pgf)
	elif args.speech == ['?']:
			print "Voices for", args.output.capitalize(), ":",
			for v in getVoice().available(args.output):
				print v.voice,
			print
	else:
		logging.basicConfig(
			level=args.log.upper(),
			format='%(name)s %(levelname)s - %(message)s')
		
		gs = GFSage(pgf,args)
		if args.speech:
			sOpt = args.speech[0]
			if sOpt:
				gs.voice = getVoice()(sOpt)
			else:
				gs.voice = getVoice().default(args.output)
		gs.run()
