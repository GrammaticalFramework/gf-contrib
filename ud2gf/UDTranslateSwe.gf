--# -path=.:alltenses:gflibsrc/translator:gflibsrc/chunk
-- you need a symlink gflibsrc to your GF/lib/src

concrete UDTranslateSwe of UDTranslate = TranslateSwe, ExtensionsSwe [GenNP] ** UDTranslateFunctor - [BackupS,BackupVPS] with
  (Syntax = SyntaxSwe),
  (Symbolic = SymbolicSwe)
  ** open ParadigmsSwe in {

lin
  BackupS s b = {s = \\o => bracket b.s1 ++ s.s ! o ++ bracket b.s2} ;
  BackupVPS vps b = lin VPS (vps ** {s = \\x,y => bracket b.s1 ++ vps.s ! x ! y ++ bracket b.s2}) ;

  StringPN s = {s = \\_ => s.s ; g = utrum} ;
  PrefixPN pn1 pn2 = {s = \\c => pn1.s ! c ++ pn2.s ! c ; g = pn2.g} ; --- Thomas+Mann

}
  
