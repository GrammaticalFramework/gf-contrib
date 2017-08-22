concrete ZorkMar of Zork = open Prelude in {

flags coding = utf8 ;

lincat
	Imp, Utt, V, V3, AP, A, Adv = Str ;
	Det = Gender => Case => Str ;
	NP = Case => Str ;
	Prep = { s : Str ; c : Case } ;
	VP = { v : Str ; n : Str } ;
	V2 = { c : Case ; s : Str } ;
	CN, N = { s: Case => Str ; g : Gender } ;

lin
	UttImp imp = imp ;
	ImpVP vp = vp.n ++ vp.v ;
	AdvVP vp adv = { n = vp.n ++ adv ; v = vp.v } ;
	UseVP v = { v = v ; n = "" } ;
	ComplV2 v2 np = { n = np ! v2.c ; v = v2.s } ;
	PrepNP prep np = np ! prep.c ++ prep.s ;
	DetCN det cn = \\c => det ! cn.g ! c ++ cn.s ! c ;
	MassNP cn = cn.s ;
	UseN n = n ;
	hit_V2 = { s = "maar" ; c = Dat } ;
	drop_V2 = { s = "tak" ; c = Nom } ;
	go_V2 = { s = "" ; c = Nom } | { s = "ja" ; c = Dat } ;
	troll_N = regN "rakshasa" Masc ;
	sword_N = regN "talwar" Neut ;
	south_N = regN "dakshin" "dakshine" Fem ;
	with_Prep = { s = "" ; c = Inst } ;
	on_Prep = { s = BIND ++ "var" ; c = Obl } ; 
	dir_Prep = { s = "" ; c = Dat } ;
	the_Det = \\g,c => "" ;

param
	Case = Nom | Dat | Inst | Obl ;
	Gender = Masc | Fem | Neut ;

oper
	Noun : Type = {s : Case => Str ; g : Gender} ;

	mkN : (_,_,_,_ : Str) -> Gender -> Noun = \pustak,pustakala,pustakani,pustaka,gen -> 
		{ s = table {
			Nom => pustak ;
			Dat => pustakala ;
			Inst => pustakani ;
			Obl => pustaka
			} ;
			g = gen ;
		} ;
	regN = overload {
		regN : Str -> Gender -> Noun = \pustak,gen -> mkN pustak (pustak + "ala") (pustak + "ani") (pustak + "a") gen ;
	regN : Str -> Str -> Gender -> Noun = \dakshin,dakshine,gen -> mkN dakshin (dakshine + "la") (dakshine + "ni") dakshine gen ;
	} ;
}

