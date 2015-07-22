import subprocess

class Voice(object):
	def __init__(self,name):
		self.voice = name

	@classmethod
	def available(klass,language):
		return []

	@classmethod
	def default(klass,language):
		for v in klass.available(language):
			return v

	def say(self,text):
		pass

	def __repr__(self):
		return "<%s '%s'>"%(self.__class__.__name__,self.voice)


class OSXVoice(Voice):
	"""Built-in voice output in OS X"""
	@classmethod
	def available(klass,language):
		import re
		lang = language.lower()
		if lang.startswith('spa'):
			lang = 'esp'
		if lang.startswith('ger'):
			lang = 'deu'
		lang = lang[:2]
		for l in subprocess.check_output(
			"say -v?",
			shell=True).split('\n'):
			name = l[:20].strip()
			lg = l[20:25].strip()
			desc = l[l.find('#'):]
			if lg.startswith(lang):
				v = OSXVoice(name)
				v.description = desc[2:]
				yield v


	def say(self,text):
		subprocess.call(['say','-v',self.voice, text])


def getVoice():
	"""Returns voice class for current OS"""
	import platform
	name = platform.system()
	if name == 'Darwin':
		return OSXVoice
	else:
		raise ValueError, "Voice not available for " + name


			

if __name__ == '__main__':
	vc = getVoice()
	for language in ('german','spanish', 'english'):
		print language, "voices:"
		for v in vc.available(language):
			print v
			v.say(v.description)