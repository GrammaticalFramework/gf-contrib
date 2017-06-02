--# -path=.:present

incomplete concrete PropI of Prop = open 
  Syntax, 
  Symbolic, 
  Sentence, ---- ExtAdvS
  Prelude in {

lincat
  Prop = {s : S ; c : Bool} ; -- c = True for connectives
  Atom = Cl ;
  Pred1 = AP ;
  Pred2 = A2 ;
  Var = Symb ;
  Conj = {s : Syntax.Conj ; c : S} ;  -- s = and ; c = all these hold
  Ind  = {s : NP ; isSymbolic : Bool} ;
  Fun1 = {s : Symb ; v : N2} ;
  Fun2 = {s : Symb ; v : N2} ;

lin
  PAtom a = {s = mkS a ; c = False} ;
  PNeg p = { 
    s = mkS negativePol (mkCl 
          (mkVP (mkNP the_Quant (mkCN case_N (mkAdv that_Subj p.s))))) ; 
    c = False ---- ?
    } ;
  PConj c p q = {s = mkS c.s p.s q.s ; c = True} ; -- can be ambiguous; cf. PConjs
  PImpl p q = {s = ExtAdvS (mkAdv if_Subj p.s) (mkS then_Adv q.s) ; c = True} ;
  PUniv v p = {
    s = ExtAdvS (mkAdv for_Prep (mkNP all_Predet (symb v.s))) p.s ;
    c = False
    } ;
  PExist v p = { 
    s = mkS (mkCl (mkNP a_Quant (mkCN (mkCN element_N (symb v.s)) 
            (mkAP (mkAP such_A) p.s)))) ;
    c = False
    } ;
  APred1 f x = mkCl x.s f ;
  APred2 f x y = mkCl x.s f y.s ;

  IVar x = {s = (symb x) ; isSymbolic = True} ;

  IFun1 f x = {
    s = case x.isSymbolic of {
          True  => app1 f.s x.s | app f.v x.s ; -- preferred symbolic, allowed verbal
          False => app f.v x.s
          } ;
    isSymbolic = x.isSymbolic
    } ;

  IFun2 f x y = {
    s = case <x.isSymbolic,y.isSymbolic> of {
          <True,True> => app2 f.s x.s y.s | app f.v x.s y.s ;
          _ => app f.v x.s y.s
          } ;
    isSymbolic = x.isSymbolic
    } ;

  VString s = mkSymb s.s ;

  CAnd = {s = and_Conj ; c = mkS (mkCl (mkNP all_Predet these_NP) hold_V)} ;
  COr = {
    s = or_Conj ; 
    c = mkS (mkCl (mkNP (mkNP (mkDet (mkCard at_least_AdN (mkCard "1")))) (mkAdv part_Prep these_NP)) hold_V)
    } ;

-- supplementary

lincat
  Kind = CN ;
  [Prop] = {s : [S] ; c : Bool} ; -- c = True if any of props is complex
  [Pred1] = [AP] ;
  [Ind] = [NP] ;
  [Var] = NP ;

lin
  AKind k x = mkCl x.s k ;

  PConjs c ps = case ps.c of {
    True  => {s = mkS <colonConj : Conj> c.c (mkS <bulletConj : Conj> ps.s) ; c = False} ; ----
    False => {s = mkS c.s ps.s ; c = True}
    } ;
  PUnivs vs k p = {
    s = ExtAdvS (mkAdv for_Prep (mkNP all_Predet (mkNP aPl_Det (mkCN k vs)))) p.s ;
    c = False
    } ;
  PExists vs k p = {
    s = mkS (mkCl (mkNP a_Quant (mkCN (mkCN k vs) (mkAP (mkAP such_A) p.s)))) ;
    c = False
    } ;
  PNegAtom a = {
    s = mkS negativePol a ;
    c = False
    } ;

  BaseProp p q = {s = mkListS p.s q.s ; c = orB p.c q.c} ;
  ConsProp p ps = {s = mkListS p.s ps.s ; c = orB p.c ps.c} ;

  BaseVar x = (symb x) ;
  ConsVar x xs = mkNP and_Conj (mkListNP (symb x.s) xs) ;

  BaseInd x y = mkListNP x.s y.s ;
  ConsInd x xs = mkListNP x.s xs ;

  BasePred1 = mkListAP ;
  ConsPred1 = mkListAP ;

lin
  ConjPred1 c = mkAP c.s ;

  APredColl f ps = mkCl (mkNP and_Conj ps) (mkAP f) ;
  APredRefl f x = mkCl x.s (reflAP f) ;

  IFunC f xs = {s = app f.v (mkNP and_Conj xs) ; isSymbolic = False} ;

  IUniv k = {s = mkNP every_Det k ; isSymbolic = False} ;
  IExist k = {s = mkNP someSg_Det k ; isSymbolic = False} ;

  ConjInd co xs = {s = mkNP co.s xs ; isSymbolic = False} ;

  ModKind k m = mkCN m k ;

  PartPred f x = mkAP f x.s ; 

  IInt i = {s = symb i.s ; isSymbolic = True} ;


-- symbolic applications by LaTeX macros

oper
  app1 : Symb -> NP -> NP = \f,x -> symbNP (f.s ++ "{" ++ (mkUtt x).s ++ "}") ; 
  app2 : Symb -> NP -> NP -> NP = \f,x,y -> 
    symbNP (f.s ++ "{" ++ (mkUtt x).s ++ "}" ++ "{" ++ (mkUtt y).s ++ "}") ; 

  symbNP : Str -> NP = \s -> (symb (mkSymb s)) ;


--- abuse of Conj category and its accidentally shared implementation

  bulletConj = lin Conj {s1,s2 = "\\item" ; n = singular ; isDiscont = True} ;
  colonConj = lin Conj {s1 = [] ; s2 = ":" ; n = singular ; isDiscont = False} ;


}
