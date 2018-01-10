--[] when to use isClit?

concrete MiniGrammarPor of MiniGrammar = open MiniResPor, Prelude in {
  lincat
    Pol = {s : Str ; b : Bool} ;
    S  = {s : Str} ;
    Cl = {s : Bool => Str} ;
    VP = MiniResPor.VP ;
    Adv = Adverb ;
    NP = MiniResPor.NP ;
    Det = {s : Gender => Case => Str ; n : Number} ;
    AP = Adjective ;
    CN = Noun ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;
    Pron = MiniResPor.Pron ;
  lin
    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    -- Verb
    UseV v = {
      verb = verb2gverb v ;
      clit = [] ;
      clitAgr = CAgrNo
      compl = [] ;
      } ;
    -- Noun, CN, NP
    UseN n = n ;
    PositA a = a ;
    AdjCN ap cn = case ap.isPre of {
        True => cn ** {s = table {n => ap.s ! cn.g ! n ++ cn.s ! n}} ;
        False => cn ** {s = table {n => cn.s ! n ++ ap.s ! cn.g ! n}}
      } ;
    MassNP cn = {
      s = \\_ => {clit = cn.s ! Sg ; obj = [] ; isClit = False} ;
      a = Agr cn.g Sg Per3
      } ;
    DetCN det cn = {
      s = \\c => {clit = det.s ! cn.g ! c ++ cn.s ! det.n ;
                  obj = [] ;
                  isClit = False
        } ;
      a = Agr cn.g det.n Per3 ;
      } ;
    UsePN pn = {
      s = \\_ => {clit = pn.s ; obj = [] ; isClit = False} ;
      a = Agr pn.g Sg Per3
      } ;
    -- Pron
    UsePron p = {
      s = table {
        Nom => {clit = p.s ! Nom ;
                obj = [] ;
                isClit = False} ;
        Acc => {clit = [] ;
                obj = p.s ! Acc ;
                isClit = True}
        } ;
      a = p.a
      } ;
    i_Pron = iMasc_Pron | genderPron Fem iMasc_Pron ;
    you_Pron = youMascSg_Pron | genderPron Fem youMascSg_Pron ;
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
      s = table {Nom => "Eles" ; Acc => "os"} ;
      a = Agr Masc Pl Per2
      }
      | {
        s = table {Nom => "Elas" ; Acc => "as"} ;
        a = Agr Fem Pl Per2
          } ;
    -- Det
    a_Det     = adjDet (mkAdjective "um" "uma" [] [] True) Sg ;
    aPl_Det   = adjDet (mkAdjective [] [] "uns" "umas" True) Pl ;
    the_Det   = adjDet (mkAdjective "o" "a" [] [] True) Sg ;
    thePl_Det = adjDet (mkAdjective [] [] "os" "as" True) Pl ;
    every_Det = adjDet (mkAdjective "todo" "toda" [] [] True) Sg ;
    -- Conjunction/Disjunction
    and_Conj = {s = "e"} ;
    or_Conj = {s = "ou"} ;
    -- polarity
    PPos  = {s = [] ; b = True} ;
    PNeg  = {s = [] ; b = False} ;

  {--
  lincat
    Utt = {s : Str} ;
    Adv = Adverb ;
    Pol = {s : Str ; b : Bool} ;
    S  = {s : Str} ;
    Cl = {s : Bool => Str} ;
    VP = {verb : GVerb ; compl : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Conj = {s : Str} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    PN = ProperName ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    PredVP np vp = {
      s = \\b =>
           np.s ! Nom
	++ case <b, np.a, vp.verb.isAux> of {
	    <True, Agr Sg Per1,_> => vp.verb.s ! PresSg1 ;
	    <True, Agr Sg Per3,_> => vp.verb.s ! VF PresSg3 ;
	    <True, _          ,_> => vp.verb.s ! PresPl ;
	    <False, Agr Sg Per1,True>  => vp.verb.s ! PresSg1 ++ "not" ;
	    <False, Agr Sg Per3,True>  => vp.verb.s ! VF PresSg3 ++ "not" ;
	    <False, _          ,True>  => vp.verb.s ! PresPl ++ "not" ;
	    <False, Agr Sg Per3,False> => "does not" ++ vp.verb.s ! VF Inf ;
	    <False, _          ,False> => "do not" ++ vp.verb.s ! VF Inf
	    }
        ++ vp.compl ;
      } ;

    UseV v = {
      verb = verb2gverb v ;
      compl = []
      } ;
    ComplV2 v2 np = {
      verb = verb2gverb v2 ;
      compl = v2.c ++ np.s ! Acc
      } ;
    UseAP ap = {
      verb = be_GVerb ;
      compl = ap.s
      } ;
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;

    DetCN det cn = {
      s = table {c => det.s ++ cn.s ! det.n} ;
      a = Agr det.n Per3
      } ;
    UsePN pn = {
      s = \\_ => pn.s ;
      a = Agr Sg Per3
      } ;
    UsePron p =
      p ;
    MassNP cn = {
      s = \\_ => cn.s ! Sg ;
      a = Agr Sg Per3
      } ;
    a_Det = {s = "a" ; n = Sg} ;
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;
    UseN n =
      n ;
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;

    PPos  = {s = [] ; b = True} ;
    PNeg  = {s = [] ; b = False} ;

    and_Conj = {s = "and"} ;
    or_Conj = {s = "or"} ;

    every_Det = {s = "every" ; n = Sg} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    i_Pron = {
      s = table {Nom => "I" ; Acc => "me"} ;
      a = Agr Sg Per1
      } ;
    youSg_Pron = {
      s = \\_ => "you" ;
      a = Agr Sg Per2
      } ;
    he_Pron = {
      s = table {Nom => "he" ; Acc => "him"} ;
      a = Agr Sg Per3
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Acc => "her"} ;
      a = Agr Sg Per3
      } ;
    we_Pron = {
      s = table {Nom => "we" ; Acc => "us"} ;
      a = Agr Pl Per1
      } ;
    youPl_Pron = {
      s = \\_ => "you" ;
      a = Agr Pl Per2
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Acc => "them"} ;
      a = Agr Pl Per2
      } ;
--}
}
