interface FrameworkInterface = 
  open 
    Prelude,
    Syntax, Symbolic, 
    Grammar
 in {

oper

-- these need instantiation

  hence_Adv : Adv ;
  thus_Adv : Adv ;
  let_V2V : V2V ;
  each_Det : Det ;
  as_Subj : Subj ;
  get_VS : VS ;
  by_Prep : Prep ;
  may_VV : VV ;
  apply_V2V : V2V ;
  commaConj : Conj ;
  so_that_Subj : Subj ;
  then_Adv : Adv ;
  write_V2 : V2 ;
  suchThatS : S -> S -> S ;
  suchThatCN : CN -> S -> CN ;
  calledCN : CN -> NP -> CN ;
  mathCN : Str -> CN ;
  allNP : CN -> NP ;
  postAdvS : S -> Adv -> S ;
  postNoCommaAdvS : S -> Adv -> S ;
  inLabelAdv : {s : Str ; isSymbolic : Bool} -> Adv ; 

  indefNP : Bool -> Det -> CN -> NP ;
  plainNP : CN -> NP ;

  existCl : NP -> Cl ;

-- shared definitions: need not be instantiated but can be overridden

param
  LSize = LS0 | LS1 |LS2 ;
  CPType = CPComma | CPNoComma | CPEmpty ;

oper
  onIfAdv : {s : NP ; size : LSize} -> Adv = \xs -> case xs.size of {
    LS0 => mkAdv (P.mkPrep []) xs.s ; -- empty adverb
    _ => mkAdv on_Prep xs.s
    } ;

  emptyNP : NP = symb (mkSymb []) ;

  symbS : Str -> S = \s -> <symb (mkSymb s) : S> ;
  mathS : Str -> S = \s -> symbS (dollars s) ;
  displayMathS : Str -> S = \s -> symbS (displayMath s) ; 

  mathEnvS : (Str * Str) -> Str -> S = \e,s -> symbS (e.p1 ++ s ++ e.p2) ;

  SortExp = {cn : CN ; postname : Str ; isSymbolic : Bool} ; -- a map ... : A -> B
  IndExp = {s : NP ; isSymbolic : Bool} ;
  FunExp = {s : CN ; isSymbolic : Bool} ;

  commaAdv : Adv -> Adv = \a -> lin Adv (ss ("," ++ a.s ++ ",")) ;

-- sort used as discontinuous, variable in between: map $f : A -> B$
  sortVarCN : SortExp -> Str -> CN = \sort, x -> 
    case sort.isSymbolic of { 
       True  => mkCN sort.cn (lin Adv (ss (dollars (x ++ ":" ++ sort.postname)))) ;
       False => mkCN (mkCN sort.cn <symb (mkSymb (dollars x)) : NP>) (lin Adv (ss sort.postname))
       } ;

-- sort used as continuous: map $A -> B$
  sortCN : SortExp -> CN = \sort ->
    mkCN sort.cn (lin Adv (ss (if_then_Str sort.isSymbolic (dollars sort.postname) sort.postname))) ;

  mkFun : CN -> FunExp = \cn -> {s = cn ; isSymbolic = False} ;

  displayMath : Str -> Str = \s -> "\\[" ++ s ++ "\\]" ;
  mathNP : Str -> NP = \x -> symbNP (dollars x) ;
  symbNP : Str -> NP = \x -> <symb (mkSymb x) : NP> ;
  dollars : Str -> Str = \s -> "$" ++ s ++ "$" ;
  mbox : Str -> Str = \s -> "\\mbox" ++ "{" ++ s ++ "}" ;

  useLabel : Bool -> {s : Str ; isSymbolic : Bool} -> Str = \asSymbolic, label -> case <asSymbolic,label.isSymbolic> of {
    <True,False> => mbox ("(" ++ label.s ++ ")") ;  -- \[ \mbox{Id-elimination} .... \] 
    <False,True> => dollars label.s ;               -- we can apply $(*)$ on ... 
    _ => label.s
    } ;

  colon : Str = ":" ;

  mkLabel : Str -> {s : Str ; isSymbolic : Bool} = \s -> {s = s ; isSymbolic = False} ;

  conclusionUtt : {s : Adv ; cptype : CPType} -> Utt -> Phr = \cp,u -> case cp.cptype of {
    CPComma   => mkPhr (advUtt cp.s u) ;
    CPNoComma => mkPhr (advNoCommaUtt cp.s u) | mkPhr (advCommaUtt cp.s u) ;
    CPEmpty   => mkPhr (advNoCommaUtt cp.s u)
    } ;


--- missing from RGL

  advUtt : Adv -> Utt -> Utt = \adv,utt -> 
      advCommaUtt adv utt
    | advNoCommaUtt adv utt
    ;

  advCommaUtt : Adv -> Utt -> Utt = \adv,utt -> 
      lin Utt (ss (adv.s ++ "," ++ utt.s)) ;

  advNoCommaUtt : Adv -> Utt -> Utt = \adv,utt -> 
      lin Utt (ss (adv.s ++ utt.s)) ;

  andUtt : Utt -> Utt -> Utt = \a,as -> 
    lin Utt (mkAdv and_Conj <lin Adv a : Adv> <lin Adv as : Adv>) ;

  aliasNP : NP -> NP -> NP = \a, b -> 
    mkNP (mkNP a (mkAdv (P.mkPrep ",") b)) (P.mkAdv ",") ;

  postAdvUtt : Utt -> Adv -> Utt = \s,a ->
      lin Utt (ss (s.s ++ "," ++ a.s))
    | lin Utt (ss (s.s ++        a.s))
    ;

  pconjCommaPhr : PConj -> Utt -> Phr = \c,u -> 
    mkPhr (lin PConj (ss (c.s ++ ","))) u ;

}