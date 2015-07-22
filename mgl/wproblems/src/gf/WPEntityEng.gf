concrete WPEntityEng of WPEntity = 
ClassEng ** 
WPEntityI with
	(Syntax = SyntaxEng),
	(Lexicon = LexiconEng) **
open
	ParadigmsEng,
	LexiconEng in
{
oper
	orange_N  = mkN "orange";
	banana_N  = mkN "banana" ;
	duck_N    = mkN  "duck" ;
	rabbit_N  = mkN "rabbit" ;
	ball_N    = mkN "ball" ;
	card_N    = mkN "card" ;
	die_N     = mkN "die" "dice" ;
	marble_N  = mkN "marble" ;
	pencil_N  = mkN "pencil" ;
	stamp_N   = mkN "stamp" ;
	sticker_N = mkN "sticker" ;
	bag_N     = mkN "bag" ;
	box_N     = mkN "box" ;
	jar_N     = mkN "jar" ;
	John_PN   = mkPN "John" ;
	Mary_PN   = mkPN "Mary" ;
	limb_N   = leg_N ;
 }