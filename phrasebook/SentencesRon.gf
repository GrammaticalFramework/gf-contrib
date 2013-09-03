
concrete SentencesRon of Sentences = NumeralRon ** SentencesI - [
  IsMass,
  IFemale, YouFamFemale, YouPolFemale, IMale, YouFamMale, YouPolMale,
  ThePlace, Nationality, CitiNat, Citizenship, ACitizen, PCitizenship, PropCit
] 
  with 
    (Syntax = SyntaxRon), 
    (Symbolic = SymbolicRon), 
    (Lexicon = LexiconRon) ** 
  open SyntaxRon, ExtraRon, (R = ResRon), (P = ParamX), (PR = ParadigmsRon) in {

oper 
  NPNationalityRon : Type = {lang : NP ; 
                             country : NP ; 
                             propObj : A; 
                             propPers : R.Gender => P.Number => Str};
  CitizenshipRon : Type = {pers : R.Gender => P.Number => Str; 
                           prop : A};


  mkNPNationalityRon : NP -> NP -> A -> Str -> Str -> Str -> Str -> NPNationalityRon = \la,co,pro, s1,s2,s3,s4 ->
        {lang = la ; 
         country = co ;
         propObj = pro ;
         propPers = mkCitiPers s1 s2 s3 s4
        } ;
 
   mkCitizenshipRon : A -> Str -> Str -> Str -> Str -> CitizenshipRon = \aobj, ap1, ap2, ap3, ap4 -> {pers = mkCitiPers ap1 ap2 ap3 ap4; prop = aobj};

   mkCitiPers : Str -> Str -> Str -> Str -> (R.Gender => P.Number => Str) = \francez, franceza, francezi, franceze ->  
table {R.Masc => table {P.Sg => francez;
                        P.Pl => francezi};
 R.Fem => table {P.Sg => franceza;
                 P.Pl => franceze}};


lincat 
   Nationality = NPNationalityRon ;
   Citizenship = CitizenshipRon ;   

lin 
      IsMass m q = mkCl (mkNP the_Det m) q ; -- le vin allemand est bon

 IFemale = {name = mkNP i8fem_Pron ; isPron = True ; poss = mkQuant i_Pron} ; 
 YouFamFemale = {name = mkNP youSg8fem_Pron ; isPron = True ; poss = mkQuant youSg_Pron} ; 
 YouPolFemale = {name = mkNP youPol8fem_Pron ; isPron = True ; poss = mkQuant youPol_Pron};
 IMale = {name = mkNP i_Pron ; isPron = True ; poss = mkQuant i_Pron} ; 
 YouFamMale = {name = mkNP youSg_Pron ; isPron = True ; poss = mkQuant youSg_Pron} ; 
 YouPolMale = {name = mkNP youPol_Pron ; isPron = True ; poss = mkQuant youPol_Pron} ;
 ThePlace kind = let name : NP = mkNP the_Quant kind.name ;
                     condAt : Bool = needIndefPlace kind.name kind.at ;
                     condTo : Bool = needIndefPlace kind.name kind.to in {
         name = name ;
         at = if_then_else Adv condAt (mkAdv kind.at (mkNP the_Art kind.name)) (mkAdv kind.at name);
         to = if_then_else Adv condTo (mkAdv kind.at (mkNP the_Art kind.name)) (mkAdv kind.to name)
       } ;
CitiNat n = {pers = n.propPers; prop = n.propObj} ;
ACitizen p n = mkCl p.name (PR.mkAdv (n.pers ! (p.name.a.g) ! (p.name.a.n))) ;
PCitizenship x =  mkPhrase (mkUtt (mkAP x.prop)) ;
PropCit p = p.prop ;


oper needIndefPlace : CN -> Prep -> Bool = \cn,prep -> 
 case <cn.isComp,prep.needIndef> of
  {<True,_> => True ;
   <False,True> => False ;
    _ => True
   };
}

