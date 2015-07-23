incomplete concrete CommandsI of Commands = 
GroundI,
BinaryOpsI **
open
    Symbolic,
    Prelude in
{ 
param K = KN | KF | KS | KT;

lincat
    Kind 	=  K ;
    Command   	= MathOper ;
    Answer    	= Text ;
    Value 	= MathObj ;
    Variable	= MathVar ;
   
oper
    assignedNAP : MathObj -> MathObj -> Cl = \np1,np2 -> mkCl np1 (assigned_to np2) ;
    
    block_CN: SS -> CN = \name -> mkCN block_N (symb name);

lin
    Num 	= KN ; -- ss "num" ;
    Fun 	= KF ;
    Set 	= KS ;
    Tensor 	= KT ;

    Compute k x = ImperativeV2 compute_V2 x ;

    addTo        x y = ImperativeV3 add_V3 x y ;
    subtractFrom x y = ImperativeV3 subtract_V3 x y ; 
    multiplyBy   x y = ImperativeV3 multiply_V3 x y ;
    divideBy     x y = ImperativeV3 divide_V3 x y ;

    intersectWith   x y = ImperativeV3 intersect_V3 x y ;
    uniteTo         x y = ImperativeV3 unite_V3 x y ; 

    itNum    = it_NP ;
    itSet    = it_NP ;   
    itFun    = NPfn it_NP ;   
    itTensor = it_NP ;

--  Compute _ x = ImperativeV2 compute_V2 x ;

    fromNum x = x ;
    fromFun x = x ;
    fromSet x = x ;
    fromTensor x = x ;

    VarfromNum x = x ;
    VarfromFun x = x ;
    VarfromSet x = x ;
    VarfromTensor x = x ;

    FeedBack _ x1 x2 	= mkText (mkCl x1 x2) ; 			
    Simple _ x 		= mkText (mkCl (mkNP it_Pron) x) ;              

    Assign _ x y    = mkText (ImpP3Assign (useVar x) y) ;

    AssignFun f x np = mkText (ImpP3Assign (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) np) ;

          --f g x = mkText (ImpP3Assign (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) (mkNP (mathFunc2NP g) (mkAdv possess_Prep (useVar x))) ) ;

    Assigned _ x y  =   variants{
				-- prova mkText ((relationPosA2 assigned_to y (useVar x)).s);
				mkText (mkS now_Adv (mkS (mkCl (useVar x) y)));               -- now x is 2
				mkText (assignedNAP y (useVar x))         		      -- 2 is assigned to x      
				};

    AssignedFun f x np  =  mkText (mkS now_Adv (mkS (mkCl (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) np)));               -- now f of x is np
			
    Assert p   	   = mkText (mkPhr (mkImp ( mkVP assume_VS p )));

    Asserted p     = let clause : Cl = mkCl (mkNP i_Pron) assume_VS p        
                            in mkText clause;       
    
    Approximate x  = ImperativeV2 approximate_V2 x ;

    ApproximateTo x d = ImperativeTo approximate_V2 x d digit_N ; -- (mkNP (mkDet (int2num d)) (mkAdv digit_N) ;

    BaseCommand x    = x ;
    ConsCommand x xs = mkText xs x;

    
    BeginBlock name = mkText (mkPhr (mkImp
        (mkVP begin_V2
            (mkNP the_Det (block_CN name))))); 
                                                                  
    EndBlock name = mkText (mkPhr (mkImp
        (mkVP end_V2
            (mkNP the_Det (block_CN name))))); 

    BegunBlock name = mkText (mkS now_Adv
        (mkS (mkCl we_NP
            (mkVP begin_V2
                (mkNP the_Det (block_CN name))))));   --now we begin the block name
    EndedBlock name  = mkText (mkS now_Adv
        (mkS (mkCl we_NP
            (mkVP end_V2
                (mkNP the_Det (block_CN name))))));   --now we end the block name 
    
   
    oo_interval x y = variants{} ;
    cc_interval x y = variants{} ;
    oc_interval x y = variants{} ;
    co_interval x y = variants{} ;

lin

    isEqual k x y    = mkText (mkPhr ( mkQS (mkCl x (equal_to y ) ))) questMarkPunct;   
    isAppEqual k x y = mkText (mkPhr ( mkQS (mkCl x (mkAP approximately_AdA (equal_to y))))) questMarkPunct;   


    Yes = mkText (mkPhr yes_Utt) ;
    No  = mkText (mkPhr no_Utt) ;

    YesApprox n = mkText (mkText (mkPhr yes_Utt)) (mkText (mkUtt (mkAdv upto_Prep (mkNP n (mkCN decimal_A place_N))))) ; 
}
