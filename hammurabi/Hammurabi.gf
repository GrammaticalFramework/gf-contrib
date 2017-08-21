abstract Hammurabi = {
    flags startcat = Law ;
    cat
        Law ;
	Action ;
	Item ;
	Person ;
	Object ;
	Quantity ;
			
    fun
	FreeMan  : Person ;
	Commoner : Person ;
	Slave    : Person ;
	King     : Person ;
	Eye      : Object ;
	Bone     : Object ;

		
	n_mana   : Quantity ;
	
	Poss : Object -> Person -> Item ;
	Det  : Object -> Item ;
	
	Strike  : Action ;
	Break   : Action ;	
--		AndAction : Action -> Action -> Action ;
		
	EyeForEye  : Action -> Person -> Person -> Object -> Law ;
	HitForHit  : Action -> Person -> Person -> Law ;
	ShallPay   : Action -> Person -> Item -> Law ;
}
