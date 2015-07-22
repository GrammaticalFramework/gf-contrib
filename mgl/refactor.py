import re
ENCODING = 'utf8'
EQ_re = re.compile(r'(\S+)\s*=\s*([^;]+);')
BEGIN_COMMENT = re.compile(r'\{-')
END_COMMENT = re.compile(r'-\}')

fullLangs = 'bulgarian catalan english french german italian romanian polish '
fullLangs += 'spanish swedish finnish'
lang_name = dict([(l.capitalize()[:3],l) for l in fullLangs.split()])
lang_name['Ron'] = lang_name['Rom'] # roManian, but Ron
del lang_name['Rom']


class Stem:
	POS = 'CN N V V2 V3 VQ VS A A2 PN S Prep Subj'.split()
	def __init__(self,stem,pos):
		if pos not in self.POS:
			raise ValueError, "Not a valid POS: " + pos
		self.stem = stem
		self.pos = pos
		
	def __eq__(s1,s2):
		return s1.stem == s2.stem and s1.pos == s2.pos
		
	def __hash__(self):
		return hash(self.unstem())
		
	def unstem(self):
		return self.stem + '_' + self.pos
		
	def __repr__(self):
		return self.stem + '/' + self.pos
		
	def __cmp__(s1,s2):
		c = cmp(s1.pos, s2.pos)
		if c == 0:
			return cmp(s1.stem, s2.stem)
		else:
			return c
			
	@classmethod	
	def stem(klass,id):
		ids = id.split('_')
		if len(ids) < 2:
			raise ValueError, "Not a stem."
		s = '_'.join(ids[:-1])
		pos = ids[-1]
		return Stem(s,pos)


def ReplaceLexicon(lang):
	"""This function will replace 'WebaltLexicon' with 'Lexicon'
	in all files of language <lang> in OpenMath, Ground and mathres directory."""
	from glob import glob
	import os
	suffix = get_suffix(lang)
	dirs = 'OpenMath Ground mathres Operations'.split()
	for dir in dirs:
		for path in glob(dir + '/*%s.gf' % suffix):
			f1 = open(path)
			f2 = open(path + '.copy','w')
			for l in f1.readlines():
				l2 = l.replace('Webalt','')
				f2.write(l2)
			f2.close()
			os.rename(path + '.copy', path)
			print "Wrote", path
		
def get_suffix(lang):
	assert len(lang) == 3, "Not an ISO code: " + lang
	return lang.capitalize()
	
def clean_line(line):
	comment_loc = line.find('--')
	if comment_loc >= 0:
		return line[:comment_loc]
	else:
		return line
				
	
		
		
def GetStems(base, lang):
	import re
	suffix = get_suffix(lang)
	stems = []
	stemf = open(base % suffix)	
	for line in stemf.readlines():
		line = clean_line(line)
		m = EQ_re.search(line)
		if not m: continue
		k = m.group(1)
		try:
			k = Stem.stem(k)
		except ValueError:
			continue
		assert k not in stems, "%s is already in." % k
		stems.append(k)
	return stems
	
def ConvertFile(base,lang1,lang2):
	"""Convert a gf grammar file for lang1 to lang2 by
	replacing occurences of ISO Codes for languages."""
	from glob import glob
	sf1 = get_suffix(lang1)
	sf2 = get_suffix(lang2)
	assert not glob(base % sf2), (base % sf2) + " already exists."
	f1 = open(base % sf1)
	f2 = open(base % sf2, 'w')
	for line in f1.readlines():
		line = line.replace(sf1,sf2)
		f2.write(line)
	f1.close()
	f2.close()
	return (base % sf2)
	
