import os
from expect import Expect, ExpectElement
from sage.misc.sage_eval import sage_eval
from sage.misc.misc import SAGE_ROOT
from re import search, match

SAGE_SAGE = SAGE_ROOT + '/devel/sage/sage'
nlgf_dir = SAGE_SAGE + '/nlgf/'
prelude_path = nlgf_dir + 'prelude.sage'
commands_path = nlgf_dir + 'Commands.pgf'

DEBUG = False
    

class GF(Expect):
    
    def __init__(self, pgf_path, lang, maxread=100, script_subdirectory="", logfile=None,
                 server=None, server_tmpdir=None):
        from os.path import splitext, basename
        module_name = splitext(basename(pgf_path))[0]
        Expect.__init__(self,
                        name = 'gf',
                        prompt = module_name + '>',
                        command = "gf -q %s" % pgf_path,
                        maxread = maxread,
                        server = server,
                        server_tmpdir = server_tmpdir,
                        script_subdirectory = script_subdirectory,
                        restart_on_ctrlc = False,
                        verbose_start = DEBUG,
                        logfile = logfile,
                        eval_using_file_cutoff=1024)
        self.lang = lang
        self.locals = None
        self.pgf_path = pgf_path
    
    
    def _start(self):
        Expect._start(self)
        self.locals = sage_eval('globals()', cmds='load "%s"'%(nlgf_dir + 'prelude.sage'))


    def _pre_interact(self):        
        try:
            import gf
        except ImportError:
            print "No autocompletion available"
            return

        pgf = gf.read_pgf(self.pgf_path)
        langs = [l for l in pgf.languages() if `l`[-3:] == self.lang]
        assert len(langs) == 1, "Cannot retrieve chosen pgf language."
        lang = langs[0]
        ip = __IPYTHON__
        class myCompleter:
            def __init__(self, pgf, lang):
                self.pgf = pgf
                self.lang = lang
            def complete(self, text, state,line_buffer=None):
                # we need the whole line; only available from readline
                line = ip.readline.get_line_buffer()
                completions = self.pgf.complete(lang, line)
                try:
                    return completions[state]
                except IndexError:
                    return None
        ip.Completer = myCompleter(pgf,lang)

    
    def gf_preparse(self, s):
        tokens = []
        for t in s.split():
            if t[-1] in '.;,?':
                tokens.extend((t[:-1], t[-1]))
            else:
                tokens.append(t)
        s = ' '.join(tokens)
        return s.endswith('.') and s or s + ' .'

    
    def eval_line(self,L):
        return self._eval_line(L, wait_for_prompt=self._prompt, allow_use_file=False)
    
    def parse(self, s):
        m = search(r"sage\d=([^;]*);", s)
        if m:
            cp = m.group(1)
        else:
            cp = s
        ps = self.gf_preparse(cp)
        parsingCmd = 'p -lang=%s "%s" | pt -compute' % (self.lang, ps)
        Ps = self.eval_line(parsingCmd)
        m = search(r'The parser failed at token "([^\"]*)"',Ps)
        if m:
            raise SyntaxError, "gf parsing failed at '%s'" % m.group(1)
        if search(r'no trees found', Ps):
            raise SyntaxError, "gf didn't found any parsing."
        ps =[P for P in clean(Ps).split('\n') if not search('float2num \-?\d*\.0',P)]
        if not ps:
            raise SyntaxError, "no parsing"
        while len(ps) > 1:
            lins = extract_shared([self.linearize(p) for p in ps])
            for k in range(len(ps)):
                print `k+1` + '> ' + lins[k]
            try:
                k = input("Ambiguous. Pick one (1..%d): " % len(ps))
                ps = [ps[k-1]]
            except IndexError:
                pass
        return ps[0]
    
    def linearize(self, s, debug=False):
        s = self.eval_line('l -lang=Sage %s' % s)
        l = clean(s)
        return l
    
    def _quit_string(self):
        return 'q'
    
    def eval(self, s, strip=True, **kw):
        R = None
        if DEBUG: print "ABOUT to evaluate stack =", s
        cmds = s.split('\n')
        cmds.reverse()
        while cmds:
           cmd = cmds.pop()
           if cmd == 'sage0':
            print "GOT:", cmd
            continue
           R = self.eval_one(cmd)
           if DEBUG:
                print "EVAL_ONE for '%s' gives '%s'" % (cmd, R)
        if DEBUG: print "EVAL return for stack:", R
        return `R`
              
              
    def eval_one(self, L):
        p = self.parse(L)
        m = match('Assign (\w+) \(Var\w+ (\w+)\)', p)
        if m:
            return self.assign(p,m.group(2))
        m = match('(Compute|Approximate)', p)
        if m:
            return self.compute(p)
        raise TypeError, "Not implemented:" + p
              
   
    
    def compute(self,exp):
        sageExp = self.linearize(exp, debug=DEBUG)
        while sageExp.endswith(';'): sageExp = sageExp[:-1]
        evaluated = sage_eval(sageExp, locals=self.locals)
        return evaluated

    def assign(self,exp,x):
        sage_cmds = self.linearize(exp, debug=DEBUG)
        return sage_eval(x, cmds=sage_cmds, locals=self.locals)
        
    def console(self):
        gf_console()

def gf_console():
    os.system('gf')


def clean(s):
    i = s.find('>') #Hack: Get rid of the rubish before '>'. It marks the beginning of thee lin.
    if i >= 0: # for sage < 5.8
        return s[(i+1):].strip()
    else:
        return s.strip()

def extract_shared(ss):
    def strip(ss, stop=None):
        if not ss: return ss
        while True:
            p = ss[0][0]
            if not all(s[0] == p for s in ss):
                return ss
            ss = [s[1:] for s in ss]
            if p == stop: return ss
        raise RuntimeError, "empty"
    rss = [s[::-1] for s in strip(ss)]
    ss = [s[::-1] for s in strip(rss, stop=',')]
    return ss
        
        


english = GF(commands_path, 'Eng')
spanish = GF(commands_path, 'Spa')
catalan = GF(commands_path, 'Cat')
german  = GF(commands_path, 'Ger')

