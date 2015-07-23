GF = '/Users/saludes/.cabal/bin/gf'

fullLangs = 'bulgarian catalan english french german italian romanian polish '
fullLangs += 'spanish swedish finnish'
lang_name = dict([(l.capitalize()[:3],l) for l in fullLangs.split()])
lang_name['Ron'] = lang_name['Rom'] # roManian, but Ron
del lang_name['Rom']

def makePgf(modname,langs):
    from subprocess import call
    call(('pwd',))
    fPatt = '%s/' + modname + '%s.gf'
    cmd = (GF,'-make','-o',modname + '.pgf')
    if len(langs)==1:
        lang = langs[0]
        cmd += (fPatt % (lang_name[lang],lang),)
    else:
        files = [fPatt % (lang_name[l],l) for l in langs]
        cmd += tuple(files)
    print ' '.join(cmd)
    return call(cmd)

def rm(pattern):
    from glob import glob
    from os import unlink
    for p in glob(pattern):
        print "Removing",p
        unlink(p)
    

if __name__ == '__main__':
    from sys import argv, exit
    from os import environ

    if environ['ACTION'] == 'clean':
        rm('*/*.gfo')
        rm('*.pgf')
        exit(0)

    if len(argv)>=2: # cl args overrides environment vars
        languages = argv[1:]
    else:
        languages = environ['LANGUAGES'].split()
    modname = ['OpenMath', 'Test'][int(environ['LAYER']) -1]
    if any(l not in lang_name for l in languages):
        raise ValueError, "Unknown in: " + languages
    retval = makePgf(modname, languages)
    exit(retval)