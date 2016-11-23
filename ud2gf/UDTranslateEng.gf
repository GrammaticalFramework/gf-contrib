--# -path=.:alltenses:gflibsrc/translator:gflibsrc/chunk
-- you need a symlink gflibsrc to your GF/lib/src

concrete UDTranslateEng of UDTranslate = TranslateEng, ExtensionsEng [GenNP] ** UDTranslateFunctor - [all_Det] with
  (Syntax = SyntaxEng),
  (Symbolic = SymbolicEng)
  ** open ParadigmsEng, (M=MorphoEng) in {

lin
  StringPN s = {s = \\_ => s.s ; g = human} ;
  PrefixPN pn1 pn2 = {s = \\c => pn1.s ! c ++ pn2.s ! c ; g = pn2.g} ; --- Thomas+Mann

  all_Det = M.mkDeterminer plural "all";


}

