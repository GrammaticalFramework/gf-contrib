instance ParamSammieSwe of ParamSammie = open 
  SyntaxSwe,
  GrammarSwe,
  ExtraSwe,
  SymbolSwe,
  ParadigmsSwe,
  IrregSwe, 
  ConstructX,
  Prelude 
in {

oper 

  song_N = mk1N "s�ngerna" ;
  track_N = mk1N "l�tarna" ;
  album_N = mk1N "albumen" ;
  record_N = regN "platta" ;
  cd_N = regN "cd-skiva" ;
  playlist_N = regN "spellista" ;
  artist_N = mk1N "artisterna" ;
  number_N = mkN "nummer" "numret" "nummer" "numren"  ;
  rock_N = regN "rock" ;

  new_A = regA "ny" ;

  add_V3 = 
    mkV3 (partV l�gga_V "till") noPrep (mkPrep "till") ;
  remove_V3 = 
    mkV3 (partV taga_V "bort") noPrep (mkPrep "fr�n") ;
  show_V3 = dirdirV3 (regV "visa") ;

  create_V2 = dirV2 (regV "skapa") ;
  tell_V2 = dirV2 s�ga_V ;
  play_V2 = dirV2 (regV "spela") ;
  show_V2 = dirV2 (regV "visa") ;
  return_V2 = mkV2 (regV "�terv�nder") to_Prep ;
  goto_V2 = mkV2 g�_V to_Prep ;
  record_V2 = dirV2 (partV (regV "spela") "in") ;
  make_V2 = dirV2 g�ra_V ;

  stop_V = regV "stanna" ;

  back_Adv = mkAdv "tillbaka" ;

  what_IAdv = mkIAdv "vad" ;

  previous_Ord = {s = "f�reg�ende" ; isDet = False ; lock_Ord = <>} ;
  next_Ord = {s = "n�sta" ; isDet = False ; lock_Ord = <>} ;
  please_PConj = mkPConj "sn�lla" ;

  next_A = mkA "n�st" ; --- not used
  previous_A = mkA "f�reg�ende" ; --- not used
  show_V2Q = mkV2Q (mkV "visa") noPrep ;
  tell_V2Q = mkV2Q (mkV "ber�tta") noPrep ;

  mainmenu_NP = 
    mkNP the_Quant 
      (UseN (mk2N "huvudmeny" "huvudmenyer")) ;

  goback_VP = AdvVP (UseV g�_V) back_Adv ;
  shutup_VP = UseV (tiga_V) ;
  pause_VP  = UseV (regV "pausa") ;
  resume_VP = UseV (irregV "�terupptaga" "�terupptog" "�terupptagit") ;

  whatever_Utt = mkUtt ["vad som helst"] ;

  typeWithGenre x genre =
---- CompoundCN genre x ;
    AdvCN x (PrepNP with_Prep 
        (mkNP genre)) ;

  name = regPN ;

  WhatName x = mkQCl whatSg_IP x (dirV2 (mk2V "heta" "hette")) ;

  past = <pastTense,simultaneousAnt> ;

  imperative = SyntaxSwe.mkUtt ;

  previous cn = mkNP the_Art cn ; --previous_Ord cn ;
  next cn = mkNP the_Art cn ; --next_Ord cn ;
 
  what_say = UttIP whatSg_IP ;

  all_art = variants {IndefArt ; DefArt} ;

  artist_Prep = variants {by8agent_Prep ; with_Prep} ;

  this cn = variants {
    mkNP this_Quant cn ;
    mkNP the_Quant
      (AdjCN (PositA (regA "nuvarande")) cn)
    } ;
}
