concrete WPRelationSpa of WPRelation =
WPProblemSpa **
WPRelationI - [isin, Q2isin] with
	(Syntax = SyntaxSpa) **
open
	IrregSpa,
	IdiomSpa,
	ParadigmsSpa in
{
oper
	thatRP : RP = which_RP ;
	own_V2 : V2 = mkV2 tener_V ;
	exist : NP -> Cl = ExistNP ;
	estarVP : VP = mkVP estar_V ;
lin
	isin ob1 ob2 =
		mkS (mkCl ob1 (mkVP estarVP (min ob2))) ;
	Q2isin cl ob =
		mkQS (mkQCl (howm cl) (mkVP estarVP (min ob))) ; 
}