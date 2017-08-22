concrete ZorkEng of Zork = {

flags coding = utf8 ;

lincat
	Imp, Utt, VP, V, V2, V3, NP, N, Det, CN, AP, A, Adv, Prep = Str ;

lin
	UttImp imp = imp ;
	ImpVP vp = vp ;
	AdvVP vp adv = vp ++ adv ;
	UseVP v = v ;
	ComplV2 v2 np = v2 ++ np ;
	DetCN det cn = det ++ cn ;
	MassNP cn = cn ;
	PrepNP prep np = prep ++ np ;
	UseN n = n ;
	AdjCN ap cn = ap ++ cn ;
	hit_V2 = "hit" ;
	drop_V2 = "drop" ;
	go_V2 = "" | "go" ;
	south_N = "south" ;
	troll_N = "troll" ;
	sword_N = "sword" ;
	the_Det = "the" ;
	with_Prep = "with" ;
	on_Prep = "on" ;
	dir_Prep = "" ;
}

