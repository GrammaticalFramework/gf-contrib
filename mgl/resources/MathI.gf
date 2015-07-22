incomplete instance MathI of Math = 
    PredefCnc **
open 
    Lexicon, 
    Symbolic, 
    Syntax, 
    Cat,
    Prelude,
    ParamX
in {
oper
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
    MathCl 	   = Cl ** {p:Polarity} ;
    MathCN     = CN ;
    MathCNPlus = {cn: CN; s: Str} ;
    CnCn 	   = CN -> CN ;

    STends 	   = {s: Str; t:Tends} ; -- Str to be removed after compiler improving. 

    limitTendNP = \tcncn,x0,st,x,fx ->
        let
            hacked_x = ss (var2str x ++ st.s) ;  -- Hack: The parser must find a non-empty string (st.s = [])
            limit = limitCN x0 hacked_x fx ;
            t = st.t ;
        in DefSgNP ((tcncn!t) limit) ;

    onSet = \func,set ->
    let
        f = mathFunc2NP func
    in mkNP f (mkAdv on_Prep set) ;


--2 Special indexes
oper
    MathIdx = Numeral; -- Ord;
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
        mkNP (mkDet the_Quant (mkOrd i))
             (modCN cn (mkAdv my_possess_Prep obj)) ; 

    revOrdCN = \cn,i ->
        let
            ap : AP = mkAP (mkOrd i)
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
                posCl (mkCl v (tend_to c))
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

    base_propL = \a,b -> mkListS a b ;
    cons_propL = mkListS ;

    PositiveCl = \cl -> cl ** {p=Pos} ;
    NegativeCl = \cl -> cl ** {p=Neg} ;

    mkFullQProp = \cl -> 
        case cl.p of {	
            Pos => posQS (mkQS (pcl2cl cl)) ;
            Neg => negQS (mkQS negPol (mkQCl (pcl2cl cl))) } ;

    mkFullProp = \cl ->
        case cl.p of {
            Pos => posS (posCl cl) ;
            Neg => negS (negCl cl) } ;

    pcl2cl : MathCl -> Cl = \cl -> cl ; -- to get overload res to work on subtype

    posCl = mkS ; 
    negCl = mkS negPol ;
    posS  = \s -> s ** {p = Pos} ;
    negS  = \s -> s ** {p = Neg} ;
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
            mkVP select_V2 (such_that (setN (useVar o) s.cn) p))))) ;

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
        let instrument : Adv = mkAdv to_Prep (mkNP num n) ;
            vp : VP = mkVP verb obj
        in mkTxtVP (mkVP vp instrument) ;
    
    mkTxtVP = \vp -> mkText (mkPhr (mkImp vp));

    MathVar = SS ;
    mkVar = \v -> {s= v} ;
    useVar : MathVar -> MathObj = symb ;
    --useQualVar = \cn,x ->      --moved to PlanGeo1I
    --    let
    --        cx : Card = symb (mkSymb x.s)
    --    in symb cn cx ;

   -- usePointVar = useQualVar point_CN ; --do we use it??
   -- varIdx = \x -> symb (mkSymb (var2str x)) ;
    subjunctS = \A,B -> 
        mkS (mkAdv if_Subj A)
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
