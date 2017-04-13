abstract MiniGrammar = {

  cat
  
-- Common
    Adv ;    -- verb-phrase-modifying adverb        e.g. "in the house"
    Temp ;   -- temporal and aspectual features     e.g. past anterior
    Tense ;  -- tense                               e.g. present, past, future
    Pol ;    -- polarity                            e.g. positive, negative
    Ant ;    -- anteriority                         e.g. simultaneous, anterior

-- Cat
    S ;      -- declarative sentence                e.g. "she lived here"
    Cl ;     -- declarative clause, with all tenses e.g. "she looks at this"
    VP ;     -- verb phrase                         e.g. "is very warm"
    Comp ;   -- complement of copula, such as AP    e.g. "very warm"
    AP ;     -- adjectival phrase                   e.g. "very warm"
    CN ;     -- common noun (without determiner)    e.g. "red house"
    NP ;     -- noun phrase (subject or object)     e.g. "the red house"
    Pron ;   -- personal pronoun                    e.g. "she"
    Det ;    -- determiner phrase                   e.g. "those seven"
    Conj ;   -- conjunction                         e.g. "and"
    Prep ;   -- preposition, or just case           e.g. "in"
    V ;      -- one-place verb                      e.g. "sleep" 
    V2 ;     -- two-place verb                      e.g. "love"
    A ;      -- one-place adjective                 e.g. "warm"
    N ;      -- common noun                         e.g. "house"
    PN ;     -- proper name                         e.g. "Paris"

  fun

-- Noun
    DetCN    : Det -> CN -> NP ;       -- the man
    UsePN    : PN -> NP ;              -- John
    UsePron  : Pron -> NP ;            -- he
---    IndefArt : Quant ;                 -- a/an
---    DefArt   : Quant ;                 -- the
    UseN     : N -> CN ;               -- house
    AdjCN    : AP -> CN  -> CN ;       -- big house

-- Adjective
    PositA   : A  -> AP ;              -- warm

-- Adverb
    PrepNP   : Prep -> NP -> Adv ;     -- in the house

-- Verb
    UseV     : V   -> VP ;             -- sleep
    ComplV2  : V2  -> NP -> VP ;       -- love it
    UseComp  : Comp -> VP ;            -- be warm
    AdvVP    : VP -> Adv -> VP ;       -- sleep here
    CompAP   : AP  -> Comp ;           -- (be) small

-- Sentence
    PredVP   : NP -> VP -> Cl ;            -- John walks
    UseCl    : Temp -> Pol -> Cl  -> S ;   -- she had not slept


-- Conjunction
  cat
    ListS ;
  fun
    ConjS     : Conj -> ListS -> S ;       -- he walks and she runs
    BaseS     : S   -> S   -> ListS ;      -- John walks, Mary runs

-- Tense
  fun
    TTAnt  : Tense -> Ant -> Temp ; -- [tense + anteriority, e.g. past anterior]
    PPos   : Pol ;                  -- I sleep  [positive polarity]
    PNeg   : Pol ;                  -- I don't sleep [negative polarity]
    TPres  : Tense ;                -- I sleep/have slept [present]
    ASimul : Ant ;                  -- I sleep/slept [simultaneous, not compound]
    AAnter : Ant ;                  -- I have slept/had slept [anterior, compound, "perfect"]

}