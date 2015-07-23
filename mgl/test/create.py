def extractAbs(pattern, depth):
	from glob import glob
	from sys import stderr
	import re
	fun_re = re.compile(r'fun\s*$')
	isFun_re= re.compile(r'(\w+)\s+:\s+(.*);')
	multiFun_re = re.compile(r'([\w,\s]+):\s+(.*)')
	multilinFun_re = re.compile(r'(\w+)\s*,$')
		
	def generate_random(s,number=1):
		print "gr -number=%d -depth=%d %s" % (number,depth,s)

	def prFuns(funs,args):
		iargs = (len(args.split('->'))-1)*' ?'
		for fun in funs:
			generate_random(fun.strip() + iargs)

	for path in glob(pattern):
		print>>stderr, "Entering " + path
		inFun = False
		multilinFun = []
		inComment = 0
		for line in open(path,'rt').readlines():
			line = line.strip()
			if not line: continue
			if line[:2] == '{-':
				inComment += 1
			elif line[:2] == '-}':
				inComment -= 1
				continue
			if inComment:
				continue
			assert inComment >=0
			if inFun:
				m = isFun_re.match(line)
				if m:
					multilinFun.append(m.group(1))
					prFuns(multilinFun, m.group(2))
					multilinFun = []
					continue
				m = multiFun_re.match(line)
				if m:
					multilinFun.extend(m.group(1).split(','))
					prFuns(multilinFun, m.group(2))
					multilinFun = []
					continue
				m = multilinFun_re.match(line)
				if m:
					multilinFun.append(m.group(1))
					continue
			elif fun_re.match(line):
				inFun = True
				continue
	
def mkTreebank(samples_path):
	from subprocess import Popen, PIPE
	from os import environ
	p = Popen(environ['GF'] + ' --run OpenMath.pgf',
			executable= environ['GF'], shell=False,stdin=PIPE)
	s = open(samples_path,'r')
	for line in s.readlines():
		print line
		p.stdin.write(line + '\n')
		p.stdin.flush()
	s.close()

if __name__ == '__main__':
	from sys import argv, exit, stdin, stderr
	if argv[1] == 'gr':
		extractAbs(argv[2], int(argv[3]))
		exit(0)

	if argv[1] == 'clean':
		samples = open(argv[2]).readlines()
		n = 0
		for line in stdin.readlines():
			line = line.strip()
			if not line: continue
			if 'no trees found' in line:
				print>>stderr, "No trees for: " + samples[n]
				print "-- no trees: " + samples[n],
			elif 'not in scope' in line:
				print>>stderr, "Not in scope: " + samples[n]
				print "-- not in scope: " + samples[n],
			else:
				print line
			n += 1
		exit(0)

	if argv[1] == 'treebank':
		for line in stdin.readlines():
			line = line.strip()
			if line[:2] == '--':
				print line
			print 'lin -treebank -lang=%s %s' % (argv[2],line)
		exit(0)

	if argv[1] == 'save':
		import json
		prefix = argv[2]
		blanks = 0
		treebank = []
		for line in stdin.readlines():
			line = line.strip()
			j = line.find(':')
			if j<0: continue
			if line.find(prefix)==0:
				if line[:j] == prefix: # Abstract
					new = {'tree': line[(j+1):].strip()}
				else: # Concrete
					cnc = line[len(prefix):j].lower()
					new[cnc] = line[(j+1):].strip()
					treebank.append(new)
					new = None
			else:
				print>>stderr, line
		print json.dumps(treebank, indent=4)

	if argv[1] == 'ldiff':
		import json, subprocess
		GF = '/Users/saludes/.cabal/bin/gf'
		p = subprocess.Popen(GF + ' --run ../OpenMath.pgf',
							 stdin = subprocess.PIPE,
							 stdout = subprocess.PIPE, shell=True)

		treebank = json.load(open(argv[2]))
		files = {}
		f1 = open(argv[2]+'.1','w')
		for d in treebank:
			t = d['tree']
			for l,line in d.items():
				if l == 'tree': continue
				if not files.has_key(l):
					files[l] = [open('%s.%d'%(l,k), 'w') for k in (0,1)]
				print t
				p.stdin.write('l -lang=%s %s\n' % (l.capitalize(),t))
				p.stdin.flush()
				out = ''
				while not out:
					out = p.stdout.readline().strip()
				files[l][0].write(out + '\n')
				files[l][1].write(d[l] + '\n')

		for fs in files.values():
			for f in fs:
				f.close()