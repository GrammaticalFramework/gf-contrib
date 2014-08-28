incomplete concrete ResMlt of Love = {

  flags
    coding=utf8;

  lincat
    Comment = {s : Str};
    CN = {s : Str ; g : Gender};
    NP,Pron = {s : Case => Str ; a : Agr ; isPron : Bool };
    V2 = {s : Agr => Str};

  param
    Gender = Masc | Fem ;
    Number = Sg | Pl ;
    Case = Nom | Dat | Gen ;
    Agr = P1 Number | P2 Number | P3 Number Gender ;

  oper
    mkPron : Agr -> Str -> Str -> Str -> Pron = \a,he,him,his -> lin Pron {
      s = table {
        Nom => he ;
        Dat => him ;
        Gen => his
        } ;
      a = a ;
      isPron = True ;
      } ;

    -- Tokenise a string at character level
    -- Need to write a case for each length since we are not allowed recursion in opers
    -- 12 chars is enough, right?
    L : pattern Str = #( "'" | "a" | "b" | "ċ" | "d" | "e" | "f" | "ġ" | "g" | "h" | "ħ" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "ż" | "z" );
    w = word ;
    word : Str -> Str = \s -> case s of {
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L+h@#L+i@#L+j@#L+k@#L+l@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ++ i ++ j ++ k ++ l ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L+h@#L+i@#L+j@#L+k@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ++ i ++ j ++ k ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L+h@#L+i@#L+j@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ++ i ++ j ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L+h@#L+i@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ++ i ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L+h@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L+g@#L => a ++ b ++ c ++ d ++ e ++ f ++ g ;
        a@#L+b@#L+c@#L+d@#L+e@#L+f@#L => a ++ b ++ c ++ d ++ e ++ f ;
        a@#L+b@#L+c@#L+d@#L+e@#L => a ++ b ++ c ++ d ++ e ;
        a@#L+b@#L+c@#L+d@#L => a ++ b ++ c ++ d ;
        a@#L+b@#L+c@#L => a ++ b ++ c ;
        a@#L+b@#L => a ++ b ;
        a@#L => a ;
        _ => s
      } ;
}
