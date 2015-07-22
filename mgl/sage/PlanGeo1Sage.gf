concrete PlanGeo1Sage of PlanGeo1 = GroundSage **
open
	mySage,
	Prelude in
{ 
lincat
	Configuration = SS ;
	[Configuration] = SS ;
	Constraint = SS ;
	[Constraint] = SS ;
	
lin
	-- not defined enterily
	point v cs = variants {} ; 
	line v cs = variants {} ; 
	incident p q = variants {} ; 
	configuration  = variants {} ; 
	assertion = variants {} ;
	are_on_line ps = variants {} ; 
	mkConfiguration p = variants {} ;
	
}
