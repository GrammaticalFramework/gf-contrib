concrete WPEntitySwe of WPEntity = 
ClassSwe ** 
WPEntityI - [omd] with
	(Syntax = SyntaxSwe),
	(Lexicon = LexiconSwe) **
open
	ParadigmsSwe,
	LexiconSwe in
{
flags coding = utf8 ;
oper
	orange_N  = mkN "apelsin" "apelsiner" ;
	banana_N  = mkN "banan" "bananer" ;
	duck_N    = mkN "anka" ;
	rabbit_N  = mkN "kanin" "kaniner" ;
	ball_N    = mkN "boll" ;
	card_N    = mkN "kort" "kort" ;
	die_N     = mkN "tärning"  ;
	marble_N  = mkN "marmor" ;
	pencil_N  = mkN "penna" ;
	stamp_N   = mkN "frimärke" ; -- or mkN "stämpel"? TH
	sticker_N = mkN "klisterlapp" ;
	bag_N     = mkN "påse" "påsar" ;
	box_N     = mkN "låda" ;
	jar_N     = mkN "burk" ;
	John_PN   = mkPN "Johan" ;
	Mary_PN   = mkPN "Maria" ;
	limb_N   = leg_N ;

lin
	omd  = mkObj "gamle McDonalds bondgård" ;
 }