--# -coding=latin1

-- (c) 2009 Martha Dis Brandt under LGPL

concrete FoodsIce of Foods = open Prelude in {

--flags coding=utf8;

  lincat
    Comment = SS ; 
    Quality = {s : Gender => Number => Defin => Str} ; 
    Kind = {s : Number => Str ; g : Gender} ; 
    Item = {s : Str ; g : Gender ; n : Number} ; 

  lin
    Pred item quality =  ss (item.s ++ copula item.n ++ quality.s ! item.g ! item.n ! Ind) ;
         This, That  = det Sg "�essi"   "�essi"  "�etta" ;
         These, Those = det Pl "�essir" "�essar" "�essi" ;
    Mod quality kind = { s = \\n => quality.s ! kind.g ! n ! Def ++ kind.s ! n ; g = kind.g } ;
         Wine = noun "v�n" "v�n" Neutr ;
         Cheese = noun "ostur" "ostar" Masc ; 
         Fish = noun "fiskur" "fiskar" Masc ; 
         -- the word "pizza" is more commonly used in Iceland, but "flatbaka" is the Icelandic word for it
         Pizza = noun "flatbaka" "flatb�kur" Fem ;
    Very qual = {s = \\g,n,defOrInd => "mj�g" ++ qual.s ! g ! n ! defOrInd } ;
         Fresh = regAdj "ferskur" ;
         Warm = regAdj "heitur" ;
         Boring = regAdj "lei�inlegur" ;
         -- the order of the given adj forms is: mSg fSg nSg mPl fPl nPl mSgDef f/nSgDef _PlDef
         Italian = adjective "�talskur" "�t�lsk" "�talskt" "�talskir" "�talskar" "�t�lsk" "�talski" "�talska" "�talsku" ;
         Expensive = adjective "d�r" "d�r" "d�rt" "d�rir" "d�rar" "d�r" "d�ri" "d�ra" "d�ru" ; 
         Delicious = adjective "lj�ffengur" "lj�ffeng" "lj�ffengt" "lj�ffengir" "lj�ffengar" "lj�ffeng" "lj�ffengi" "lj�ffenga" "lj�ffengu" ;

  param
    Number = Sg | Pl ;
    Gender = Masc | Fem | Neutr ;
    Defin = Ind | Def ;

  oper
    det : Number -> Str -> Str -> Str -> {s : Number => Str ; g : Gender} -> 
        {s : Str ; g : Gender ; n : Number} = 
      \n,masc,fem,neutr,cn -> {
        s = case cn.g of {Masc => masc ; Fem => fem; Neutr => neutr } ++ cn.s ! n ;
        g = cn.g ;
        n = n
      } ;

    noun : Str -> Str -> Gender -> {s : Number => Str ; g : Gender} = 
      \man,men,g -> {
        s = table {
          Sg => man ;
          Pl => men 
          } ;
        g = g
      } ;

    adjective : (x1,_,_,_,_,_,_,_,x9 : Str) -> {s : Gender => Number => Defin => Str} =
      \ferskur,fersk,ferskt,ferskir,ferskar,fersk_pl,ferski,ferska,fersku -> {
         s = \\g,n,t => case <g,n,t> of {
            < Masc, Sg, Ind > => ferskur ;
            < Masc, Pl, Ind > => ferskir ;
            < Fem, Sg, Ind > => fersk ;
            < Fem, Pl, Ind > => ferskar ;
            < Neutr, Sg, Ind > => ferskt ;
            < Neutr, Pl, Ind > => fersk_pl;
            < Masc, Sg, Def > => ferski ;
            < Fem, Sg, Def > | < Neutr, Sg, Def > => ferska ;
            < _ , Pl, Def > => fersku 
            }
          } ;

    regAdj : Str -> {s : Gender => Number => Defin => Str} = \ferskur ->
      let fersk = Predef.tk 2 ferskur
      in adjective
        ferskur fersk (fersk + "t")
        (fersk + "ir") (fersk + "ar") fersk
        (fersk + "i") (fersk + "a") (fersk + "u") ;

    copula : Number -> Str = 
      \n -> case n of {
        Sg => "er" ;
        Pl => "eru"
        } ;
}
