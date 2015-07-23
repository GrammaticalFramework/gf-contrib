concrete WPEntitySpa of WPEntity = 
ClassSpa ** 
WPEntityI - [omd, leg_N] with
	(Syntax = SyntaxSpa),
	(Lexicon = LexiconSpa) **
open
	ParadigmsSpa,
	LexiconSpa in
{
flags coding = utf8 ;

oper
	orange_N  = mkN "naranja";
	banana_N  = mkN ("plátano" | "banana") ;
	duck_N    = mkN "pato" ;
	rabbit_N  = mkN "conejo" ;
	ball_N    = mkN "bola" ;
	card_N    = mkN "carta" ;
	die_N     = mkN "dado" ;
	marble_N  = mkN "canica" ;
	pencil_N  = mascN (mkN "lápiz") ;
	stamp_N   = mkN "sello" ;
	sticker_N = mkN "pegatina" ;
	bag_N     = mkN "bolsa" ;
	box_N     = mkN "caja" ;
	jar_N     = mkN "jarra" ;
	John_PN   = mkPN "Juan" ;
	Mary_PN   = mkPN "María" ;
	limb_N     = mkN "pata" ;
lin
	omd  = mkObj "la vieja granja" ;
 }