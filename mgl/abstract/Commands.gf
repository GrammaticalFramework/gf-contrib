--# -path=../OpenMath:../Ground

abstract Commands = 
	Ground,
	OpenMath,
	BinaryOps ** {
flags
    startcat = Command ;
cat
    Kind ;
    Command;
    Answer;
    Value Kind;
    Variable Kind ; 
    [Answer]    {1} ;   --for disjoint union of sets
     
-- data Command = Compute | Assign | Assert ;

fun 
    Num, Fun, Set, Tensor : Kind ;

    fromNum    : ValNum -> Value Num ;
    fromFun    : ValFun -> Value Fun ;
    fromSet    : ValSet -> Value Set ;
    fromTensor : ValTensor -> Value Tensor ;
    
    VarfromNum : VarNum -> Variable Num ;
    VarfromFun : VarFun -> Variable Fun ;
    VarfromSet : VarSet -> Variable Set ;
    VarfromTensor : VarTensor -> Variable Tensor ;

data Compute :  (k: Kind) -> Value k -> Command ; 		   -- To evaluate expressions: Compute the determinant of m
fun
    addTo        : ValNum -> ValNum -> Command ;
    subtractFrom : ValNum -> ValNum -> Command ;
    multiplyBy   : ValNum -> ValNum -> Command ;
    divideBy     : ValNum -> ValNum -> Command ;

    intersectWith  : ValSet -> ValSet -> Command ;   
    uniteTo        : ValSet -> ValSet -> Command ;

    itNum   : ValNum ;  
    itSet   : ValSet ;
    itFun   : ValFun ;
    itTensor: ValTensor ;   

    Simple :   (k: Kind) -> Value k -> Answer ;            -- Simple answer to compute
    FeedBack : (k: Kind) -> Value k -> Value k -> Answer;  -- Re-state the question and give answer


data 
    Assign :   (k: Kind) -> Variable k -> Value k -> Command ; 
    AssignFun : VarFun -> VarNum -> ValNum -> Command ; --VarFun -> ValFun -> VarNum -> Command ;

fun
    Assigned : (k: Kind) -> Variable k -> Value k -> Answer ;
    AssignedFun : VarFun -> VarNum -> ValNum -> Answer ;

data Assert  : Prop -> Command ;                           -- To assert (and retract) propositions: Assume n is integer

fun
    Asserted : Prop -> Answer;  

    Approximate  : ValNum -> Command ; 
    ApproximateTo: ValNum -> Index -> Command ; 
                        		
    BeginBlock 	: String -> Command ;
    EndBlock   	: String -> Command ;   

    BegunBlock 	: String -> Answer ;
    EndedBlock	: String -> Answer ;

fun

    disjoint_union_sets: [ValSet] -> Answer ; --[Answer] -> Answer ;

 --   caret_pow : (a,b: ValNum) -> Answer ;
    
    bracket_emptyset : Answer ;

    arrow_lambda : VarNum -> ValNum -> Answer ;

  --  plus_union : [ValSet] -> Answer ;   -- [2 :: 3] + 4;
    plus_union : (a,b: ValSet) -> Answer ;

def
    addTo x y          = Compute Num (fromNum (plus (BaseValNum x y))) ;
    subtractFrom x y   = Compute Num (fromNum (minus y x)) ;
    multiplyBy x y     = Compute Num (fromNum (times (BaseValNum x y))) ;
    divideBy x y       = Compute Num (fromNum (divide x y)) ;

-- To recognize some Sage evaluated expressions:

    oo_interval x y = Simple Set (fromSet (interval_oo x y)) ;
    cc_interval x y = Simple Set (fromSet (interval_cc x y)) ;
    oc_interval x y = Simple Set (fromSet (interval_oc x y)) ;
    co_interval x y = Simple Set (fromSet (interval_co x y)) ;    
    caret_pow x y   = Simple Num (fromNum (power x y)) ;
    
def
    bracket_emptyset = Simple Set (fromSet emptyset) ;
 
    arrow_lambda v x = Simple Fun (fromFun (lambda v x)) ;
    --   arrow_lambda x g = Simple Num (fromNum g) ;

--    plus_union bs = Simple Set (fromSet (union bs)) ;
    plus_union a b = Simple Set (fromSet (bin_union a b)) ;

    disjoint_union_sets xs = Simple Set (fromSet (union xs ));
    
def
    bin_over x y = divide x y ;

def 
    intersectWith a b = Compute Set (fromSet (intersect (BaseValSet a b ) )) ;
    uniteTo 	  a b = Compute Set (fromSet (union     (BaseValSet a b ) )) ;

fun
    isEqual   : (k: Kind) -> Value k -> Value k-> Command ;
    isAppEqual: (k: Kind) -> Value k -> Value k-> Command ;

    Yes: Answer ;
    No: Answer ;
    YesApprox: Index -> Answer ;

    Answer_quotes : Answer -> Answer ;

--fun 
--    Prop2Answer: Prop -> Answer ;
--def
--    Yes = Prop2Answer true ;--

}
