--A resource grammar module for Irish
--Michal Boleslav Měchura, http://www.lexiconista.com/
--Last updated: 11 October 2014

resource ResGle = open Prelude,Predef in {
	flags coding = utf8;

	param NCase = NNom | NGen | NDat; --case in nouns
	param PCase = PNom | PAcc | PPrep Prep; --case in pronouns
	param NPCase = NPNom Mutation | NPGen Mutation | NPAcc | NPPrep Prep ; --case in noun phrases
	param Gender = Masc | Fem;
	param Number = Sg | Pl;
	param Person = Pers1 | Pers2 | Pers3;
	param Strength = Strong | Weak; --plural strength
	
	--Tells you whether the string ends with a slender consonant:
	oper endsInSlenderConsonant : Str -> Bool = \str -> case str of {
		_ + #slenderVowel + #consonant* + ("-"|"") => True;
		_ => False
	};
	oper
		consonant : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"t"|"v"|"w"|"x"|"z" | "B"|"C"|"D"|"F"|"G"|"H"|"J"|"K"|"L"|"M"|"N"|"P"|"Q"|"R"|"S"|"T"|"V"|"W"|"X"|"Z");
		broadVowel : pattern Str = #("a"|"o"|"u"|"y"|"á"|"ó"|"ú"|"ý" | "A"|"O"|"U"|"Y"|"Á"|"Ó"|"Ú"|"Ý");
		slenderVowel : pattern Str = #("e"|"i"|"é"|"í" | "E"|"I"|"É"|"Í");
	
	--Tells you whether the string starts with a 'dentals' consonant:
	oper startsDentals : Str -> Bool = \str -> case str of {
		("d"|"D") + _ => True;
		("n"|"N") + _ => True;
		("t"|"T") + _ => True;
		("l"|"L") + _ => True;
		("s"|"S") + _ => True;
		_ => False
	};

	--Tells you whether the string ends with a 'dentals' consonant:
	oper endsDentals : Str -> Bool = \str -> case str of {
		_ + ("d"|"D") + ("h"|"H")* + ("-"|"") => True;
		_ + ("n"|"N") + ("-"|"") + ("-"|"") => True;
		_ + ("t"|"T") + ("h"|"H")* + ("-"|"") => True;
		_ + ("l"|"L") + ("-"|"") => True;
		_ + ("s"|"S") + ("h"|"H")* + ("-"|"") => True;
		_ => False
	};
	
	--Tells you whether the string begins with a vowel:
	oper startsVowel : Str -> Bool = \str -> case str of {
		("a"|"á"|"A"|"Á") + _ => True;
		("e"|"é"|"E"|"É") + _ => True;
		("i"|"í"|"I"|"Í") + _ => True;
		("o"|"ó"|"O"|"Ó") + _ => True;
		("u"|"ú"|"U"|"Ú") + _ => True;
		_ => False
	};

	--Tells you whether the string begins with F:
	oper startsF : Str -> Bool = \str -> case str of {
		("f"|"F") + _ => True;
		_ => False
	};

	
	--MUTATIONS:
	param Mutation =
		  Unmut					--unmutated
		| Len LenDT LenS		--lenition (consonants only)
		| Ecl EclDT EclS EclV	--eclipsis (consonants and vowels)
		| PrefT					--t-prefixation (vowels only)
		| PrefH;				--h-prefixation (vowels only)
	param LenDT =	--If you're leniting, how do you want to lenite D and T?
		  UnlenDT		--Leave them unlenited.
		| LenDTH;		--Lenite them as usual (= insert H after).
	param LenS =	--If you're leniting, how do you want to lenite S? (But SP, ST, SC are never lenited.)
		  UnlenS		--Leave it unlenited.
		| LenSH			--Lenite it as usual (= insert H after).
		| LenTS; 		--Lenite it by prefixing T.
	param EclDT =	--If you're eclipting, how do you want to eclipt D and T?
		  UneclDT		--Leave them uneclipted.
		| EclNDT; 		--Eclipt them as usual (= prefix N before D, D before T).
	param EclS =	--If you're eclipting, how do you want to eclipt S? (But SP, ST, SC are never eclipted.)
		  UneclS		--Leave it uneclipted.
		| EclTS;		--Eclipt it as usual (= prefix T before S).
	param EclV =	--If you're eclipting, how do you want to eclipt vowels?
		  UneclV		--Leave them uneclipted.
		| EclNV;		--Eclipt them as usual (= prefix N before).
	
	--Returns a mutation table:
	oper mutate : Str -> (Mutation => Str);
	oper mutate str = table {
		Unmut => str;
		Len lenDT lenS => lenite str lenDT lenS;
		Ecl eclDT eclS eclV => eclipt str eclDT eclS eclV;
		PrefT => prefixT str;
		PrefH => prefixH str
	};
	
	--Performs lenition on a string:
	oper lenite : Str -> LenDT -> LenS -> Str;
	--str   = the string to be lenited
	--lenDT = how how do you want to lenite D and T?
	--lenS  = how do you want to lenite S?
	oper lenite str lenDT lenS = case str of {
		("s"|"S")+("p"|"t"|"c")+_ => str; --leave "sp", "st", "sc" unmutated
		start@("s"|"S")+rest => case lenS of {UnlenS => str; LenSH => start+"h"+rest; LenTS => "t"+str};
		start@("d"|"D"|"t"|"T")+rest => case lenDT of {UnlenDT => str; LenDTH => start+"h"+rest};
		start@("p"|"P"|"b"|"B"|"m"|"M"|"f"|"F"|"c"|"C"|"g"|"G")+rest => start+"h"+rest;
		_ => str --if none of the above, pass the string through unmutated
	};
	
	--Performs eclipsis on a string:
	oper eclipt : Str -> EclDT -> EclS -> EclV -> Str;
	--str   = the string to be eclipted
	--eclDT = how do you want to eclipt D and T?
	--eclS  = how do you want to eclipt S?
	--eclV  = how do you want to eclipt vowels?
	oper eclipt str eclDT eclS eclV = case str of {
		("s"|"S")+("p"|"t"|"c")+_ => str; --leave "sp", "st", "sc" unmutated
		start@("s"|"S")+rest => case eclS of {UneclS => str; EclTS => "t"+str};
		start@("d"|"D")+rest => case eclDT of {UneclDT => str; EclNDT => "n"+str};
		start@("t"|"T")+rest => case eclDT of {UneclDT => str; EclNDT => "d"+str};
		start@("p"|"P")+rest => "b"+str;
		start@("b"|"B")+rest => "m"+str;
		start@("f"|"F")+rest => "bh"+str;
		start@("c"|"C")+rest => "g"+str;
		start@("g"|"G")+rest => "n"+str;
		start@("a"|"e"|"i"|"o"|"u"|"á"|"é"|"í"|"ó"|"ú")+rest => case eclV of {UneclV => str; EclNV => "n-"+str};
		start@("A"|"E"|"I"|"O"|"U"|"Á"|"É"|"Í"|"Ó"|"Ú")+rest => case eclV of {UneclV => str; EclNV => "n"+str};
		_ => str --if none of the above, pass the string through unmutated
	};

	--Prefixes "t-" to a string if it begins with a vowel:
	oper prefixT : Str -> Str = \str -> case str of {
		start@("a"|"e"|"i"|"o"|"u"|"á"|"é"|"í"|"ó"|"ú")+rest => "t-"+start+rest;
		start@("A"|"E"|"I"|"O"|"U"|"Á"|"É"|"Í"|"Ó"|"Ú")+rest => "t"+start+rest; --no hyphen if capital letter
		_ => str
	};
	
	--Prefixes "h" to a string if it begins with a vowel:
	oper prefixH : Str -> Str = \str -> case str of {
		start@("a"|"e"|"i"|"o"|"u"|"á"|"é"|"í"|"ó"|"ú")+rest => "h"+start+rest;
		start@("A"|"E"|"I"|"O"|"U"|"Á"|"É"|"Í"|"Ó"|"Ú")+rest => "h"+start+rest;
		_ => str
	};
	
	
	
	--PREFIX:
	oper Pref : Type = {
		s : Mutation => Str;
		startsDentals : Bool; --does it start with a 'dentals' consonant?
		endsDentals : Bool;   --does it end eith a 'dentals' consonant?
		startsVowel : Bool;	  --does it start with a vowel?
		startsF : Bool;	      --does it start with F?
	};
	
	--Build a prefix:
	oper mkPref : Str -> Pref;
	oper mkPref str = {
		s = mutate str;
		startsDentals = startsDentals str;
		endsDentals = endsDentals str;
		startsVowel = startsVowel str;
		startsF = startsF str;
	};
	
	--Some prefabricated prefixes:
	oper anPref : Pref = mkPref "an-";      --the prefix "an-" meaning 'very', 'excellent'
	oper roPref : Pref = mkPref "ró";       --the prefix "ró" meaning 'too', 'excessive'
	oper deaPref : Pref = mkPref "dea-";    --the prefix "dea-" meaning 'good'
	oper drochPref : Pref = mkPref "droch"; --the prefix "droch" meaning 'bad'
	oper gnathPref : Pref = mkPref "gnáth"; --the prefix "gnáth" meaning 'usual'



	--ADJECTIVE:
	oper Adj : Type = {
		sg : NCase => Gender => Mutation => Str;   --singular forms
		pl : NCase => Strength => Mutation => Str; --plural forms
		startsDentals : Bool; --does it start with a 'dentals' consonant?
		endsDentals : Bool;   --does it end with a 'dentals' consonant?
		startsVowel : Bool;	  --does it start with a vowel?
		startsF : Bool;	      --does it start with F?
		isPre : Bool;         --is this a prefixing adjective (like "sean")?
	};
	
	--Build an adjective:
	oper mkAdj : Str -> Str -> Str -> Str -> Bool -> Adj;
	oper mkAdj sgNom sgGenMasc sgGenFem plNom isPre = {
		sg = table {
			NNom => table {Masc => mutate sgNom; Fem => mutate sgNom};
			NGen => table {Masc => mutate sgGenMasc; Fem => mutate sgGenFem};
			NDat => table {Masc => mutate sgNom; Fem => mutate sgNom}
		};
		pl = table {
			NNom => table {Strong => mutate plNom; Weak => mutate plNom};
			NGen => table {Strong => mutate plNom; Weak => mutate sgNom};
			NDat => table {Strong => mutate plNom; Weak => mutate plNom}
		};
		startsDentals = startsDentals sgNom;
		endsDentals = endsDentals sgNom;
		startsVowel = startsVowel sgNom;
		startsF = startsF sgNom;
		isPre = isPre;
	};
	
	--Some prefabricated adjectives:
	oper morAdj : Adj = mkAdj "mór" "móir" "móire" "móra" False;       --'big'
	oper beagAdj : Adj = mkAdj "beag" "big" "bige" "beaga" False;      --'small'
	oper glasAdj : Adj = mkAdj "glas" "glais" "glaise" "glasa" False;  --'green'
	oper dubhAdj : Adj = mkAdj "dubh" "duibh" "duibhe" "dubha" False;  --'black'
	oper eascaAdj : Adj = mkAdj "éasca" "éasca" "éasca" "éasca" False; --'easy'
	oper seanAdj : Adj = mkAdj "sean" "sin" "sine" "seana" True;       --'old'
	
	
	--Add a prefix to an adjective:
	oper prefAdj : Adj -> Pref -> Adj;
	oper prefAdj adj pref = {
		sg = \\cas,gender,mutation => glue (pref.s!mutation) (adj.sg!cas!gender!adjMut) -- prefix + adjective
			where {adjMut = pickMutPref pref.endsDentals}; --pick a mutation for the adjective
		pl = \\cas,strength,mutation => glue (pref.s!mutation) (adj.pl!cas!strength!adjMut) --prefix + adjective
			where {adjMut = pickMutPref pref.endsDentals}; --pick a mutation for the adjective
		startsDentals = pref.startsDentals;
		endsDentals = adj.endsDentals;
		startsVowel = pref.startsVowel;
		startsF = pref.startsF;
		isPre = False;
	};

	
	
	--NOUN:
	oper Noun : Type = {
		s : Number => NCase => Mutation => Str;
		g : NCase => Gender;    --yes, gender is case-depedent!
		strength : Strength;    --is the plural strong or weak?
		isSlenderPlural : Bool; --true if the plural ending is a slender consonant, eg. "crainn", "fir"
		startsDentals : Bool;   --does it start with a 'dentals' consonant?
		startsVowel : Bool; 	--does it start with a vowel?
		startsF : Bool;	        --does it start with F?
		hasTail : Bool;         --does it have a tail (an adjective or a genitive NP)? 
		isDef : Bool;           --is the noun definite (such as a proper noun, or a noun that has a definite tail: "teach an fhir" etc)
		isProper : Bool;        --is it a proper name (such as a personal name: Micheál etc.)
	};
	
	--Build a noun:
	oper mkNoun : Str -> Gender -> Str -> Gender -> Str -> Str -> Str -> Noun;
	oper mkNoun sgNom sgNomGender sgGen sgGenGender sgDat plNom plGen = {
		s = table {
			Sg => table {NNom => mutate sgNom; NGen => mutate sgGen; NDat => mutate sgDat};
			Pl => table {NNom => mutate plNom; NGen => mutate plGen; NDat => mutate plNom}
		};
		g = table {NNom => sgNomGender; NGen => sgGenGender; NDat => sgNomGender};
		strength = case eqStr plGen plNom of { PTrue => Strong; _ => Weak };
		isSlenderPlural = endsInSlenderConsonant plNom;
		startsDentals = startsDentals sgNom;
		startsVowel = startsVowel sgNom;
		startsF = startsF sgNom;
		isDef = False;
		hasTail = False;
		isProper = False;
	};
	
	--Some prefabricated nouns:
	oper fearNoun : Noun = mkNoun "fear" Masc "fir" Masc "fear" "fir" "fear"; --'man'
	oper beanNoun : Noun = mkNoun "bean" Fem "mná" Fem "bean" "mná" "ban"; --'woman'
	oper teachNoun : Noun = mkNoun "teach" Masc "tí" Masc "teach" "tithe" "tithe"; --'house'
	oper crannNoun : Noun = mkNoun "crann" Masc "crainn" Masc "crann" "crainn" "crann"; --'tree'
	oper ispinNoun : Noun = mkNoun "ispín" Masc "ispín" Masc "ispín" "ispíní" "ispíní"; --'sausage'
	oper sraidNoun : Noun = mkNoun "sráid" Fem "sráide" Fem "sráid" "sráideanna" "sráideanna"; --'street'
	oper saighdiuirNoun : Noun = mkNoun "saighdiúir" Masc "saighdiúra" Masc "saighdiúir" "saighdiúirí" "saighdiúirí"; --'soldier'
	
	--Add a prefix to a noun:
	oper prefNoun : Noun -> Pref -> Noun;
	oper prefNoun n pref = {
		s = \\num,cas,mut => glue (pref.s!mut) (n.s!num!cas!nounMut) --prefix + noun
			where {nounMut = pickMutPref pref.endsDentals}; --pick a mutation for the noun
		g = n.g;
		strength = n.strength;
		isSlenderPlural = n.isSlenderPlural;
		startsDentals = pref.startsDentals;
		startsVowel = pref.startsVowel;
		startsF = pref.startsF;
		isDef = n.isDef;
		hasTail = n.hasTail;
		isProper = n.isProper;
	};

	--Add an adjective to a noun:
	oper addAdjNoun : Noun -> Adj -> Noun = \n,a -> {
		g = n.g;
		strength = n.strength;
		isSlenderPlural = n.isSlenderPlural;
		startsDentals = case a.isPre of { False => n.startsDentals; True => a.startsDentals };
		startsVowel = case a.isPre of { False => n.startsVowel; True => a.startsVowel };
		startsF = case a.isPre of { False => n.startsF; True => a.startsF };
		isDef = n.isDef;
		hasTail = case a.isPre of { False => True; True => False };
		isProper = n.isProper;
		s = case a.isPre of {
			--If this is a prefixed adjective (like "sean"):
			True => \\num,cas,mut => glue (a.sg!NNom!Masc!mut) (n.s!num!cas!nounMut) --adjective + noun
				where {nounMut = pickMutPref a.endsDentals}; --pick a mutation for the noun
			--If this is a normal post-positioned adjective:
			False => table {
				Sg => table {
					cas => table {mut => n.s!Sg!cas!mut ++ a.sg!cas!(n.g!cas)!adjMut} --noun ++ adjective
					where {adjMut : Mutation = pickMutSg cas (n.g!cas)} --pick a mutation for the adjective
				};
				Pl => table {
					cas => table {mut => n.s!Pl!cas!mut ++ a.pl!cas!n.strength!adjMut} --noun ++ adjective
					where {adjMut : Mutation = pickMutPl cas n.isSlenderPlural n.strength} --pick a mutation for the adjective
				}
			}
		};
	};
	
	--Add a noun phrase to a noun.
	--Modifies a noun with a noun phrase in the genitive (always unmutated in the singular, eg. "monarcha brící"):
	oper addNPNoun : Noun -> NP -> Noun = \n,np -> {
		g = n.g;
		strength = n.strength;
		isSlenderPlural = n.isSlenderPlural;
		startsDentals = n.startsDentals;
		startsVowel = n.startsVowel;
		startsF = n.startsF;
		isDef = case np.isDef of { True => True; False => n.isDef }; --if the NP is definite, the noun is automatically also definite
		hasTail = True;
		isProper = n.isProper;
		s = table {
			Sg => table {
				NGen => case np.isDef of {
					False => table { mut => n.s!Sg!NGen!mut ++ np.s!(NPGen Unmut) }; --"thí fir" 'of a man's house': noun in genitive, mutation table as normal ++ NP
					True =>  table { mut => n.s!Sg!NNom!(Len LenDTH LenSH) ++ np.s!(NPGen Unmut) } --"theach an fhir" 'of the man's house': noun in nominative, always lenited ++ NP
				};
				cas => table { mut => n.s!Sg!cas!mut ++ np.s!(NPGen Unmut) } --noun ++ NP
			};
			Pl => table {
				NGen => case np.isDef of {
					False => table { mut => n.s!Pl!NGen!mut ++ np.s!(NPGen npMut) } --noun in genitive, mutation table as normal ++ NP
				             where { npMut : Mutation = pickMutPl NGen n.isSlenderPlural n.strength }; --pick a mutation for the genitive NP
					True =>  table { mut => n.s!Pl!NNom!(Len LenDTH LenSH) ++ np.s!(NPGen npMut) } --noun in nominative, always lenited ++ NP
				             where { npMut : Mutation = pickMutPl NGen n.isSlenderPlural n.strength } --pick a mutation for the genitive NP
				};
				cas => table { mut => n.s!Pl!cas!mut ++ np.s!(NPGen npMut) } --noun ++ NP
				       where { npMut : Mutation = pickMutPl cas n.isSlenderPlural n.strength } --pick a mutation for the genitive NP
			}
		};
	};
	
	--Add a lenited NP to a noun.
	--Modifies a noun with a noun phrase in the genitive (lenited in the singular like an adjective, eg. "monarcha bhrící").
	--Yes, this is more or less a copy-and-paste of addNPNoun. Needs refactoring:
	oper addLenNPNoun : Noun -> NP -> Noun = \n,np -> {
		g = n.g;
		strength = n.strength;
		isSlenderPlural = n.isSlenderPlural;
		startsDentals = n.startsDentals;
		startsVowel = n.startsVowel;
		startsF = n.startsF;
		isDef = case np.isDef of { True => True; False => n.isDef }; --if the NP is definite, the noun is automatically also definite
		hasTail = True;
		isProper = n.isProper;
		s = table {
			Sg => table {
				NGen => case np.isDef of {
					False => table { mut => n.s!Sg!NGen!mut ++ np.s!(NPGen npMut) } --noun in genitive, mutation table as normal ++ NP
					         where { npMut : Mutation = pickMutSg NGen (n.g!NGen) }; --pick a mutation for the genitive NP
					True =>  table { mut => n.s!Sg!NNom!(Len LenDTH LenSH) ++ np.s!(NPGen npMut) } --noun in nominative, always lenited ++ NP
					         where { npMut : Mutation = pickMutSg NGen (n.g!NGen) } --pick a mutation for the genitive NP
				};
				cas => table { mut => n.s!Sg!cas!mut ++ np.s!(NPGen npMut) } --noun + NP
				       where { npMut : Mutation = pickMutSg cas (n.g!cas) } --pick a mutation for the genitive NP
			};
			Pl => table {
				NGen => case np.isDef of {
					False => table { mut => n.s!Pl!NGen!mut ++ np.s!(NPGen npMut) } --noun in genitive, mutation table as normal ++ NP
				             where { npMut : Mutation = pickMutPl NGen n.isSlenderPlural n.strength }; --pick a mutation for the genitive NP
					True =>  table { mut => n.s!Pl!NNom!(Len LenDTH LenSH) ++ np.s!(NPGen npMut) } --noun in nominative, always lenited ++ NP
				             where { npMut : Mutation = pickMutPl NGen n.isSlenderPlural n.strength } --pick a mutation for the genitive NP
				};
				cas => table { mut => n.s!Pl!cas!mut ++ np.s!(NPGen npMut) } --noun + NP
				       where { npMut : Mutation = pickMutPl cas n.isSlenderPlural n.strength } --pick a mutation for the genitive NP
			}
		};
	};
	
	--Picks a mutation for a modifier modifying a singular noun, depending on case and gender:
	oper pickMutSg : NCase -> Gender -> Mutation = \cas,gen -> case <cas, gen> of {
		<NGen, Masc> => Len LenDTH LenSH; --"an fhir mhóir" 'of the big man',   adjective lenited
		<NGen, Fem> => Unmut;             --"na mná móire"  'of the big woman', adjective unmutated
		<_, Masc> => Unmut;               --"an fear mór"   'the big man',      adjective unmutated
		<_, Fem> => Len LenDTH LenSH      --"an bhean mhór" 'the big woman',    adjective lenited
	};

	--Picks a mutation for a modifier modifying a plural noun, depending on case, slenderness and strength:
	oper pickMutPl : NCase -> Bool -> Strength -> Mutation = \cas,isSlenderPlural,strength -> case <cas, isSlenderPlural, strength> of {
		<NNom|NDat, True, _> => Len LenDTH LenSH; --"na fir mhóra": slender noun ending => adjective lenited
		<NGen, True, Strong> => Len LenDTH LenSH; --(can't think of an example now!)
		<_, _, _> => Unmut                        --"na bhfear mór", "na (n)daoine móra": noun ending not slender => adjective unmutated
	};
	
	--Picks a mutation for a token that's having something prefixed to it:
	oper pickMutPref : Bool -> Mutation;
	oper pickMutPref endsDentals = case endsDentals of {
		--endsDentals = does the prefix end in a 'dentals' consonant?
		True => Len UnlenDT UnlenS; --"seanduine" 'old person'
		False => Len LenDTH LenSH   --"seanfhear" 'old man'
	};

	
	
	--NOUN PHRASE:
	oper NP : Type = {
		num : Number;
		pers : Person;
		isPro : Bool; --is this NP a pronoun?
		isDef : Bool; --is this NP definite?
		s : NPCase => Str;
	};
	
	--Determiners:
	param Determiner = DetZero Number 				 --zero determiner (no article), singular or plural
						| DetArt Number Demonstrative --definite article, singular or plural, with or without a demonstrative at the end
						| DetGach;					 --"gach" 'every'
	param Demonstrative = DemZero					 --no demonstrative
						| DemSeo  					 --adds "seo" ('this') the end of the noun phrase
						| DemSin; 					 --adds "sin" ('that') the end of the noun phrase

	--Build a noun phrase from a (possibly modified) noun and a determiner:
	oper mkNounNP : Noun -> Determiner -> NP;
	oper mkNounNP noun det = {
		num = case det of {
			DetZero number => number;
			DetArt number _ => number;
			DetGach => Sg
		};
		pers = Pers3;
		isPro = False;
		isDef = case det of {
			DetZero _ => noun.isDef;
			DetArt _ _ => True;
			DetGach => True
		};
		s = case <det, noun.isDef> of {
			--No article:
			<DetZero num, _> => table {
				NPNom mut => noun.s!num!NNom!mut;
				NPGen mut => noun.s!num!NGen!mut;
				NPAcc => noun.s!num!NNom!Unmut;
				NPPrep p => prepNoun p noun num
			};
			--Definite article, noun is already definite:
			<DetArt num dem, True> => table {
				NPNom mut => noun.s!num!NNom!mut ++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"};
				NPGen mut => noun.s!num!NGen!mut ++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"};
				NPAcc => noun.s!num!NNom!Unmut ++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"};
				NPPrep p => (prepNoun p noun num) ++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"}
			};
			--Definite article, noun is not yet definite:
			<DetArt num dem, False> => table {
				(NPNom _)|NPAcc => case num of {Sg => "an"; Pl => "na"}
						++ noun.s!num!NNom!(case <num, noun.g!NNom> of {<Sg, Masc> => PrefT; <Sg, Fem> => Len UnlenDT LenTS; <Pl, _> => PrefH})
						++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"};
				NPGen _ => case <num, noun.g!NGen> of {<Sg, Masc> => "an"; <Sg, Fem> => "na"; <Pl, _> => "na"}
						++ noun.s!num!NGen!(case <num, noun.g!NGen> of {<Sg, Masc> => Len UnlenDT LenTS; <Sg, Fem> => PrefH; <Pl, _> => Ecl EclNDT UneclS EclNV})
						++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"};
				NPPrep p => (prepArtNoun p noun num) ++ case dem of {DemZero => ""; DemSeo => "seo"; DemSin => "sin"}
			};
			--"Gach" ('every'):
			<DetGach, _> => table {
				(NPNom _)|NPAcc => "gach" ++ noun.s!Sg!NNom!Unmut;
				NPGen _ => "gach" ++ noun.s!Sg!NGen!Unmut;
				NPPrep p => (prep p) ++ "gach" ++ noun.s!Sg!(prepCase p)!Unmut
			}
		}
	};
	
	--Build a noun phrase from a pronoun:
	oper mkPronounNP : Pronoun -> NP;
	oper mkPronounNP p = {
		num = p.num;
		pers = p.pers;
		isPro = True;
		isDef = True;
		s = table {
			NPNom _ => p.s!PNom;
			NPGen _ => []; --pronouns have no genitives
			NPAcc => p.s!PAcc;
			NPPrep prep => p.s!(PPrep prep)
		};
	};	
	
	
	--PRONOUNS:
	oper Pronoun : Type = {
		num : Number;
		pers : Person;
		s : PCase => Str;
	};
	
	--The pronouns of Irish:
	oper mePron : Pronoun = { --'I'
		num = Sg;
		pers = Pers1;
		s = table {
			PNom => "mé"; PAcc => "mé";
			PPrep PLe => "liom"; PPrep PAr => "orm"; PPrep PDo => "dom"; PPrep PDe => "díom"; PPrep PFaoi => "fúm";
			PPrep PO => "uaim"; PPrep PRoimh => "romham"; PPrep PTri => "tríom"; PPrep PThar => "tharam"; PPrep PAg => "agam";
			PPrep PAs => "asam"; PPrep PChuig => "chugam"; PPrep PI => "ionam"; PPrep PGo => [];
			PPrep PGan => "gan mé"; PPrep PIdirBetween | PPrep PIdirBoth => "idir mé";
			PPrep PSeachas => "seachas mé"; PPrep PMurach => "murach mé"; PPrep PTrasna => []; PPrep PMar => "mar mé";
			PPrep PUm => "umam"; PPrep PChun => "chugam"

		}
	};		
	oper tuPron : Pronoun = { --'you' singular
		num = Sg;
		pers = Pers2;
		s = table {
			PNom => "tú"; PAcc => "thú";
			PPrep PLe => "leat"; PPrep PAr => "ort"; PPrep PDo => "duit"; PPrep PDe => "díot"; PPrep PFaoi => "fút";
			PPrep PO => "uait"; PPrep PRoimh => "romhat"; PPrep PTri => "tríot"; PPrep PThar => "tharat"; PPrep PAg => "agat";
			PPrep PAs => "asat"; PPrep PChuig => "chugat"; PPrep PI => "ionat"; PPrep PGo => [];
			PPrep PGan => "gan tú"; PPrep PIdirBetween | PPrep PIdirBoth => "idir tú";
			PPrep PSeachas => "seachas tú"; PPrep PMurach => "murach tú"; PPrep PTrasna => []; PPrep PMar => "mar tú";
			PPrep PUm => "umat"; PPrep PChun => "chugat"
		}
	};
	oper sePron : Pronoun = { --'he', 'it'
		num = Sg;
		pers = Pers3;
		s = table {
			PNom => "sé"; PAcc => "é";
			PPrep PLe => "leis"; PPrep PAr => "air"; PPrep PDo => "dó"; PPrep PDe => "de"; PPrep PFaoi => "faoi";
			PPrep PO => "uaidh"; PPrep PRoimh => "roimhe"; PPrep PTri => "tríd"; PPrep PThar => "thairis"; PPrep PAg => "aige";
			PPrep PAs => "as"; PPrep PChuig => "chuige"; PPrep PI => "ann"; PPrep PGo => [];
			PPrep PGan => "gan é"; PPrep PIdirBetween | PPrep PIdirBoth => "idir é";
			PPrep PSeachas => "seachas é"; PPrep PMurach => "murach é"; PPrep PTrasna => []; PPrep PMar => "mar é";
			PPrep PUm => "uime"; PPrep PChun => "chuige"
		}
	};
	oper siPron : Pronoun = { --'she'
		num = Sg;
		pers = Pers3;
		s = table {
			PNom => "sí"; PAcc => "í";
			PPrep PLe => "léi"; PPrep PAr => "uirthi"; PPrep PDo => "di"; PPrep PDe => "di"; PPrep PFaoi => "fúithi";
			PPrep PO => "uithi"; PPrep PRoimh => "roimpi"; PPrep PTri => "tríthi"; PPrep PThar => "thairsti"; PPrep PAg => "aici";
			PPrep PAs => "aisti"; PPrep PChuig => "chuici"; PPrep PI => "inti"; PPrep PGo => [];
			PPrep PGan => "gan í"; PPrep PIdirBetween | PPrep PIdirBoth => "idir í";
			PPrep PSeachas => "seachas í"; PPrep PMurach => "murach í"; PPrep PTrasna => []; PPrep PMar => "mar í";
			PPrep PUm => "uimpi"; PPrep PChun => "chuici"
		}
	};
	oper muidPron : Pronoun = { --'we'
		num = Pl;
		pers = Pers1;
		s = table {
			PNom => "muid"; PAcc => "muid";
			PPrep PLe => "linn"; PPrep PAr => "orainn"; PPrep PDo => "dúinn"; PPrep PDe => "dínn"; PPrep PFaoi => "fúinn";
			PPrep PO => "uainn"; PPrep PRoimh => "romhainn"; PPrep PTri => "trínn"; PPrep PThar => "tharainn"; PPrep PAg => "againn";
			PPrep PAs => "asainn"; PPrep PChuig => "chugainn"; PPrep PI => "ionainn"; PPrep PGo => [];
			PPrep PGan => "gan muid"; PPrep PIdirBetween | PPrep PIdirBoth => "eadrainn";
			PPrep PSeachas => "seachas muid"; PPrep PMurach => "murach muid"; PPrep PTrasna => []; PPrep PMar => "mar muid";
			PPrep PUm => "umainn"; PPrep PChun => "chugainn"
		}
	};
	oper sinnPron : Pronoun = { --'we' (variant)
		num = Pl;
		pers = Pers1;
		s = table {
			PNom => "sinn"; PAcc => "sinn";
			PPrep PLe => "linn"; PPrep PAr => "orainn"; PPrep PDo => "dúinn"; PPrep PDe => "dínn"; PPrep PFaoi => "fúinn";
			PPrep PO => "uainn"; PPrep PRoimh => "romhainn"; PPrep PTri => "trínn"; PPrep PThar => "tharainn"; PPrep PAg => "againn";
			PPrep PAs => "asainn"; PPrep PChuig => "chugainn"; PPrep PI => "ionainn"; PPrep PGo => [];
			PPrep PGan => "gan sinn"; PPrep PIdirBetween | PPrep PIdirBoth => "eadrainn";
			PPrep PSeachas => "seachas sinn"; PPrep PMurach => "murach sinn"; PPrep PTrasna => []; PPrep PMar => "mar sinn";
			PPrep PUm => "umainn"; PPrep PChun => "chugainn"
		}
	};
	oper sibhPron : Pronoun = { --'you' plural
		num = Pl;
		pers = Pers2;
		s = table {
			PNom => "sibh"; PAcc => "sibh";
			PPrep PLe => "libh"; PPrep PAr => "oraibh"; PPrep PDo => "daoibh"; PPrep PDe => "díbh"; PPrep PFaoi => "fúibh";
			PPrep PO => "uaibh"; PPrep PRoimh => "romhaibh"; PPrep PTri => "tríbh"; PPrep PThar => "tharaibh"; PPrep PAg => "agaibh";
			PPrep PAs => "asaibh"; PPrep PChuig => "chugaibh"; PPrep PI => "ionaibh"; PPrep PGo => [];
			PPrep PGan => "gan sibh"; PPrep PIdirBetween | PPrep PIdirBoth => "eadraibh";
			PPrep PSeachas => "seachas sibh"; PPrep PMurach => "murach sibh"; PPrep PTrasna => []; PPrep PMar => "mar sibh";
			PPrep PUm => "umaibh"; PPrep PChun => "chugaibh"
		}
	};
	oper siadPron : Pronoun = { --'they'
		num = Pl;
		pers = Pers3;
		s = table {
			PNom => "siad"; PAcc => "iad";
			PPrep PLe => "leo"; PPrep PAr => "orthu"; PPrep PDo => "dóibh"; PPrep PDe => "díobh"; PPrep PFaoi => "fúthu";
			PPrep PO => "uathu"; PPrep PRoimh => "rompu"; PPrep PTri => "tríothu"; PPrep PThar => "tharstu"; PPrep PAg => "acu";
			PPrep PAs => "astu"; PPrep PChuig => "chucu"; PPrep PI => "iontu"; PPrep PGo => [];
			PPrep PGan => "gan iad"; PPrep PIdirBetween | PPrep PIdirBoth => "eatarthu";
			PPrep PSeachas => "seachas iad"; PPrep PMurach => "murach iad"; PPrep PTrasna => []; PPrep PMar => "mar iad";
			PPrep PUm => "umpu"; PPrep PChun => "chucu"
		}
	};
	
	
	--PREPOSITIONS:
	param Prep = PLe | PAr | PDo | PDe | PFaoi | PO | PRoimh | PTri | PThar | PAg | PAs | PChuig | PI | PGo | PGan | PIdirBetween | PIdirBoth
				 | PSeachas | PMurach | PTrasna | PMar | PUm | PChun ;
	
	--Returns the basic "dictionary" form of a preposition:
	oper prep : Prep -> Str = \p -> case p of {
		PLe => "le"; --'with'
		PAr => "ar"; --'on'
		PDo => "do"; --'to', 'for'
		PDe => "de";  --'off', 'off the surface of'
		PFaoi => "faoi";  --'under', 'about'
		PO => "ó";  --'from'
		PRoimh => "roimh";  --'before'
		PTri => "trí";  --'through'
		PThar => "thar";  --'over'
		PAg => "ag";  --'at'
		PAs => "as";  --'from', 'out of'
		PChuig => "chuig";  --'to', 'towards'
		PI => "i";  --'in'
		PGo => "go"; --'to', 'towards'
		PGan => "gan";  --'without'
		PIdirBetween => "idir"; --'both'
		PIdirBoth => "idir"; --'between'
		PSeachas => "seachas"; --'except'
		PMurach => "murach"; --'if it wasn't for...'
		PTrasna => "trasna"; --'across'
		PMar => "mar"; --'as'
		PUm => "um"; --'around'
		PChun => "chun" --'chun'
	};
	
	--Tells you which noun case the preposition takes (when not followed by an article):
	oper prepCase : Prep -> NCase = \p -> case p of {
		PLe|PAr|PDo|PDe|PFaoi|PO|PRoimh|PTri|PThar|PAg|PAs|PChuig|PI|PIdirBetween|PIdirBoth|PUm => NDat;
		PGo => NDat; --"go" takes dative when without article ("go hÉirinn"), but nominative when with article ("go dtí an chathair")
		PTrasna|PChun => NGen;
		PGan|PMar|PMurach|PSeachas => NNom
	};
	
	--Applies a preposition (without an article) to a noun:
	oper prepNoun : Prep -> Noun -> Number -> Str;
	oper prepNoun p n num = case p of {
		--Dative prepositions that cause lenition:
		PAr | PFaoi | PO | PRoimh | PTri | PThar | PUm => (prep p) ++ n.s!num!NDat!(Len LenDTH LenSH);
		--Dative prepositions that cause no mutation:
		PAg | PAs | PChuig => (prep p) ++ n.s!num!NDat!Unmut;
		--Dative preposition "le", causes h-prefixiation:
		PLe => "le" ++ n.s!num!NDat!PrefH;
		--The prepositions "de" and "do":
		PDo|PDe => case <n.startsVowel, n.startsF> of {
			<True, _> | <_, True> => glue "d'" (n.s!num!NDat!(Len LenDTH LenSH));
			_ => (prep p) ++ n.s!num!NDat!(Len LenDTH LenSH)
		};
		--The preposition "i":
		PI => case n.startsVowel of {
			True => "in" ++ n.s!num!NDat!Unmut; --"in Éirinn"
			False => "i" ++ n.s!num!NDat!(Ecl EclNDT UneclS UneclV) --"i dtrioblóid"
		};
		--The preposition "go":
		PGo => "go" ++ n.s!num!NDat!PrefH; --"go hifreann"
		--The preposition "gan":
		PGan => "gan" ++ n.s!num!NDat!(case n.hasTail of {
			True => Unmut; --"gan pingin rua"
			False => case n.isProper of {
				True => Unmut; --"gan Mícheál"
				False => case n.startsF of {
					True => Unmut; --"gan fadhb"
					False => Len UnlenDT UnlenS --"gan phingin"
				}
			}
		});
		--The preposition "idir" meaning 'between'
		PIdirBetween => "idir" ++ n.s!num!NDat!Unmut;
		--The preposition "idir" meaning 'both':
		PIdirBoth => "idir" ++ n.s!num!NDat!(Len LenDTH LenSH);
		--Nominative prepositions:
		PSeachas|PMurach => (prep p) ++ n.s!num!NNom!Unmut;
		PMar => (prep p) ++ n.s!num!NNom!(Len LenDTH LenSH);
		--Genitive prepositions:
		PTrasna|PChun => (prep p) ++ n.s!num!NGen!Unmut
	};
	
	--Applies a preposition + article to a noun:
	oper prepArtNoun : Prep -> Noun -> Number -> Str;
	oper prepArtNoun p n num = case p of {
		--Nominative prepositions:
		PSeachas|PMurach|PMar => (prep p)
				++ case num of {Sg => "an"; Pl => "na"}
				++ n.s!num!NNom!(case <num, n.g!NNom> of {<Sg, Masc> => PrefT; <Sg, Fem> => Len UnlenDT LenTS; <Pl, _> => PrefH});
		--Genitive prepositions:
		PTrasna|PChun => (prep p)
				++ case <num, n.g!NGen> of {<Sg, Masc> => "an"; <Sg, Fem> => "na"; <Pl, _> => "na"}
				++ n.s!num!NGen!(case <num, n.g!NGen> of {<Sg, Masc> => Len UnlenDT LenTS; <Sg, Fem> => PrefH; <Pl, _> => Ecl EclNDT UneclS EclNV});
		--Dative prepositions other than "do", "de":
		PLe|PAr|PFaoi|PO|PRoimh|PTri|PThar|PAg|PAs|PChuig|PUm => case <p, num> of {
				<PLe, Sg> => "leis an"; <PLe, Pl> => "leis na";
				<PAr, Sg> => "ar an"; <PAr, Pl> => "ar na";
				<PFaoi, Sg> => "faoin"; <PFaoi, Pl> => "faoi na";
				<PO, Sg> => "ón"; <PO, Pl> => "ó na";
				<PRoimh, Sg> => "roimh an"; <PRoimh, Pl> => "roimh na";
				<PTri, Sg> => "tríd an"; <PTri, Pl> => "trí na";
				<PThar, Sg> => "thar an"; <PThar, Pl> => "thar na";
				<PAg, Sg> => "ag an"; <PAg, Pl> => "ag na";
				<PAs, Sg> => "as an"; <PAs, Pl> => "as na";
				<PChuig, Sg> => "chuig an"; <PChuig, Pl> => "chuig na";
				<PUm, Sg> => "um an"; <PUm, Pl> => "um na";
				_ => ""
			}
			++ n.s!num!NDat!(case <num, n.g!NDat> of {
				<Sg, Masc> => Ecl UneclDT UneclS UneclV; --"ar an saighdiúir"
				<Sg, Fem>  => Ecl UneclDT EclTS UneclV; --"ar an tsráid"
				<Pl, _>    => PrefH --"ar na healaíona"
			});
		--The prepositions "do", "de":
		PDo|PDe => case <p, num> of {
				<PDo, Sg> => "don"; <PDo, Pl> => "do na"; --"don duine", "do na daoine"
				<PDe, Sg> => "den"; <PDe, Pl> => "de na"; --"den duine", "de na daoine"
				_ => ""
			}
			++ n.s!num!NDat!(case <num, n.g!NDat> of {
				<Sg, Masc> => Len UnlenDT UnlenS; --"don saighdiúir"
				<Sg, Fem> => Len UnlenDT LenTS; --"den tsráid"
				<Pl, _> => PrefH --"do na healaíona"
			});
		--The preposition "i":
		PI => case num of {
			Pl => "sna" ++ n.s!num!NDat!PrefH; --"sna healaíona"
			Sg => case <n.startsVowel, n.startsF, n.g!NDat> of {
				<True, _, _> | <_, True, _> => "san" ++ n.s!num!NDat!(Len UnlenDT UnlenS); --"san abairt"
				<_, _, Masc> => "sa" ++ n.s!num!NDat!(Len UnlenDT UnlenS); --"sa sampla"
				<_, _, Fem> => "sa" ++ n.s!num!NDat!(Len UnlenDT LenTS) --"sa tsráid"
			}
		};
		--The preposition "go":
		PGo => "go dtí"
			++ case num of {Sg => "an"; Pl => "na"}
			++ n.s!num!NNom!(case <num, n.g!NNom> of {<Sg, Masc> => PrefT; <Sg, Fem> => Len UnlenDT LenTS; <Pl, _> => PrefH});
		--The preposition "gan":
		PGan => "gan"
			++ case num of {Sg => "an"; Pl => "na"}
			++ n.s!num!NNom!(case <num, n.g!NNom> of {<Sg, Masc> => PrefT; <Sg, Fem> => Len UnlenDT LenTS; <Pl, _> => PrefH});
		--The preposition "idir":
		PIdirBetween | PIdirBoth => "idir"
			++ case num of {Sg => "an"; Pl => "na"}
			++ n.s!num!NNom!(case <num, n.g!NNom> of {<Sg, Masc> => PrefT; <Sg, Fem> => Len UnlenDT LenTS; <Pl, _> => PrefH})
	};
	
	
	--CONJUNCTIONS:
	param Conjunction = ConjAgus | ConjNo;
	
	--Returns the form of the conjunction:
	oper conj : Conjunction -> Str;
	oper conj c = case c of {
		ConjAgus => "agus";
		ConjNo => "nó"
	};
	
	--Joins two noun phrases with a conjunction, returning a new noun phrase:
	oper conjNP : Conjunction -> NP -> NP -> NP;
	oper conjNP c np1 np2 = {
		num = Pl;
		pers = case <np1.pers,np2.pers> of {
			<Pers1,_> | <_,Pers1> => Pers1;
			<Pers2,_> | <_,Pers2> => Pers2;
			_ => Pers3
		};
		isPro = case <np1.isPro,np2.isPro> of { <True,True> => True; _ => False };
		isDef = case <np1.isDef,np2.isDef> of { <True,True> => True; _ => False };
		s = table {
			NPPrep PIdirBetween => case c of {
				ConjAgus => "idir" ++ np1.s!(NPNom Unmut) ++ "agus" ++ np2.s!(NPNom Unmut); --"idir ABC agus XYZ"
				ConjNo => np1.s!(NPPrep PIdirBetween) ++ "nó" ++ np2.s!(NPPrep PIdirBetween) --"idir ABC nó idir XYZ"
			};
			NPPrep PIdirBoth => case c of {
				ConjAgus => "idir" ++ np1.s!(NPNom (Len LenDTH LenSH)) ++ "agus" ++ np2.s!(NPNom (Len UnlenDT UnlenS)); --"idir ABC agus XYZ"
				ConjNo => np1.s!(NPPrep PIdirBetween) ++ "nó" ++ np2.s!(NPPrep PIdirBetween) --"idir ABC nó idir XYZ"
			};
			cas => np1.s!cas ++ (conj c) ++ np2.s!cas
		};
	};

}
