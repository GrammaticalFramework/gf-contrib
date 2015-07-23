incomplete concrete WPEntityI of WPEntity = 
	ClassI **
open
	Syntax,
	Lexicon in
{
oper
	mkObj : Str -> NP = \o -> mkNP (mkPN o) ;
lin
	Orange = mkCN orange_N;
	Apple  = mkCN apple_N ;
	Banana = mkCN banana_N ;
	Fruit  = mkCN fruit_N;
lin
	omd    = mkObj "Old MacDonald" ;
	Duck   = mkCN  duck_N ;
	Rabbit = mkCN rabbit_N ;
	Cow    = mkCN  cow_N ;
	Leg    = mkCN  limb_N ;
	Animal = mkCN animal_N ;

lin  -- Small things you can count
	Ball    = mkCN ball_N ;
	Card    = mkCN card_N ;
	Die     = mkCN die_N ;
	Marble  = mkCN marble_N ;
	Pencil  = mkCN pencil_N ;
	Stamp   = mkCN stamp_N ;
	Sticker = mkCN sticker_N ;
	Bag     = mkCN bag_N ;
	Box     = mkCN box_N ;
	Jar     = mkCN jar_N ;
lin
	john = mkNP John_PN ;
	mary = mkNP Mary_PN ;
 }