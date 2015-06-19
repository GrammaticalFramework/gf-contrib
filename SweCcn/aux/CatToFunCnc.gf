concrete CatToFunCnc of CatToFunAbs = {

param
	Voice = Act | Pass ;
	Tense = Pres | Past ;
	Degree = Pos | Comp ;

lincat
	V, V2 = Voice => Str ;
	Pc, Pc2, PcP, PcPSlash = Tense => Str ;
	A = Degree => Str ;
	VV, VA, V2A, VP, Pron, N, PN, CN, Det, NP, AP, Adv, AdV, Prep, SS = Str ;

lin
	-- Constructors:

	partV v ss = \\voice => v ! voice ++ ss ;
	reflV v = \\voice => v ! voice ++ "refl_Pron" ;

	mkV2__V v = \\voice => v ! voice ;
	mkV2__V_Prep v prep = \\voice => v ! voice ++ prep ;

	mkV2__Pc pc = \\tense => pc ! tense ;

	mkVV v = v ! Act ;

	mkVA v = v ! Act ;

	mkV2A v = v ! Act ;

	mkVP__V v = v ! Act ;
	mkVP__V2_NP v2 np = v2 ! Act ++ np ;
	mkVP__VV_VP vv vp = vv ++ vp ;
	mkVP__VA_AP va ap = va ++ ap ;
	mkVP__VP_Adv vp adv = vp ++ adv ;
	mkVP__V2A_NP_AP v2a np ap = v2a ++ np ++ ap ;
	mkVP__AdV_VP adv vp = adv ++ vp ;
	passiveVP__V2 v2 = v2 ! Pass ;

	mkVP__Pc pc = \\tense => pc ! tense ;

	mkVPSlash pc2 = \\tense => pc2 ! tense ;

	mkCN__A_N a n = a ! Pos ++ n ;
	mkCN__A_CN a cn = a ! Pos ++ cn ;
	mkCN__AP_N ap n = ap ++ n ;
	mkCN__AP_CN ap cn = ap ++ cn ;

	mkNP__Pron pron = pron ;
	mkNP__PN pn = pn ;
	mkNP__Det_N det n = det ++ n ;
	mkNP__N n = n ;
	mkNP__Det_CN det cn = det ++ cn ;
	mkNP__CN cn = cn ;

	mkAP a = a ! Pos ;
	comparAP a = a ! Comp ;
	PresPartAP pcp = pcp ! Pres ;
	PastPartAP pcpslash = pcpslash ! Past ;

	mkAdv prep np = prep ++ np ;
	GerundAdv pcp = pcp ! Pres ;
	--InOrderToVP vp = vp ;

	mkAdV ss = ss ;

	-- Structural words:

	aSg_Det = "aSg_Det" ;
	aPl_Det = "aPl_Det" ;
	theSg_Det = "theSg_Det" ;
	thePl_Det = "thePl_Det" ;

	it_Pron = "it_Pron" ;

	-- Lexical units:

	_mkV___V = table { Act => "{V}" ; Pass => "{V,,pass}" } ;
	_mkV___Pc = table { Pres => "{Pc,,pres}" ; Past => "{Pc,,pret}" } ;

	_mkN_ = "{N}" ;

	_mkPN_ = "{PN}" ;

	_mkPrep_ = "{Prep}" ;

	_mkAdv_ = "{Adv}" ;

	-- Variables:

	_V___V = table { Act => "V" ; Pass => "V,,pass" } ;
	_V___Pc = table { Pres => "Pc,,pres" ; Past => "Pc,,pret" } ;

	_VP___VP = "VP" ;
	_VP___PcP = table { Pres => "PcP,,pres" ; Past => "PcP,,pret" } ;

	_Det_ = "Det" ;

	_Pron_ = "Pron" ;

	_N_ = "N" ;

	_PN_ = "PN" ;

	_CN_ = "CN" ;

	_NP_ = "NP" ;

	_A_ = table { Pos => "A" ; Comp => "A,,komp" } ;

	_AP_ = "AP" ;

	_Prep_ = "Prep" ;

	_Adv_ = "Adv" ;

	-- Literals:

	_SS_ = "{Str}" ;

	-- Operators:

	prefixV ss v = \\voice => ss ++ "+" ++ v ! voice ;
	suffixV v ss = \\voice => v ! voice ++ "-" ++ ss ;

	toStr__Prep prep = prep ;
	toStr__N n = n ;
	toStr__A a = a ! Pos ;

}
