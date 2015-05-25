--# -path=.:present

concrete YAQLHaskell of YAQL = NumeralHaskell ** open ResHaskell, Prelude in {

lincat 
  Move,                 -- ind or [ind] or Bool
  Query,                -- ind or [ind] or Bool
  Kind,                 -- list of any type
  Term,                 -- (ind -> Bool) -> Bool ; [[ind]] as in GQ theory
  Entity,               -- ind (=individual)
  [Term],               -- [(ind -> Bool) -> Bool]
  Function,             -- ind -> ind
  Proposition,          -- Bool
  Property,             -- ind -> Bool
  [Property],           -- [ind -> Bool]
  Relation,             -- ind -> ind -> Bool
  QuestionAdverb,       --
  QuestionPhrase,       -- (ind -> Bool) -> [ind] / ind / Int
  Numeric,              -- length [ind] -> Bool
  Polarity,             -- Bool -> Bool
  Temporality           --
    = Str ;


lin
--  MQuery query = start domain query ; -- to be defined in each application
--  MWhatIs ent = start domain ent ;
--  MRelation dom range rel = 
--    start numberDomain (map (abstr x_var (parenth ("x ," ++ filter (apply rel x_var) range))) dom) ;
--    -- map (\x -> (x,filter (rr x) domain)) domain

---  MAbout ent = ent ;

----  MShowTerm t = set t ;

  MAssert prop = prop ;

  QWh qp pred = apply qp pred ;

---  QAdv qadv prop = mkQCl qadv prop ;
  QProp prop = prop ;

  QThere qp = apply qp (apply "const" "True") ;
  QAdvEntity qadv ent = apply qadv ent ;

  PPred pred term = apply (quant term) pred ;

  PKind kind = flip "elem" kind ;

  PRel1 term rel = abstr y_var (apply (quant term) (abstr x_var (apply rel x_var y_var))) ;
  PRel2 rel term = abstr x_var (apply (quant term) (abstr y_var (apply rel x_var y_var))) ;


  KProperty kind pred = 
    filter pred kind ;

  TEntity ent = mkTerm (abstr p_var (apply p_var ent)) (bracket ent) ;
  TAll kind = mkTerm (abstr p_var (apply "all" p_var kind)) kind ;
  TSome kind = mkTerm (abstr p_var (apply "any" p_var kind)) (take1 kind) ;
  TNumeric numer kind = 
    mkTerm (abstr p_var (apply (quant numer) (apply "length" (filter p_var kind)))) 
           (apply "take" (set numer) kind) ;

  BaseTerm x y = "[" ++ x ++ "," ++ y ++ "]" ;
  ConsTerm x y = infix ":" x y ;
  
  TAndTerm qs = 
    mkTerm (abstr p_var (apply "and" (map (parenth ("$" ++ p_var)) (map "fst" qs)))) 
           (apply "concat" (map "snd" qs)) ;
  TOrTerm qs  = 
    mkTerm (abstr p_var (apply "or"  (map (parenth ("$" ++ p_var)) (map "fst" qs)))) 
           (set (apply "head" qs)) ;

  TFunction f t = 
    mkTerm 
      (abstr p_var (apply t (abstr x_var (apply p_var (apply f x_var))))) -- \p -> t (\x -> p (f x))
      "[]" ;
  NNumeral num = mkTerm (apply num "==") num ;
  NAtLeast num = mkTerm (apply num "<=") num ;
  NAtMost  num = mkTerm (apply num ">=") num ;

  QPWho = abstr p_var (take1 (filter p_var domain)) ;  -- who = which in domain, returns first found
  QPWhos = abstr p_var (filter p_var domain) ;                    -- who = which in the domain
  QPWhat = abstr p_var (take1 (filter p_var domain)) ; -- what = who
  QPWhats = abstr p_var (filter p_var domain) ;                   -- whats = whos
  QPWhich kind = abstr p_var (take1 (filter p_var kind)) ;
  QPWhichs kind = abstr p_var (filter p_var kind) ;
  QPHowMany kind = abstr p_var (apply "length" (filter p_var kind)) ;

---  QAHow   = how_IAdv ;
---  QAWhen  = when_IAdv ;
---  QAWhere = where_IAdv ;
---  QAWhy   = why_IAdv ;

  TPresent = "id" ;
  TPast = "id" ;

  PPositive = "id" ;
  PNegative = abstr p_var (apply "not" p_var) ;

}
