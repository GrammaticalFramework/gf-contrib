resource Maybe' = Maybe ** open Prelude in {

	oper

		Nothing' : (T : Type) -> Maybe T = \_ -> {
			inner = variants {} ;
			exists = False
		} ;

}
