concrete GrammarPor of Grammar = open ResPor, Prelude in {
  lincat  
    S  = {s : Str} ;
    Cl = {s : ResPor.Tense => Bool => Str} ; 
    NP = ResPor.NP ;  
      -- {s : Case => {clit,obj : Str ; isClit : Bool} ; a : Agr} ; 
    VP = ResPor.VP ;  
      -- {v : Verb ; clit : Str ; clitAgr : ClitAgr ; obj : Agr => Str} ;
    AP = {s : Gender => Number => Str ; isPre : Bool} ;
    CN = Noun ;           -- {s : Number => Str ; g : Gender} ;
    Det = {s : Gender => Case => Str ; n : Number} ;
    N = Noun ;            -- {s : Number => Str ; g : Gender} ;
    A = Adj ;             -- {s : Gender => Number => Str ; isPre : Bool} ;
    V = Verb ;            -- {s : VForm => Str ; aux : Aux} ;
    V2 = Verb ** {c : Case} ;
    AdA = {s : Str} ;
    Pol = {s : Str ; b : Bool} ;
    Tense = {s : Str ; t : ResPor.Tense} ;
    Conj = {s : Str ; n : Number} ;
  lin
    UseCl t p cl = {s = t.s ++ p.s ++ cl.s ! t.t ! p.b} ; 
    PredVP np vp = 
      let 
        subj = (np.s ! Nom).obj ;
        obj  = vp.obj ! np.a ;
        clit = vp.clit ;
        verb = table {
          Pres => agrV vp.v np.a ;
          Perf => agrV (auxVerb vp.v.aux) np.a ++ agrPart vp.v np.a vp.clitAgr
          }
      in {
        s = \\t,b => subj ++ neg b ++ clit ++ verb ! t ++ obj
      } ;

    ComplV2 v2 np = 
      let
        nps = np.s ! v2.c
      in {
        v = {s = v2.s ; aux = v2.aux} ; 
        clit = nps.clit ; 
        clitAgr = case <nps.isClit,v2.c> of {
          <True,Acc> => CAgr np.a ;
          _ => CAgrNo
          } ;
        obj  = \\_ => nps.obj
        } ;

    UseV v = {
      v = v ; 
      clit = [] ; 
      clitAgr = CAgrNo ;
      obj = \\_ => []
      } ;

    DetCN det cn = {
      s = \\c => {
        obj = det.s ! cn.g ! c ++ cn.s ! det.n ; 
        clit = [] ; 
        isClit = False
        } ;
      a = Ag cn.g det.n Per3
      } ;

    ModCN ap cn = {
      s = \\n => preOrPost ap.isPre (ap.s ! cn.g ! n) (cn.s ! n) ;
      g = cn.g
      } ;

    CompAP ap = {
      v = essere_V ; 
      clit = [] ; 
      clitAgr = CAgrNo ;
      obj = \\ag => case ag of {
        Ag g n _ => ap.s ! g ! n
        }
      } ;

    AdAP ada ap = {
      s = \\g,n => ada.s ++ ap.s ! g ! n ;
      isPre = ap.isPre ;
      } ;

    ConjNP co nx ny = {
      s = \\c => {
        obj = (nx.s ! c).obj ++ co.s ++ (ny.s ! c).obj ; 
        clit = [] ; 
        isClit = False
        } ;
      a = ny.a ; ---- should be conjAgr co.n nx.a ny.a
      } ;

    UseN n = n ;

    UseA adj = adj ;

    a_Det = adjDet (mkAdj "un" "una" [] [] True) Sg ;

    the_Det = {
      s = table {
        Masc => table {
          Nom | Acc => "o"
          Dat => elisForms "allo" "all'" "al"
          } ;
        Fem => table {
          Nom | Acc => elisForms "la" "'l" "la" ;
          Dat => elisForms "alla" "all'" "alla"
          }
        } ;
      n = Sg
      } ;
        
    this_Det = adjDet (regAdj "este") Sg ;
    these_Det = adjDet (regAdj "este") Pl ;
    that_Det = adjDet (regAdj "esse") Sg ;
    those_Det = adjDet (regAdj "esse") Pl ;

    i_NP =   pronNP "eu"  "me" "me" Masc Sg Per1 ;
    she_NP = pronNP "ela" "a" "lhe" Fem  Sg Per3 ;
    we_NP =  pronNP "nós" "nos" "nos" Masc Pl Per1 ;

    very_AdA = ss "muito" ;

    Pos  = {s = [] ; b = True} ;
    Neg  = {s = [] ; b = False} ;
    Pres = {s = [] ; t = ResPor.Pres} ;
    Perf = {s = [] ; t = ResPor.Perf} ;

    and_Conj = {s = "e" ; n = Pl} ;
    or_Conj  = {s = "o" ; n = Sg} ;
