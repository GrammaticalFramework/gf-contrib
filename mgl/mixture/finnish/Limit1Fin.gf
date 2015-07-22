concrete Limit1Fin of Limit1 =
GroundFin ** Limit1I - [limitTendNP, limit] 
with
(Lexicon = LexiconFin),
(Math = MathFin) **
open
	(P = ParadigmsFin),
	SyntaxFin,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = 
                table {
		TNone		=> \cn -> cn ; --P.mkAdv [];
		TAbove		=> byRight ; --_Adv ;
		TBelow		=> byLeft ; --_Adv ;
		TBothSides	=> byBothSides } ; --_Adv };

        limitTendNP  : (Tends => CnCn) -> MathObj -> STends -> MathVar -> MathObj -> MathObj = 
      		\tcncn,x0,st,x,fx ->
        	   let
            		hacked_x = ss (var2str x ++ st.s) ;  -- Hack: The parser must find a non-empty string (st.s = [])
            		limit = limitCN x0 x fx ; ---- x0 hacked_x fx ;
            		t = st.t ;
        	   in DefSgNP ((tcncn!t) limit) ;

lin 
	limit f t v a = mkMathObj (limitTendNP limitAdv f.v t v a.v) (L.limit f.s t.t (var2SS v) a.s) f a ;   
								 				--ValNum -> TendsTo -> VarNum -> ValNum -> ValNum;
}
