# coding=utf8



#import sys, os
#sage_gf_path = os.environ.get('SAGE_GF_DIR')
#if sage_gf_path:
#    sys.path.append(sage_gf_path)

from sage.nlgf.realsets import RealSet

identity = lambda t: t


# variables
var('A,B,C')
var('f,g,h')
var('M,N,u,v,i,j,n,P,Q,l')
var('p,q,r')
var('X,Y,Z')



#-----------------
# VecCalc1Sage
# For divergence , curl

# from http://trac.sagemath.org/sage_trac/ticket/3021
# a possible implementation of div, for irc user hedgehog

var('x, y, z')
#(x, y, z)
#f1 = x^2 + 2*y; f2 = x^3 + sin(z); f3 = y*z + 2

f1 = function('f1',x,y,z)
f2 = function('f2',x,y,z)
f3 = function('f3',x,y,z)

F = vector([f1, f2, f3])

#print F(x=0, y=2, z=3)

def _variables(F):
    # this is a little funky -- we're finding all the variables that occur
    # in the components of F, and somehow choosing an ordering.  There are
    # other (better ways) but I'm not sure what the correct interface is.
    # For now, the user can specify the variables if they choose, just
    # like the gradient method.
    variables = list(set(flatten([ list(f.variables()) for f in F ])))
    variables.sort()
    return variables

def div(F, variables=None):
    assert len(F) == 3
    if variables is None:
        variables = var('x y z')

    s = 0
    for i in range(len(F)):
        s += F[i].derivative(variables[i])
    return s

#print F
#print div(F)
#print div(F, variables=(y, x, z))

def curl(F, variables=None):
    assert len(F) == 3
    if variables is None:
        variables =  var('x y z')  
    assert len(variables) == 3
    x, y, z = variables
    Fx, Fy, Fz = F
    i = Fz.derivative(y) - Fy.derivative(z)
    j = Fz.derivative(z) - Fx.derivative(x)
    k = Fy.derivative(x) - Fx.derivative(y)
    return vector([i, j, k])
    
#print curl(F)
#print curl(F, variables=(y, x, z))

## let's assert that div(curl) == 0
## we need the variables because the ordering is suspect otherwise: for me,
## sage: _variables(F)
## [x, y, z]
## sage: _variables(curl(F))
## [z, x, y]
#assert div(curl(F, variables=(x, y, z)), variables=(x, y, z)) == 0

# if necessary, add as second and third component the variables y,z to gradient():

r###
def complete_vector3 (v):
    if len(v) == 1:
        l = v.list()
        l.extend([y,z])
        v = vector(l)
    if len(v) == 2:
        l = v.list()
        l.append(z)
        v = vector(l)
    return v
###

def complete3_gradient(fvar): 
	 var = list(fvar.variables())
	 if len(var) == 1:
         	var.extend([Y,Z])
         	var = vector(var)
         if len(var) == 2:
        	var.append(Z)
        	var = vector(var)
         return fvar.function(var[0],var[1],var[2]).gradient([var[0],var[1],var[2]])

		

    
#-------------------------------------------------------------------------------
#QUANT1SAGE

# A set, for example A=Set([2,4,5])
# p symbolic expression, for example p = x+1 <= x-2

def ForSet(set,vars):
    
    setFor = tuples(set.list(), len(vars))

    if len(vars) == 1:
        return set
        
    for i in range(len(setFor)):
        setFor[i] = vector(setFor[i])

    return setFor
       

# reason for not doing it here directly: return exists (setFor, lambda (vars) : p) does not work
#return exists(A, lambda (x,y) : x^2 + y^2 == 25)[0]==True;
#exists ([(x1,...xn) for x1 in C ... for xn in C], lambda (x1,...xn) : p)

#----------------------------------------------------------------------------------
#ARITH1SAGE

#not necessary:

#def product_sage(f, x, lo, hi):
#    p = 1
#        for x in [lo..hi]:
#               p = p * f(x)
#    return p

#def product_set(f, x, set):
#    p = 1
#        for i in set:
#                p = p * f(i)
#    return p

#def sum_set(f, x, set):
#    s = 0
#        for i in set:
#                s = s + f(i)
#    return s
#----------------------------------------------------------------------------------


#SET1SAGE

def RealSet_intersection (xs):
	i = RealSet.oo_interval(-Infinity,Infinity)
	for set in xs:	
		i = i. intersection(set)
	return i

def RealSet_union (xs):
	u = RealSet()
	for set in xs:	
                u = u. union(set)
	return u

