concrete MiniGrammarPor of MiniGrammar = open MiniResPor, Prelude in {
  lincat
    Utt = {s : Str} ;
    Pol = {s : Str ; b : Bool} ;
    S  = {s : Str} ;
    Cl = {s : Bool => Str} ;
    VP = MiniResPor.VP ;
    Adv = Adverb ;
    NP = MiniResPor.NP ;
    Det = {s : Gender => Case => Str ; n : Number} ;
    Conj = {s : Str} ;
    Prep = MiniResPor.Prep ;
    AP = Adjective ;
    CN = Noun ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;
    Pron = MiniResPor.Pron ;
  lin
    -- Phrase
    UttS s = s ;
    UttNP np = ss (employNP Nom np) ;
    -- Sentence
    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    PredVP np vp = let subj = (np.s ! Nom).obj ;
                       obj = vp.compl ! np.a ;
                       clit = vp.clit ;
                       verb = agrV vp.verb np.a
      in {
        s = \\b => subj ++ clit ++ neg b ++ verb ++ obj
      } ;
    -- Verb
    UseV v = {
      verb = v ;
      clit = [] ;
      clitAgr = CAgrNo ;
      compl = \\_ => []
      } ;
    ComplV2 v2 np = let nps = np.s ! v2.c in {
      verb = {s = v2.s} ;
      clit = nps.clit ;
      clitAgr = case <nps.isClit,v2.c> of {
        <True,Acc> => CAgr np.a ;
        _          => CAgrNo
        } ;
      compl = \\_ => v2.p ++ nps.obj
      } ;
    AdvVP vp adv = vp ** {compl = \\agr => vp.compl ! agr ++ adv.s } ;
    UseAP ap = {
      verb = ser_V | estar_V ;
      clit = [] ;
      clitAgr = CAgrNo ;
      compl = \\agr => case agr of {
        Agr g n _ => ap.s ! g ! n
        }
      } ;
    -- Noun, CN, NP
    UseN n = n ;
    PositA a = a ;
    PrepNP prep np = case np.a of {
      Agr g n _ => {s = prep.s ! g ! n ++ employNP Nom np}
      } ;
    AdjCN ap cn = case ap.isPre of {
        True => cn ** {s = table {n => ap.s ! cn.g ! n ++ cn.s ! n}} ;
        False => cn ** {s = table {n => cn.s ! n ++ ap.s ! cn.g ! n}}
      } ;
    MassNP cn = {
      s = \\_ => {clit = [] ; obj = cn.s ! Sg ; isClit = False} ;
      a = Agr cn.g Sg Per3
      } ;
    DetCN det cn = {
      s = \\c => {clit = [] ;
                  obj = det.s ! cn.g ! c ++ cn.s ! det.n ;
                  isClit = False
        } ;
      a = Agr cn.g det.n Per3 ;
      } ;
    UsePN pn = {
      s = \\_ => {clit = [] ; obj = pn.s ; isClit = False} ;
      a = Agr pn.g Sg Per3
      } ;
    -- Pron
    UsePron p = {
      s = table {
        Nom => {clit = [] ;
                obj = p.s ! Nom ;
                isClit = False} ;
        Acc => {clit = p.s ! Acc ;
                obj = [] ;
                isClit = True}
        } ;
      a = p.a
      } ;
    i_Pron = iMasc_Pron | genderPron Fem iMasc_Pron ;
    youSg_Pron = youMascSg_Pron | genderPron Fem youMascSg_Pron ;
    he_Pron = {
      s = table {Nom => "ele" ; Acc => "o"} ;
      a = Agr Masc Sg Per3
      } ;
    she_Pron = {
      s = table {Nom => "ela" ; Acc => "a"} ;
      a = Agr Fem Sg Per3
      } ;
    we_Pron    = weMasc_Pron | genderPron Fem weMasc_Pron ;
    youPl_Pron = youMascPl_Pron | genderPron Fem youMascPl_Pron ;
    they_Pron = {
      s = table {Nom => "eles" ; Acc => "os"} ;
      a = Agr Masc Pl Per2
      }
      | {
        s = table {Nom => "elas" ; Acc => "as"} ;
        a = Agr Fem Pl Per2
          } ;
    -- Det
    a_Det     = adjDet (mkAdjective "um" "uma" [] [] True) Sg ;
    aPl_Det   = adjDet (mkAdjective [] [] "uns" "umas" True) Pl ;
    the_Det   = adjDet (mkAdjective "o" "a" [] [] True) Sg ;
    thePl_Det = adjDet (mkAdjective [] [] "os" "as" True) Pl ;
    every_Det = adjDet (mkAdjective "todo" "toda" [] [] True) Sg ;
    -- Prep
    in_Prep = no_Prep ;
    on_Prep = no_Prep ;
    with_Prep = {s = \\_ => \\_ => "com"} ;
    -- Conjunction/Disjunction
    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    and_Conj = {s = "e"} ;
    or_Conj = {s = "ou"} ;
    -- polarity
    PPos  = {s = [] ; b = True} ;
    PNeg  = {s = [] ; b = False} ;

}
