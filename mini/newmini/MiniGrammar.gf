abstract MiniGrammar = {

-- collected from GF/lib/src/abstract/*.gf
-- the functions marked ---s are shortcuts

  cat
  
-- Common
    Utt ;    -- sentence, question, word...         e.g. "be quiet"
    Adv ;    -- adverbial phrase                    e.g. "in the house"
    Pol ;    -- polarity                            e.g. positive, negative

-- Cat
    S ;      -- declarative sentence                e.g. "she lives here"
    Cl ;     -- declarative clause, with all tenses e.g. "she looks at this"
    VP ;     -- verb phrase                         e.g. "lives here"
    AP ;     -- adjectival phrase                   e.g. "very warm"
    CN ;     -- common noun (without determiner)    e.g. "red house"
    NP ;     -- noun phrase (subject or object)     e.g. "the red house"
    Pron ;   -- personal pronoun                    e.g. "she"
    Det ;    -- determiner phrase                   e.g. "those"
    Conj ;   -- conjunction                         e.g. "and"
    Prep ;   -- preposition, or just case           e.g. "in", dative
    V ;      -- one-place verb                      e.g. "sleep" 
    V2 ;     -- two-place verb                      e.g. "love"
    A ;      -- one-place adjective                 e.g. "warm"
    N ;      -- common noun                         e.g. "house"
    PN ;     -- proper name                         e.g. "Paris"

  fun
-- Phrase
    UttS      : S  -> Utt ;
    UttNP     : NP -> Utt ;

-- Sentence
    UsePresCl : Pol -> Cl  -> S ;       -- John does not walk ---s
    PredVP    : NP -> VP -> Cl ;        -- John walks / John does not walk

-- Verb
    UseV      : V   -> VP ;             -- sleep
    ComplV2   : V2  -> NP -> VP ;       -- love it  ---s
    UseAP     : AP  -> VP ;             -- be small ---s
    AdvVP     : VP -> Adv -> VP ;       -- sleep here

-- Noun
    DetCN     : Det -> CN -> NP ;       -- the man
    UsePN     : PN -> NP ;              -- John
    UsePron   : Pron -> NP ;            -- he
    MassNP    : CN -> NP ;              -- milk
    a_Det     : Det ;                   -- indefinite singular ---s
    aPl_Det   : Det ;                   -- indefinite plural   ---s
    the_Det   : Det ;                   -- definite singular   ---s
    thePl_Det : Det ;                   -- definite plural     ---s
    UseN      : N -> CN ;               -- house
    AdjCN     : AP -> CN  -> CN ;       -- big house

-- Adjective
    PositA    : A  -> AP ;              -- warm

-- Adverb
    PrepNP    : Prep -> NP -> Adv ;     -- in the house

-- Conjunction
    CoordS    : Conj -> S -> S -> S ;   -- he walks and she runs ---s

-- Tense
    PPos      : Pol ;                   -- I sleep  [positive polarity]
    PNeg      : Pol ;                   -- I do not sleep [negative polarity]

-- Structural
    and_Conj  : Conj ;
    or_Conj   : Conj ;
    
    every_Det : Det ;

    in_Prep   : Prep ;
    on_Prep   : Prep ;
    with_Prep : Prep ;

    i_Pron     : Pron ;
    youSg_Pron : Pron ;
    he_Pron    : Pron ;
    she_Pron   : Pron ;
    we_Pron    : Pron ;
    youPl_Pron : Pron ;
    they_Pron  : Pron ;
    
}