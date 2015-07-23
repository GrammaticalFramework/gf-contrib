# -*- coding: utf8 -*-
r"""
    Reals sets consisting of union of real intervals and isolated points.
    
    This is based of previous work available from http://www.mail-archive.com/sage-support@googlegroups.com/msg21326.html
    but supporting now integration on real intervals and real sets.
    
    - Laurent Claessens (2010-12-10): Original Interval and ContinuousSet from 'http://www.mail-archive.com/sage-support@googlegroups.com/msg21326.html'.
        Defined a class Interval that represents an interval (can be open, closed, half open, unbounded), and implements union() and intersection() methods, as well
        as the __contains__() method that tests if a number is contained in the interval. Also defined the class ContinuousSet that represents finite union and
        intersections of intervals by a list of disjoint intervals. For the class ContinuousSet, union() and __contain__() methods are implemented.

    - Ares Ribo (2011-10-24): Extended the previous work defining the class RealSet, that describes any real set as a list of disjoint intervals and a list of     
        isolated points. For this class, we implemented the intersection() ( union() and __contain__() as for ContinuousSets). We implemented the function 'subsets'
        which given two different real sets A and B returns if A is a (proper) subset of B, and the function 'setdiff' that returns the difference of two given real
        sets. Also we support definite integration over a RealSet, and we implemented the infimum and the supremum of a RealSet. We define the class RInterval of
        real intervals. A RInterval is now a RealSet, consituted as a list of disjoint intervals with a unique element and an empty list of isolated points. 

    - Jordi Saludes (2011-12-10): Documentation and file reorganization. Reimplementation of 'setdiff'. RInterval is now always an open interval. The boundary/ies
        can be added as isolated point/s if necessary, constituting a RealSet. 

    The research leading to these results has received funding from the European Union's Seventh Framework Programme (FP7/2007-2013) under grant agreement 
    n° FP7-ICT-247914.
     
    Examples
    
    sage: A = RealSet([RInterval((1,2)),RInterval((3,4))],[1,2])

    sage: A
    [ 1 :: 2 ] + ] 3 :: 4 [

    sage: B = RealSet([RInterval((2,3))],[1])

    sage: B
    ] 2 :: 3 [ + {1}
   
    """

from sage.rings.infinity import Infinity


