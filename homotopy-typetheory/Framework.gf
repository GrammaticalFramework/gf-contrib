abstract Framework = Formulas ** {

-- The main unit of translation is Paragraph, which are expected to appear one per line, to permit simple processing.

flags startcat = Paragraph ;

cat
  Paragraph ;        -- definition, theorem, etc
  Definition ;       -- definition of a new concept
  Assumption ;       -- assumption in a proof                                 -- let ...
  [Assumption]{1} ;  -- list of assumptions in one sentence                   -- let ... and ...
  Conclusion ;       -- conclusion in a proof                                 -- thus P
  Prop ;             -- proposition (sentence or formula)                     -- A is contractible
  Sort ;             -- set, type, etc corresponding to a common noun
  Ind ;              -- individual, element, corresponding to a singular term
  Fun ;              -- function with individual value
  Pred ;             -- predicate: function with proposition value            -- contractible
  [Ind] ;            -- list of individual expressions                        -- 1, 2 and 3
  UnivPhrase ;       -- universal noun phrase                                 -- for all x,y : A
  ConclusionPhrase ; -- conclusion word                                       -- hence
  Label ;            -- name/number of definition, theorem, etc               -- Id-induction
  Title ;            -- title for theorem, definition, etc

fun

-- paragraphs (lines of text)

  DefinitionParagraph : Definition -> Paragraph ;                             -- we write A, if B
  PropParagraph       : ConclusionPhrase -> Prop -> Paragraph ;               -- (hence | thus | -) A is contractible
  AssumptionParagraph : [Assumption] -> Paragraph ;                           -- let ... and let ...
  ConclusionParagraph : ConclusionPhrase -> Conclusion -> Paragraph ;         -- (hence | thus | -) C
  SoThatParagraph     : ConclusionPhrase -> Conclusion -> Prop -> Paragraph ; -- (hence | thus) C so that P  --- as Conclusion would create ambiguity
  FormatParagraph     : Format -> Paragraph ;                                 -- latex formatting, e.g. \begin{document}
  TitleParagraph      : Title -> Paragraph ;                                  -- Definition:
  QEDParagraph        : Paragraph ;    -- \Box

-- definitions

  IndDefinition     : Ind  -> Ind -> Definition ;                  -- the identity mapping of A is \lambda x:A.x
  PropDefinition    : Prop -> Prop -> Definition ;                 -- P if Q
  PropExpDefinition : MathEnv -> Exp  -> Prop -> Definition ;      -- we write $P$ if Q
  ForAllDefinition  : UnivPhrase -> Definition -> Definition ;     -- for all x : A, we write P if Q
  PredDefinition    : Sort -> Var -> Pred -> Prop -> Definition ;  -- a type A is contractible if P 

-- Assumptions: parts of proof texts.

  LetAssumption    : Ind -> Ind -> Assumption ;                    -- let x be b
  LetExpAssumption : Exp -> Exp -> Assumption ;                    -- let x := b
  ForAllAssumption : UnivPhrase -> Assumption -> Assumption ;      -- for (each | all) x,y : A, let ...

-- Conclusions: parts of proof text that are not Assumptions of just Propositions.

  AsConclusion         : Prop -> Conclusion -> Conclusion ;        -- as P, we may apply R to get that Q
  ApplyLabelConclusion : Label -> [Ind] -> Prop -> Conclusion ;    -- apply R to x and y to get Q
  ForAllConclusion     : UnivPhrase -> Conclusion -> Conclusion ;  -- for x : A, by L, P 

  henceConclusionPhrase : ConclusionPhrase ;  -- hence (,) P
  thusConclusionPhrase  : ConclusionPhrase ;  -- thus (,) P
  NoConclusionPhrase    : ConclusionPhrase ;  -- P

  plainUnivPhrase   : [Var] -> Sort -> UnivPhrase ;  -- for x, y : A
  eachUnivPhrase    : [Var] -> Sort -> UnivPhrase ;  -- for each x,y : A
  allUnivPhrase     : [Var] -> Sort -> UnivPhrase ;  -- for all x,y : A
  ifUnivPhrase      : [Var] -> Sort -> UnivPhrase ;  -- if x,y : A
  if_thenUnivPhrase : [Var] -> Sort -> UnivPhrase ;  -- if x,y : A then

  ExistProp         : [Var] -> Sort        -> Prop -> Prop ;     -- there are sets A,B such that P
  ExistCalledProp   : Var   -> Sort -> Ind -> Prop -> Prop ;     -- there is a set A, called F, such that P
  ExistVarSortProp  : Var   -> Sort                -> Prop ;     -- there is a set A
  ExistSortProp     :          Sort                -> Prop ;     -- there is a set

  ForAllProp        : UnivPhrase -> Prop -> Prop ;            -- for all sets A,B, P

  IfProp            : Prop -> Prop -> Prop ;  -- if A then B

  PredProp          : Pred -> Ind -> Prop ;   -- a is P

  LabelProp         : Label -> Prop ;         -- (*)

  AppFunInd         : Fun -> [Ind] -> Ind ;   -- the f of x, y, and z
  FunInd            : Fun          -> Ind ;   -- the f
  AppFunItInd       : Fun          -> Ind ;   -- its f                               --- anaphoric: may be problematic to interpret

  TheSortInd        : Sort -> Exp -> Ind ;    -- the map $f$

  IndInLabel        : Ind -> Label -> Ind ;   -- f (constructed) in (the proof of) L --- anaphoric: may be problematic to interpret

  ExpFun            : Exp -> Fun ;                      -- $ f $
  ExpSort           : Exp -> Sort ;                     -- $ A $
  ExpProp           : MathEnv -> Exp -> Prop ;          -- $ x = a $
  LabelledExpProp   : MathEnv -> Label -> Exp -> Prop ; -- \[ (*) x = a \]

  AliasInd          : Ind -> Ind -> Ind ;   -- its fiber, {x : A | fx = y},

  StarLabel : Label ;   -- (*)
  the_lemma_Label : Label ; -- the lemma

-- titles
  DefinitionTitle : Title ;
  TheoremTitle : Title ;
  LemmaTitle : Title ;
  ProofTitle : Title ;
  CorollaryTitle : Title ;

}