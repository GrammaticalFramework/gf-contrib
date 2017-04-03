abstract Zork = {

flags coding = utf8 ; startcat = Utt ;

cat
	Imp ; Utt ; VP ; V ; V2 ; V3 ; NP ; N ; Det ; CN ; AP ; A ; Prep ; Adv ;

fun
	UttImp : Imp -> Utt ;
	ImpVP : VP -> Imp ; 
	AdvVP : VP -> Adv -> VP ;
	UseVP : V -> VP ;
	ComplV2 : V2 -> NP -> VP ;
	ComplV3 : V3 -> NP -> NP -> VP ;
	DetCN : Det -> CN -> NP ;
	MassNP : CN -> NP ;
	PrepNP : Prep -> NP -> Adv ;
	UseN : N -> CN ;
	AdjCN : AP -> CN -> CN ;
	PositA : A -> AP ;
	hit_V2 : V2 ; 
	drop_V2 : V2 ;
	go_V2 : V2 ;
	south_N : N ;
	troll_N : N ;
	sword_N : N ;
	the_Det : Det ;
	with_Prep, on_Prep, dir_Prep : Prep ;
}

