resource ResAkk = open Prelude, Predef in {
flags coding = utf8 ;
-- Kategoriat

param
  Number = Sg | Du | Pl ;
  Gender = Masc | Fem ;
  Case   = Nom | Acc | Gen ;
  Status = Abs | Det | Cstr ; 
  Tense  = Pres | Perf ;
  Person = Per1 | Per2 | Per3 ;
  Agr    = Ag Gender Number Person ;


-- Sanaluokka- ja lauseketyypit

oper
  VerbPhrase : Type = {
    s : Tense => Agr => Str ; 
    } ;
  NounPhrase : Type = {
    s : Case => Str ; --NP:tä tehdessä tiedetään jo status ja numero. Sitten on enää sijavaihtoehdot, jotka määräytyy syntaksista. 
    a : Agr --NP:n gender, number, person. Kun NP:stä tulee S:n subjekti, VP:stä valitaan oikea verbimuoto.
    } ; 
  CN : Type = {
    s : Number => Case => Str ; --CN:ää tehdessä tiedetään jo status. Vielä numero ja sija. 
    g : Gender --suku
    } ; 

  
  mkAgr : Gender -> Number -> Person -> Agr = \g,n,p ->
    Ag g n p ;

--Morfologia
  Determiner : Type = {s : Gender => Case => Str ; n : Number} ;
  Noun : Type = {s : Status => Number => Case => Str ; g : Gender} ;
   --Constructus jos sitä modifioi ModP osana. Determinatus, jos se on yksinään NP.
   --Absolutusta ei käytetä hammurapi-kieliopissa, mukana täydellisyyden vuoksi.
   --Sija sen mukaan, miten se on koko lauseessa.
  Modifier : Type = {s : Str} ; --Luodaan NP:stä valitsemalla genetiivi.
  Verb : Type = {s : Tense => Agr => Str} ;


  mkDeterminer : (x1,_,_,_,x5 : Str) -> Number -> Determiner = 
  \su,sa,si,saat,saati,n -> {
    s = table {
        Masc => table {
          Nom => su ; 
          Acc => sa ;
          Gen => si
          } ;
        Fem => table {
          Nom => saat ;
          Gen => saati ; 
          Acc => saati
          }
        } ;
      n = Sg
      } ;

    
  reg1Determiner : Str -> Number -> Determiner = \saat,n -> 
    mkDeterminer saat saat saat saat saat n ;

  reg2Determiner : (masc, fem : Str) -> Number -> Determiner = \suut,saat,n -> 
    mkDeterminer suut suut suut saat saat n ;
 

  mkNoun : (x1,_,_,_,_,_,_,_,x9 : Str) -> Gender -> Noun = 
  \alp,alap,alpum,alpam,alpim,iinaan,iiniin,sarruu,sarrii,g ->
  let
    taipumaton : Str -> (Number => Case => Str) = \n ->
        table { _ => table {_ => n } } ;
  in
  { s = table {
        Abs => taipumaton alap ; --Ei käytössä tässä kieliopissa
    	Det => table { Sg => table {
    		              Nom => alpum ;
    		              Acc => alpam ;
    		              Gen => alpim
    		              } ;
    	               Pl => table {
    	                      Nom => sarruu ;	  
    	                      Acc => sarrii ;
    		              Gen => sarrii
    		              } ;
    	               Du => table {
    			      Nom => iinaan ;	  
    			      Acc => iiniin ;
    		              Gen => iiniin
    		              } 
                      } ;
    	Cstr => taipumaton alap --Constructuksen kanssa ei sijaeroja
        } ;
    g = g
  } ;
 

  mascNoun : Str -> Noun = \marum -> 
    let
      mar = tk 2 marum
    in 
    case marum of {
      naru + qq@("bb"|"dd"|"gg"|"hh"|"jj"|"kk"|"ll"|"mm"|"nn"|"pp"|"qq"|"rr"|"ss"|"šš"|"şş"|"tt"|"ţţ"|"zz") + "um" =>
                   mkNoun (naru+init qq) (naru+init qq) --olematon suffiksimuoto, st.cstr.
                   marum (mar+"am") (mar+"im") --Sg nom, acc, gen
                   (mar+"aan") (mar+"iin") -- Du nom, acc/gen 
                   (mar+"uu") (mar+"ii") Masc ; --  Pl nom, acc/gen, Gender
      w@? + a@("a"|"i"|"u"|"e") + r@("'"|"b"|"d"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"š"|"ş"|"t"|"ţ"|"z") + d@("'"|"b"|"d"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"š"|"ş"|"t"|"ţ"|"z") + "um" =>
                   mkNoun mar (w + a + r + a + d) --st.cstr
                   marum (mar + "am") (mar + "im")
                   (mar + "aan") (mar + "iin")
                   (mar + "uu") (mar + "ii") Masc ;
      ese + m@("'"|"b"|"d"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"š"|"ş"|"t"|"ţ"|"z") + t@("'"|"b"|"d"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"š"|"ş"|"t"|"ţ"|"z") + "um" =>
                   mkNoun mar (mar+"i")
                   (mar+"um") (mar+"am") (mar+"im") 
                   (mar+"aan") (mar+"iin")
                   (mar+"uu") (mar + "ii") Masc ;
                   
      _         => mkNoun mar mar 
                   (mar+"um") (mar+"am") (mar+"im") 
                   (mar+"aan") (mar+"iin")
                   (mar+"uu") (mar + "ii") Masc  
    } ;

    femNoun  : (sg,du : Str) -> Noun = \sarratum,saptan ->
    let      
      sarrat = tk 2 sarratum ;
      sarr   = tk 2 sarrat ;
      sap    = tk 3 saptan
    in 
      case sarratum of {
      sa + rr@("bb"|"dd"|"gg"|"hh"|"jj"|"kk"|"ll"|"mm"|"nn"|"pp"|"qq"|"rr"|"ss"|"šš"|"şş"|"tt"|"ţţ"|"zz") + "atum" =>
                  mkNoun sarrat sarrat
                  sarratum (sarrat+"am") (sarrat+"im")
                  (sap + "taan") (sap + "tiin")
                  (sarr + "aatum") (sarr + "aatim") Fem ;
     
     _         => mkNoun sarrat sarrat
                  sarratum (sarrat+"am") (sarrat+"im")
                  (sap + "taan") (sap + "tiin")
                  (sarr + "aatum") (sarr + "aatim") Fem 
     } ;
  
  --Teoreettinen pahin tapaus; kaikki 16 muotoa olisivat epäsäännöllisiä.
  --(Olisi varmasti mahdollista tehdä mukavampi pahimman tapauksen konstruktori.)
  --Tämä ei näy käyttäjälle ikinä.
  mkVerb : (x1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,x16 : Str) -> Verb = 
    \aparras,taparras,taparrasii,iparras,niparras,taparrasaa,iparrasuu,iparrasaa,
    aptaras,taptaras,taptarsii,iptaras,niptaras,taptarsaa,iptarsuu,iptarsaa-> {
    s = table {          	         
          Pres => table { Ag _    Sg Per1 => aparras ;
          		  Ag Masc Sg Per2 => taparras ;
          		  Ag Fem  Sg Per2 => taparrasii ;
          		  Ag _    Sg Per3 => iparras ;
          		  Ag _    Pl Per1 => niparras ;
          	          Ag _    Pl Per2 => taparrasaa ;
          	          Ag Masc Pl Per3 => iparrasuu ;
          		  Ag Fem  Pl Per3 => iparrasaa ;
          		  Ag _    Du _    => []
                         } ;
                         
          Perf => table { Ag _    Sg Per1 => aptaras ;
          		  Ag Masc Sg Per2 => taptaras ;
          		  Ag Fem  Sg Per2 => taptarsii ;
          		  Ag _    Sg Per3 => iptaras ;
          		  Ag _    Pl Per1 => niptaras ;
          	          Ag _    Pl Per2 => taptarsaa ;
          	          Ag Masc Pl Per3 => iptarsuu ;
          		  Ag Fem  Pl Per3 => iptarsaa ;          		  
          		  Ag _    Du _    => []
          	         }
        }
  } ;
  
 
  strongVerb : (root,vowels : Str) -> Verb = \prs,vv ->
    let
     v1 : Str = take 1 vv ;
     v2 : Str = dp 1 vv ;
     faCCaL : Str = "F" + v1 + "CC" + v2 + "L" ;
     ftaCaL  : Str = "Ft" + v1 + "C"  + v2 + "L" ;

     aparras : Str    = word ("a" + faCCaL) prs ;
     taparras : Str   = word ("ta" + faCCaL) prs ;
     taparrasii : Str = word ("ta" + faCCaL + "ii") prs ;
     iparras : Str    = word ("i" + faCCaL) prs ;
     niparras : Str   = word ("ni" + faCCaL) prs ;
     taparrasaa : Str = word ("ta" + faCCaL + "aa") prs ;
     iparrasaa  : Str = word ("i" + faCCaL + "aa") prs ;
     iparrasuu : Str  = word ("i" + faCCaL + "uu") prs ;
     
     aptaras : Str    = word ("a" + ftaCaL) prs ;
     taptaras : Str   = word ("ta" + ftaCaL) prs ;
     taptarsii : Str  = word ("ta" + ftaCaL + "ii") prs ;
     iptaras : Str    = word ("i" + ftaCaL) prs ;
     niptaras : Str   = word ("ni" + ftaCaL) prs ;
     taptarsaa : Str  = word ("ta" + ftaCaL + "aa") prs ;
     iptarsuu : Str   = word ("i" + ftaCaL + "uu") prs ;
     iptarsaa : Str   = word ("i" + ftaCaL + "aa") prs ;
    in
     mkVerb aparras  taparras   taparrasii iparras
            niparras taparrasaa iparrasuu  iparrasaa
            aptaras  taptaras   taptarsii  iptaras
            niptaras taptarsaa  iptarsuu   iptarsaa;
  
  Root : Type = {F,C,L : Str} ;
  Pattern : Type = Root -> Str ;
  Filling : Type = {F,FC,CL,L : Str} ;
  
  fill : Filling -> Root -> Str = \p,r ->
    p.F + r.F + p.FC + r.C + p.CL + r.L + p.L ;
    
  dfill : Filling -> Root -> Str = \p,r ->
    p.F + r.F + p.FC + r.C + r.C + p.CL + r.L + p.L ;
  
  getRoot : Str -> Root = \s -> case s of {
    F + C@? + L@? => {F = F ; C = C ; L = L} ;
    _ => Predef.error ("cannot get root from" ++ s)
  } ;
  
  getPattern : Str -> Pattern = \s -> case s of {
    F + "F" + FC + "CC" + CL + "L" + L =>
      dfill {F = F ; FC = FC ; CL = CL ; L = L} ;
    F + "F" + FC + "C" + CL + "L" + L =>
      fill {F = F ; FC = FC ; CL = CL ; L = L} ;
    _ => Predef.error ("cannot get pattern from" ++ s)
  } ;
  
  word : (patt, root : Str) -> Str = \p,r ->
    getPattern p (getRoot r) ;
    
}