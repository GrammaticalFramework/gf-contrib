incomplete concrete YAQLFunctor of YAQL = Numeral ** 
  open 
    BuildQueryInterface,
    Syntax, 
    (Lexicon = Lexicon), 
    (Verb = Verb), 
    Prelude 
  in {

lincat 
  Move = Utt ;
  Query = QS ;
  Kind = CN ;
  Term = NP ;
  Entity = NP ;
  [Term] = [NP] ;
  Function = F1 ; -- {cn : CN ; prep : Prep} ;
  Proposition = Cl ;
  Property = R1 ; -- {vps : VPSlash ; arg : NP ; qualif : AP ; adv : Adv ; predType : PredType} ;
  Relation = R2 ; -- {vps : VPSlash ; subjectFirst : Bool} ;
  [Property] = [RS] ;
  QuestionAdverb = IAdv ;
  QuestionPhrase = IP ;
  Numeric = Card ;
  Polarity = {pol : Syntax.Pol ; isPos : Bool} ;
  Temporality = {tense : Tense ; isPresent : Bool} ;

lin
  MQuery query = mkUtt query ;
  MWhatIs ent = mkUtt (mkQS (mkQCl what_IP ent)) ;
  MShowTerm term = showUtt term ;
  MAllAbout term = showUtt (mkNP allAboutNP (Syntax.mkAdv about_Prep term)) ;
  MRelation dom range rel = 
    showUtt (mkNP (mkNP all_Predet (mkNP aPl_Det dom)) 
               (Syntax.mkAdv with_Prep (mkNP thePl_Det (relRelation rel range)))) ;
  MRelRev dom range rel = 
    showUtt (mkNP (mkNP all_Predet (mkNP aPl_Det dom)) 
               (Syntax.mkAdv with_Prep (mkNP thePl_Det (relRelation (reverseRelation rel) range)))) ;
  MAssert prop = mkUtt (mkS prop) ;

  MYes = yes_Utt ;
  MNo = no_Utt ;

  QWh qp pred = case pred.predType of {
    PSubjectFirst True  => mkQS (mkQCl qp (mkVP pred.vps pred.arg)) ;
    PSubjectFirst False => mkQS (slashQCl qp (mkClSlash pred.arg pred.vps)) ;
    _                   => mkQS (mkQCl qp (useAsVP pred.vps pred.arg))
    } ;

  QAdv qadv prop = mkQS (mkQCl qadv prop) ;
  QProp prop = mkQS (mkQCl prop) ;

  QThere qp = mkQS (mkQCl qp) ;
  QAdvEntity qadv ent = mkQS (mkQCl qadv ent) ;

  PPred pred ent = case pred.predType of {
    PSubjectFirst True  => mkCl ent (mkVP pred.vps pred.arg) ;
    PSubjectFirst False => mkCl pred.arg (mkVP pred.vps ent) ;
    _                   => mkCl ent (useAsVP pred.vps pred.arg)
    } ;

  PKind kind = {
    vps = Verb.VPSlashPrep (mkVP kind) dummyPrep ;
    arg = dummyNP ;
    qualif = dummyAP ;
    adv = dummyAdv ;
    predType = PSubjectOnly ;
    } ;

  PRel1 ent rel = {
    vps = rel.vps ;
    arg = ent ;
    qualif = dummyAP ;
    adv = dummyAdv ;
    predType = PSubjectFirst (notB rel.subjectFirst) ;
    } ;

  PRel2 rel ent = {
    vps = rel.vps ;
    arg = ent ;
    qualif = dummyAP ;
    adv = dummyAdv ;
    predType = PSubjectFirst rel.subjectFirst ;
    } ;

  KProperty kind pred = case pred.predType of {
    PSubjectFirst True  =>         -- philosopher that influenced Marx
      mkCN kind (mkRS (mkRCl idRP (mkVP pred.vps pred.arg))) ;
    PSubjectFirst False =>         -- philosopher that Marx influenced
      mkCN kind (mkRS (slashRCl idRP (mkClSlash pred.arg pred.vps))) ;
    PSubjectOnly        =>         -- philosopher that sleeps
      mkCN kind (mkRS (mkRCl idRP (useAsVP pred.vps pred.arg))) ;
    PAdjective => mkCN pred.qualif kind ; ---- mkCN kind pred.adv; --changed from (pred.qualif kind) to solve the 'gamle' issue in the Scandinavian languages 
    PAdverb => mkCN kind pred.adv
    } ;

  TEntity ent = ent ;
  TAll kind = mkNP all_Predet (mkNP aPl_Det kind) ;
  TSome kind = mkNP someSg_Det kind ;
  TNumeric numer kind = mkNP numer kind ;
  TFunction func term = mkNP the_Det (mkCN func.cn (Syntax.mkAdv func.prep term)) ; --- thePl_Det for plural term

  BaseTerm, ConsTerm = mkListNP ;
  TAndTerm = mkNP and_Conj ;
  TOrTerm = mkNP or_Conj ;

  NNumeral num = mkCard (numNum num) ;
  NAtLeast num = mkCard at_least_AdN (mkCard (numNum num)) ;
  NAtMost num = mkCard at_most_AdN (mkCard (numNum num)) ;

  QPWho    = who_IP ;
  QPWhos   = whoPl_IP ;
  QPWhat   = what_IP ;
  QPWhats  = whatPl_IP ;
  QPWhich  = mkIP which_IDet ;
  QPWhichs = mkIP whichPl_IDet ;
  QPHowMany = mkIP how8many_IDet ;

  QAHow   = how_IAdv ;
  QAWhen  = when_IAdv ;
  QAWhere = where_IAdv ;
  QAWhy   = why_IAdv ;

  TPresent = {tense = presentTense ; isPresent = True} ;
  TPast = {tense = pastTense ; isPresent = False} ;

  PPositive = {pol = positivePol ; isPos = True} ;
  PNegative = {pol = negativePol ; isPos = False} ;


----------
  oper
    idRP = which_RP ;
    slashQCl : IP -> ClSlash -> QCl = mkQCl ; 
    slashRCl : RP -> ClSlash -> RCl = mkRCl ; 
-------------

oper
  relRelation : R2 -> CN -> CN = \rel,kind ->  -- kind that the given relates to  --- TODO gender of "they"
    case rel.subjectFirst of {
      True  => mkCN kind (mkRS (slashRCl idRP (mkClSlash they_NP rel.vps))) ;  -- philosophers that they influenced
      False => mkCN kind (mkRS (mkRCl idRP (mkVP rel.vps they_NP)))            -- philosophers that influenced them
      } ;

oper
  useAsVP : VPSlash -> NP -> VP = \vps,np -> lin VP vps ; --- hack
  numNum : Numeral -> Numeral = \n -> lin Numeral n ;

  allAboutNP : NP = everything_NP ;


}
