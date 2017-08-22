abstract ExtMiniGrammar = {

  cat
  
-- Common
    Utt ;    -- sentence, question, word...         e.g. "be quiet"
    Interj ; -- interjection                        e.g. "alas"
    Adv ;    -- verb-phrase-modifying adverb        e.g. "in the house"
    AdV ;    -- adverb directly attached to verb    e.g. "always"
    AdA ;    -- adjective-modifying adverb          e.g. "very"
    
    IAdv ;   -- interrogative adverb                e.g. "why"
    CAdv ;   -- comparative adverb                  e.g. "more"
    Temp ;   -- temporal and aspectual features     e.g. past anterior
    Tense ;  -- tense                               e.g. present, past, future
    Pol ;    -- polarity                            e.g. positive, negative
    Ant ;    -- anteriority                         e.g. simultaneous, anterior

-- Cat
    S ;      -- declarative sentence                e.g. "she lived here"
    QS ;     -- question                            e.g. "where did she live"
    Cl ;     -- declarative clause, with all tenses e.g. "she looks at this"
    Imp ;    -- imperative                          e.g. "look at this"
    QCl ;    -- question clause, with all tenses    e.g. "why does she walk"
    ClSlash; -- clause missing NP (S/NP in GPSG)    e.g. "she looks at"
    IP ;     -- interrogative pronoun               e.g. "who"
    VP ;     -- verb phrase                         e.g. "is very warm"
    Comp ;   -- complement of copula, such as AP    e.g. "very warm"
    VPSlash; -- verb phrase missing complement      e.g. "give to John"
    AP ;     -- adjectival phrase                   e.g. "very warm"
    CN ;     -- common noun (without determiner)    e.g. "red house"
    NP ;     -- noun phrase (subject or object)     e.g. "the red house"
    Pron ;   -- personal pronoun                    e.g. "she"
    Det ;    -- determiner phrase                   e.g. "those seven"
    Quant ;  -- quantifier ('nucleus' of Det)       e.g. "this/these"
    Num ;    -- number determining element          e.g. "seven"
    Conj ;   -- conjunction                         e.g. "and"
    Subj ;   -- subjunction                         e.g. "if"
    Prep ;   -- preposition, or just case           e.g. "in"
    V ;      -- one-place verb                      e.g. "sleep" 
    V2 ;     -- two-place verb                      e.g. "love"
    VV ;     -- verb-phrase-complement verb         e.g. "want"
    VS ;     -- sentence-complement verb            e.g. "claim"
    A ;      -- one-place adjective                 e.g. "warm"
    N ;      -- common noun                         e.g. "house"
    PN ;     -- proper name                         e.g. "Paris"

  fun

-- Noun
    DetCN    : Det -> CN -> NP ;       -- the man
    UsePN    : PN -> NP ;              -- John
    UsePron  : Pron -> NP ;            -- he
    DetQuant : Quant -> Num -> Det ;   -- these
    NumSg    : Num ;                   -- [singular]
    NumPl    : Num ;                   -- [plural]
    IndefArt : Quant ;                 -- a/an
    DefArt   : Quant ;                 -- the
    MassNP   : CN -> NP ;              -- beer
    UseN     : N -> CN ;               -- house
    AdjCN    : AP -> CN  -> CN ;       -- big house

-- Adjective
    PositA   : A  -> AP ;              -- warm
    AdAP     : AdA -> AP -> AP ;       -- very warm

-- Adverb
    PrepNP   : Prep -> NP -> Adv ;     -- in the house
    SubjS    : Subj -> S -> Adv ;      -- when she sleeps

-- Verb
    UseV     : V   -> VP ;             -- sleep
    ComplVV  : VV  -> VP -> VP ;       -- want to run
    ComplVS  : VS  -> S  -> VP ;       -- say that she runs
    SlashV2a : V2        -> VPSlash ;  -- love (it)
    ComplSlash : VPSlash -> NP -> VP ; -- love it
    UseComp  : Comp -> VP ;            -- be warm
    AdvVP    : VP -> Adv -> VP ;       -- sleep here
    CompAP   : AP  -> Comp ;           -- (be) small
    CompNP   : NP  -> Comp ;           -- (be) the man
    CompAdv  : Adv -> Comp ;           -- (be) here
    CompCN   : CN  -> Comp ;           -- (be) a man/men

-- Sentence
    PredVP   : NP -> VP -> Cl ;            -- John walks
    SlashVP  : NP -> VPSlash -> ClSlash ;  -- (whom) he sees
    ImpVP    : VP -> Imp ;                 -- love yourselves
    UseCl    : Temp -> Pol -> Cl  -> S ;   -- she had not slept
    UseQCl   : Temp -> Pol -> QCl -> QS ;  -- who had not slept
    AdvS     : Adv -> S  -> S ;            -- then I will go home
    SSubjS   : S -> Subj -> S -> S ;       -- I go home if she comes

-- Question
    QuestCl     : Cl -> QCl ;            -- does John walk
    QuestVP     : IP -> VP -> QCl ;      -- who walks
    QuestSlash  : IP -> ClSlash -> QCl ; -- whom does John love
    QuestIAdv   : IAdv -> Cl -> QCl ;    -- why does John walk

-- Phrase
    UttS      : S   -> Utt ;                -- John walks
    UttQS     : QS  -> Utt ;                -- is it good
    UttImpSg  : Pol -> Imp -> Utt ;         -- (don't) love yourself
    UttImpPl  : Pol -> Imp -> Utt ;         -- (don't) love yourselves
    UttIP     : IP   -> Utt ;               -- who
    UttIAdv   : IAdv -> Utt ;               -- why
    UttNP     : NP   -> Utt ;               -- this man
    UttAdv    : Adv  -> Utt ;               -- here
    UttVP     : VP   -> Utt ;               -- to sleep
    UttCN     : CN   -> Utt ;               -- house
    UttAP     : AP   -> Utt ;               -- fine
    UttInterj : Interj -> Utt ;             -- alas

-- Conjunction
  cat
    ListS ;
    ListAdv ;
    ListNP ;
    ListAP ;
  fun
    ConjS     : Conj -> ListS -> S ;       -- he walks and she runs
    ConjAP    : Conj -> ListAP -> AP ;     -- cold and warm
    ConjNP    : Conj -> ListNP -> NP ;     -- she or we
    ConjAdv   : Conj -> ListAdv -> Adv ;   -- here or there
    BaseS     : S   -> S   -> ListS ;      -- John walks, Mary runs
    BaseAP    : AP  -> AP  -> ListAP ;     -- red, white
    BaseNP    : NP  -> NP  -> ListNP ;     -- John, Mary
    BaseAdv   : Adv -> Adv -> ListAdv ;    -- here, there

-- Tense
  fun
    TTAnt  : Tense -> Ant -> Temp ; -- [tense + anteriority, e.g. past anterior]
    PPos   : Pol ;                  -- I sleep  [positive polarity]
    PNeg   : Pol ;                  -- I don't sleep [negative polarity]
    TPres  : Tense ;                -- I sleep/have slept [present]
    TPast  : Tense ;                -- I slept [past, "imperfect"]
    ASimul : Ant ;                  -- I sleep/slept [simultaneous, not compound]
    AAnter : Ant ;                  -- I have slept/had slept [anterior, compound, "perfect"]

}