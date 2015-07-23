incomplete instance MathI of Math = 
    PredefCnc **
open 
    myLaTeX, myFormal, (GL = GroundLaTeX),

    Lexicon, 
    Symbolic, 
    Syntax, 
    Cat,
    Prelude ,
    ParamX
in {
oper

    MathObjPlus = {v : NP ; s : Latex ; isSymb : Bool} ;

    PropositionPlus = {v : Proposition ; s : Latex ; isSymb : Bool} ;
    
    MathFuncPlus = {v : MathFunc ; s: Latex ; isSymb: Bool} ; 

    MathClPlus = {v : MathCl ; s : Latex ; isSymb : Bool} ;

    MathCNPlus = {v : MathCN ; s : SS ; isSymb : Bool} ;

    mkMathObj = overload {
      mkMathObj : NP -> Latex -> Bool -> MathObjPlus    -- basic constructor. Decide yourself if it is symbolic or not.
        = \np,sy,b -> {v = np ; s = sy ; isSymb = b} ;

      mkMathObj : NP -> MathObjPlus                     -- inherently verbal
        = \np -> {v = np ; s = dontCareSymb ; isSymb = False} ;

      mkMathObj : Latex -> MathObjPlus                  -- inherently symbolic
        = \sy -> {v = symbNP sy ; s = sy ; isSymb = True} ;

      mkMathObj : NP -> Latex -> MathObjPlus -> MathObjPlus   -- apply to given object: objects decides if it is symbolic.
        = \np,sy,x -> case x.isSymb of {
             True  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> Latex -> MathObjPlus -> MathObjPlus -> MathObjPlus   -- apply to two given objects: objects decides if it is symbolic.
        = \np,sy,x,y -> case <x.isSymb,y.isSymb> of {
           <True,True>  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             _          => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> Latex -> MathObjPlus -> MathObjPlus -> MathObjPlus -> MathObjPlus   -- apply to three given objects: objects decides if it is symbolic.
        = \np,sy,x,y,z -> case <x.isSymb, y.isSymb, z.isSymb> of {
           <True,True,True>  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             _               => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> Latex -> MathObjPlus -> MathFuncPlus -> MathObjPlus   -- for defint : apply to an object and a function
        = \np,sy,x,y -> case <x.isSymb,y.isSymb> of {
           <True,True>  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             _          => {v = np ; s = dontCareSymb ; isSymb = False}
	     } ;
      mkMathObj : NP -> Latex -> MathFuncPlus -> MathObjPlus -> MathObjPlus -> MathObjPlus   -- for defint_interval: apply to a function and two objects
        = \np,sy,x,y,z -> case <x.isSymb, y.isSymb, z.isSymb> of {
           <True,True,True>  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             _               => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> Latex -> MathFuncPlus -> MathObjPlus   -- for domain, range: apply to given function
        = \np,sy,x -> case x.isSymb of {
             True  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> SS -> Bool -> MathObjPlus    -- for emptyset
        = \np,sy,b -> {v = np ; s = mkPrec highest sy.s ; isSymb = b} ;
     } ;

{- the following cases were written for lins that are inherently verbal, so we do not need them

     mkMathObj : NP -> Latex -> MathListPlus -> MathObjPlus   -- for SData1 (mean,...) : apply to list
        = \np,sy,x -> case x.isSymb of {
             True  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}

             } ;
      mkMathObj : NP -> SS -> MathObjPlus -> MathListPlus -> MathObjPlus   -- for moment : apply to an object and an object list
        = \np,sy,x,y -> case <x.isSymb,y.isSymb> of {
           <True,True>  => {v = np ; s = mkPrec highest sy.s ; isSymb = True} ;
             _          => {v = np ; s = dontCareSymb ; isSymb = False}
	     } ;

      mkMathObj : NP -> Latex -> MathObjPlus -> PropositionPlus -> MathObjPlus   -- for suchthat : apply to an object and a proposition
        = \np,sy,x,y -> case <x.isSymb,y.isSymb> of {
           <True,True>  => {v = symbNP sy ; s = sy ; isSymb = True} ;
             _          => {v = np ; s = dontCareSymb ; isSymb = False}
	     } ;

      mkMathObj : NP -> SS -> MathListPlus -> MathObjPlus    -- for configuration
        = \np,sy,x -> case x.isSymb of {
             True  => {v = np ; s = mkPrec highest sy.s ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> SS -> MathObjPlus -> MathObjPlus   -- for mkConfiguration
        = \np,sy,x -> case x.isSymb of {
             True  => {v = np ; s = mkPrec highest sy.s ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathObj : NP -> Latex -> PropListPlus -> MathObjPlus   -- for point, line
        = \np,sy,x -> case x.isSymb of {
             True  => {v =  symbNP sy ; s = sy ; isSymb = True} ;
             False => {v = np ; s = dontCareSymb ; isSymb = False}
             } ;
   -}


             

    mkMathFunc = overload {
      mkMathFunc : MathFunc -> Latex -> Bool -> MathFuncPlus    -- basic constructor. Decide yourself if it is symbolic or not.
        = \f,sy,b -> {v = f ; s = sy ; isSymb = b} ;

      mkMathFunc : MathFunc -> MathFuncPlus                    -- inherently verbal
        = \f -> {v = f ; s = dontCareSymb ; isSymb = False} ;
  
      mkMathFunc : Latex -> MathFuncPlus                  -- inherently symbolic
        = \sy -> {v = NPfn (symbNP sy) ; s = sy ; isSymb = True} ;

      mkMathFunc : MathFunc -> SS -> Bool -> MathFuncPlus    -- for Var2Fun3: basic constructor. Decide yourself if it is symbolic or not.
        = \f,sy,b -> {v = f ; s = mkPrec highest sy.s ; isSymb = b} ;

      mkMathFunc : MathFunc -> Latex -> MathFuncPlus -> MathFuncPlus   -- apply to given function: objects decides if it is symbolic.
        = \f,sy,func -> case func.isSymb of {
             True  => {v = f ; s = sy ; isSymb = True} ;
             False => {v = f ; s = dontCareSymb ; isSymb = False}
	     } ;
      mkMathObj : MathFunc -> Latex -> MathFuncPlus -> MathFuncPlus -> MathFuncPlus   -- left_compose, right_compose : apply to two given objects
        = \f,sy,f1,f2 -> case <f1.isSymb,f2.isSymb> of {
           <True,True>  => {v = f ; s = sy ; isSymb = True} ;
             _          => {v = f ; s = dontCareSymb ; isSymb = False}
             } ;
      mkMathFunc : MathFunc -> Latex -> MathObjPlus -> MathFuncPlus   -- for lambda: apply to given object
        = \f,sy,x -> case x.isSymb of {
             True  => {v = f ; s = sy ; isSymb = True} ;
             False => {v = f ; s = dontCareSymb ; isSymb = False}
	     } ;
      mkMathFunc : MathFunc -> SS -> MathFuncPlus -> MathFuncPlus   -- for curl: apply to given function: objects decides if it is symbolic.
        = \f,sy,func -> case func.isSymb of {
             True  => {v = f ; s = mkPrec highest sy.s ; isSymb = True} ;
             False => {v = f ; s = dontCareSymb ; isSymb = False}
	     } ;
     } ;


--- unfortunately, overloading higher-order functions doesn't work

{- see corresponding bug, and more information: https://upc.podio.com/grammaticalframework/item/14825174

      appMathObj : (NP -> NP) -> (Latex -> Latex) -> Bool -> MathObjPlus -> MathObjPlus   -- apply to given object: we decide if it is symbolic.
        = \np,sy,b,x -> case x.isSymb of {
             True  => {v = np (symbNP x.s) ; s = sy x.s ; isSymb = b} ;
             False => {v = np x.v ; s = sy x.s ; isSymb = b}
             } ;
-}

      appMathObj : (NP -> NP) -> (Latex -> Latex) -> MathObjPlus -> MathObjPlus   -- apply to given object: objects decides if it is symbolic.
        = \np,sy,x -> case x.isSymb of {
             True  => {v = symbNP (sy x.s) ; s = sy x.s ; isSymb = True} ;
             False => {v = np x.v ; s = dontCareSymb ; isSymb = False}
             } ;

       
    app2MathObj : (NP -> NP -> NP) -> (Latex -> Latex -> Latex) -> MathObjPlus -> MathObjPlus -> MathObjPlus   -- apply to two objects
        = \np,sy,x,y -> case <x.isSymb,y.isSymb> of {
             <True,True>  => {v = symbNP (sy x.s y.s) ; s = (sy x.s y.s) ; isSymb = True} ;
             _            => {v = np x.v y.v ; s = dontCareSymb ; isSymb = False}
             } ;

    appListMathObj : (NP -> NP) -> (LatexList -> Latex) -> MathListPlus -> MathObjPlus   -- apply to a list of objects
        	= \np,sy,x -> case x.isSymb of {
        	     True  => {v = symbNP (sy x.s) ; s = sy x.s ; isSymb = True} ;
        	     False => {v = np (andNP x.v) ; s = sy x.s ; isSymb = False}
        	     } ;

    mkMathCl = overload {     
    	mkMathCl : MathCl -> Latex -> MathObjPlus -> MathObjPlus -> MathClPlus    
    	    = \cl,sy,x,y -> case <x.isSymb,y.isSymb> of {
    	       <True,True>  => {v = cl ; s = sy ; isSymb = True} ;
    	         _          => {v = cl ; s = dontCareSymb ; isSymb = False}
    	         } ;
 	--    Bool   = \cl,sy,b -> {v = cl ; s = sy ; isSymb = b} ;

        mkMathCl : MathCl -> MathClPlus                     -- inherently verbal
            =  \cl -> {v = cl ; s = dontCareSymb ; isSymb = False} ;
        } ;

    appListMathCl : (NP -> Cl) -> (LatexList -> Latex) -> MathListPlus -> MathClPlus   -- apply to a list of objects
        	= \np2cl,sy,x -> case x.isSymb of {
                     True  => {v = PositiveCl (np2cl (andNP x.v)) ; s = sy x.s ; isSymb = True};
                     False => {v = PositiveCl (np2cl (andNP x.v)) ; s = sy x.s ; isSymb = False}
                     } ;

    mkMathCN : MathCN -> SS -> Bool -> MathCNPlus    -- for SetName1: basic constructor. Decide yourself if it is symbolic or not.
        = \cn,sy,b -> {v = cn ; s = sy ; isSymb = b} ;


    useMathObj = overload {
      useMathObj : MathObjPlus -> NP = \x -> x.v ;
      useMathObj : MathObjPlus -> Latex = \x -> x.s ;
      } ;

    dontCareSymb = constant "XXX" ;

    Latex : Type = Value ; -- TermPrec, defined in myLatex

    symbNP : Latex -> NP  = \x -> symb x.s ; --  symb (dollar x.s) 

    varProp : Str -> Proposition =     --also used in VariablesI
        \x -> symb (mkSymb x) ;

    symbProposition : Latex -> Proposition = \x -> varProp x.s ; --varProp (dollar x.s); 

    useVarPlus = \x -> mkMathObj (constant x.s) ;  

    --dollar : Str -> Str = \s -> "$" ++ s ++ "$" ;

-- for lists

    MathListPlus : Type  = {v : [NP] ; s : LatexList ; isSymb : Bool} ;
    
    PropListPlus : Type = {v: PropList ; s: LatexList; isSymb: Bool} ;

    LatexList : Type = SS ; -- as defined in GroundLaTeX for [ValNum]

    consMPlus : MathObjPlus -> MathListPlus -> MathListPlus = \x,xs -> {
      v = mkListNP x.v xs.v ;
      s = GL.consValue x.s xs.s ;
      isSymb = andB x.isSymb xs.isSymb
      } ; 
    baseM2Plus : MathObjPlus -> MathObjPlus -> MathListPlus = \x,y -> {
      v = mkListNP x.v y.v ;
      s = GL.baseValue x.s y.s ;
      isSymb = andB x.isSymb y.isSymb
      } ;

-- for Idx

    MathIdx = {v : Numeral ; s : Latex} ;

    mkIdx : Str -> Numeral -> MathIdx = \s,v -> {v = v ; s = constant s} ;

-- for Prop
    my_possess_Prep = possess_Prep ;


    CompAction     = V2 ;
    QuestAction    = VQ ;
    BoolAction     = VS ;
    SimpleMathOper = Phr ;
    MathOper 	   = Text ;
    MathOperList   = Text ;
    MathExercise   = Text ;
    MathObj 	   = NP ;
    MathList 	   = [NP] ;
    MathSomeVars   = MathList ** {s3: MathVar ; num: NVars} ; --- {s1:MathObj; s2:MathList} ;
    MathCl 	   = {s : Cl ; p:Polarity} ;
    MathCN 	   = CN ;
    CnCn 	   = CN -> CN ;

--    STends 	   = {s: Str; t:Tends} ; -- Str to be removed after compiler improving. 

    onSet = \func,set ->
    let
        f = mathFunc2NP func
    in mkNP f (mkAdv on_Prep set) ;


--2 Special indexes
oper
    MathIdx = {v : Numeral ; s : Latex} ;
     ----AR changed type
    -- num2Idx : Numeral -> MathIdx = \x -> x  ; -- mkOrd;

    --number1 = num2Idx n1_Numeral ;
    --number2 = num2Idx n2_Numeral ;
    --number3 = num2Idx n3_Numeral ;
    --number4 = num2Idx n4_Numeral ;
    --number5 = num2Idx n5_Numeral ;
    --number6 = num2Idx n6_Numeral ;
    --number7 = num2Idx n7_Numeral ;

--2 Auxiliary
oper		
    massPl = mkNP a_Art plNum ;
    prepAdv = mkAdv ;
    whereCl = \clause -> 
        mkAdv where_Subj (mkS clause) ;
    whereIs = \x,y -> whereCl (mkCl x y) ;
    atAdv = prepAdv at_Prep;
    possessAdv = prepAdv my_possess_Prep ;

    fromTo = \func,x0,x1 ->
        let
            from = mkAdv from_Prep x0 ;
            to = mkAdv to_Prep x1 ;
            f = mathFunc2NP func
	in mkNP (mkNP f from) to ;
        --in mkNP (mkNP (mkNP f (mkAdv on_Prep (mkNP the_Det interval_N))) from) to ;

    respect = \x,f -> 
        adverbNP (prepAdv respect_to_Prep (useVar x)) f ;

    mathFunc2NP = \f -> f ;

    rangeOver  = \v,set ->
            let
                x = useVar v ;
                cl : Cl = mkCl x range_V2 set ;        --(DefGenPlCN element_CN set) ; we want eng: "ranges over B"; spa: "varía en B"
				sen : S = mkS cl
            in mkAdv when_Subj sen;


--2 Type for functions of 1 variable.
oper	
    MathFunc = {t:FuncForm; s2:MathVar} ** NP ; 

--3 Make functions in each form
    lambda_fn = \x,f -> 
        (DefGenN3 function_N3 (useVar x) f) ** {t= FVar; s2= x} ;

    NPfn = \np -> 
         np ** {t= FGral; s2= NullVar} ;

    named_fn = \n -> 
        {t= FNamed; s2=NullVar} ** (mkNP the_Art n) ;

    hashed_fn = \s -> 
        (useVar s) ** {t= FNoVar; s2=NullVar} ;

--3 Generate functional forms for diff, int, ...

    flwrt = \n,f ->
        let np = DefGenCN n
        in case f.t of {
            FVar => variants {
                        NPfn (np (respect f.s2 f)) ;
                        NPfn (np f) } ;
            _ => NPfn (np f)
        } ;

    flwrtNP = \ord,cn,f ->
        let np = DefGenCNOrd cn ord
        in case f.t of {
            FVar => NPfn (np (respect f.s2 f)) ;
            _ => NPfn (np f)
        } ;

    fn_qualNP = \f ->
        case f.t of {
            FVar =>  respect f.s2 f ;
            _  =>  f
        } ;

--3 Apply function to value.

    at_fn = \f,x -> 
        case f.t of {
            FNoVar => variants {} ; --TODO
            FGral => NPfn (adverbNP (atAdv x) f) ;
            FNamed => NPfn (adverbNP (possessAdv x) f) ;
            FVar => NPfn (adverbNP (whereIs (useVar f.s2) x) f)
        } ;

--2 Lists and lists of Vars
oper
    consM  = mkListNP ;
    baseM2 = mkListNP ;


--3 Lists of MathVars
    singleSV = \x ->
        let
            xv = useVar x
        in (baseM2 xv xv) ** {s3 = x ; num= One} ;

    consSV = \x,xs ->
        let
            xv = useVar x
        in case xs.num of {
             One => baseM2 xv (useVar (xs.s3)) ;
             Many => consM xv xs
             } 
           ** {s3 = x ; num = Many} ;

--2 Numeric constants
oper
    useNum  = symb ;
    useReal = symb ;


--2 Variables, Strings
oper
    NullVar = mkVar "x" ;

oper
    apposCN = mkCN ;

--2 Noun Phrases
oper
    DefSgNP   = mkNP the_Art ;
    InDefSgNP = mkNP a_Art ;
    InDefPlNP = mkNP a_Art plNum ;
    DefGenN2  = app ;
    DefGenCN  = \noun,obj -> 
        mkNP the_Art (modCN noun (mkAdv my_possess_Prep obj)) ;        --the noun of obj
     
    DefGenPlCN = \noun,obj -> 
        mkNP the_Art plNum (modCN noun (mkAdv my_possess_Prep obj));   --the nouns of obj 


    DefGenCNOrd = \cn,ord,obj -> 
        mkNP (mkDet the_Art sgNum ord)
             (modCN cn (mkAdv my_possess_Prep obj)) ; 
    
    DefGenCNidx = \cn,obj,i -> 
        mkNP (mkDet the_Quant (mkOrd i.v))
             (modCN cn (mkAdv my_possess_Prep obj)) ; 

    revOrdCN = \cn,i ->
        let
            ap : AP = mkAP (mkOrd i.v)
        in mkCN ap cn ;

    DefGenCNidxRev = \cn,obj,i ->
        DefGenCN (revOrdCN cn i) obj ; 

    DefGenN3 = app ;

    onRange  = \np,from,to -> 
        adverbNP (mkAdv to_Prep to)
                 (adverbNP (mkAdv from_Prep from) np) ;

    possessCN = \cn,obj -> 
        modCN cn (possessAdv obj) ;

    modCN = mkCN ;

    pointWith = \point,x ->
        mkCN point (prepAdv (with_Prep | elem_Prep) x) ;

    mCoords = \coords, obj ->
        massPl (mkCN coords obj);

    DefCNwithCN = \point,coords,obj -> 
        DefSgNP (pointWith point (mCoords coords obj)) ;


--3 Adverbial NPs

    adverbNP = \a,np -> mkNP np a ;        

--3 complex NPs

    PosPredNPS =
        \n,v -> mkFullProp (PositiveCl (mkCl n v)) ;

    CompAdvVP = \n,prep ->
        mkVP (prepAdv prep n) ;

    limitCN = \x0,x,fx ->
        let
            tendS : MathObj -> MathObj -> Proposition = \v,c -> 
                posCl (mkCl v (tend_to c))  --posCl (mkS (mkCl v (tend_to c)))
        in modCN (modCN limit_CN (possessAdv fx)) (mkAdv as_Subj (tendS (useVar x) x0)) ;

--3 Coordinated NPs

    andNP = mkNP and_Conj ;
    orNP  =  mkNP or_Conj ;
    xorNP = mkNP either7or_DConj ;

    coordList : (MathList -> MathObj) -> (x,y:MathObj) -> MathObj = \c,obj1,obj2 ->
        c (mkListNP obj1 obj2) ;
    
    both_and =  coordList andNP ;  
    both_or  = coordList orNP ;
    both_xor = coordList xorNP ; 

--2 Phrases
oper
    mkTextS = mkText ;
    mkTextQ = \phr -> 
        mkText phr questMarkPunct ;



--2 Propositions and Lists of Propositions
oper
    Prop2NPModCNPos = \cn,np1,np2 -> 
        PositiveCl (mkCl np1
            (InDefSgNP (modCN cn (prepAdv my_possess_Prep np2)))) ;

    Prop2NPModCNNeg = \cn,np1,np2 -> 
        NegativeCl (mkCl np1 
            (InDefSgNP (modCN cn (prepAdv my_possess_Prep np2)))) ;


    relationNAP : Polarity -> (NP -> AP) -> MathObj -> MathObj -> MathCl = \pol,fap,np1,np2 ->
            let
                cl : Cl = mkCl np1 (fap np2) ;
            in case pol of {
                Pos => PositiveCl cl ;
                Neg => NegativeCl cl } ;

    relationPosA2 = relationNAP Pos ;
    relationNegA2 = relationNAP Neg ;

    Proposition  = S ;
    PropList  = [S] ;
    FullQProp = QS ;

    base_propLPlus : (p,q : PropositionPlus) -> PropListPlus =
		\a,b -> {v = mkListS a.v b.v ; s = dontCareSymb ; isSymb = False} ; --is inherently verbal? I do not find its form in LaTeX...

    cons_propLPlus : PropositionPlus -> PropListPlus -> PropListPlus =
                \a,ls -> {v = mkListS a.v ls.v ; s = dontCareSymb ; isSymb = False} ;--is inherently verbal? I do not find its form in LaTeX...

    PositiveCl = \cl -> {s = cl ; p=Pos}; --{s = mkS cl ; p=Pos} ;
    NegativeCl = \cl -> {s = cl ; p=Neg} ;  --{s = mkS negativePol cl ; p=Neg} ;

    pcl2cl : MathCl -> Cl = \cl -> cl.s ;

    mkFullQProp = \cl -> 
        case cl.p of {	
            Pos => posQS (mkQS (pcl2cl cl)) ;
            Neg => negQS (mkQS negPol (mkQCl (pcl2cl cl))) } ;


    mkFullProp = \cl ->
        case cl.p of {
            Pos => posS (posCl cl.s) ;
            Neg => negS (negCl cl.s)
            } ;

    mkFullPropPlus  = overload {
        mkFullPropPlus : MathCl -> Latex -> Bool -> PropositionPlus    -- basic constructor
        	= \cl,sy,b -> {v = mkFullProp cl ; s = sy ; isSymb = b} ;

        mkFullPropPlus : MathCl -> PropositionPlus                    -- inherently verbal
        	= \cl -> {v = mkFullProp cl; s = dontCareSymb ; isSymb = False} ;
 
        mkFullPropPlus : Latex -> PropositionPlus                  -- inherently symbolic
        	= \sy -> {v = symbProposition sy ; s = sy ; isSymb = True} ;

        mkFullPropPlus : MathCl -> Latex -> PropositionPlus -> PropositionPlus   -- apply to given object
	        = \cl,sy,x -> case x.isSymb of {
	             True  => {v = symbProposition sy ; s = sy ; isSymb = True} ;
	             False => {v = mkFullProp cl ; s = dontCareSymb ; isSymb = False}
	             } ;
        mkFullPropPlus : Proposition -> Latex -> PropositionPlus -> PropositionPlus                  
        	= \p,sy,x -> case x.isSymb of { 
                     True  => {v = p ; s = sy ; isSymb = True} ;
                     False => {v = p ; s = sy ; isSymb = False}
                     } ;
        mkFullPropPlus : Proposition -> Latex -> PropositionPlus -> PropositionPlus -> PropositionPlus         --implies, equivalent      
        	= \p,sy,x,y -> case <x.isSymb,y.isSymb> of {
           		<True,True>  => {v = p ; s = sy ; isSymb = True} ;
             		_            => {v = p ; s = dontCareSymb ; isSymb = False}
        	     } ;

        mkFullPropPlus : Proposition -> PropositionPlus                    -- and, xor, or: for lists, inherently verbal
         	= \p -> {v = p; s = dontCareSymb ; isSymb = False} ;

        mkFullPropPlus : Proposition -> Latex -> Bool -> PropositionPlus     --true, false             
        	= \p,sy,b -> case b of { 
                     True  => {v = p ; s = sy ; isSymb = True} ;
                     False => {v = p ; s = sy ; isSymb = False}
                     } ;

	} ;



     appListProp : (PropList -> Proposition) -> (LatexList -> Latex) -> PropListPlus -> PropositionPlus   -- apply to a list of propositions
        	= \np,sy,p -> case p.isSymb of {
                    True  => {v = np p.v ; s = sy p.s ; isSymb = True} ;
                    False => {v = np p.v ; s = sy p.s ; isSymb = False} 
                    } ;


----    pcl2cl : MathCl -> Cl = \cl -> cl ; -- to get overload res to work on subtype

    posCl x = mkS x ; 
    negCl x = mkS negPol x ; 
    posS  = \s -> s ;
    negS  = \s -> s ;
    posQS = \qs -> qs ** {p = Pos} ;
    negQS = \qs -> qs ** {p = Neg} ;

    and_prop = \ab -> posS (mkS and_Conj ab) ;
    or_prop = \ab -> posS (mkS or_Conj ab) ;
    xor_prop = \ab -> posS (mkS either7or_DConj ab) ;

--2 Selection Operations
oper
    such_that = \o,p -> 
        adverbNP (mkAdv suchthat_Subj p) o ;
    
    SelectN  = \o,p -> 
        mkTextS (mkPhr (mkUtt (mkImp (
                mkVP select_V2 (such_that o p))))) ;

    SelectNamed = \o,s,p -> 
        mkTextS (mkPhr (mkUtt (mkImp (
            mkVP select_V2 (such_that (setN (useVar o) s) p))))) ;

    SelectFromN = \o,s,p ->
        let os = mkNP o (mkAdv from_Prep s)
        in mkTxtVP (mkVP select_V2 (such_that os p)) ;

    setN = \o,s -> 

        InDefSgNP (apposCN s o) ; 

    a_element : MathObj = InDefSgNP element_CN ;


--2 Declarations + combinations of operations
oper
    consOperation = mkText ;
    baseOperation = \t -> t  ;

    declareOper = \s,op ->   variants{
			let assume = mkImp (mkVP assume_VS s) 							--assume, supon
				in mkText (mkPhr assume) op ;
			let assume = lets_Utt (mkVP assume_VS s) 						--let's assume, supongamos
				in mkText (mkPhr assume) op 
			};

    ImperativeV2 = \verb,obj ->
	mkText (mkPhr (mkImp verb obj));
        --mkTxtVP (mkVP verb obj) ;

    ImperativeV3 verb obj1 obj2 = 
        mkTxtVP (mkVP verb obj1 obj2) ;

    ImperativeVS verb prop = 
        mkTxtVP (mkVP verb prop) ;

    ImperativeVQ verb qprop = 
        mkTxtVP (mkVP verb qprop) ;
        
    ImperativeTo = \verb,obj,num,n ->
        let instrument : Adv = mkAdv to_Prep (mkNP num.v n) ;
            vp : VP = mkVP verb obj
        in mkTxtVP (mkVP vp instrument) ;
    
    mkTxtVP = \vp -> mkText (mkPhr (mkImp vp));

    MathVar = SS ;
    mkVar = \v -> {s= v} ;
    useVar = symb ;

    --useQualVar = \cn,x ->    --moved to PlanGeo1I
    --    let
    --        cx : Card = symb (mkSymb x.s)
    --    in symb cn cx ;

   -- usePointVar = useQualVar point_CN ;  --do we use it?
   -- varIdx = \x -> symb (mkSymb (var2str x)) ;
    subjunctS = \A,B -> mkS (mkAdv if_Subj A)
            			(mkS then_Adv B) ; --- if A then, B

    DefNPwithElem = \cn,o ->  
        DefSgNP (mkCN cn (prepAdv elem_Prep 
                    (massPl (mkCN element_CN o)))) ;  
        -- "the ...of/with elements x, y and z"


    DefNPwith = \n,o -> 
        DefSgNP (mkCN n (prepAdv with_Prep o)) ;  
        -- "the n with o"

    whatis = \o ->
        let
            what : IComp = what_IComp
        in mkTextQ (mkPhr (mkUtt (mkQS (mkQCl what o)))) ;

    inObj = prepAdv in_Prep ;
    AdvS  = mkS ;


mkbiCompAP : (_,_:NP -> AP) -> MathObj -> AP = \f,g,np -> 
    mkAP or_Conj (f np) (g np) ;

predbiComp = \fap1,fap2,np1,np2 -> 
    PositiveCl (mkCl np1 (mkbiCompAP fap1 fap2 np2)) ;

-- this has an exception in MathEng to produce uncontracted negation (don't -> do not)
negPol : Pol = negativePol ;

-- this has an exception in Fin, where variables have case endings
var2str : MathVar -> Str = \x -> x.s ;

}
