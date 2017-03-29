concrete GrammarEng of Grammar = open ResEng, Prelude in {


  lincat 
    S  = {s : Str} ;
    Cl = {subj : Str ; a : Agreement ; verb : GVerb ; compl : Str ; isAux : Bool} ;
    NP = {s : Case => Str ; a : Agreement} ;
    VP = {verb : GVerb ; compl : Str ; isAux : Bool} ;
    AP = Adjective ;
    CN = Noun ; 
    Det = {s : Str ; n : Number} ;
    N = Noun ;
    A = Adjective ;
    V = Verb ;
    V2 = Verb ;
--    AdA ; 
    Tense = {vf : VForm} ;
    Pol   = {p  : Bool} ;
--    Conj ;

  lin
    UseCl t p cl = {
      s = let
            agr = cl.a ;
	    verb = cl.verb
          in
          cl.subj ++
	  case <t.vf, p.p, agr, cl.isAux> of {
            <Inf,True,Agr Sg Per3,_>  => verb ! VF PresSg ; 
            <Inf,True,Agr Sg Per1,_>  => verb ! PresSg1 ;
            <Inf,True,_,_>            => verb ! PresPl ;
	    <Inf,False,Agr Sg Per3,False> => do_Verb.s ! PresSg ++ "not" ++ verb ! VF Inf ;
	    <Inf,False,_,False>           => do_Verb.s ! Inf ++ "not" ++ verb ! VF Inf ;
	    <Inf,False,Agr Sg Per3,_>  => verb ! VF PresSg ++ "not" ; 
            <Inf,False,Agr Sg Per1,_>  => verb ! PresSg1 ++ "not" ; 
            <Inf,False,_,_>            => verb ! PresPl ++ "not" ; 
            <_  ,True,Agr Sg Per3,_>  => have_Verb.s ! PresSg ++ verb ! VF PastPart ; 
            <_ , True,_,_>            => have_Verb.s ! Inf ++ verb ! VF PastPart ; 
	    <_,  False,Agr Sg Per3,_> => have_Verb.s ! PresSg ++ "not" ++ verb ! VF PastPart ; 
	    <_,  False,_,_>           => have_Verb.s ! Inf ++ "not" ++ verb ! VF PastPart
            } ++
	  cl.compl ;
      } ;
    PredVP np vp = {
      subj = np.s ! Nom ;
      a = np.a ;
      verb = vp.verb ;
      compl = vp.compl ;
      isAux = vp.isAux
      } ;
    ComplV2 v2 np = {
      verb = verb2gverb v2 ;
      compl = np.s ! Acc ;
      isAux = False
      } ;
    DetCN det cn = {
      s = table {c => det.s ++ cn.s ! det.n} ;
      a = Agr det.n Per3
      } ;
    ModCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    CompAP ap = {verb = be_GVerb ; compl = ap.s ; isAux = True} ;
    AdAP ada ap = {s = ada.s ++ ap.s} ;

--    ConjNP  : Conj -> NP -> NP -> NP ;

    UseV v = {verb = verb2gverb v ; compl = "" ; isAux = False} ;
    UseN n = n ;
    UseA a = a ;

    a_Det = {s = "a" ; n = Sg} ;
    the_Det = {s = "the" ; n = Sg} ;
    this_Det = {s = "this" ; n = Sg} ;
    these_Det = {s = "these" ; n = Pl} ;
    that_Det = {s = "that" ; n = Sg} ;
    those_Det = {s = "those" ; n = Pl} ;

  i_NP = {
    s = table {Nom => "I" ; Acc => "me"} ;
    a = Agr Sg Per1
    } ;
  she_NP = {
    s = table {Nom => "she" ; Acc => "her"} ;
    a = Agr Sg Per3
    } ;
  we_NP = {
    s = table {Nom => "we" ; Acc => "us"} ;
    a = Agr Pl Per1
    } ;

  very_AdA = {s = "very"} ;

  Pos  = {p = True} ;
  Neg  = {p = False} ;
  Pres = {vf = Inf} ;
  Perf = {vf = PastPart} ;

--   and_Conj, or_Conj : Conj ;

}
