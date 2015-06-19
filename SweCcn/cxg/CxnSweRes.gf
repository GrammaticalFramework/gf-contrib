resource CxnSweRes = open CommonScand, CatSwe, Prelude in {

	oper

		prefixV : Str -> V -> V = \p,v -> lin V {
			s = \\vform => p ++ BIND ++ v.s ! vform ;
			part = v.part ;
			vtype = v.vtype
		} ;

		suffixV : V -> Str -> V = \v,s -> lin V {
			s = \\_ => v.s ! VI (VInfin  Act) ++ BIND ++ s ;
			part = v.part ;
			vtype = v.vtype
		} ;

		toStr = overload {
			toStr : Prep -> Str = \prep -> prep.s ;
			toStr : A -> Str = \a -> a.s ! AF (APosit (Weak Sg)) Nom ;
			toStr : N -> Str = \n -> n.s ! Sg ! Indef ! Nom ;
		} ;

}
