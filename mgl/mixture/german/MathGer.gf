--# -path=.:../lexicon:prelude:present:mathematical

instance MathGer of Math = MathI -
	[onRange,
	 onSet,
	 DefNPwithElem,
         my_possess_Prep,
         useVar,
         useVarPlus,
         rangeOver,
         fromTo,
         lambda_fn,
	 declareOper,
	 ImperativeTo]
with  
    (Cat = CatGer),
    (Syntax = SyntaxGer), 
    (Symbolic = SymbolicGer), 
    (Symbol = SymbolGer), 
    (Lexicon = LexiconGer) **
open
	(R = ResGer), 
	NounGer, 
        (P = ParadigmsGer),
        AdjectiveGer, 
	SentenceGer 
in {

oper
 	mySymbPN : Symb -> PN = 
                   \i -> lin PN {s = table {
					R.Gen      => "von" ++ i.s ;
					_          => i.s };
		   		 g = R.Neutr} ;

      
	-- element_linalg_CN : CN = mkCN (P.mkN "Element" "Elemente" P.neuter) ;
        then_Adv = P.mkAdv "dann" ;
        elem_Prep = my_possess_Prep ;
        
        my_possess_Prep = P.genPrep;

	onRange  : MathObj -> MathObj -> MathObj -> MathObj = \thing,from,to ->            
    		         adverbNP (mkAdv till_Prep to)
			               (adverbNP (mkAdv part_Prep from) thing) ;

        onSet: MathFunc -> NP -> MathObj = \func,set ->
            let f = mathFunc2NP func
    		in mkNP f (mkAdv over_Prep set) ;

        DefNPwithElem : CN -> MathObj -> MathObj = \cn,o ->  
        	DefSgNP (mkCN cn (prepAdv with_Prep 
                	(massPl (mkCN element_CN o)))) ;  
        -- "the ...with elements x, y and z"


	useVar : MathVar -> MathObj 
		= \s -> UsePN (mySymbPN (mkSymb s.s)) ;

        useVarPlus : MathVar -> MathObjPlus  = \s ->  mkMathObj (UsePN (mySymbPN (mkSymb s.s))) (constant s.s) True ;
                                                      --mkMathObj (UsePN (mySymbPN (mkSymb (dollar s.s)))) (constant s.s) True;

 	rangeOver : MathVar -> (set:MathObj) -> Adv  = \v,set ->
             let
                  x = useVar v ;
                  cl : Cl = mkCl x range_V2 set ;    -- die Menge (problem: die Menge das Intervall ) :  (mkNP the_Art (mkCN set_N set)) ;
				sen : S = mkS cl
             in mkAdv wobei_Subj sen;

	fromTo : MathFunc -> MathObj -> MathObj -> NP 
	     = \func,x0,x1 ->
        	let
        	    from = mkAdv part_Prep x0 ;
            	    to = mkAdv till_Prep x1 ;
            	    f = mathFunc2NP func
        	in mkNP (mkNP f from) to ;
        	-- in mkNP (mkNP (mkNP f (mkAdv over_Prep (mkNP the_Det interval_N))) from) to ;

        lambda_fn : MathVar -> MathObj -> MathFunc = \x,f -> 
      		(mkNP the_Det (my_mkCN function_N (mkRS (mkRCl which_RP (mkVP (mkVP abbilden_V2 (useVar x)) (mkAdv onto_Prep f)    ))))) ** {t= FVar; s2= x} ;
   
 	my_mkCN :  N -> RS  -> CN    
      		= \x,y -> RelCN (UseN x) y   ; --(mkCN gives an error)

        declareOper: Proposition -> MathOper -> MathOper  = \s,op ->
		let assume = mkUtt (my_mkAP (mkAP (P.mkA ["angenommen ,"])) s) ;
                in mkText (mkPhr assume) op ;

	my_mkAP : AP -> S -> AP    -- probable that she sleeps  
		=  \ap,s -> SentAP ap (EmbedS s) ; --% 

    	ImperativeTo  : V2 -> MathObj -> MathIdx -> N -> MathOper 
		= \verb,obj,num,n ->
       		let instrument : Adv = mkAdv on_Prep (mkNP num.v n) ;
        	    vp : VP = mkVP verb obj
        	in mkTxtVP (mkVP vp instrument) ;


}
