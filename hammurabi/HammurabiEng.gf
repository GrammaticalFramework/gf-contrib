concrete HammurabiEng of Hammurabi = NumeralEng **
  open SyntaxEng, ParadigmsEng, ExtraEng, Prelude,
        (S=SentenceEng), (L=LexiconEng), (I=IrregEng), (E=ExtendEng) in {
    lincat
	Law      = S ;   -- RGL category
	Quantity = Det ; -- RGL category
	Action = LinAction ; -- Homebrewed categories, defined later in this file
	Item   = LinItem ;
	Person = LinPerson ;
	Object = LinObject ;

    lin
        FreeMan  = mkPerson (mkCN (mkA "free") L.man_N) Man ;
        FreeWoman = mkPerson (mkCN (mkA "free") L.woman_N) Woman ;
	Commoner = mkPerson (mkCN (mkN "commoner")) Nonbinary ;
	Slave    = mkPerson (mkCN (mkN "slave")) Nonbinary ;
        King     = mkPerson (mkCN L.king_N) Man ;
        Queen    = mkPerson (mkCN L.queen_N) Woman ;
        Eye      = mkObject L.eye_N Stabbable ;
        Bone     = mkObject L.bone_N Breakable ;


        Poss obj person = obj ** { -- keep the ObjType
          np = xOf obj person
          } ;
        Any obj = obj ** { -- keep the ObjType
          np = mkNP (E.GenNP somebody_NP) (mkCN obj.n2)
          } ;

        DigQ dig = mkDet <dig : Digits> ;
        NumQ num = mkDet <num : Numeral> ;

        Strike = {
          v = \\_ => mkV2 I.hit_V
          } ;

        Break = {
          v = table {
            Breakable => L.break_V2 ;
            Stabbable => mkV2 "stab"
            }
          } ;

        EyeForEye action agent patient object =
        let
          act : V2 = action.v ! object.ot ; -- Stab or break depending on obj
          patObj : NP = xOf object patient ;
          agObj  : NP = xOfPron object agent ;
          condition : Adv = mkCondition agent.np act patObj ;
          consequence : S = mkConsequence agObj act ;
	in
	  mkLaw condition consequence ;

	HitForHit action agent patient =
        let
          act : V2 = action.v ! Stabbable ; -- Patient is always human, and humans are stabbable
          condition : Adv = mkCondition agent.np act patient.np ;
          consequence : S = mkConsequence (referent agent) act ;
	in
	  mkLaw condition consequence ;

	ShallPay action agent item quantity =
        let
          act : V2 = action.v ! item.ot ; -- Item inherits Object's stabbability/breakability
          condition : Adv = mkCondition agent.np act item.np ;
	  consequence : S = mkS (mkCl (mkNP (referent agent))
                                      (mkVP shall_VV
                                           (mkVP pay_V2 (mkNP quantity (mkCN mina silver)))))
	in
	  mkLaw condition consequence ;

  param
    ObjType = Breakable | Stabbable ;
    HumanGender = Woman | Man | Nonbinary ;

  oper
    -- Lincats
    LinAction : Type = {v : ObjType => V2} ;
    LinPerson : Type = {np : NP ; gender : HumanGender} ;
    LinObject : Type = {n2 : N2 ; ot : ObjType} ;
    LinItem : Type = {np : NP ; ot : ObjType} ;

    mkPerson : CN -> HumanGender -> LinPerson ;
    mkPerson cn g = {
      np = mkNP aSg_Det cn ;
      gender = g
      } ;

    mkObject : N -> ObjType -> LinObject = \n,ot -> {
      n2 = mkN2 n ;
      ot = ot
      } ;

    -- Syntactic helper functions, to avoid repetition
    mkLaw : Adv -> S -> S = S.ExtAdvS ;

    mkCondition : NP -> V2 -> NP -> Adv = \ag,act,pat ->
      let cond : S = mkS (mkCl ag (mkVP act pat)) ;
       in SyntaxEng.mkAdv if_Subj cond ;

    mkConsequence : NP -> V2 -> S = \pat,act ->
      mkS (mkCl pat (mkVP shall_VV (passiveVP act))) ;

    referent : LinPerson -> Pron = \person -> case person.gender of {
      Man => he_Pron ;
      Woman => she_Pron ;
      Nonbinary => they_Pron
      } ;

    xOf : LinObject -> LinPerson -> NP = \obj,pers ->
      mkNP theSg_Det (mkCN obj.n2 pers.np) ; -- "the eye of the king"

    xOfPron : LinObject -> LinPerson -> NP = \obj,slave ->
      mkNP (referent slave) (mkCN obj.n2) ; -- "his/her/their eye"

    -- Lexicon
    mina = mkN2 "mina" ; -- Ancient unit of weight and currency https://en.wikipedia.org/wiki/Mina_(unit)
    silver  = mkNP (mkN "silver") ;

    pay_V2  = mkV2 "pay" ;


} ;
