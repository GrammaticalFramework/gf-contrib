concrete WPRelationProlog of WPRelation =
	WPProblemProlog **
open
	Formal in
{
oper
    isinOp : (_,_:TermPrec) -> TermPrec = \x,y -> fun2 "isin" x y ;
    z : TermPrec = constant "Z" ;
    lambda = fun2 "lambda" ;
    ownOp : (_,_:TermPrec) -> TermPrec = \x,y -> fun2 "own" x y ;

lin -- isin
	isin   = isinOp ;
    E2isin = isinOp ;
	P2isin = isinOp ;
	C2isin cl am = fun2 "compose" am (lambda z cl) ;
	Q2isin cl obj = find (isinOp cl obj) ;

lin -- own
	E1owns = ownOp ;
	P1owns = ownOp ; 
	Q1owns obj cl = find (ownOp obj cl) ; 
}