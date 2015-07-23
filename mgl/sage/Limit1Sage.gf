concrete Limit1Sage of Limit1 = GroundSage **
open
	mySage, 
	myFormal,
	Prelude
in
{
param 
	Tends = Above | Below | Both | None ;
oper
	decorate : Tends -> Str = 
		\t -> case t of {
					Above => variants{ ", dir = '+' )" ; ", dir = 'plus' )" ; ", dir = 'right' )" } ;
					Below => variants{ ", dir = '-' )" ; ", dir = 'minus' )" ; ", dir = 'left' )" } ;
					_     => ")"	
					} ;

	tend : SS -> TermPrec -> TermPrec = \v,a  ->  infixn 4 "=" (constant v.s) (constant a.s) ;

lincat
	TendsTo = Tends ;
lin
	limit f t v a = variants{ delimited2 "limit(" "," (decorate t) a (tend v f) ;                  -- limit((x^2 - 1)/(x - 1), x=1, dir='+')
                                  function_command a (delimited "limit(" (decorate t) (tend v f)) ;    -- only when x = var('x'); f = (1+1/x)^x ; f.limit(x=1, dir='+')
 				};

	both_sides = Both ;
	above	   = Above ;
	below	   = Below ;
	null	   = None ;
}
