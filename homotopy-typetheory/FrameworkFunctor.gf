incomplete concrete FrameworkFunctor of Framework = FormulasLatex **
  open 
    Prelude,
    Syntax, Symbolic, 
    FrameworkInterface,
    Grammar
 in {

lincat
  Paragraph = Text ;

  Sort = SortExp ;
  Fun  = FunExp ;
  Ind  = IndExp ; 
  Prop = S ;
  Pred = Comp ; ---
  UnivPhrase = Adv ;

  ConclusionPhrase = {s : Adv ; cptype : CPType} ; -- cptype to control the use of commas

  [Ind] = {s : NP ; size : LSize} ;
  Label = {s : Str ; isSymbolic : Bool} ;

  Definition   = Utt ;
  Assumption   = Utt ;
  [Assumption] = Utt ;
  Conclusion   = Utt ;

  Title = Str ;
  
lin
  DefinitionParagraph df = 
    mkText (mkPhr df) ;

  PropParagraph cp p = 
    mkText (conclusionUtt cp (mkUtt p)) ;

  AssumptionParagraph a = 
    mkText (mkPhr a) ;

  ConclusionParagraph cp c = 
    mkText (conclusionUtt cp c) ;

  SoThatParagraph cp c p =
    mkText (conclusionUtt cp (postAdvUtt c (mkAdv so_that_Subj p))) ;

  FormatParagraph p = 
    lin Text (ss p) ;

  TitleParagraph t = 
    lin Text (ss (t ++ colon)) ;

  QEDParagraph = lin Text (ss (dollars "\\Box")) ;

  PropDefinition P Q =
    mkUtt (postAdvS P (mkAdv if_Subj Q)) ; 

  IndDefinition a b =
    mkUtt (mkS (mkCl a.s b.s)) ;

  PropExpDefinition env X Q =
    mkUtt (postAdvS (mkS (mkCl we_NP ((mkVP write_V2 <symb (mkSymb (dollars X)) : NP>)))) (mkAdv if_Subj Q)) ; 

  ForAllDefinition univ D = 
    advUtt univ D ;

  PredDefinition sort var pred prop = 
    mkUtt (postAdvS (mkS (mkCl (mkNP a_Det (sortVarCN sort var)) (mkVP pred))) (mkAdv if_Subj prop)) ; 

  henceConclusionPhrase = {s = hence_Adv ; cptype = CPComma} ;
  thusConclusionPhrase = {s = thus_Adv ; cptype = CPNoComma} ;
  NoConclusionPhrase = {s = lin Adv (ss []) ; cptype = CPEmpty} ;

  BaseAssumption a = a ;
  ConsAssumption a as = andUtt a as ;

  LetAssumption a b = 
    mkUtt (mkImp (mkVP let_V2V a.s (mkVP b.s))) ;
  LetExpAssumption a b =
    mkUtt (mkImp (mkVP <lin V2 let_V2V : V2> (mathNP (defineH a b)))) ;
  ForAllAssumption univ ass = 
    advUtt univ ass ;

  AsConclusion p c = 
    advCommaUtt (mkAdv as_Subj p) c ; --- comma is compulsory here, for disambiguation

  ApplyLabelConclusion l xs p =  ---- split to different functions?
     mkUtt (mkCl we_NP may_VV (mkVP apply_V2V (mkNP (symbNP (useLabel False l)) (onIfAdv xs)) (mkVP get_VS p)))
   | mkUtt (Grammar.ExtAdvS (mkAdv by_Prep (mkNP (symbNP (useLabel False l)) (onIfAdv xs))) p)
   | mkUtt (postAdvS p (mkAdv by_Prep (mkNP (symbNP (useLabel False l)) (onIfAdv xs))))
   ;
  ForAllConclusion univ con = 
    advUtt univ con ;

  plainUnivPhrase   vars sort = mkAdv for_Prep (mkNP aPl_Det (sortVarCN sort vars.s)) ;
  eachUnivPhrase    vars sort = mkAdv for_Prep (mkNP each_Det (sortVarCN sort vars.s)) ;
  allUnivPhrase     vars sort = mkAdv for_Prep (allNP (sortVarCN sort vars.s)) ;
  ifUnivPhrase      vars sort = mkAdv if_Subj (mkS (mkCl (mathNP vars.s) (mkVP (Grammar.CompCN  (sortCN sort))))) ;
  if_thenUnivPhrase vars sort = mkAdv if_Subj (postAdvS (mkS (mkCl (mathNP vars.s) (mkVP (Grammar.CompCN  (sortCN sort))))) then_Adv) ;

  BaseInd = {s = emptyNP ; size = LS0} ;
  ConsInd a as = {
    s = case as.size of {LS0 => mkNP a.s <lin Adv (mkUtt as.s) : Adv> ; LS1 => mkNP and_Conj a.s as.s ; _ => mkNP commaConj a.s as.s} ; 
    size = case as.size of {LS0 => LS1 ; _ => LS2} ;
    } ;

  ExistProp vars sort prop =  
    mkS (existCl (indefNP sort.isSymbolic (case vars.isPl of {True  => aPl_Det ; False => a_Det}) (suchThatCN (sortVarCN sort vars.s) prop))) ;

  ExistCalledProp var sort ind prop = 
    mkS (existCl (indefNP sort.isSymbolic a_Det (suchThatCN (calledCN (sortVarCN sort var) ind.s) prop))) ;

  ExistVarSortProp x sort = 
    mkS (existCl (indefNP sort.isSymbolic a_Det (sortVarCN sort x))) ;

  ExistSortProp sort = 
    mkS (existCl (mkNP a_Det (sortCN sort))) ;

  ForAllProp univ prop = 
      Grammar.ExtAdvS univ prop
    | mkS univ prop
    | postNoCommaAdvS prop univ
    ;

  IfProp A B = 
     mkS (mkAdv if_Subj A) B 
   | mkS (mkAdv if_Subj A) (mkS then_Adv B) ; ---- optional comma

  PredProp pred ind = mkS (mkCl ind.s (mkVP pred)) ;

  AppFunInd f a = {
    s = mkNP (mkNP the_Det f.s) (mkAdv possess_Prep a.s) ;
    isSymbolic = False ;
    } ;

  FunInd f = {
    s = if_then_else NP f.isSymbolic (plainNP f.s) (mkNP the_Det f.s) ;
    isSymbolic = f.isSymbolic ;
    } ;

  AppFunItInd f = {
    s = mkNP (mkQuant it_Pron) f.s ;   ---- gender of "it" in some languages
    isSymbolic = f.isSymbolic ;
    } ;

  TheSortInd sort exp = {s = mkNP the_Det (sortVarCN sort exp) ; isSymbolic = False} ;

  IndInLabel ind label = {s = mkNP ind.s (inLabelAdv label) ; isSymbolic = False} ;

  LabelProp l = symbS (useLabel False l) ;

  ExpFun x = {s = mathCN x ; isSymbolic = True} ;

  ExpProp env P = mathEnvS env P ;

  LabelledExpProp env l x = mathEnvS env ((useLabel True l) ++ x) ; 

  ExpSort X = {cn = emptyCN ; postname = X ; isSymbolic = True} ;

  AliasInd a b = {s = aliasNP a.s b.s ; isSymbolic = False} ;

  StarLabel = {s = "( * )" ; isSymbolic = True} ;
  
}