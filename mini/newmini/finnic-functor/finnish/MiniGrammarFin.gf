--# -path=.:../finnic:../..
concrete MiniGrammarFin of MiniGrammar = 
  MiniGrammarFinnic -
   [or_Conj, every_Det, in_Prep, on_Prep,
    with_Prep, i_Pron,
    youSg_Pron,
    he_Pron,
    she_Pron,
    we_Pron,
    youPl_Pron,
    they_Pron] with (ResFinnic = ResFin) ** {

lin
    and_Conj = { s1 = "ja" ; s2 = [] ; n = Pl } ;
{-    or_Conj = {} ;
    
    every_Det = {} ;

    in_Prep = {} ;
    on_Prep = {} ;
    with_Prep = {} ;

    i_Pron   = {} ;
    youSg_Pron  = {}  ;
    he_Pron  = {} ;
    she_Pron = {} ;
    we_Pron  = {} ;
    youPl_Pron  = {}  ;
    they_Pron   = {}  ; -}

} 