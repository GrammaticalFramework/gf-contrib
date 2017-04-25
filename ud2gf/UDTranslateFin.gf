--# -path=.:gflibsrc/chunk:gflibsrc/finnish/stemmed:gflibsrc/finnish:gflibsrc/api:gflibsrc/translator
-- you need a symlink gflibsrc to your GF/lib/src

concrete UDTranslateFin of UDTranslate =
  TranslateFin,
  VerbFin [UseCopula],
  ExtensionsFin [GenNP,UseQuantPN,ComplVPIVV] **
UDTranslateFunctor - [BackupQS,BackupClSlash, BackupQCl, StringCard, ExplPredSCVPS] with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Extensions = ExtensionsFin)
  ** open ParadigmsFin, (R=ResFin) in {
lin
  BackupQS s b = {s = bracket b.s1 ++ s.s ++ bracket b.s2} ;
  BackupClSlash cl b = cl ** {s = \\t,a,p => bracket b.s1 ++ cl.s ! t ! a ! p ++ bracket b.s2} ;
  BackupQCl cl b = {s = \\t,a,p => bracket b.s1 ++ cl.s ! t ! a ! p ++ bracket b.s2} ;

  StringCard s = {s = \\_,_ => s.s ; n = plural} ; ---- mkCard s ;
  StringPN s = {s = \\_ => s.s ; h = R.Back} ;
  PrefixPN pn1 pn2 = {s = \\c => pn1.s ! c ++ pn2.s ! c ; h = pn2.h} ; ----- c

  SlashVPS t p np vps = ExtensionsFin.PredVPS np (ExtensionsFin.MkVPS t p vps) ** {c2 = vps.c2} ;
  AdvVPS vps adv = vps ** {s = \\a => vps.s ! a ++ adv.s} ;

  ExplPredSCVPS sc vps = Extensions.PredVPS (mkNP (mkPN [])) (AdvVPS vps (lin Adv sc)) ; ---- pn

  UttVPS vps = lin Utt {s = vps.s ! it_NP.a} ;

}

