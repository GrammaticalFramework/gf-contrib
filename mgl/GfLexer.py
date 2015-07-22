from pygments.lexer import Lexer, RegexLexer, bygroups, include, do_insertions
from pygments.token import *


class GfLexer(RegexLexer):
	"""
	A Gf lexer.
	"""
	name = 'Grammatical Framework'
	aliases = ['gf']
	filenames = ['*.gf']
	mimetypes = ['text/x-gf']

	modType = "incomplete abstract resource interface concrete instance transfer".split()

	other = "with ** open".split()
	
	topDef = "cat fun data def param oper lincat lindef lin printname flags".split()

	ascii = ['NUL','SOH','[SE]TX','EOT','ENQ','ACK',
			 'BEL','BS','HT','LF','VT','FF','CR','S[OI]','DLE',
			 'DC[1-4]','NAK','SYN','ETB','CAN',
			 'EM','SUB','ESC','[FGRU]S','SP','DEL']
			 

	tokens = {
		'root': [
			# Whitespace:
			(r'\s+', Text),
			#(r'--\s*|.*$', Comment.Doc),
			(r'--#.*$', Comment.Single),
			(r'--(?![!#$%&*+./<=>?@\^|_~]).*?$', Comment.Single),
			(r'{-', Comment.Multiline, 'comment'),
			# Lexemes:
			#  Identifiers
			(r'\b(incomplete\b)?(%s)\s+(\S+) of (\S+)\s*=\s*' % '|'.join(modType),
				bygroups(Keyword.Reserved, Keyword.Reserved, Name.Variable, Name.Variable), 'module'),
			(r'\bmodule\b', Keyword.Reserved, 'module'),
			(r'\berror\b', Name.Exception),
			#  Operators
			(r'\\(?![:!#$%&*+.\\/<=>?@^|~-]+)', Name.Function), # lambda operator
			(r'(<-|::|->|=>|=)(?![:!#$%&*+.\\/<=>?@^|~-]+)', Operator.Word), # specials
			(r':[:!#$%&*+.\\/<=>?@^|~-]*', Keyword.Type), # Constructor operators
			(r'[:!#$%&*+.\\/<=>?@^|~-]+', Operator), # Other operators
			#  Numbers
			(r'\d+[eE][+-]?\d+', Number.Float),
			(r'\d+\.\d+([eE][+-]?\d+)?', Number.Float),
			(r'0[oO][0-7]+', Number.Oct),
			(r'0[xX][\da-fA-F]+', Number.Hex),
			(r'\d+', Number.Integer),
			#  Character/String Literals
			(r"'", String.Char, 'character'),
			(r'"', String, 'string'),
			#  Special
			(r'\[\]', Keyword.Type),
			(r'\(\)', Name.Builtin),
			(r'[][(),;`{}]', Punctuation),
		],
		'import': [
			# Import statements
			(r'\s+', Text),
			(r'"', String, 'string'),
			# after "funclist" state
			(r'\)', Punctuation, '#pop'),
			(r'qualified\b', Keyword),
			# import X as Y
			(r'([A-Z][a-zA-Z0-9_.]*)(\s+)(as)(\s+)([A-Z][a-zA-Z0-9_.]*)',
			 bygroups(Name.Variable, Text, Keyword, Text, Name), '#pop'),
			# import X hiding (functions)
			(r'([A-Z][a-zA-Z0-9_.]*)(\s+)(hiding)(\s+)(\()',
			 bygroups(Name.Variable, Text, Keyword, Text, Punctuation), 'funclist'),
			# import X (functions)
			(r'([A-Z][a-zA-Z0-9_.]*)(\s+)(\()',
			 bygroups(Name.Variable, Text, Punctuation), 'funclist'),
			# import X
			(r'[a-zA-Z0-9_.]+', Name.Variable, '#pop'),
		],
		'module': [
			(r'\s+', Text),
			(r'([A-Z][a-zA-Z0-9_.]*),', bygroups(Name.Variable), 'module'),
			(r'([A-Z][a-zA-Z0-9_.]*)\s+\*\*', bygroups(Name.Variable), 'module'),
			(r'{',Text,'bracket')
		],
		'bracket': [
			(r'\s+', Text),
			(r'}\s*;', Text, '#pop')
		],
		'funclist': [
			(r'\s+', Text),
			(r'[A-Z][a-zA-Z0-9_]*', Keyword.Type),
			(r'[_a-z][\w\']+', Name.Function),
			(r'--.*$', Comment.Single),
			(r'{-', Comment.Multiline, 'comment'),
			(r',', Punctuation),
			(r'[:!#$%&*+.\\/<=>?@^|~-]+', Operator),
			# (HACK, but it makes sense to push two instances, believe me)
			(r'\(', Punctuation, ('funclist', 'funclist')),
			(r'\)', Punctuation, '#pop:2'),
		],
		'comment': [
			# Multiline Comments
			(r'[^-{}]+', Comment.Multiline),
			(r'{-', Comment.Multiline, '#push'),
			(r'-}', Comment.Multiline, '#pop'),
			(r'[-{}]', Comment.Multiline),
		],
		'character': [
			# Allows multi-chars, incorrectly.
			(r"[^\\']", String.Char),
			(r"\\", String.Escape, 'escape'),
			("'", String.Char, '#pop'),
		],
		'string': [
			(r'[^\\"]+', String),
			(r"\\", String.Escape, 'escape'),
			('"', String, '#pop'),
		],
		'escape': [
			(r'[abfnrtv"\'&\\]', String.Escape, '#pop'),
			(r'\^[][A-Z@\^_]', String.Escape, '#pop'),
			('|'.join(ascii), String.Escape, '#pop'),
			(r'o[0-7]+', String.Escape, '#pop'),
			(r'x[\da-fA-F]+', String.Escape, '#pop'),
			(r'\d+', String.Escape, '#pop'),
			(r'\s+\\', String.Escape, '#pop'),
		],
	}



if __name__ == '__main__':
	import sys
	text = open(sys.argv[1]).read()
	for t in GfLexer().get_tokens(text):
		assert t[0] != Token.Error, "Parse error"
		print t
	