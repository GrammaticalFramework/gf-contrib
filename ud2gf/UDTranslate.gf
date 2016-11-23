abstract UDTranslate =
  Translate,
  Extensions [GenNP]
     ** {

flags startcat = Top ;

cat
  Top ;
  Punct ;
  Numer ;

fun
  TopUtt : Utt -> Top ;
  TopUttPunct : Utt -> Punct -> Top ;

  StringPunct : String -> Punct ;

  StringCard  : String -> Card ; ---- TODO proper numerals
  StringPN    : String -> PN ;
  PrefixPN    : PN -> PN -> PN ;

-- backup functions for unknown dependents

cat
  Backups ;
  Backup ;
  [Backup] {0} ;

fun
  MkBackups : [Backup] -> [Backup] -> Backups ; -- pre- and post-backups

  BackupAdV: AdV -> Backups -> AdV ;
  BackupAdv: Adv -> Backups -> Adv ;
  BackupAP : AP  -> Backups -> AP ;
  BackupNP : NP  -> Backups -> NP ;
  BackupVP : VP  -> Backups -> VP ;
  BackupVPS : VPS  -> Backups -> VPS ;
  BackupVPSlash : VPSlash  -> Backups -> VPSlash ;
  BackupV2V : V2V  -> Backups -> V2V ;
  BackupCl : Cl  -> Backups -> Cl ;
  BackupClSlash : ClSlash  -> Backups -> ClSlash ;
  BackupS  : S   -> Backups -> S ;
  BackupQS : QS  -> Backups -> QS ;
  BackupSC : SC  -> Backups -> SC ;
  BackupSubj : Subj -> Backups -> Subj ;
  BackupUtt: Utt -> Backups -> Utt ;
  BackupTop: Top -> Backups -> Top ;

  APBackup    : AP -> Backup ;
  AdvBackup   : Adv -> Backup ;
  DetBackup   : Det -> Backup ;
  InterjBackup : Interj -> Backup ;
  NPBackup    : NP -> Backup ;
  OrdBackup   : Ord -> Backup ;
  PNBackup    : PN -> Backup ;
  PunctBackup : Punct -> Backup ;
  SBackup     : S -> Backup ;
  ConjBackup  : Conj -> Backup ;
  SubjBackup  : Subj -> Backup ;
  SymbBackup  : Symb -> Backup ;
  UttBackup   : Utt -> Backup ;

-- extra lexicon to make it easier to connect to word-based dep trees
  all_Det : Det ;
  no_Det : Det ;
  these_Det : Det ;
  this_Det : Det ;
  that_Det : Det ;
  those_Det : Det ;
  these_NP : NP ;
  this_NP : NP ;
  that_NP : NP ;
  those_NP : NP ;
  which_Det : IDet ;

---- TODO: treat numbers with the Numeral grammar
  one_Card : Card ;
  two_Card : Card ;
  three_Card : Card ;
  four_Card : Card ;
  five_Card : Card ;
  ten_Card : Card ;


}