def map_sage (f , set):

    if set.discrete():
        return map ( f , set.points_list)
    else:
        raise TypeError("Type error: Continuous set, not iterable")     # map does not work for continuous sets


def suchthat_sage (set, prop):

    if set.discrete(): 
        output    = []
    
        for i in set.points_list:
            if bool(prop(i)):
                output.append(i)
            
        return RealSet([],output)
    else:
        raise TypeError("Type error: Continuous set, not iterable")     # map does not work for continuous sets

def NotImplementedError():
    raise TypeError, "Error: Not implemented"

#-----------------------------------------------------------------------------------
#LOGIC1SAGE

import sage.logic.propcalc as propcalc

def reduce_list(op, l, pre= identity, post=identity):
    """ reduce binary operator over Proposition list:

        sage: and_list([True, True])
        True
        sage: and_list([True, True, False])
        False

        sage: or_list([False, False])
        False
        sage: or_list([False, False, True])
        True

        sage: xor_list([False, True])
        True
        sage: xor_list([True, True])
        False
        sage: xor_list([False, False])
        False
    """
    i = l[0]
    for p in l[1:]: i = op(i,p)
    return post(i)


and_list = lambda l: reduce_list(lambda i,p: i & p, l)

or_list = lambda l: reduce_list(lambda i,p: i | p, l) 

xor_list = lambda l: reduce_list(lambda i,p: i + int(p), l, pre=int, post=lambda i: bool(i%2))   


#-----------------------------------------------------------------------------------
#SDATA1SAGE
def moment(r, m, xs):
    """ The `r` moment of a list of data respect to `m`

        sage: moment(1, 0, range(5))
        2
        sage: moment(2, 0, [-1,0,1])
        2/3
    """
    acc = 0
    if not xs: # moment of empty set defined as NaN
        return NaN
    for x in xs:
        acc += (x - m) ** r

    if isinstance(acc, (int,long)):
        return acc / ZZ(len(xs))
    return acc / len(xs)

def mode_sage(l):
    m = mode (l)        
    if len (m) > 1:
        raise TypeError, "Multimodality. OpenMath's output is a unique value."
    return m[0]


#-----------------------------------------------------------------------------------
#INTERVAL1SAGE

def interval_oo(a,b):
    """ sage: interval_oo(2,3)
        ]2, 3[
    """
    return RealSet.oo_interval(a, b)

def interval_oc(a,b):
    """ sage: interval_oc(2,3)
        ]2, 3]
    """
    return RealSet.oc_interval(a, b)

def interval_co(a,b):
    """ sage: interval_co(2,3)
        [2, 3[
    """
    return RealSet.co_interval(a, b)

def IntervalError():
    raise TypeError, 'Please use a specific kind of interval'

#-----------------------------------------------------------------------------------
#FNS1SAGE

x = var('x')

def domain_sage (fun):
    allR = RealSet.oo_interval(-Infinity,Infinity)

    if bool(type(fun) != str) :
    	fun = str(fun)
        if fun.find(' |--> ') >= 0 :   					# domain( X |--> f(X)) = domain (f(X))
		fun = fun.partition(' |--> ')[2]
        fun = fun.rstrip('(X)').lstrip('-')         #domain(-f)=domain(f)
  
    #fun = str(fun)
    #fun = fun.rstrip('(X)').lstrip('-')         #domain(-f)=domain(f)
        
    fun = fun.strip()

    if fun == 'arcsinh': return allR
    if fun == 'arccsh':  return RealSet.co_interval(1,Infinity)
    if fun == 'arcsec':  return RealSet.oc_interval(-Infinity, -1).union(RealSet.co_interval(1, Infinity))   # (-oo,-1] U [1,oo)
    if fun == 'ln':      return RealSet.oo_interval(0,Infinity)                                              # (0,+oo)
    if fun == 'csch':    return RealSet.oo_interval(-Infinity,0).union(RealSet.oo_interval(0,Infinity))      # (-oo, 0) U (0, oo)
    if fun == 'arctan':  return allR
    if fun == 'arccsc':  return RealSet.oc_interval(-Infinity,-1).union(RealSet.co_interval(1,Infinity))     # (-oo,-1] U [1,oo)
    if fun == 'sin':     return allR    
    if fun == 'arcsin':  return RealSet.cc_interval(-1,1)                                                     # [-1,1]
    if fun == 'arctanh': return RealSet.oo_interval(-1,1)                                                     # (-1,1)
    if fun == 'sinh':    return allR
    if fun == 'arcsech': return RealSet.oo_interval(0,1)                                                      # (O,1)
    if fun == 'coth':    return RealSet.oo_interval(-Infinity,0).union(RealSet.oo_interval(0,Infinity))      # (-oo, 0) U (0, oo)
    if fun == 'cos':     return allR
    if fun == 'tanh':    return allR
    if fun == 'sech':    return allR
    if fun == 'arccot':  return allR       
    if fun == 'e^' or fun == 'exp':     return allR
    if fun == 'arccosh': return RealSet.oo_interval(1,Infinity)                                              # ( 1, oo)
   		
    raise TypeError, 'The domain of this function is not implemented'

    #if fun == 'tan':            # R - {múltiplos impares de π/2}
    #if fun == 'csc':            # R - {múltiplos de π}
    #if fun == 'cot':            # R - {múltiplos de π}

    # f.domain() works only for piecewise linear functions !
   

