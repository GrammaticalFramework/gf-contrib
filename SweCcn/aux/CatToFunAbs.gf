abstract CatToFunAbs = {

cat
	V ; V2 ; VV ; VA ; V2A ; VP ;
	Pc ; Pc2 ; PcP ; PcPSlash ;
	Pron ; N; PN ; CN ; Det ; NP ;
	A ; AP ;
	Adv ; AdV ; Prep ; SS ;

fun
	-- Constructors:

	partV : V -> SS -> V ;
	reflV : V -> V ;

	mkV2__V : V -> V2 ;
	mkV2__V_Prep : V -> Prep -> V2 ;

	mkV2__Pc : Pc -> Pc2 ;

	mkVV : V -> VV ;

	mkVA : V -> VA ;

	mkV2A : V -> V2A ;

	mkVP__V : V -> VP ;
	mkVP__V2_NP : V2 -> NP -> VP ;
	mkVP__VV_VP : VV -> VP -> VP ;
	mkVP__VA_AP : VA -> AP -> VP ;
	mkVP__VP_Adv : VP -> Adv -> VP ;
	mkVP__V2A_NP_AP : V2A -> NP -> AP -> VP ;
	mkVP__AdV_VP : AdV -> VP -> VP ;
	passiveVP__V2 : V2 -> VP ;

	mkVP__Pc : Pc -> PcP ;

	mkVPSlash : Pc2 -> PcPSlash ;

	mkCN__A_N : A -> N -> CN ;
	mkCN__A_CN : A -> CN -> CN ;
	mkCN__AP_N : AP -> N -> CN ;
	mkCN__AP_CN : AP -> CN -> CN ;

	mkNP__Pron : Pron -> NP ;
	mkNP__PN : PN -> NP ;
	mkNP__Det_N : Det -> N -> NP ;
	mkNP__N : N -> NP ;
	mkNP__Det_CN : Det -> CN -> NP ;
	mkNP__CN : CN -> NP ;

	mkAP : A -> AP ;
	comparAP : A -> AP ;
	PresPartAP : PcP -> AP ;
	PastPartAP : PcPSlash -> AP ;

	mkAdv : Prep -> NP -> Adv ;
	GerundAdv : PcP -> Adv ;
	--InOrderToVP : VP -> Adv ;

	mkAdV : SS -> AdV ;

	-- Structural words:

	aSg_Det : Det ;
	aPl_Det : Det ;
	theSg_Det : Det ;
	thePl_Det : Det ;

	it_Pron : Pron ;

	-- Lexical units:

	_mkV___V : V ;
	_mkV___Pc : Pc ;

	_mkN_ : N ;

	_mkPN_ : PN ;

	_mkPrep_ : Prep ;

	_mkAdv_ : Adv ;

	-- Variables:

	_V___V : V ;
	_V___Pc : Pc ;

	_VP___VP : VP ;
	_VP___PcP : PcP ;

	_Det_ : Det ;

	_Pron_ : Pron ;

	_N_ : N ;

	_PN_ : PN ;

	_CN_ : CN ;

	_NP_ : NP ;

	_A_ : A ;

	_AP_ : AP ;

	_Prep_ : Prep ;

	_Adv_ : Adv ;

	-- Literals:

	_SS_ : SS ;

	-- Operators:

	prefixV : SS -> V -> V ;
	suffixV : V -> SS -> V ;

	toStr__Prep : Prep -> SS ;
	toStr__N : N -> SS ;
	toStr__A : A -> SS ;

}
