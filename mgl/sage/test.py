from websocket import create_connection
import json
import urllib

#host = 'http://sagecell.sagemath.org/kernel'
host = 'http://localhost:8888'

k = json.loads(urllib.urlopen(host + '/kernel', data="").read())

prefix = k['ws_url'] + 'kernel/' + k['kernel_id']
print prefix

iopub = create_connection(prefix + '/iopub')
shell = create_connection(prefix + '/shell')

def request(exp):
	return json.dumps({
	    "header": {
	        "msg_id": "37B1EF5AB1A14230BC9251C65E3220C9",
	        "username": "username",
	        "session": "313C08D5FC16438E9C35D48771EC74D7",
	        "msg_type": "execute_request"
	    },
	    "metadata": {},
	    "content": {
	        "code": exp,
	        "silent": False,
	        "user_variables": [],
	        "user_expressions": {
	            "_sagecell_files": "sys._sage_.new_files()"
	        },
	        "allow_stdin": False
	    },
	    "parent_header": {}
	})

def permalink(exp):
	msg = json.dumps({
		    "header": {
		        "msg_type": "execute_request"
		    },
		    "metadata": {},
		    "content": {
		        "code": exp
		    }
		})
	return json.loads(urllib.urlopen(host + '/permalink', data="message="+msg).read())

cmd = 'factor(2013)'
shell.send(request(cmd))
print permalink(cmd)

response = json.loads(shell.recv())
print response['metadata']['status']

while 1:
	answer = json.loads(iopub.recv())
	if answer.get('msg_type') == 'pyout':
		print answer['content']['data']['text/plain']
		break
shell.close()
iopub.close()