concrete WPRelationCat of WPRelation =
WPProblemCat **
WPRelationI - [isin, Q2isin] with
	(Syntax = SyntaxCat) **
open
	IdiomCat,
	ParadigmsCat,
    ExtraCat,
    (B = BeschCat),
	IrregCat in
{
oper
	exist : NP -> Cl = \np -> ExistNP np ;
	thatRP : RP = which_RP ;
	own_V2 : V2 = mkV2 (mkV (B.tenir_108 "")) ;
	estarVP : VP = mkVP estar_V ;
lin
	isin ob1 ob2 =
		mkS (mkCl ob1 (mkVP estarVP (min ob2))) ;
	Q2isin cl ob =
		mkQS (mkQCl (howm cl) (mkVP estarVP (min ob))) ; 
}