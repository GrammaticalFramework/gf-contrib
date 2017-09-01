--# -path=.:..:../..

-- This is a first attempt at a Finnic functor: a GF grammar that would cover 
-- the similarities between Finnish, Estonian, and other related languages, such as 
-- Karelian and Votic.
-- Most of the functions are copied from existing Finnish or Estonian grammars.
-- Started by Inari Listenmaa 2017-08-30. 

incomplete concrete MiniGrammarFinnic of MiniGrammar 
  = open Prelude, CommonFinnic, ResFinnic in {

-- collected from GF/lib/src/abstract/*.gf
-- the functions marked ---s are shortcuts

  lincat
  
-- Common
    Utt = SS ;  -- sentence, question, word...         e.g. "be quiet"
    Adv = SS ;  -- adverbial phrase                    e.g. "in the house"
    Pol = SS ;  -- polarity                            e.g. positive, negative

-- Cat
    S = SS ;
    Cl = { 
      s : SType => Tense => Anteriority => Polarity => Str } ; --ClSlash will be without the SType

    -- Word order is different, but type can be shared.
    VP = ResFinnic.VP ;

    AP = ResFinnic.AP ;
    CN = Noun ;

    NP   = ResFinnic.NP ;
    Pron = Pronoun ;

    Det  = ResFinnic.Det ;

    Conj = { s1,s2 : Str ; n : Number } ;

    Prep = Compl ; 


  
  lincat
    V = Verb ;
    V2 = Verb ** {c2 : Compl} ;
    A = Adj ;
    N = Noun ;
    PN = Noun ;

  lin
-- Phrase
    -- : S  -> Utt ;
    UttS s = s ;

    -- : NP -> Utt ;
    UttNP np = { s = np.s ! NPSep } ;
{-
-- Sentence
    UsePresCl : Pol -> Cl  -> S ;       -- John does not walk ---s
    PredVP    : NP -> VP -> Cl ;        -- John walks / John does not walk

-- Verb
    UseV      : V   -> VP ;             -- sleep
    ComplV2   : V2  -> NP -> VP ;       -- love it  ---s
    UseAP     : AP  -> VP ;             -- be small ---s
    AdvVP     : VP -> Adv -> VP ;       -- sleep here
-}
-- Noun
    -- : Det -> CN -> NP ;
-- The $Number$ is subtle: "nuo autot", "nuo kolme autoa" are both plural
-- for verb agreement, but the noun form is singular in the latter.

    DetCN det cn = 
      let
        n : Number = case det.isNum of {
          True => Sg ;
          _ => det.n
          } ;
        -- ncase defined in DiffFinnic
      in {
      s = \\c => let 
                   k = ncase n c det ;
                 in
                 det.s ! k.p1 ++ cn.s ! k.p2 ++ det.ps ! cn.h ;
      a = agrP3 (case <det.isDef, det.isNum> of {
            <False,True> => Sg ;  -- kolme kytkintä on
            _ => det.n
            }) ;
      isPron = False ; isNeg = det.isNeg
      } ;

    -- : PN -> NP ;
--    UsePN pn = {} ;

    -- : Pron -> NP ;
    UsePron pron = pron ** { 
      isPron = True ; isNeg = False 
    } ;

    -- : CN -> NP ;
    MassNP cn =
      let
        n : Number = Sg ;
        ncase : Case -> NForm = \c -> NCase n c ;
      in {
        s = \\c => let k = npform2case n c in
                cn.s ! ncase k ; 
        a = agrP3 Sg ;
        isPron = False ; isNeg = False
      } ;

    a_Det = emptyDet Sg ;
    aPl_Det = emptyDet Pl ;
    the_Det = a_Det ** { isDef = True } ;
    thePl_Det = aPl_Det ** { isDef = True } ;

    -- : N -> CN ;
    UseN n = n ;

    -- : AP -> CN  -> CN ;       -- big house
    AdjCN ap cn = cn ** { 
      s = \\nf => ap.s ! Mod ! nf ++ cn.s ! nf 
    } ;

-- Adjective
   -- : A  -> AP ;              -- warm
   PositA a = a ** {
     s = \\atyp,nf => a.s ! Posit ! AN nf 
   } ;

{-
-- Adverb
    PrepNP    : Prep -> NP -> Adv ;     -- in the house

-- Conjunction
    CoordS    : Conj -> S -> S -> S ;   -- he walks and she runs ---s

-- Tense
    PPos      : Pol ;                   -- I sleep  [positive polarity]
    PNeg      : Pol ;                   -- I do not sleep [negative polarity]

-- Structural
-- To be defined in each concrete
-}

    
}