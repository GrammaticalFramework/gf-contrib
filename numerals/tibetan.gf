concrete tibetan of Numerals = {
flags coding = utf8 ;
-- include numerals.Abs.gf ;
-- flags coding=extradiacritics ;

oper bind : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ s2;

param DForm = unit | teen | bform | ten | hundred | agg ;

-- Sorry no tibetan script but the adhoc transliteration should be phonematic
-- 21 has an extra variant namely nyerchi'

oper LinDigit = {s : DForm => Str} ;

lincat Numeral =    { s : Str } ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = {s : Str ; s2 : Str} ;
lincat Sub1000 = {s : Str ; s2 : Str} ;
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> Str -> Str -> Str -> LinDigit = 
  \u -> \tn -> \b -> \t ->  
  {s = table {unit => u ; teen => tn ; bform => b + "chu" ; ten => t ; hundred => b + "ğya" ; agg => "ṭ'a'" ++ u}} ;

-- lin n1 mkNum "chi'" "chuǵchi'"  ;
lin n2 = 
{s = table {unit => "n̆yī" ; teen => "chuǵn̆yī" ; ten => "tsaǵ" ; 
            bform => "nyishu" ; hundred => (variants {"nyibğya"; "nyībğya"}) ; 
            agg => "ṭ'a'" ++ "n̆yī" } };
lin n3 = mkNum "sum" "chuǵsum" "sum" "soǵ" ;
lin n4 = mkNum "z̆hyi" "chubz̆hyi" (variants {"z̆hyib" ; "z̆hib"}) "źhye" ; 
lin n5 = mkNum "n̆ga" "chȫn̆ga" "n̆gab" "nga" ;
lin n6 = mkNum "ḍu'" "chuḍu'" "ḍuǵ" "re";
lin n7 = mkNum "d̆ün" "chubd̆ün" "d̆ün" "d́ön";
lin n8 = mkNum "ğyä'" "chobğyä'" "ğyä'" "ǵya"; 
lin n9 = mkNum "ğu" "chuğu" "ğub" "ǵo";

oper dang : Str = "d́ang" ;
oper tampa : Str -> Str = \s -> (variants {s; s ++ "t'ampa"});

lin num x = {s = [] ++ x.s ++ [] }; -- extra diacritics translation 

lin pot01 = 
  {s = table {hundred => "ğya" ; agg => (variants {[] ; "t'a'"}) ; _ => "chi'"}} ;
lin pot0 d = d ; 
lin pot110 = {s = tampa "chu" ; s2 = variants {"ṭ'i" ; "ṭ'iṭ'a'"}} ; 
lin pot111 = 
  {s = "chuǵchi'" ; 
   s2 = variants {"ṭ'i" ; "ṭ'iṭ'a'"} ++ dang ++ variants {"t̆ong'i" ; "t̆ongṭ'a'"}} ;
lin pot1to19 d = {s = d.s ! teen ; s2 = variants {"ṭ'i" ; "ṭ'iṭ'a'"} ++ mkagg (d.s ! agg) "t̆ong"} ;
lin pot0as1 n = {s = n.s ! unit ; s2 = mkagg (n.s ! agg) "t̆ong"} ;
lin pot1 d = {s = tampa (d.s ! bform) ; s2 = mkagg (d.s ! agg) "ṭ'i"} ;
lin pot1plus d e = 
  {s = variants { d.s ! bform ++ (bind (d.s ! ten) (e.s ! unit)) ; 
       (bind (d.s ! ten) (e.s ! unit))} ; 
   s2 = mkagg (d.s ! agg) "ṭ'i" ++ dang ++ mkagg (e.s ! agg) "t̆ong"} ;
lin pot1as2 n = {s = n.s ; s2 = n.s2 } ;
lin pot2 d = {s = d.s ! hundred ; s2 = mkagg (d.s ! agg) "b̆um" } ;
lin pot2plus d e = {s = d.s ! hundred ++ dang ++ e.s ;
                    s2 = mkagg (d.s ! agg) "b̆um" ++ dang ++ e.s2} ;
lin pot2as3 n = {s = n.s } ;
lin pot3 n = {s = n.s2 } ; 
lin pot3plus n m = {s = n.s2 ++ dang ++ m.s} ;

oper mkagg : Str -> Str -> Str = \attr -> \s -> bind s attr ;





}
