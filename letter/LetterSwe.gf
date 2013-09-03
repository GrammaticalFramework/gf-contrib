concrete LetterSwe of Letter = {

--1 An Swedish Concrete Syntax for Business and Love Letters
--
-- This file defines the Swedish syntax of the grammar set 
-- whose abstract syntax is $letter.Abs.gf$. 


flags lexer=textlit ; unlexer=textlit ;

printname cat Letter = "Brev" ;
printname fun MkLetter = "brevmall" ;

param Sex = masc | fem ;
param Gen = en | ett ;
param Num = sg | pl ;
param Kas = nom | acc ;
param DepNum = depnum | cnum Num ;

oper SS     = {s : Str} ;
oper SSDep  = {s : Num => Sex => Str} ;      -- needs Num and Sex
oper SSSrc  = {s : Str ; n : Num ; x : Sex} ; -- gives Num and Sex
oper SSSrc2 = {s : Num => Sex => Str ; n : DepNum ; x : Sex} ; -- gives and needs
oper SSDep2 = {s : DepNum => Sex => Num => Sex => Str} ; -- needs Auth's & Recp's
oper SSSrcGen  = {s : Str ; n : Num ; g : Gen} ; -- gives Num and Gen


oper 
  ss : Str -> SS = \s -> {s = s} ;

  constNX : Str -> Num -> Sex -> SSSrc2 = \str,num,sex -> 
    {s =  table {_ => table {_ => str}} ; n = cnum num ; x = sex} ;

  dep2num : DepNum -> Num -> Num = \dn,n -> case dn of {
    depnum  => n ; 
    cnum cn => cn
    } ;

  RET = "" ; -- &-

lincat
Letter     = SS ;
Recipient  = SSSrc ;
Author     = SSSrc2 ;
Message    = SSDep2 ;
Heading    = SSSrc ;
Ending     = SSSrc2 ;
Mode       = SSDep2 ;
Sentence   = SSDep2 ;
NounPhrase = SSSrcGen ;
Position   = SSDep ;

lin
MkLetter head mess end = 
  ss (head.s ++ "," ++ RET ++ 
      mess.s ! end.n ! end.x ! head.n ! head.x ++ "." ++ RET ++ 
      end.s ! head.n ! head.x) ;

DearRec rec   = {s = kaer ! rec.n ! rec.x ++ rec.s ; n = rec.n ; x = rec.x} ;
PlainRec rec  = rec ;
HelloRec rec  = {s = "Hej" ++ rec.s ; n = rec.n ; x = rec.x} ;
JustHello rec = {s = "Hej"          ; n = rec.n ; x = rec.x} ;

ModeSent mode sent = 
  {s = 
    table {na => table {xa => table {nr => table {xr => 
      mode.s ! na ! xa ! nr ! xr ++ sent.s ! na ! xa ! nr ! xr}}}}
  } ;
PlainSent sent = sent ;

FormalEnding auth = 
  {s = table {n => table {x => 
     ["Med v�nlig h�lsning"] ++ RET ++ auth.s ! n ! x}} ; n = auth.n ; x = auth.x} ;

InformalEnding auth = 
  {s = table {n => table {x => 
     ["Med h�lsningar"] ++ RET ++ auth.s ! n ! x}} ; n = auth.n ; x = auth.x} ;

ColleaguesHe  = {s = kollega ! pl ; n = pl ; x = masc} ;
ColleaguesShe = {s = kollega ! pl ; n = pl ; x = fem} ;
ColleagueHe  = {s = kollega ! sg ; n = sg ; x = masc} ;
ColleagueShe = {s = kollega ! sg ; n = sg ; x = fem} ;
DarlingHe    = {s = "�lskling"  ; n = sg ; x = masc} ;
DarlingShe   = {s = "�lskling"  ; n = sg ; x = fem} ;
NameHe s   = {s = s.s  ; n = sg ; x = masc} ;
NameShe s  = {s = s.s  ; n = sg ; x = fem} ;

Honour = {s = 
    table {na => table {xa => table {nr => table {xr => 
      jag ! dep2num na nr ! nom ++ ["har �ran att meddela"] ++ 
      du ! nr ! acc ++ "att"}}}}
  } ;

Regret = {s = 
    table {na => table {xa => table {nr => table {xr => 
      jag ! dep2num na nr ! nom ++ ["m�ste tyv�rr meddela"] ++ 
      du ! nr ! acc ++ "att"}}}}
  } ;


President = constNX ["Presidenten"] sg masc ;
Mother    = constNX ["Mamma"] sg fem ;
Spouse    = {s = table {
                   sg => table {fem => ["din man"] ; masc => ["din hustru"]} ; 
                   pl => table {fem => ["era m�n"] ; masc => ["era hustrur"]}
                 } ; n = depnum ; x = masc} ; -- sex does not matter here
Dean      = constNX ["Dekanus"] sg masc ;
Name s    = constNX s.s sg masc ; ---

BePromoted pos = {s = 
    table {na => table {xa => table {nr => table {xr => 
      du ! nr ! nom ++ ["har blivit"] ++ befordrad ! nr ++
      "till" ++ pos.s ! nr ! xr}}}}
  } ;
GoBankrupt np = {s = 
    table {na => table {xa => table {nr => table {xr => 
      np.s ++ ["har g�tt i konkurs"]}}}}
  } ;
ILoveYou = {s = 
    table {na => table {xa => table {nr => table {xr => 
      jag ! dep2num na nr ! nom ++ ["�lskar"] ++ du ! nr ! acc}}}}
  } ;
    
Company      = {s = ["v�rt f�retag"]          ; n = sg ; g = ett} ;
Competitor   = {s = ["v�r v�rsta konkurrent"] ; n = sg ; g = en} ;
OurCustomers = {s = ["v�ra kunder"] ; n = pl ; g = en} ;

Senior = {s = table {n => table {x => ["�ldre forskare"]}}} ;
ProjectManager = {s = 
  table {
    sg => table {_ => "projektchef"} ;
    pl => table {_ => "projektchefer"}
        }} ;

oper 

kaer : 
  Num => Sex => Str =
  table {
    sg => table {masc => "K�re" ; fem => "K�ra"} ;
    pl => table {_ => "K�ra"}
        } ;

kollega : 
  Num => Str =
  table {sg => "kollega" ; pl => "kollegor"} ;

befordrad : 
  Num => Str =
  table {sg => "befordrad" ; pl => "befordrade"} ;

jag : 
  Num => Kas => Str =
  table {
    sg => table {nom => "jag" ; acc => "mig"} ;
    pl => table {nom => "vi"  ; acc => "oss"}
        } ;
du : 
  Num => Kas => Str =
  table {
    sg => table {nom => "du" ; acc => "dig"} ;
    pl => table {nom => "ni" ; acc => "er"}
        } ;
}
