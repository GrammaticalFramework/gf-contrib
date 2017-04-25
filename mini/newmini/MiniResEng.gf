resource MiniResEng = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Person = Per1 | Per2 | Per3 ;

  Agreement = Agr Number Person ;

  VForm = Inf | PresSg3 ;

oper
  Noun : Type = {s : Number => Str} ;

  mkNoun : Str -> Str -> Noun = \sg,pl -> {
    s = table {Sg => sg ; Pl => pl}
    } ;

  regNoun : Str -> Noun = \sg -> mkNoun sg (sg + "s") ;

  -- smart paradigm
  smartNoun : Str -> Noun = \sg -> case sg of {
    _ + ("ay"|"ey"|"oy"|"uy") => regNoun sg ;
    x + "y" => mkNoun sg (x + "ies") ;
    _ + ("ch"|"sh"|"s"|"o") => mkNoun sg (sg + "es") ;
    _       => regNoun sg
    } ;

  mkN = overload {
   mkN : Str -> Noun = smartNoun ;
   mkN : Str -> Str -> Noun = mkNoun ;
   } ;

  ProperName : Type = {s : Str} ;

  mkPN : Str -> ProperName = \s -> {s = s} ;

  Adjective : Type = {s : Str} ;

  mkA : Str -> Adjective = \s -> {s = s} ;

  Verb : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres : Str) -> Verb = \inf,pres -> {
    s = table {
      Inf => inf ;
      PresSg3 => pres
      }
    } ;

  smartVerb : Str -> Verb = \inf ->
     mkVerb inf ((mkN inf).s ! Pl) ;
 
  mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    mkV : (inf,pres : Str) -> Verb = mkVerb ;
    } ;

  Verb2 : Type = Verb ** {c : Str} ;

  mkV2 = overload {
    mkV2 : Str         -> Verb2 = \s   -> mkV s ** {c = []} ;
    mkV2 : Str  -> Str -> Verb2 = \s,p -> mkV s ** {c = p} ;
    mkV2 : Verb        -> Verb2 = \v   -> v ** {c = []} ;
    mkV2 : Verb -> Str -> Verb2 = \v,p -> v ** {c = p} ;
    } ;

  Adverb : Type = {s : Str} ;

  mkAdv : Str -> Adverb = \s -> {s = s} ;

  be_GVerb : GVerb = {
     s = table {
       PresSg1 => "am" ;
       PresPl  => "are" ;
       VF vf   => (mkVerb "be" "is").s ! vf
       } ;
     isAux = True
     } ;

  GVerb : Type = {
     s : GVForm => Str ;
     isAux : Bool
     } ;

 param
   GVForm = VF VForm | PresSg1 | PresPl ;

 oper
   verb2gverb : Verb -> GVerb = \v -> {s =
     table {
       PresSg1 => v.s ! Inf ;
       PresPl  => v.s ! Inf ;
       VF vf   => v.s ! vf
       } ;
     isAux = False
     } ;

}