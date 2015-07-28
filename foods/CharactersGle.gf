--# -coding=latin1
resource CharactersGle = {
	
	--Character classes
	oper
		vowel : pattern Str = #("a"|"e"|"i"|"o"|"u"|"�"|"�"|"�"|"�"|"�") ;
		vowelCap : pattern Str = #("A"|"E"|"I"|"O"|"U"|"�"|"�"|"�"|"�"|"�") ;
		consonant : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"t"|"v"|"w"|"x"|"z") ;
		consonantCap : pattern Str = #("B"|"C"|"D"|"F"|"G"|"H"|"J"|"K"|"L"|"M"|"N"|"P"|"Q"|"R"|"S"|"T"|"V"|"W"|"X"|"Z") ;
		broadVowel : pattern Str = #("a"|"o"|"u"|"�"|"�"|"�") ;
		slenderVowel : pattern Str = #("e"|"i"|"�"|"�") ;
	
}