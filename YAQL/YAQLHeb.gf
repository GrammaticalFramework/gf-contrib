--# -path=.:alltenses

concrete YAQLHeb of YAQL =  open Prelude in {

flags coding = utf8 ;

 
lincat 
Move,  
Entity, 
[Entity], 
Preposition, 
[Property],
Relation, 
QuestionAdverb,
QuestionPhrase,
Numeric,
Polarity,
Temporality, 
Query = Str ;


lin

MQuery q =   q ; 
TAll k =  k ; 
MAllAbout t = "הצג הכל על" ++ t.s ;
PKind k = k ; 
TSome k = k ;
PKind k = k ; 
TSome k = k ;
MShowTerm k = "הצג את " ++ k.s ;
KProperty k p = { s = k.s ++ "ב" ++ "&+" ++ p.s} ;

oper 
 qType : Str ->  {s : Str}  = \st ->  {s = st } ;

}