def mkLaTeX(module_name):
	"""Convert an abstract for module_name to a concrete for LaTeX"""
	from glob import glob
	from os.path import dirname, abspath
	import os
	import re
	dir = dirname(abspath(__file__)) + '/OpenMath/'
	old_path = dir + module_name + '.gf'
	abs_files = glob(old_path)
	assert len(abs_files) == 1, `old_path`
	f1 = open(abs_files[0],'r')
	new_path = dir + module_name + 'LaTeX.gf'
	f2 = open(new_path,'w')
	headerRe = re.compile(r"abstract\s+(\w+)\s+=")
	for l in f1.readlines():
		m = headerRe.match(l)
		if m:
			assert m.group(1) == module_name, "File header doesn't match file name"
			f2.write("concrete {0}LaTeX of {0} = \n".format(module_name))
		else:
			f2.write(l)
	f1.close()
	f2.close()
	print "Created file", new_path
	os.system('svn add ' + new_path)
	
def StemDefinitions(base,lang=None):
	"""Return a dictionnary with keys in stems and values
	the definition of given stem in <lang> instance of file <base>"""
	if lang:
		sf = get_suffix(lang)
	f = open(lang and base % sf or base)
	defs = {}
	in_comment = False
	for j,line in enumerate(f.readlines()):
		line = clean_line(line)
		if END_COMMENT.search(line):
			assert in_comment, "in comment in line %d" % j
			in_comment = False
			continue
		if BEGIN_COMMENT.search(line):
			assert not in_comment, "not in comment in line %d" % j
			in_comment = True
			continue
		if in_comment: continue
		m = EQ_re.search(line)
		if not m: continue
		lhs = m.group(1)
		rhs = m.group(2).decode(ENCODING)
		try:
			key = Stem.stem(lhs)
		except ValueError:
			print "Skipping:", line
			continue
		if defs.has_key(key):
			raise KeyError, "Definition already given for " + `key`
		else:
			defs[key] = (rhs,j)
	return defs
		
	
def atomic2Lex(lang1,lang2):
	import os
	newLex = 'lexicon/Lexicon%s.gf'
	atomLex = 'lexicon/AtomicLexicon%s.gf'
	defs1 = StemDefinitions(newLex,lang1)
	defs2 = StemDefinitions(atomLex,lang2)
	print "Base language:",lang1.capitalize()
	print "Target language:", lang2.capitalize()
	newdefs = set(defs2) - set(defs1)
	print "There are %d new declarations." % len(newdefs)
	undefs = set(defs1) - set(defs2)
	print "There are %d undefined." % len(undefs)
	defs = set(defs1) & set(defs2)
	print "%d definitions moved." % len(defs)
	npath = ConvertFile(newLex, lang1, lang2)
	print "Converted to file", npath
	os.system('cp %s %s.orig' % (2*(npath,)))
	f1 = open(npath + '.orig')
	f2 = open(npath,'w')
	alllines = dict((j,k) for (k,(_,j)) in defs1.items())
	p = f2.write
	for j,line in enumerate(f1.readlines()):
		if j in alllines:
			s = alllines[j]
			if s in defs2: # Is defined in new
				p('\t%s = %s ;\n' % (s.unstem(),defs2[s][0].encode(ENCODING)))
			else:
				p('\t%s = ? -- %s ;\n' % (s.unstem(),defs1[s][0].encode(ENCODING)))
		else:
			p(line)
	f2.close()
	f1.close()



def moveAbs():
	from subprocess import call
	from glob import glob
	from os.path import splitext, basename
	def move(path,dir):
		if call(('mv', '-i', path, dir + '/' + basename(path)))!=0:
			raise RuntimeError, "cannot move " + path + " to " + dir
		
	for dir in 'Ground OpenMath Operations'.split():
		for path in glob(dir + '/*.gf'):
			base,ext = splitext(path)
			assert ext == '.gf'
			if base[-3:] in lang_name:
				lang_dir = lang_name[base[-3:]]
				move(path,lang_dir)
			elif base[-1] == 'I': # incomplete concrete
				move(path,'resources')
			elif 'LaTeX' in path: # latex concrete
				move(path,'latex')
			else: # Abstract
				move(path,'abstract')
	

