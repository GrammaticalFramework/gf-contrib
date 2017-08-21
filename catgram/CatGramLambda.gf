concrete CatGramLambda of CatGram = {

--Just ignore this file, nothing interesting so far

  lincat
    S, NP = Str ;

  lin
    Prove x y    = "(\\x y . prove' x y)" ++ x ++ y;
    Walk x       =  "(\\x . walk' x )" ++ x;
    Marcel       = "marcel'" ;
    Completeness = "completeness'" ;

}