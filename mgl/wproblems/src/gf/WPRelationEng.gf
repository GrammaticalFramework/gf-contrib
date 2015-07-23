concrete WPRelationEng of WPRelation =
WPProblemEng **
WPRelationI with
	(Syntax = SyntaxEng) **
open
	IdiomEng,
	ParadigmsEng,
    ExtraEng,
	IrregEng in
{
oper
	thatRP : RP = that_RP ;
	exist : NP -> Cl = ExistNP ;
	own_V2 : V2 = mkV2 (have_V | mkV "own") ;
}