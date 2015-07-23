concrete WPEntityCat of WPEntity = 
ClassCat ** 
WPEntityI -[omd]
with
	(Syntax = SyntaxCat),
	(Lexicon = LexiconCat) **
open
	ParadigmsCat,
	LexiconCat in
{
flags coding = utf8 ;
oper
	orange_N  = mkN "taronja" "taronges" feminine ;
	banana_N  = mkN "plàtan" ;
	duck_N    = mkN "ànec" ;
	rabbit_N  = mkN "conill" ;
	ball_N    = mkN "bola" ;
	card_N    = mkN "carta" ;
	die_N     = mkN "dau" ;
	marble_N  = mkN "bala" ;
	pencil_N  = mkN "llapis" ;
	stamp_N   = mkN "segell" ;
	sticker_N = mkN "gomet" ;
	bag_N     = mkN "bossa" ;
	box_N     = mkN "capsa" ;
	jar_N     = mkN "gerro" ;
	John_PN   = mkPN "en Joan" ;
	Mary_PN   = mkPN "na Maria" ;
	limb_N     = mkN "pota" ;
lin
	omd  = mkObj "la granja vella" ;
 }