class RInterval(object):
    r"""
        Represents the real open interval between a and b: `(a,b)`
        
        sage: RInterval()
        ()
        
        it is the empty interval `\emptyset`.
        
        sage: RInterval().is_empty
        True
        
        sage: I = RInterval((2,4))
        sage: J = RInterval((1,3))
        sage: K = RInterval((0,1))
        
        sage: I2 = RInterval((2,+Infinity))
        sage: J3 = RInterval((-Infinity,3))
        
        
        Intersection of intervals give an interval:
        
        sage: I.intersection(J)
        (2, 3)
        
        sage: I.intersection(K)
        ()
        
        sage: I2.intersection(J3)
        (2, 3)
        
        Union returns a set of disjoint intervals:
        
        sage: I.union(J)
        [(1, 4)]
        sage: I.intersection(K)
        ()
        sage: I.union(K)
        [(2, 4), (0, 1)]
        
             
        Interval membership:
        
        sage: 3 in I
        True
        
        sage: 3 in J
        False
            
        
        Interval inclusion:
        
        sage: RInterval().included(I)
        True
        
        sage: I.included(RInterval())
        False
        
        sage: IJ = I.union(J)[0]
        sage: J.included(IJ)
        True
        sage: IJ.included(J)
        False
        sage: IJ.included(I)
        False
        
        """
    
    def __init__(self, bounds=None):
        r"""
            An open interval is defined by its bounds. See ``RInterval`` for full documentation.     

            sage: RInterval((1,2))
            (1, 2)
            """
        if bounds and bounds[1] <= bounds[0]:
            raise ValueError, "Inverted bounds"
        self.bounds = bounds

    def __hash__(self):
        r"""
            sage: I=RInterval((1,2))
            sage: hash(I)
            3713081631934410656
            """
        return hash(self.bounds)
  
    @property
    def is_empty(self):
        r"""
            Returns True if the interval is empty, and False otherwise.

            sage: RInterval().is_empty
            True
            sage: RInterval((1,2)).is_empty
            False
            """
        return not self.bounds

    
    def __repr__(self):
        r"""
            Returns the representation of the real interval from a to b as the string '(a,b)', 
            and for the empty interval '()' is returned. 
            
            sage: repr(RInterval((1,2)))
            '(1, 2)'
            sage: repr(RInterval())
            '()'
            """
        if self.bounds:
            return "(%s, %s)" % self.bounds 
        else:
            return "()"

    def __cmp__(self, other):
        r"""
            sage: I = RInterval((1,2))
            sage: J = RInterval((1,3))
            sage: I.__cmp__(J)
            -1
            """
        if self.is_empty:
            if other.is_empty: return 0
            return -1
        else:
            if other.is_empty: return 1
            a0,a1 = self.bounds
            b0,b1 = other.bounds
            if cmp(a0,b0) != 0:
                return cmp(a0,b0)
            else:
                return cmp(a1,b1)    
    
    def intersection(self, other):
        r"""
            Returns the interval intersection of intervals self and other 

            sage: I = RInterval((2,4))
            sage: J = RInterval((1,3))
            sage: K = RInterval((0,1))
        
            sage: I2 = RInterval((2,+Infinity))
            sage: J3 = RInterval((-Infinity,3))
          
            sage: I.intersection(J)
            (2, 3)
        
            sage: I.intersection(K)
            ()
        
            sage: I2.intersection(J3)
            (2, 3)
        """ 

        if self.is_empty or other.is_empty:
            return RInterval() 
        a0,a1 = self.bounds
        b0,b1 = other.bounds
        c0 = max(a0, b0)
        c1 = min(a1, b1)
        return c0 < c1 and RInterval((c0,c1)) or RInterval()
    
    def hull(self,other):
        r""" 
            Returns the hull of the specified intervals, i.e. the smallest connected interval enclosing both intervals.
             
            sage: I=RInterval((1,2))
            sage: J=RInterval((3,4))
            sage: I.hull(J)
            (1, 4)
            """ 
  
        if self.is_empty: return other
        if other.is_empty: return self
        a0,a1 = self.bounds
        b0,b1 = other.bounds
        c0 = min(a0, b0)
        c1 = max(a1, b1)
        return c0 < c1 and RInterval((c0,c1)) or RInterval()
    
    def union(self,other):
        r"""
           The union of two intervals returns a set of disjoint intervals
           
           sage: I = RInterval((2,4))
           sage: J = RInterval((1,3))
           sage: K = RInterval((0,1))
        
           sage: I.union(J)
           [(1, 4)]
           sage: I.union(K)
           [(2, 4), (0, 1)]
           """    

        if self.intersection(other).is_empty:
            return [self, other]
        else:
            return [self.hull(other)]

    
    def __contains__(self,x):
        r"""
           Tests if a real number belongs to an interval

           sage: I=RInterval((1,3))
           sage: 2 in I
           True
           sage: 1 in I
           False
           sage: 1.1 in I
           True
           """ 
        if self:
            x0,x1 = self.bounds
            return x0 < x and x < x1
        else:
            return False

    def included(self, other):
        r"""
            Tests interval inclusion
            
            sage: I = RInterval((1,2))
            sage: J = RInterval((1,3))
            sage: K = RInterval((2,3))
            sage: I.included(J)
            True
            sage: J.included(K)
            False
            """
        return other.intersection(self) == self

    def __neg__(self):
        """The opposite of an interval: `-(a, b) = (-b, -a)`
           sage: -RInterval((2, 3))
           (-3, -2) 
        """
        if self.is_empty:
            return RInterval()
        a,b = self.bounds
        return RInterval((-b, -a))


    @classmethod
    def reduce(klass, intervals_list):
        """
            Return a set of disjoint intervals that represent the same set.
            
            sage: I = RInterval((1, 4))
            sage: J = RInterval((0, 2))
            sage: K = RInterval((3, 5))
            sage: L = RInterval((6, 7))
            sage: M = RInterval((7, 8))
            sage: RInterval.reduce([I,J,K,L,M])
            set([(0, 5), (6, 7), (7, 8)])
        """
        intervals = set(intervals_list)        
        while True:
            reduced1 = set()
            for I in intervals:
                for J in intervals:
                    reduced1 |= set(I.union(J))
            reduced2 = set(reduced1)
            for I in reduced1:
                for J in reduced1:
                    if I != J and I.included(J) and I in reduced2:
                            reduced2.remove(I)
            if intervals == reduced2:
                return intervals
            intervals = set(reduced2)
        
            
 
