abstract YAQL = Numeral ** {

-- Yet Another Query Language

flags startcat = Move ;

cat 
  Move ;          -- question, assertion, command   -- show all historians
  Query ;         -- question                       -- who influenced Marx
  Kind ;          -- type of object                 -- political philosopher
  Term ;          -- object or quantifier           -- all historians
  Entity ;        -- individual object              -- Karl Marx
  [Term] {2} ;    -- term list                      -- Marx, Hegel, Plato
  Function ;      -- entity to entity               -- the teacher of x
  Proposition ;   -- statement of a fact            -- Hegel influenced Marx
  Property ;      -- one-place predicate            -- influence Marx
  Relation ;      -- two-place predicate            -- influence
  QuestionAdverb ;-- question adverb                -- how
  QuestionPhrase ;-- question noun phrase           -- who
  Numeric ;       -- numeric expression             -- at least five
  Polarity ;      -- positive/negative              -- who didn't influence Marx
  Temporality ;   -- tense (present, past)          -- who influences/influenced Marx

fun
  MQuery    : Query       -> Move ;                 -- does she influence him
  MWhatIs   : Entity      -> Move ;                 -- what is the square of 5
  MShowTerm : Term        -> Move ;                 -- show five historians
  MAllAbout : Term        -> Move ;                 -- show all about Marx
  MRelation : Kind -> Kind -> Relation -> Move ;    -- show all philosophers with the historians that they influenced
  MRelRev   : Kind -> Kind -> Relation -> Move ;    -- show all philosophers with the historians that influenced them
  MAssert   : Proposition -> Move ;                 -- she influences him

  MYes, MNo : Move ;                                -- answers to questions

  QWh   : QuestionPhrase -> Property -> Query ;     -- who influences him/whom does she influence
  QAdv  : QuestionAdverb -> Proposition -> Query ;  -- how does she influence him
  QProp : Proposition -> Query ;                    -- does she influence him

  QThere     : QuestionPhrase -> Query ;            -- how many philosophers are there
  QAdvEntity : QuestionAdverb -> Entity -> Query ;  -- when was the Vienna Congress

  PPred      : Property -> Term -> Proposition ;    -- she influences him
  KProperty  : Kind -> Property -> Kind ;           -- philosopher who influenced Marx

  PKind      : Kind -> Property ;                   -- is a philosopher

  PRel1      : Term -> Relation -> Property ;       -- she influences       
  PRel2      : Relation -> Term -> Property ;       -- influences him       

---  PAndProperty : [Property] -> Property ;  -- who is German and influenced Marx
---  POrProperty  : [Property] -> Property ;  -- who is German or influenced Marx

  TEntity    : Entity -> Term ;            -- Marx
  TAll       : Kind -> Term ;              -- all philosophers
  TSome      : Kind -> Term ;              -- some philosopher
  TNumeric   : Numeric -> Kind -> Term ;   -- at least five philosophers
  TAndTerm   : [Term] -> Term ;            -- Hegel and Marx 
  TOrTerm    : [Term] -> Term ;            -- Hegel or Marx

  TFunction  : Function -> Term -> Term ;  -- the teachers of all philosophers

  NNumeral   : Numeral -> Numeric ;        -- five
  NAtLeast   : Numeral -> Numeric ;        -- at least five
  NAtMost    : Numeral -> Numeric ;        -- at most five

  QPWho     : QuestionPhrase ;             -- who (is German)
  QPWhos    : QuestionPhrase ;             -- who (are German)
  QPWhat    : QuestionPhrase ;             -- what (is a philosopher)  
  QPWhats   : QuestionPhrase ;             -- what (are philosophers)  
  QPWhich   : Kind -> QuestionPhrase ;     -- which historian
  QPWhichs  : Kind -> QuestionPhrase ;     -- which historians
  QPHowMany : Kind -> QuestionPhrase ;     -- how many historians

  QAHow     : QuestionAdverb ;
  QAWhen    : QuestionAdverb ;
  QAWhere   : QuestionAdverb ;
  QAWhy     : QuestionAdverb ;

---- not yet in use

  TPresent  : Temporality ;
  TPast     : Temporality ;

  PPositive : Polarity ;
  PNegative : Polarity ;

}
