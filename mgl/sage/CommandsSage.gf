--# -path=../resources:../abstract:present

concrete CommandsSage of Commands = 
	GroundSage,
	OpenMathSage,
	BinaryOpsSage **
open 
	mySage,
	myFormal,
	Prelude 
in
{
param K = KN | KF | KS | KT | KR ;

lincat
    Kind 	= K ;
    Command   	= SS ;
    Value 	= SS ;
    Variable	= SS ;
    Answer 	= SS ;
    [Answer]    = SS ;
 
lin
    Num    = KN ;
    Fun    = KF ;
    Set    = KS ; 
    Tensor = KT ;

    Compute k x  = case k of {
			KN => {s = "Compute('" ++ x.s ++ "', 'Num' );" } ;
							-- we had {s = "Compute( str(" ++ x.s ++ "), 'Num' );" } ; but we changed it because of Bug 6290151
			KF => {s = "Compute('" ++ x.s ++ "', 'Fun' );" } ;  
                	KS => {s = "Compute('" ++ x.s ++ "', 'Set' );" } ;  --prints realset representation for gf
			KT => {s = "Compute('" ++ x.s ++ "', 'Tensor' );" };
            KR => variants {} 
			};  

    addTo        x y = variants{}; --{s = "compute_last(" ++ x.s ++ "+" ++ y.s ++ ", 'Num');" } ;
    subtractFrom x y = variants{}; --{s = "compute_last(" ++ y.s ++ "-" ++ x.s ++ ", 'Num');" } ;
    multiplyBy   x y = variants{}; --{s = "compute_last(" ++ x.s ++ "*" ++ y.s ++ ", 'Num');" } ;
    divideBy     x y = variants{}; --{s = "compute_last(" ++ x.s ++ "/" ++ y.s ++ ", 'Num');" } ;

    intersectWith x y = variants{}; 
  --  uniteTo       x y = variants{}; 

    itNum = constant "IT" ; 				--constant "GfContext.active().compute('IT','Num')";
    itSet = constant "IT" ; 				--constant "GfContext.active().compute('IT','Set')";
    itFun = fun_X_hasNoVar(constant "IT") ; 		--fun_X_hasNoVar (constant "GfContext.active().compute('IT','Fun')");    
    itTensor = constant "IT" ; 				--constant "GfContext.active().compute('IT','Tensor')";

     -- Compute _   x  = {s = "computenum(" ++ x.s ++ ");" } ; 

    fromNum x = x ;
    fromFun x = x ;
    fromSet x = x ;
    fromTensor x = x ;
    
    -- floatAnswer x = x ;

    VarfromNum x = x ;
    VarfromFun x = x ;
    VarfromSet x = x ;
    VarfromTensor x = x ;

    Simple _ x     = x ;
    FeedBack _ _ x = x ; 

    Assign _ x y = {s = "Assign('" ++ x.s ++ "' , '" ++ y.s ++ "') ;"  } ;  

    AssignFun f x np  = {s = "Assign('" ++ f.s ++ "' , '" ++ np.s ++ "') ;" };

        --f g x = {s = "Assign('" ++ f.s ++ "(" ++ x.s ++ ")" ++ "' , '" ++ g.s ++ "(" ++ x.s ++ ")" ++ "') ;"  } ;
                                                                                       --do we need to change the variable of g using fun_hasVar?
	--AssignFun f x (power2 (Var2Num x))


    Assigned _ x y 	= variants{}; 

    AssignedFun f x np  = variants{};

    Assert p   		= {s = "Assume('" ++ p.s ++ "') ;" };
    
    Asserted p 		= variants{}; 

    Approximate x 	= {s = "Approximate('" ++ x.s ++ "');" } ;  
 
    ApproximateTo x d  	= {s = "ApproximateTo('" ++ x.s ++ " '," ++ d.s ++ ");" } ;  --{s = x.s ++ ".n(digits =" ++ d.s ++ ");" } ; 

    BeginBlock name = { s = "begin_block('" ++ name.s ++ "');" } ;
    EndBlock   name = { s = "end_block('"   ++ name.s ++ "');" } ;

    BegunBlock name = ss ("BEGIN" ++ name.s) ;
    EndedBlock name = ss ("END" ++ name.s) ; 
 
--    BaseAnswer x = id SS x ;
--    ConsAnswer x xs = infixSS "," x xs ;

    disjoint_union_sets xs = { s = "{" ++ xs.s ++ "}" } ; 
   
     --   caret_pow x y = {s = usePrec 0 (infixr 3 "^" x y)} ;

    bracket_emptyset = {s = "{ }"} ;

    arrow_lambda v x = {s = v.s ++ "|-->" ++ x.s} ;

    --plus_union xs =  delimited "RealSet_union([" "])"   (mkPrec 0 xs.s) ; --delimited_command "list2plus_union" (mkPrec 0 xs.s) ;

    plus_union x y = {s = x.s ++ "+" ++ y.s };

    isEqual _ x y = {s = "bool(" ++ x.s ++ "==" ++ y.s ++ ");" } ;
    isAppEqual _ x y = {s = "IsAppEqual('" ++ x.s ++ "','" ++ y.s ++ "');" } ;
    
lin
--    Prop2Answer p = p;
    Yes = {s = "True"} ;

    No  = {s = "False"} ; 
    YesApprox d = {s = "(" ++ "True" ++ "," ++ d.s ++ ")"} ;  

    Answer_quotes answer = { s = "'" ++ answer.s ++ "'"};
}



