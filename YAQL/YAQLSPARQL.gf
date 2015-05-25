--# -path=.:present

concrete YAQLSPARQL of YAQL = NumeralSPARQL ** 

  open ResSPARQL, Prelude in {

lincat 
  Move,                 -- ind or [ind] or Bool
  Query,                -- ind or [ind] or Bool
  Kind,                 -- list of any type
  Term,                 -- (ind -> Bool) -> Bool
  Entity,               -- ind (=individual)
  [Entity],             -- [ind]
  Proposition,          -- Bool
  [Property],           -- [ind -> Bool]
  Relation,             -- ind -> ind -> Bool
  QuestionAdverb,       --
  QuestionPhrase,       -- (ind -> Bool) -> [ind] / ind / Int
  Numeric,              -- length [ind] -> Bool
  Polarity,             -- Bool -> Bool
  Temporality           --
    = Str ;
  Property = {s : Str ; hasSubject : Bool} ; -- ind -> Bool -- hasSubject = True means the form x p, False means p y


lin
--  MQuery query = start domain query ; -- to be defined in each application
  MWhatIs ent = ent ;
---  MAbout ent = ent ;

  MAssert prop = prop ;

  QWh qp pred = apply pred qp ;

---  QAdv qadv prop = mkQCl qadv prop ;
  QIf prop = prop ;

  QThere qp = apply "any" qp domain ;
---  QAdvEntity qadv ent = mkQCl qadv ent ;

  PPred pred term = apply pred term ;

  PRel1 term rel = {s = term ++ rel ; hasSubject = True} ;
  PRel2 rel term = {s = rel ++ term ; hasSubject = False} ;

  KProperty kind pred = 
    kind ++ pred.s ; ---- not correct

  TEntity ent = abstr p_var (apply p_var ent) ;
  TAll kind = abstr p_var (apply "all" p_var kind) ;
  TSome kind = abstr p_var (apply "any" p_var kind) ;
  TNumeric numer kind = abstr p_var (apply numer (apply "length" (apply "filter" p_var kind))) ;

  BaseEntity x y = "[" ++ x ++ "," ++ y ++ "]" ;
  ConsEntity x y = infix ":" x y ;
  
  TAndEntity xs = abstr p_var (apply "and" (apply "map" p_var xs)) ;
  TOrEntity xs  = abstr p_var (apply "or"  (apply "map" p_var xs)) ;

  NNumeral num = apply num "==" ;
  NAtLeast num = apply num "<=" ;
  NAtMost  num = apply num ">=" ;

----  QPWho    = who_IP ;
----  QPWhos   = whoPl_IP ;
----  QPWhat   = what_IP ;
  QPWhich kind = abstr p_var (apply "take" "1" (apply "filter" p_var kind)) ;
  QPWhichs kind = abstr p_var (apply "filter" p_var kind) ;
  QPHowMany kind = abstr p_var (apply "length" (apply "filter" p_var kind)) ;

---  QAHow   = how_IAdv ;
---  QAWhen  = when_IAdv ;
---  QAWhere = where_IAdv ;
---  QAWhy   = why_IAdv ;

  TPresent = "id" ;
  TPast = "id" ;

  PPositive = "id" ;
  PNegative = abstr p_var (apply "not" p_var) ;

}