def toISO2(lang):
	"""from ISO3 to ISO2"""
	assert lang in lang_name, "Not known " + lang
	iso2 = lang.lower()[:2]
	if iso2 == 'en': return 'en_US'
	return iso2


def mkFile(lang,path_temp,template):
	from string import Template
	iso = get_suffix(lang)
	iso2 = toISO2(iso)
	fulllang = lang_name[iso]
	txt = Template(template).substitute(iso_lang=iso, iso_short=iso2)
	path = path_temp % (fulllang, iso)
	f = open(path, 'w')
	f.write(txt)
	f.close()
	print path + " created."

	
	
mkOperations = lambda l: mkFile(l, '%s/Operations%s.gf', """{-
Copyright 2006,2008 WebALT Inc.
This file is part of the Mathematical Grammar Library, MGL.

MGL is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

MGL is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with MGL.  If not, see <http://www.gnu.org/licenses/>.


History:
$$Rev::               $$:  Revision of last commit
$$Author::            $$:  Author of last commit
$$Date::              $$:  Date of last commit

-}

--# -path=present:../abstract:../resources

concrete Operations$iso_lang of Operations =
    Ground$iso_lang **
    OperationsI
with
    (Lexicon = Lexicon$iso_lang),
    (Math = Math$iso_lang) ;
""")

mkTest = lambda l: mkFile(l, '%s/Test%s.gf', """{-
Copyright 2006,2008 WebALT Inc.
This file is part of the Mathematical Grammar Library, MGL.

MGL is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

MGL is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with MGL.  If not, see <http://www.gnu.org/licenses/>.


History:
$$Rev::               $$:  Revision of last commit
$$Author:: saludes   $$:  Author of last commit
$$Date:: 2008-09-29 1#$$:  Date of last commit

-}

--# -path=../resources:../abstract:present

concrete Test$iso_lang of Test =
    Operations$iso_lang, 
    OpenMath$iso_lang **
{
flags
    language = $iso_short ;
} ;""")



if __name__ == '__main__':
	if False: # Refactor to new format
		ReplaceLexicon('ron')
		atomic2Lex('eng','ron')
	
	if False: # Fin lexical productions
		common = StemDefinitions('lexicon/CommonL.gf')
		eng,fin  = [StemDefinitions('lexicon/Lexicon%s.gf',l) for l in ('eng','fin')]
		notinFin = (set(eng) | set(common)) - set(fin)
		print "CN's not in Fin:"
		for s in notinFin:
			if s.pos == 'CN': print s
		verb = 'V[123SQ]'
		import re
		verb_re = re.compile('^'+verb)
		print verb + "'s not in Fin:"
		for s in notinFin:
			if verb_re.match(s.pos): print s
	
	if False: # Make LaTeX versions
		from glob import glob
		import re
		from os.path import basename
		cncRe = re.compile(r'\w+[A-z][a-z][a-z].gf$')
		incompleteRe = re.compile(r'\w+I.gf$')
		absRe = re.compile(r'^(\w+).gf$')
		latexRe = re.compile(r'^(\w+)LaTeX.gf')
		modules = set()
		for l in glob('OpenMath/*.gf'):
			b = basename(l)
			if cncRe.match(b): continue
			if incompleteRe.match(b): continue
			if latexRe.match(b): continue
			m = absRe.match(b)
			assert m, "Unmatced abs: " + b 
			modules.add(m.group(1))
		for l in glob('OpenMath/*LaTeX.gf'):
			m = latexRe.match(basename(l))
			if m.group(1) in modules:
				print "Found LaTeX concrete for", m.group(1)
				modules.remove(m.group(1))
		for md in  modules:
			mkLaTeX(md)
	
	if False: # new directory structure
		#moveLexicon()
		moveAbs()
	
	if False:
		samples = 'samples.txt'
		#from sys import stdout
		extractAbs('abstract/*.gf',samples)
		mkTreebank(samples)

	if True:
		for l in lang_name:
			mkOperations(l)
			mkTest(l)


	

		

		
		
	
	