class RealSet(object):
    r"""
        Represent a set that can be the union of some intervals and isolated points.
        
        It consists of:
        
        - A list of disjoint open non-empty intervals.
        
        - A list of points. Each of these points belongs at most to one interval.

        sage: RealSet([RInterval((1,2))],[1])
        [ 1 :: 2 [
        sage: RealSet([RInterval((1,2)), RInterval((3,4))],[1])
        [ 1 :: 2 [ + ] 3 :: 4 [
        
        A closed interval:
        
        sage: RealSet.cc_interval(1,4); 
        [ 1 :: 4 ]
        
        A single point:
        
        sage: RealSet.singleton(1)
        {1}
        
        UNION
        Union is supported with intervals and can be nested :
        
        sage: I = RealSet.co_interval(1, 4)
        sage: J = RealSet.co_interval(4, 5)
        sage: M = RealSet.oc_interval(7, 8)
        sage: I.union(J).union(M)
        [ 1 :: 5 [ + ] 7 :: 8 ]
        
        INTERSECTION
        
        sage: I.intersection(J)
        {}
        sage: I.intersection(RealSet.cc_interval(2,5))
        [ 2 :: 4 [
        
        """
    
    def __init__(self, intervals=[], points=[]):
        r"""
            See ``RealSet`` for full documentation.      

            sage: RealSet([RInterval((1,2))],[1])
            [ 1 :: 2 [
            sage: RealSet([RInterval((1,2)), RInterval((3,4))],[1])
            [ 1 :: 2 [ + ] 3 :: 4 [
            """ 
        if (Infinity in points) or (-Infinity in points):
            raise ValueError, "Infinity is not a real number"
        self.intervals_list = intervals
        self.points_list = points
    
    @classmethod
    def cc_interval(klass, x0, x1):
        r"""
            Closed interval

            sage: RealSet.cc_interval(1,2)
            [ 1 :: 2 ]
            """
        return RealSet([RInterval((x0,x1))], [x0,x1])

    @classmethod
    def oc_interval(klass, x0, x1):
        r"""
            Right-half-open interval
   
            sage: RealSet.oc_interval(1,2)
            ] 1 :: 2 ]
            """
        return RealSet([RInterval((x0,x1))], [x1])

    @classmethod
    def co_interval(klass, x0, x1):
        r"""
            Left-half-open interval

            sage: RealSet.co_interval(1,2)
            [ 1 :: 2 [
            """
        return RealSet([RInterval((x0,x1))], [x0])

    @classmethod
    def oo_interval(klass, x0, x1):
        r"""
            Open Interval

            sage: RealSet.oo_interval(1,2)
            ] 1 :: 2 [
            """
        return RealSet([RInterval((x0,x1))], [])

    @classmethod
    def singleton(klass, x):
        r"""
            A single point:
        
            sage: RealSet.singleton(1)
            {1}
            """
        return RealSet(points=[x])

    @property
    def is_interval(self):  
        r"""Is this set a single interval ?
   
            sage: RealSet([RInterval((1,2))],[]).is_interval
            True
            sage: RealSet([RInterval((1,2))],[1]).is_interval
            True
            sage: RealSet([RInterval((1,2))],[1,2]).is_interval
            True
            sage: RealSet([RInterval((1,2))],[1,2,3]).is_interval
            False
            sage: RealSet([RInterval((1,2))],[1,3]).is_interval
            False
            sage: RealSet([RInterval((1,2)),RInterval((1,3))],[1,3])
            [ 1 :: 2 [ + ] 1 :: 3 ]
            sage: RealSet([RInterval((1,2)),RInterval((1,3))],[1,3]).is_interval
            True
            """
        self = self.reduce()
        if len(self.intervals_list) != 1 or len(self.points_list)>2:
            return False
        if len(self.points_list) == 1:
            return self.points_list[0] in self.intervals_list[0].bounds
        if len(self.points_list) == 2:
            return (self.points_list[0] in self.intervals_list[0].bounds) and (self.points_list[1] in self.intervals_list[0].bounds) 
        else:    #len(self.intervals_list)==1 and not self.points_list
            return True    
  
    def bounds(self):      
        """Return the bounds provided it is an interval
            
           sage: RealSet.cc_interval(2, 3)
           [ 2 :: 3 ]
        """
        if self.is_interval:
            return self.intervals_list[0].bounds
        else:
            raise ValueError, "Not an interval."

    
    def __contains__(self,x):
        """ is x in the realset?
              
            sage: I = RealSet.oo_interval(1, 3)
            sage: 2 in I
            True
            sage: 3 in I
            False
        """
        in_intervals = any(x in I for I in self.intervals_list)
        return in_intervals or x in self.points_list

    
    def union(self, other):
        """
        sage: I = RealSet.oc_interval(0,1)
        sage: J = RealSet.oo_interval(1,2)
        sage: I.union(J)
        ] 0 :: 2 [
            
        """
        if self.is_empty: return other    
        if other.is_empty: return self
        intervals = list(self.intervals_list)
        intervals.extend(other.intervals_list)
        points = list(self.points_list)
        points.extend(other.points_list)
        points = list(set(points))
        return RealSet(intervals, points).reduce()


    def reduce(self):
        r"""Normalize Realset by:
            - replacing overlaping intervals with its union.
            
            - Removing points at the interior of intervals.
            
            - Replacing 'bridge points' and corresponding intervals with union.  

            sage: RealSet([RInterval((1,2)),RInterval((1,4))],[1,3])
            [ 1 :: 2 [ + ] 1 :: 4 [ + {3}
            sage: RealSet([RInterval((1,2)),RInterval((1,4))],[1,3]).reduce()
            [ 1 :: 4 [
            sage: RealSet([RInterval((1,2)),RInterval((2,3))],[2])
            ] 1 :: 2 ] + ] 2 :: 3 [
            sage: RealSet([RInterval((1,2)),RInterval((2,3))],[2]).reduce()
            ] 1 :: 3 [
                     
            """
        intervals = RInterval.reduce(self.intervals_list)
        # No overlapping intervals now
        for p in self.points_list:
            if any(p in I for I in intervals):
                self.points_list.remove(p)
            bridge = [I for I in intervals if p in I.bounds]
            if len(bridge) == 2: # remove bridge
                K = bridge[0].hull(bridge[1])
                for I in bridge: intervals.remove(I)
                intervals.add(K)
                self.points_list.remove(p)
        # remaining points must be only in the boundary of intervals now
        self.intervals_list = list(intervals)
        return self 
    
    def __repr__(self):
        r"""
            sage: repr(RealSet([RInterval((0,1)),RInterval((2,3))],[0,3,4,5]))
            '[ 0 :: 1 [ + ] 2 :: 3 ] + {4, 5}'
            sage: repr(RealSet())
            '{}'
            """

        if self.is_empty: return '{}'
        points = list(self.points_list)
        def delim(p):
            b = p in points
            if b: points.remove(p)
            return b
        def stri(I):
            x0,x1 = I.bounds
            d0 = delim(x0) and '[ ' or '] '
            d1 = delim(x1) and ' ]' or ' ['
            return d0 + `x0` + ' :: ' + `x1` + d1
        str_intervals = " + ".join(map(stri, self.intervals_list))
        str_points = ', '.join([str(x) for x in points])
        if str_intervals and str_points:
            return str_intervals + ' + {%s}' % str_points
        if str_points:
            return '{%s}' % str_points
        return str_intervals
            
    @property
    def discrete(self):
        """
            RealSet is discrete (i.e: Does not contain intervals)?
            
            sage: RealSet.oo_interval(0,1).discrete
            False
            sage: RealSet(points=(1,2,3)).discrete
            True
        """
        return bool(len(self.intervals_list) == 0)
    
    @property
    def size(self):
        """The size of a discrete set is the number of points; the size of a real interval is Infinity:
            
           sage: RealSet(points=range(5)).size
           5
           sage: RealSet.oo_interval(0,3).size
           +Infinity
        """
        if self.discrete:
            return len(self.points_list)            
        else:   
            return Infinity
                
    def __eq__(self,other):
        """ Assume they are reduced
            sage: I = RealSet.oc_interval(0,1)
            sage: J = RealSet.co_interval(1,2)
            sage: I.intersection(J) == RealSet(points=[1])
            True
        """
        return self.subset(other) and other.subset(self)
                
    def different(self, A):
        r"""
            sage: A=RealSet([RInterval((1,2)),RInterval((1,4))],[1,3])
            sage: A
            [ 1 :: 2 [ + ] 1 :: 4 [ + {3}
            sage: B=RealSet([RInterval((1,2)),RInterval((1,4))],[1,3]).reduce()
            sage: B
            [ 1 :: 4 [
            sage: A.different(B)
            False
            sage: C=RealSet([RInterval((1,4))],[4])
            sage: A.different(C)
            True
            """
        self = self.reduce()
        A = A.reduce() 
        return (self.points_list != A.points_list) or (self.intervals_list != A.intervals_list)

    def subset(self, other, proper=False):
        """ A is subset of B
            sage: A = RealSet.oo_interval(0,1)
            sage: B = RealSet.cc_interval(0,1)
            sage: RealSet().subset(A)
            True
            sage: B.subset(A)
            False
            sage: A.subset(B)
            True
            sage: A.subset(A)
            True
            sage: A.subset(A, proper=True)
            False
        """
        if not all(p in other for p in self.points_list):
            return False
        for I in self.intervals_list:
            if not any(I.included(J) for J in other.intervals_list):
                return False
        return not (proper and other.subset(self))

    def evalboundary(self, F):
        r""" It does not integration per se. You must provide the primitive.
            To obtain \int_I f dx , we must compute I.evalboundary(F) where F is the primitive of f, since I.evalboundary(F) = F(b) - F(a)

            EXAMPLE:
            Integrate `f(x) = |x|` on a set.
            sage: F = lambda x: x**2/2.
            sage: I1 = RealSet.cc_interval(-1,0)
            sage: I2 = RealSet.cc_interval(1,2)
            sage: I1.union(I2).evalboundary(F)
            1.00000000000000
            sage: RealSet(points=range(10)).evalboundary(F)
            0
        """
        integral = 0    
        for I in self.intervals_list:
            a,b = I.bounds
            integral += F(b) - F(a)
        return integral
    
    def infimum(self):
        """Return the Infimum (greatest lower bound)
            sage: RealSet(points=range(3)).infimum()
            0
            sage: RealSet.oo_interval(1,3).infimum()
            1
            sage: RealSet().infimum()
            +Infinity
        """
        imin = min([I.bounds[0] for I in self.intervals_list] + [+Infinity])
        pmin = min(self.points_list + [+Infinity])
        return min(imin, pmin)

    def __neg__(self):
        r"""The opposite of a set: `-A = \{-x\mid x\in A\}`
            sage: -RealSet.oo_interval(1,2)
            ] -2 :: -1 [
        """
        intervals = [-I for I in self.intervals_list]
        points = [-p for p in self.points_list]
        return RealSet(intervals, points)
    
    def supremum(self):
        """Return the Supremum (least upper bound)
            
           sage: RealSet(points=range(3)).supremum()
           2
           sage: RealSet.oo_interval(1,3).supremum()
           3
           sage: RealSet().supremum()
           -Infinity
        """
        return - (-self).infimum()

    @property
    def is_empty(self):
        r"""
            sage: RealSet().is_empty
            True
            sage: RealSet([RInterval((1,2))],[]).is_empty
            False
            sage: RealSet([],[1]).is_empty
            False
            """ 
        return not self.intervals_list and not self.points_list

    def complement(self):
        """The complementary of a set:
            
           sage: RealSet.oo_interval(2,3).complement()
           ] -Infinity :: 2 ] + [ 3 :: +Infinity [
            
           sage: RealSet(points=range(3)).complement()
           ] 0 :: 1 [ + ] 1 :: 2 [ + ] 2 :: +Infinity [ + ] -Infinity :: 0 [
        """
        def p_complement(p):
            left = RInterval((-Infinity,p)) 
            right = RInterval((p,+Infinity))
            return RealSet(intervals=[left,right])
        def i_complement(I):
            a,b = I.bounds
            left = a != -Infinity and RealSet.oc_interval(-Infinity,a) or RealSet()
            right = b != +Infinity and RealSet.co_interval(b,+Infinity) or RealSet()
            return left.union(right)
        s = RealSet.oo_interval(-Infinity, +Infinity)
        for I in self.intervals_list:
            s = s.intersection(i_complement(I))
        for p in self.points_list:
            s = s.intersection(p_complement(p))
        return s
        
    def setdiff(self, other):
        r"""The set difference of `A` and `B`: `\{x \in A, x\notin B\}`
            
            sage: I = RealSet.oo_interval(2,+Infinity)
            sage: J = RealSet.oo_interval(-Infinity, 5)
            sage: I.setdiff(J)
            [ 5 :: +Infinity [
            sage: J.setdiff(I)
            ] -Infinity :: 2 ]
         """
        return self.intersection(other.complement())

    
    def intersection(self,other):
        """
            sage: I = RealSet.oc_interval(0,1)
            sage: J = RealSet.co_interval(1,2)
            sage: I.intersection(J)
            {1}
            
        """
        intervals = []
        for I in self.intervals_list:
            for J in other.intervals_list:
                ij_int = I.intersection(J)
                if not ij_int.is_empty:
                    intervals.append(ij_int)
        # border or isolated point in both sets
        points = set(self.points_list) &  set(other.points_list)
        # isolated/border points in self in the interior of other 
        for p in self.points_list:
            if any(p in I for I in other.intervals_list):
                points.add(p)
        # isolated/border points in other in the interior of self
        for p in other.points_list:
            if any(p in I for I in self.intervals_list):
                points.add(p)
    
        return RealSet(intervals, list(points)).reduce()

    
    def toGf(self):
        r"""only for interface with gf

            sage: RealSet([RInterval((1,2)),RInterval((3,4))],[2,5])
            ] 1 :: 2 ] + ] 3 :: 4 [ + {5}
            sage: RealSet([RInterval((1,2)),RInterval((3,4))],[2,5]).toGf()
            '{ ] 1 , 2 ] , ] 3 , 4 [ , {5} }'
        """
        if self.is_empty: return '{}'
        points = list(self.points_list)
        def delim(p):
            b = p in points
            if b: points.remove(p)
            return b
        def stri(I):
            x0,x1 = I.bounds
            d0 = delim(x0) and '[ ' or '] '
            d1 = delim(x1) and ' ]' or ' ['
            return d0 + `x0` + ' , ' + `x1` + d1
        str_intervals = " , ".join(map(stri, self.intervals_list))
        str_points = ' , '.join([str(x) for x in points])
        if str_intervals and str_points:
            return '{ ' + str_intervals + ' , {%s}' % str_points  + ' }'
        if str_points:
            return '{%s}' % str_points   
        if len(self.intervals_list) == 1 :
            return str_intervals 
        return '{ ' + str_intervals + ' }'
     
