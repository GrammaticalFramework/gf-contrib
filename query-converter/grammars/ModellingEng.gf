concrete ModellingEng of Modelling = open
  SyntaxEng,
  ParadigmsEng

in {

lincat
  Model = Text ;
  [Element] = Text ;
  Element = S ;
  Entity = CN ;
  Relationship = VPSlash ;
  Attrib = CN ;
  [Attrib] = NP ;
  Arrow = Det ;
  Support = Adv ;
  [Support] = Adv ;
  SupportRelationship = Prep ;
  Related = NP ;
  [Related] = {subj : NP ; obj : NP} ;

lin
  MEntities es = es ;

  BaseElement e = mkText e ;
  ConsElement e es = mkText (mkPhr e) es ;

  BaseAttrib a = mkNP a_Det a ;
  ConsAttrib a as = mkNP and_Conj (mkNP a_Det a) as ;

  EEntity ent atts = mkS (mkCl (mkNP a_Det ent) have_V2 atts) ;

  EWeakEntity ent supps atts = mkS (mkCl (mkNP a_Det (mkCN ent supps)) have_V2 atts) ;
  ERelationship rel rels atts = mkS (mkCl rels.subj (mkVP can_VV (mkVP rel rels.obj))) ;  ---- atts 
  ESubEntity subent superent atts =
    mkS (mkCl (mkNP a_Det subent) (mkNP a_Det (mkCN superent (mkRS (mkRCl which_RP (mkVP have_V2 atts)))))) ;

  SEntity ent supprel = SyntaxEng.mkAdv supprel (mkNP a_Det ent) ;

  BaseSupport s = s ;
  ConsSupport s ss = lin Adv {s = s.s ++ ss.s} ; ----

  REntity e a = mkNP a e ;
  
  BaseRelated s o = {subj = s ; obj = o} ;
  ConsRelated r rs = {subj = r ; obj = mkNP and_Conj rs.subj rs.obj} ;


  AMany = a_Det ;
  AAtLeastOne = mkDet a_Quant (mkNum at_least_AdN (mkCard "1")) ;
  AExactlyOne = mkDet a_Quant (mkNum <lin AdN {s = "exactly"} : AdN> (mkCard "1")) ;

  SOf = possess_Prep ;
  SIn = in_Prep ;


---- example

  ECountry  = mkCN (mkN "country") ;
  ECurrency = mkCN (mkN "currency") ;
  EKingdom  = mkCN (mkN "kingdom") ;
  ACapital  = mkCN (mkN "capital") ;
  AMonarch  = mkCN (mkN "monarch") ;
  ACode     = mkCN (mkN "code") ;
  RUse      = mkVPSlash (mkV2 "use") ;


}