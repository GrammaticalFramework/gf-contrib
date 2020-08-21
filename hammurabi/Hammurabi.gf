abstract Hammurabi = Numeral ** {
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


	DigQ : Digits -> Quantity ;
        NumQ : Numeral -> Quantity ;

	Poss : Object -> Person -> Item ;
	Det  : Object -> Item ;

	Strike  : Action ;
	Break   : Action ;
--		AndAction : Action -> Action -> Action ;

        -- If Person1 does Action to Person2's Object, …
	EyeForEye  : Action -> Person -> Person -> Object -> Law ;

        -- If Person1 does Action to Person2, …
	HitForHit  : Action -> Person -> Person -> Law ;

        -- If Person does Action to Item,  they shall pay this much
        ShallPay : Action -> Person -> Item -> Quantity -> Law ;
}
