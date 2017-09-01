--# -path=.:..
resource CommonFinnic = ParamX ** open Prelude in {

-- Tense, Anteriority, Number, Person, Degree ... from ParamX


-- Noun, NP, Adjective
param
  Case = Nom | Gen | Part | Transl | Ess 
       | Iness | Elat | Illat 
       | Adess | Ablat | Allat 
       | Abess | Comit | Termin ; -- Finnish Comitative and Instructive are in NForm -- too hacky?

  Agr = Ag Number Person | AgPol ;

  -- Both Finnish and Estonian have the thing with accusative being whatever the verb wants, and partitive in negated sentence.
  -- With personal pronouns, Finnish has a special form and Estonian uses the partitive.
  NPForm = NPCase Case | NPAcc | NPSep ;  -- NPSep is NP used alone, e.g. in an Utt and as complement to copula. Equals NPCase Nom except for pro-drop  

-- $AttrType$ tells whether the adjective is modifying or predicative, 
-- e.g. "x on suurempi kuin y" vs. "y:tä suurempi luku".
  AttrType = Mod | Pred ;

oper
  agrP3 : Number -> Agr = \n -> Ag n P3 ;

  conjAgr : Agr -> Agr -> Agr = \a,b -> case <a,b> of {
    <Ag n p, Ag m q> => Ag (conjNumber n m) (conjPerson p q) ;
    <Ag n p, AgPol>  => Ag Pl (conjPerson p P2) ;
    <AgPol,  Ag n p> => Ag Pl (conjPerson p P2) ;
    _ => b 
    } ;

  npform2case : Number -> NPForm -> Case = \n,f ->
    case <<f,n> : NPForm * Number> of {
      <NPCase c,_> => c ;
      <NPAcc,Sg>   => Gen ; -- appCompl does the job
      <NPAcc,Pl>   => Nom ;
      <NPSep,_>    => Nom
    } ;



-- Clause, Sentence

param
  SType = SDecl | SQuest ;

----------------------------------------------------------------------------
-- Smaller things that are only common to one language.
-- They however appear in some other lincats, which would be useful to share 
-- TODO figure out how to handle them.

param 
  -- Only Estonian uses this, Finnish functions can just ignore?
  Infl = Regular | Participle | Invariable ;

  -- Only Finnish uses this, Estonian can just ignore?
  Harmony = Back | Front ;

} 