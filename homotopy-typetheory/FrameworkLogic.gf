concrete FrameworkLogic of Framework = FormulasLogic **
  open 
    Prelude
 in {

lincat
  Paragraph = Str ;

  Sort = Str ;
  Fun  = Str ;
  Ind  = SE ;
  Prop = SE ;
  Pred = Str ;
  UnivPhrase = Str ;

  ConclusionPhrase = Str ;

  [Ind] = SE ** {isPl : Bool} ;
  Label = Str ;

  Definition   = SE ;
  Assumption   = Str ;
  [Assumption] = Str ;
  Conclusion   = Str ;

  Title = Str ;

oper
-- expression with side effects

  SE = {s : Str ; side : Str} ;

  mkSE = overload {
    mkSE : (s : Str) -> SE = \s -> {s = s ; side = []} ;
    mkSE : (s,side : Str) -> SE = \s,side -> {s = s ; side = side} ;
    mkSE : SE -> SE -> SE = \x,y -> {s = x.s ++ sep ++ y.s ; side = x.side ++ sep ++ y.side} ;
    } ;

  fromSE : SE -> Str = \se -> se.s ++ sep ++ se.side ;

  sep = ";" ;

  conclStr = "=>" ;
  assumptionStr = "<=" ;
  
lin
  DefinitionParagraph df = fromSE df ;

  PropParagraph cp p = cp ++ fromSE p ;

  AssumptionParagraph a = assumptionStr ++ a ;

  ConclusionParagraph cp c = cp ++ c ;

  SoThatParagraph cp c p = cp ++ c ++ sep ++ fromSE p ; 

  FormatParagraph p = p ;

  TitleParagraph t = t ;

  QEDParagraph = "QED" ;

  PropDefinition P Q = mkSE (defineH P.s Q.s) (P.side ++ sep ++ Q.side) ; 

  IndDefinition a b = mkSE (defineH a.s b.s) (a.side ++ sep ++ b.side) ; 

  PropExpDefinition env X Q = mkSE (env ++ defineH X Q.s) Q.side ;

  ForAllDefinition univ D = mkSE (univ ++ conclStr ++ D.s) (D.side ++ univ) ;

  PredDefinition sort var pred prop = mkSE (parenth (typingH var sort) ++ conclStr ++ defineH (pred ++ var) prop.s) prop.side ;

  henceConclusionPhrase = conclStr ;
  thusConclusionPhrase = conclStr ;
  NoConclusionPhrase = conclStr ;

  BaseAssumption a = a ;
  ConsAssumption a as = a ++ sep ++ as ;

  LetAssumption a b = defineH a.s b.s ++ sep ++ a.side ++ sep ++ b.side ;

  LetExpAssumption a b = defineH a b ;

  ForAllAssumption univ ass = univ ++ conclStr ++ ass ;

  AsConclusion p c = p.s ++ conclStr ++ c ++ sep ++ p.side ;

  ApplyLabelConclusion l xs p = typingH (l ++ xs.s) p.s ++ p.side ;

  ForAllConclusion univ con = univ ++ conclStr ++ con ;

  plainUnivPhrase   vars sort = parenth (typingH vars.s sort) ;
  eachUnivPhrase    vars sort = parenth (typingH vars.s sort) ;
  allUnivPhrase     vars sort = parenth (typingH vars.s sort) ;
  ifUnivPhrase      vars sort = parenth (typingH vars.s sort) ;
  if_thenUnivPhrase vars sort = parenth (typingH vars.s sort) ;

  BaseInd = mkSE [] ** {isPl = False} ;
  ConsInd a as = mkSE (a.s ++ as.s) (a.side ++ sep ++ as.side) ** {isPl = True} ;

  ExistProp vars sort prop = mkSE (fun2 "exist" (parenth (typingH vars.s sort)) prop.s) prop.side ;

  ExistCalledProp var sort ind prop = 
    mkSE (fun2 "exist" (parenth (typingH var sort)) prop.s) (ind.side ++ sep ++ ind.s ++ sep ++ prop.side) ; --- a kind of epsilon term; how to interpret

  ExistVarSortProp x sort = mkSE (typingH x sort) ;

  ExistSortProp sort = mkSE sort ;

  ForAllProp univ prop = mkSE (arrowH univ prop.s) prop.side ; 

  IfProp A B = mkSE (arrowH A.s B.s) (A.side ++ sep ++ B.side) ; 

  PredProp pred ind = mkSE (parenth (pred ++ parenth ind.s)) ind.side ;

  AppFunInd f a = mkSE (f ++ parenth a.s) a.side ;

  FunInd f = mkSE f ;

  AppFunItInd f = mkSE (f ++ "it") ;

  TheSortInd sort exp = mkSE (parenth (typingH exp sort)) ;

  IndInLabel ind label = mkSE (parenth (typingH ind.s label)) ind.side ;

  LabelProp l = mkSE l ;

  ExpFun x = x ;

  ExpProp env P = mkSE (env ++ P) ;

  LabelledExpProp env l x = mkSE (env ++ x) (defineH l x) ;

  ExpSort X = X ;

  AliasInd a b = mkSE a.s (a.side ++ sep ++ b.side ++ sep ++ defineH a.s b.s) ;

  StarLabel = "it" ; 
  
}