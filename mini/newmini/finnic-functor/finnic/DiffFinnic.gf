--# -path=.:..

interface DiffFinnic = open CommonFinnic, Prelude in {

---------------
-- Noun, NP, AP

param 
  -- The only difference in cases (Terminative in Estonian, Instructive in Finnish)
  -- is hardcoded into NForm instead.
  -- In addition to the one difference in cases, Finnish needs possessive forms.
  -- Estonian doesn't have a possessive clitic, it's just a separate word "oma".
  NForm ;
  AForm = AN NForm | AAdv;

oper 

  Noun : Type = {
    s : NForm => Str ; 
    h : Harmony -- Only Finnish
    } ; 

  Adj : Type = { 
    s : Degree => AForm => Str ; 
    h : Harmony ; -- Only Finnish
    i : Infl } ; -- Only Estonian

  AP : Type = { 
    s : AttrType => NForm => Str ; 
    i : Infl } ;  -- Only Estonian: Tells whether the adj inflects as modifier: e.g. "väsinud mehele" vs. "mees muutus väsinuks".

-------------
-- Determiner

oper
  ncase : Number -> NPForm -> Det -> Case * NForm ;

  Det : Type = {
    s : Case => Str ;      -- minun kolme
    sp : Case => Str ;     -- se   (substantival form)
    ps : Harmony => Str ;  -- -ni (Front for -nsä, Back for -nsa) -- Only Finnish
    n : Number ;           -- Pl   (agreement feature for verb)
    isNum : Bool ;         -- True (a numeral is present)
    isPoss : Bool ;        -- True (a possessive suffix is present) -- Only Finnish
    isDef : Bool ;         -- True (verb agrees in Pl, Nom is not Part) -- Only Finnish ???
    isNeg : Bool           -- False (only True for "mikään", "kukaan") -- How does this work for Estonian?
    } ;

----------------
-- Verbs and VPs

param 

  -- Different VForm: Quotative in Estonian, more infinitives in Finnish
  VForm ;

oper 

  Verb : Type = {
    s : VForm => Str ;
    h : Harmony
    } ; 

  VP : Type = { -- This comes from StemFin
    s   : Verb ; 
    s2  : Bool => Polarity => Agr => Str ; -- talo/talon/taloa
    adv : Polarity => Str ; -- ainakin/ainakaan -- Polarity not needed in Estonian, but otherwise, VP stuff is so much same that let's keep it ^^
    ext : Str ;
    p : Str ; -- Particle of a separable verb. Was only in Estonian, but it could make sense in Finnish (e.g. yli+ajaa).
    vptyp : {isNeg : Bool ; isPass : Bool} ;-- True if some complement is negative, and if the verb is rendered in the passive
    } ;
}