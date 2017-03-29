resource ResEng = {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Person = Per1 | Per2 | Per3 ;

  Agreement = Agr Number Person ;

  VForm = Inf | PresSg | Past | PastPart | PresPart ;

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

  Adjective : Type = {s : Str} ;

  mkA : Str -> Adjective = \s -> {s = s} ;

  Verb : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres,past,pastp,presp : Str) -> Verb =
    \inf,pres,past,pastp,presp -> {
    s = table {
      Inf => inf ;
      PresSg => pres ;
      Past => past ;
      PastPart => pastp ;
      PresPart => presp
      }
    } ;

   regVerb : Str -> Verb = \s ->
     mkVerb s (s + "s") (s + "ed") (s + "ed") (s + "ing") ;

   smartVerb : Str -> Verb = \inf -> case inf of {
    _ + ("ay"|"ey"|"oy"|"uy") => regVerb inf ;
    x + "y" =>
      mkVerb inf (x + "ies") (x + "ied") (x + "ied") (inf + "ing") ;
    x + "e" =>
      mkVerb inf (inf + "s") (x + "ed") (x + "ed") (x + "ing") ;
    _ + ("ch"|"sh"|"s"|"o") =>
      mkVerb inf (inf + "es") (inf + "ed") (inf + "ed") (inf + "ing") ;
    _       => regVerb inf
    } ;

  mkV = overload {
   mkV : Str -> Verb = smartVerb ;
   mkV : (inf,past,pastp : Str) -> Verb =
     \inf,past,pastp -> {
       s = table {
         Past => past ;
	 PastPart => pastp ;
	 f => (smartVerb inf).s ! f
	 }
       } ;
   mkV : (inf,pres,past,pastp,presp : Str) -> Verb = mkVerb ;
   } ;

   noVerb = mkVerb "" "" "" "" "" ;
   do_Verb = mkVerb "do" "does" "did" "done" "doing" ;
   have_Verb = mkVerb "have" "has" "had" "had" "having" ;
   be_GVerb : GVerb = table {
     PresSg1 => "am" ;
     PresPl  => "are" ;
     PastPl  => "were" ;
     VF vf   => (mkVerb "be" "is" "was" "been" "being").s ! vf
     } ;

   GVerb : Type = GVForm => Str ;

 param
   GVForm = VF VForm | PresSg1 | PresPl | PastPl ;

 oper
   verb2gverb : Verb -> GVerb = \v -> table {
     PresSg1 => v.s ! Inf ;
     PresPl  => v.s ! Inf ;
     PastPl  => v.s ! Past ;
     VF vf   => v.s ! vf
     } ;

}