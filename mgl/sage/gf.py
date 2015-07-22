import pgf, readline, sets, sys

ENCODING = sys.stdin.encoding or 'UTF-8'

def readPGF(pgfPath, verbose=False):
	if verbose:
			print "loading " + pgfArg + "...",
			sys.stdout.flush()
	p = pgf.readPGF(pgfPath)
	if verbose:
			print "done"
	return p



class GF():
	def __init__(self, pgf, iLang, oLang, category,verbose=False, lexer=None):
		self.pgf = pgf
		self.lexer = lexer
		lang1 = self.findLanguage(iLang)
		lang2 = self.findLanguage(oLang)
		self.category = category
		self.lang = (lang1,lang2)
		self.history = ".history-%s" % iLang.lower()


	def findLanguage(self,name):
		langs = [l for l in self.pgf.languages if l.endswith(name)]
		if len(langs) > 1:
			raise KeyError, "Ambiguous language name"
		elif not langs:
			raise KeyError, "No such language"
		return self.pgf.languages[langs[0]]


	def complete(self, prefix, state):
		try:
			if state == 0:
				line = readline.get_line_buffer()
				line = line[0:readline.get_begidx()].decode(ENCODING)
				if self.lexer:
					self.options = self.lang[0].getCompletions(tokens=self.lexer(line), prefix=prefix)
				else:
					self.options = self.lang[0].getCompletions(line, prefix=prefix)
				self.tokens = []

			if len(self.tokens) > 50:
				return None
			while len(self.tokens) <= state:
				try:
					(p,t) = self.options.next()
				except StopIteration:
					return None
				if not t in self.tokens:
					self.tokens.append(t)
			return self.tokens[state] + " "

		except:
			print "Raised error while completing:", sys.exc_info()

	def parse(self,text,compute=None):
		compute = compute or (lambda x: x)
		parsings = {}
		try:
			if self.lexer:
				parIter = self.lang[0].parse(tokens=self.lexer(text),cat=self.category)
			else:
				parIter = self.lang[0].parse(text, cat=self.category)
			for (_,t) in parIter:
				ct = compute(t)
				if not str(ct) in parsings:
					parsings[str(ct)] = ct
		except pgf.ParseError:
			print "No parsing for", text
			return []
		return parsings.values()

	def translate(self,text):
		try:
			parsed = self.parse(text)
		except ParseError:
			return []
		return [self.linearize(p) for (_,p) in parsed]

	def linearize(self,exp):
		return self.lang[1].linearize(exp)

	def interact(self,f,prompt=""):
		self.prompt = prompt
		readline.set_completer(self.complete)
		readline.parse_and_bind("tab: complete")
		readline.set_completer(self.complete)
		try:
			readline.read_history_file(self.history)
		except IOError:
			pass
		while True:
			try:
				a = raw_input(self.prompt + '> ').decode(ENCODING)
			except EOFError:
				readline.write_history_file(self.history)
				print
				return
			if a:
				try:
					f(a)
				except ValueError as e:
					print "Value error: ", e



def commandsLex(text):
	"""Tokenize words, integers, floats and factions"""
	import re
	just0 = lambda m: [m.group(0)]
	numberRe   = (re.compile(r'[+\-]?\d+(\.\d+)?'), just0)
	fractionRe = (re.compile(r'([+\-]?\d+)\W*/\W*(\d+)'), lambda m: [m.group(1),'/', m.group(2)])
	alphaRe    = (re.compile(r'\w+', re.UNICODE), lambda m: [m.group(0).encode(ENCODING)])
	punctRe    = (re.compile(r'[,;.?]'), just0)
	tokens = []
	text = text.strip()
	while text:
		for r,f in (fractionRe,numberRe,alphaRe,punctRe): # Match first fraction, then number, then alpha
			m = r.match(text)
			if m:
				tokens.extend(f(m))
				text = text[m.end():].strip()
				break
	return tokens



if __name__ == '__main__':
	c = GF(readPGF("Commands-noGer.pgf"),'Spa','Spa', 'Command', lexer=commandsLex)
	def repl(a):
		for p in c.parse(a): print p
	c.interact(repl)
