incomplete concrete ClassI of Class = 
open 
	Syntax
in
{
lincat	
	Object = NP ;
	Prop  = S ;
	Class = CN ;
	-- Class] = ListNP ;
oper
	copula : NP -> NP -> S = \np1,np2 -> mkS (mkCl np1 np2) ;
lin
	istop cl = variants {} ;
	subclass scl cl = copula (mkNP a_Det scl) (mkNP a_Det cl) ;
	isa ob cl = copula ob (mkNP a_Det cl) ;
}
