--# -path=.:present:prelude

concrete AnimalsSwe of Animals = QuestionsSwe **
  open LangSwe, ParadigmsSwe, IrregSwe in {

  lin
    Dog = regN "hund" ;
    Cat = mk2N "katt" "katter" ;
    Mouse = mkN "mus" "musen" "m�ss" "m�ssen" ;
    Lion = mk2N "lejon" "lejon" ;
    Zebra = regN "zebra" ;
    Chase = dirV2 (regV "jaga") ;
    Eat = dirV2 �ta_V ;
    See = dirV2 se_V ;
}
