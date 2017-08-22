concrete GrammarAkk of Grammar = open ResAkk, (R=ResAkk), Prelude in {
flags coding = utf8 ;

  lincat  
    S  = {s : Str} ;
    Cl = {s : R.Tense => Str} ; --perfekti tai preesens! ehtolauseessa vika verbi perfektissä, seuraamuslauseessa preesens 
    NP = R.NounPhrase ;   
    VP = R.VerbPhrase ;  
    ModP = {s : Str} ; --R.Modifier ; --Käytännössä vain genetiiviattribuutti tässä kieliopissa
    CN = R.CN ;
    Det = R.Determiner ;
    N = R.Noun ;
    V = R.Verb ;
    V2 = R.Verb ** {c : R.Case} ;
    Adv = {s : Str} ;
    Tense = {s : Str ; t : R.Tense} ; 
    Conj = {s : Str ; n : R.Number} ;
  lin
  
    UseCl t cl = {s = cl.s ! t.t} ;

    PredVP np vp = {
      s = \\t => np.s ! R.Nom ++ vp.s ! t ! np.a -- Subjekti on nominatiivissa. Aikamuoto tarvitaan vielä.  
      } ;
 
    ComplV2 v2 np = {
       s = \\t,a => 
       let
         verb   = v2.s ! t ! a ; 
         object = np.s ! v2.c
       in 
         object ++ verb  
      } ;
      
    PassVP np vp = { --Objekti ja verbi; kongruenssi aina mask. mon. 3.
      s = \\t =>
      let
        agr : Agr = mkAgr Masc Pl Per3
      in
        np.s ! Acc ++ vp.s ! t ! agr 
      } ;
      
    ProDrop np vp = {
      s = \\t => vp.s ! t ! np.a --Ei subjektia ollenkaan, vain sen kongruenssi.
      };
    
    UseV v = v ;

    DetCN det cn = {
      s = \\c => 
      	let determiner = det.s ! cn.g ! c ;
            cnoun      = cn.s ! det.n ! c 
      	in  cnoun ++ determiner ;
      a = mkAgr cn.g det.n R.Per3
      } ;

    ModN mod n = {
      s = \\num,c => n.s ! R.Cstr ! num ! c ++ mod.s ; --Jos nominia modifioidaan, se on construktuksessa
      g = n.g
      } ;
      
    ModCN mod cn = {
      s = \\num,c => cn.s ! num ! c ++ mod.s ; --sallii modifioida mitä tahansa CN:ää (vaikka ei pitäisi). Mahdollistaa ketjutukset "iin maar awiilim", käytännössä vähän yligeneroi nyt. 
      g = cn.g
      } ;
 
    UseN n = {s = n.s ! R.Det ;
    	      g = n.g } ;
    
    UseMod np = {s = np.s ! Gen } ;

    ConjS c a b = {s = c.s ++ a.s ++ "," ++ b.s} ; --pelkästään "jos a, b" -lauseita varten
    AdvS  adv s = {s = adv.s ++ "," ++ s.s} ;
    
    sg_Det = reg1Determiner "" Sg ;
    pl_Det = reg1Determiner "" Pl ;
    that_Det = mkDeterminer "šuu" "ša" "ši" "šaat" "šaati" Sg ;
    thatDu_Det = reg1Determiner "šaat" Du ;
    those_Det = reg2Determiner "šuut" "šaat" Pl ;
    
    Present = {s = [] ; t = R.Pres} ;
    Perfect = {s = [] ; t = R.Perf} ;

    and_Conj = {s = "wa" ; n = Pl} ; --Jos se yhdistää nominilausekkeita, syntyvän NP:n n on Pl
    or_Conj  = {s = "ū lu" ; n = Sg} ;
    if_Conj  = {s = "šumma" ; n = Sg} ;
} ;