def range_sage (fun): 

    allR = RealSet.oo_interval(-Infinity,Infinity)
 
    if bool(type(fun) != str) :
    	fun = str(fun)
        if fun.find(' |--> ') >= 0 :   					# range( X |--> f(X)) = range (f(X))
		 fun = fun.partition(' |--> ')[2]
        fun = fun.rstrip('(X)')
        if fun.find('-') == 0 : return -range_sage(fun.lstrip('-'))     #range(-f)=-range(f)

#   fun = str(fun)
#   fun = fun.rstrip('(X)')
#   if fun.find('-') == 0 : return -range_sage(fun.lstrip('-'))         #range(-f)=-range(f)

    fun = fun.strip()

    if fun == 'arcsinh': return allR
    if fun == 'arccos':  return allR 
    if fun == 'arccoth': return RealSet.oo_interval(-Infinity,0).union(RealSet.oo_interval(0,Infinity))      # (-oo, 0) U (0, oo)
    if fun == 'cosh':    return RealSet.oo_interval(1,Infinity)                                              # ( 1, oo)
    if fun == 'sec':     return RealSet.oc_interval(-Infinity,-1).union(RealSet.co_interval(1,Infinity))     # (-oo,-1] U [1,oo)
    if fun == 'arccsch': return RealSet.oo_interval(-Infinity,0).union(RealSet.oo_interval(0,Infinity))      # (-oo,0) U (0,oo)
    if fun == 'tan':     return allR
    if fun == 'ln':      return allR
    if fun == 'csch':    return RealSet.oo_interval(-Infinity,0).union(RealSet.oo_interval(0,Infinity))      # (-oo,0) U (0,oo)
    if fun == 'csc':     return RealSet.oc_interval(-Infinity,-1).union(RealSet.co_interval(1,Infinity))     # (-oo,-1] U [1,oo)
    if fun == 'sin':     return RealSet.cc_interval(-1,1)                                                     # [-1,1]
    if fun == 'arcsin':  return allR        
    if fun == 'arctanh': return allR         
    if fun == 'sinh':    return allR
    if fun == 'arcsech': return allR
    if fun == 'coth':    return RealSet.oo_interval(-Infinity,-1).union(RealSet.oo_interval(1,Infinity))     # (-oo,-1) U (1,oo)
    if fun == 'cos':     return RealSet.cc_interval(-1,1)                                                     # [-1,1]
    if fun == 'cot':     return allR
    if fun == 'tanh':    return RealSet.oo_interval(-1,1)                                                     # (-1,1)
    if fun == 'sech':    return RealSet.oo_interval(0,1)                                                      # (O,1)
    if fun == 'e^' or fun == 'exp': return RealSet.oo_interval(0,Infinity)     
    if fun == 'arccosh': return allR
   
    raise TypeError, 'The range of this function is not implemented'

    # return f.domain() this would be for piecewise linear functions!!!    

    #if fun == 'arcsec':          # R - {múltiplos impares de π/2}
    #if fun == 'arccot':          # R - {múltiplos de π}
    #if fun == 'arctan':          # R - {múltiplos impares de π/2}
    #if fun == 'arccsc':          # R - {múltiplos de π}

# from  http://ask.sagemath.org/question/502/can-sage-compute-the-inverse-of-a-function
# examples:
# symbolic_inverse(sin(x),x)
# symbolic_inverse(f,x)

def symbolic_inverse(f, x):
    y = SR.var('y')
    g = (f - y).roots(x, multiplicities=False)
    return [expr.subs(y=x) for expr in g][0]

#-----------------------------------------------------------------------------------
#CALCULUS1SAGE

