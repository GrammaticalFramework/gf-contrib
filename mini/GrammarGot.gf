concrete GrammarGot of Grammar = open ResGot, Prelude in {
  flags coding = utf8 ;
  lincat
    S = {s : Str};
    Cl = {s : TTense => Bool => Str} ;
    NP = {s : Case => Str ; a : Agr} ;
    VP = {v : Verb ; obj : Agr => Str} ;
    AP = {s : ADecl => Gender => Number => Case => Str} ;
    CN = {s : ADecl => Number => Case => Str ; g : Gender} ;
    N = Noun ;            -- {s : Number => Case => Str ; g : Gender} ;
    V = Verb ;
    V2 = Verb ** {c : Case} ;
    A = Adj;
    Det = {s : Gender => Case => Str ; n : Number ; f : ADecl} ;
    AdA = {s : Str} ;
    Tense = {s : Str ; t : TTense} ;
    Pol = {s : Str ; b : Bool};
    Conj = {s : Str ; o : ConjOp} ;
  lin
    UseCl t p cl = {s = t.s ++ p.s ++ cl.s ! t.t ! p.b} ;

    PredVP np vp =
      let
	subj = np.s ! Nom ;
	obj = vp.obj ! np.a ;
      in
      {
	s = \\t,b => subj ++ neg b ++ agrV vp.v np.a t ++ obj
      } ;

    ComplV2 v2 np = {
      v = v2 ;
      obj = \\ag => np.s ! v2.c
      } ;

    DetCN det cn = {
      s = \\c => det.s ! cn.g ! c ++ cn.s ! det.f ! det.n ! c ;
      a = Ag cn.g det.n Per3
      } ;

    ModCN ap cn = {
      s = \\a, n, c => cn.s ! a ! n ! c ++ ap.s ! a ! cn.g ! n ! c ;
      g = cn.g
      } ;

    CompAP ap = {
      v = wisan_V ;
      obj = \\ag => case ag of {
	Ag g n _ => ap.s ! Strong ! g ! n ! Nom
	}
      } ;

    AdAP ada ap = {
      s = \\a,g,n,c => ada.s ++ ap.s ! a ! g ! n ! c ;
      } ;

    ConjS  co x y = {s = x.s ++ co.s ++ y.s} ;

    ConjNP co nx ny = {
      s = \\c => nx.s ! c ++ co.s ++ ny.s ! c ;
      a = conjAgr co.o nx.a ny.a
      } ;

    UseN n = {
      s = \\a => n.s ;
      g = n.g
      } ;

    UseV v = {
      v = v ;
      obj = \\_ => []
      } ;

    UseA adj = adj ;

    a_Det = {
      s = \\_, _ => "" ;
      n = Sg ;
      f = Strong ;
      } ;

    the_Det = this_Det ;

    this_Det = mkDet "sa" "þis" "þamma" "þana"
      "þata" "þis" "þamma" "þata"
      "so" "þizos" "þizai" "þo" Sg Weak ;

    these_Det = mkDet "þai" "þize" "þaim" "þans"
      "þo" "þize" "þaim" "þo"
      "þos" "þizo" "þaim" "þos" Pl Weak ;

    every_Det = mkDet "hwazuh" "hwizuh" "hwammeh" "hwanoh"
      "hwah" "hwizuh" "hwammeh" "hwah"
      "hwoh" "hwizozuh" "hwizaih" "hwoh" Sg Strong ;

    that_Det = this_Det ;
    those_Det = these_Det ;

    i_NP = pronNP "ik" "meina" "mis" "mik" Masc Sg Per1 ;
    she_NP = pronNP "si" "izos" "izai" "ija" Fem Sg Per3 ;
    we_NP = pronNP "weis" "unsara" "uns" "uns" Masc Pl Per1 ;

    very_AdA = ss "filu" ;

    Pos  = {s = [] ; b = True} ;
    Neg  = {s = [] ; b = False} ;
    Pres = {s = [] ; t = ResGot.Pres} ;
    Perf = {s = [] ; t = ResGot.Pret} ;


    and_Conj = {s = "jah" ; o = Add} ;
    or_Conj  = {s = "or" ; o = Max} ;

}
