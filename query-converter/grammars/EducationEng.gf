concrete EducationEng of Education = RelationalEng ** open
    SyntaxEng,
    SymbolicEng,
    ParadigmsEng,
    IrregEng,
    Prelude
  in {

lin
  TCourse = mkCN (mkN "course") ;
  TTeacher = mkCN (mkN "teacher") ;

  AName = mkCN (mkN "name") ;
  ACode = mkCN (mkN "code") ;
  ANumberStudents = numberOfCN (mkCN (mkN "student")) ;
  ANumberCredits = numberOfCN (mkCN (mkN "credit")) ;

oper
  numberOfCN : CN -> CN = \cn ->
    mkCN (mkN "number") (SyntaxEng.mkAdv possess_Prep (mkNP aPl_Det cn)) ;

}