def variable_search(n,vars):        # variable_search( 2 , ( 'x,y' , sin(x) ) [0]) 
    varstring = str(vars) 
    p = varstring.find(',')
    if p == -1: 
        return eval(varstring) 
    if n == 1:
        return eval(varstring[0:p])                	#substring from 0 to p-1    

    varstring = varstring.replace(',','.',n-2)
    p1 = varstring.find(',') 
    varstring = varstring.replace(',','.',1)
    p2 = varstring.find(',')
    if p2 == -1 :
        return eval(varstring[p1+1:])               	#substring from p1+1 till the end
    
    return eval(varstring[p1+1: p2])            	#substring from p1+1 to p2-1                    
    
#-----------------------------------------------------------------------------------
#COMMANDSSAGE


def Compute(exp,kind):
    #return GfContext.active().compute(exp,kind) 
    o = GfContext.active().compute(exp,kind)     
    if kind == 'Set':
    	return o.toGf()
    return str(" " + str(o) + " ")    #str(o)

def Assign(v,exp):
    v = v.strip() 
    GfContext.active().assign(v,exp)

def Assume(prop):
    GfContext.active().assume(prop)

def Approximate(exp) :
    evaluation = GfContext.active().eval(exp)
    f=float(evaluation)
    return f

def ApproximateTo(exp,d) :
    evaluation = GfContext.active().eval(exp)
    f=evaluation.n(digits = d)
    return f
  
def IsAppEqual(exp1,exp2):
    cx = GfContext.active()
    x = cx.eval(exp1)
    y = cx.eval(exp2)
    if x == y:
        return True #(True, Infinity)
    d = - round(log(abs(float(x-y)), 10))
    if d <=0:
        return False
    return (True,d)

#-------------------------------------------------------------------------------
# Blocks

class GfContext:
    stack = []
    kinds = 'Num Tensor Fun Set'.split()

    def __init__(self, name,vars={},asms=[]):
        #self.locals = dict(locals())
        self.asms = list(asms) # copy
        self.vars = dict(vars) # copy
        self.name = name
        self.last = dict([(k,None) for k in self.kinds])
        self.kind = 'Num'
        
    
    def eval(self,exp):
        locs = {'IT': self.it()}
        locs.update(self.vars)
        return eval(preparse(exp), globals(), locs)


    def assign(self,v,exp):
        self.vars[v] = self.eval(exp)
        return self
        
    def compute(self,exp,kind):
        assert kind in self.kinds
        result = self.eval(exp)
        self.kind = kind          #this is the last kind used
        self.last[kind] = result
        return result
    
    def it(self):
        return self.last[self.kind]

    def assume(self,p):
        assume(p)
        self.asms.append(p)
        
    def approximate(self,exp):
        evaluation = self.eval(exp)
        f=float(evaluation)
	return f	
    
        
    def __repr__(self):
        return "<gf context '%s'>" % self.name
        
        
    @classmethod
    def active(klass):
        return klass.stack[-1]
        
    @classmethod
    def push(klass, name):
        assert name not in [c.name for c in klass.stack], "Context name '%s' already used." % name
        current = klass.active()
        cx = klass(name, vars=current.vars, asms=current.asms)
        klass.stack.append(cx)
        return cx
        
    @classmethod
    def pop(klass,name=None,locs=locals()):
        if name and name != klass.stack[-1].name:
            raise RuntimeError, "Tried to end unopen context '%s'" % name
        klass.stack.pop()
        return klass.active()

    @classmethod
    def save(klass):
      import cPickle
      return cPickle.dumps(klass.stack)

    @classmethod
    def restore(klass, serial):
      import cPickle
      klass.stack = cPickle.loads(serial)


GfContext.stack.append(GfContext('toplevel'))


def test_blocks():
    def prcx(s,k='Num'):
        c = GfContext.active()
        print "Inside '%s':" % c.name, c.compute(s,k)
    Compute('10^1', 'Num')
    Assign('x', "IT + 1")

    prcx('x')
    
    begin_block('block 1')
    Compute('10^2', 'Num')
    Assign('x', 'x + IT')
    prcx('x')

    begin_block('block 2')
    Compute('10^3', 'Num')
    Assign('x', 'x + IT')
    prcx('x')
    print IsAppEqual('x','1111')
    end_block('block 2')


    prcx('x')
    end_block('block 1')

    prcx('x')


        
def begin_block(name):
    GfContext.push(name)
    return 'BEGIN %s' % name

def end_block(name):
    GfContext.pop(name)
    return 'END %s' % name

    

def block_derivative(f):
    return diff(f(X), X).function(X)

def block_primitive(f):
    return integral(f(X), X).function(X)

def block_integral(f,a,b):
    return integral(f(X), X,a,b)

def block_lambda(x,e):
    return e.function(x)

def block_compose(f,g):
    return f(g(X)).function(X)
    


    

