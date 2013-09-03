--# -path=.:present

concrete QuerySwe of Query = QueryI - [namePrep, propCalled, KFunPair] with 
  (Syntax = SyntaxSwe),
  (Lang = LangSwe),
  (LexQuery = LexQuerySwe) **
open
  LexQuerySwe,
  ParadigmsSwe,
  IrregSwe,
  SyntaxSwe,
  ExtraSwe,
  (L = LangSwe),
  (M = MakeStructuralSwe),
  Prelude
in {

-- deviations from functor
oper
-- prep not "av"
  namePrep = on_Prep ;
-- verb "heta"
  propCalled : NP -> Prop = \i -> 
      propVP (mkVP (mkAdV "�ven") (mkVP (mkV2 (depV (mkV "kalla")) for_Prep) i))
    | propVP (mkVP (mkAdV "�ven") (mkVP (mkV2 "heter") i)) ;

lin
  KFunPair k r = mkCN k (mkAdv with_Prep (sina r.cn)) ;

oper
  sina : CN -> NP = \cn -> mkNP (M.mkPredet "sin" "sitt" "sina") (mkNP a_Quant plNum cn) ; ---- should be in ExtraSwe

-- lexicon

lin
  Located = relAP (mkAP located_A) in_Prep ;

  In = relVP UseCopula in_Prep ;

  Employed = 
      relAP (mkAP (mkA "anst�lld" "anst�llt")) at_Prep
--    | relAP (mkAP (mkA "anst�lld" "anst�llt")) by8agent_Prep
--    | relAP (mkAP (mkA "betald" "betalt")) by8agent_Prep
    | relAP (mkAP (mkA "aktiv")) at_Prep
    | relAP (mkAP (mkA "professionellt aktiv")) at_Prep
    | relVP (mkVP (mkV "arbeta")) at_Prep
    | relVP (mkVP (mkV "jobba")) at_Prep
    | relVP (mkVP (mkV "medarbeta")) at_Prep
    ;

  HaveTitle = 
      relAP (mkAP (mkA "anst�lld" "anst�llt")) som_Prep
--    | relVP UseCopula noPrep
    | relVP (mkVP (mkV "arbeta")) som_Prep
    | relVP (mkVP (mkV "jobba")) som_Prep
--    | relVP (mkVP have_V2 (mkNP the_Det (mkCN (mkN2 (mkN "titel" "titlar") noPrep)))) possess_Prep
    ;

  EmployedAt s = 
      relAP (mkAP (mkA2 (mkA "anst�lld" "anst�llt") at_Prep) s) som_Prep
--    | relAP (mkAP (mkA2 (mkA "anst�lld" "anst�llt") by8agent_Prep) s) som_Prep
    | relVP (mkVP (mkV2 (mkV "arbeta") at_Prep) s) som_Prep 
    | relVP (mkVP (mkV2 (mkV "jobba") at_Prep) s) som_Prep 
    ;

  HaveTitleAt t = 
      relAP (mkAP (mkA2 (mkA "anst�lld" "anst�llt") som_Prep) (mkNP t)) at_Prep
--    | relAP (mkAP (mkA2 (mkA "anst�lld" "anst�llt") som_Prep) (mkNP t)) by8agent_Prep
    | relVP (mkVP (mkNP a_Det t)) at_Prep
    | relVP (mkVP (mkV2 (mkV "arbeta") som_Prep) (mkNP t)) at_Prep 
    | relVP (mkVP (mkV2 (mkV "jobba") som_Prep) (mkNP t)) at_Prep 
--    | relVP (mkVP have_V2 (mkNP the_Det (mkCN (mkN2 (mkN "titel" "titlar") noPrep) (mkNP t)))) at_Prep 
    ;

  Named n = propAP  (mkAP (mkA2 called_A (mkPrep [])) n) ;
  Start n = propVP (mkVP (mkV2 "b�rja" with_Prep) n) ;

  Organization = mkCN (mkN "organisation" "organisationer") ;
  Company = mkCN (mkN "f�retag" "f�retag") ;
  Place = mkCN (mkN "plats" "platser") | mkCN (mkN "st�lle" "st�llen") ;
  Person = 
      mkCN (mkN "person" "personen" "folk" "folket")
    | mkCN (mkN "person" "personer") ;

  Location = mkFunctionP (mkN "l�ge" "l�gen") possess_Prep ;
  Region = mkFunctionP (mkN "region" "regioner") possess_Prep ;
  Subregion = mkFunctionP (mkN "delregion" "delregioner") possess_Prep ;
  FName = mkFunctionP (mkN "namn" "namn") on_Prep ;
  FNickname = mkFunctionP (mkN "till�ggsnamn" "till�ggsnamn") on_Prep ;
  FJobTitle = 
     mkFunctionP (mkN "jobb" "jobb") possess_Prep
   | mkFunction "befattning" ;

  SJobTitle t = mkNP a_Det t ;

oper
  mkCountry : Str -> Str -> {np : NP ; a : A} = 
    \n,a -> {np = mkNP (mkPN n) ; a = mkA a} ;

  mkName : Str -> NP = 
    \s -> mkNP (mkPN s) ;
  mkFunction : Str -> Fun =
    \s -> {cn = mkCN (mkN s) ; prep = possess_Prep} ;
  mkFunctionP : N -> Prep -> Fun =
    \n,p -> {cn = mkCN n ; prep = p} ;

  som_Prep = mkPrep "som" ;

lin
-- JobTitles
  JobTitle1 = mkCN (mkN "'JobTitle1") ;
  JobTitle2 = mkCN (mkN "'JobTitle2") ;
  JobTitle3 = mkCN (mkN "'JobTitle3") ;
  JobTitle4 = mkCN (mkN "'JobTitle4") ;

-- Locations
  Location1 = mkName "'Location1" ;
  Location2 = mkName "'Location2" ;
  Location3 = mkName "'Location3" ;
  Location4 = mkName "'Location4" ;

-- Organizations
  Organization1 = mkName "'Organization1" ;
  Organization2 = mkName "'Organization2" ;
  Organization3 = mkName "'Organization3" ;
  Organization4 = mkName "'Organization4" ;

-- Persons
  Person1 = mkName "'Person1" ;
  Person2 = mkName "'Person2" ;
  Person3 = mkName "'Person3" ;
  Person4 = mkName "'Person4" ;

}
