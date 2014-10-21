concrete TestGot of Test = GrammarGot ** open ParadigmsGot in {
  flags coding = utf8 ;

lin
  man_N = mkN "wair" "wairis" "waira" "wair"
    "wairos" "waire" " wairam" "wairans"  masculine ;

  woman_N = mkN "qino" "qinons" "qinon" "qinon"
    "qinons" "qinono" "qinom" "qinons" feminine ;

  house_N = mkN "razn" "raznis" "razna" "razn"
    "razna" "razne" "raznam" "razna" neuter ;

  tree_N = mkN "bagms" "bagmis" "bagma" "bagm"
    "bagmos" "bagme" "bagmam" "bagmans" masculine ;

  -- mikils: pure a/o-stem
  big_A = mkA "mikils" ;

  -- leitils: pure a/o-stem
  small_A = mkA "leitils" ;

  -- groneis: long ja/jo-stem; neologism, but exists in 'Bagme Bloma'!
  green_A = mkAia "groneis" ;

  -- hwairban: strong verb III
  walk_V = mkV "hwairban" "hwairb" "hwairbum" "hwairbans" ;

  -- qiman: strong verb IV
  arrive_V = mkV "qiman" "qam" "qemum" "qumans" ;

  -- frijon: weak verb II
  love_V2 = mkV2 (mkV "frijon" "frijo" "frijos" "frijoþ"
		    "frijos" "frijots" "frijom" "frijoþ" "frijond"
		    "frijoda" "frijodes" "frijoda"
		    "frijodedu" "frijodeduts"
		    "frijodedum" "frijodeduþ" "frijodedun") ;

  -- leikan: weak verb III
  -- 2nd person dual is (re)constructed
  please_V2 = mkV2 (mkV "leikan" "leika" "leikais" "leikaiþ"
		      "leikos" "leikats" "leikam" "leikaiþ" "leikand"
		      "leikaida" "leikaides" "leikaida"
		      "leikaidedu" "leikaideduts"
		      "leikaidedum" "leikaideduþ" "leikaidedun") dative ;

} ;
