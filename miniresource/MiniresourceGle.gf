--A miniature resource grammar of Irish
--Michal Boleslav Měchura, http://www.lexiconista.com/
--Last updated: 11 October 2014

concrete MiniresourceGle of Miniresource = open Prelude, ResGle in {
	flags coding = utf8;

	

	--SENTENCE:
	lincat S  = {s : Str};
	
	--Build a sentence from a tense, a polarity and a clause:
	lin UseCl t p cl = { --UseCl : Tense -> Pol -> Cl -> S
		s = cl.s ! t.t ! p.b
	};
	
	--Build a new sentence by connecting two existing sentences with a conjunction:
	lin ConjS co sx sy = { --ConjS : Conj -> S  -> S  -> S
		s = sx.s ++ (ResGle.conj co) ++ sy.s
	};
	
	
	
	--TENSE:
	param TTense = TPres | TPast;
	lincat Tense = {s : Str; t : TTense};
	
	--Two prefabricated tenses:
	lin Pres = {s = ""; t = TPres};
	lin Perf = {s = ""; t = TPast};
	
	
	
	--POLARITY:
	lincat Pol = {s : Str; b : Bool};
	
	--Two prefabricated polarities:
	lin Pos = {s = ""; b = True};
	lin Neg = {s = ""; b = False};
	

	
	--CLAUSE:
	lincat Cl = {
		s : TTense => Bool => Str --tense => polarity => clause form
	};
	
	--Build a clause from a noun phrase (= the subject) and a verb phrase:
	lin PredVP np vp = { --PredVP : NP -> VP -> Cl
		s = \\tense,polarity =>
			vp.head!tense!polarity	--the verb phrase bit before the subject (= the verb)
			++ np.s!(NPNom Unmut)	--the subject, in the nominative case
			++ vp.tail				--the verb phrase bit after the subject (= the verb's object and whatever else)
	};
	
	

	--VERB PHRASE:
	lincat VP = {
		head : TTense => Bool => Str; --the bit that goes before the subject; tense => polarity => verb form
		tail : Str --the bit that goes after the subject, such as the verb's object; can be empty
	};
	
	--Build a verb phrase by elevating a verb:
	lin UseV v = { --UseV : V -> VP
		head = v.s;
		tail = ""
	};
	
	--Build a verb phrase from a two-place verb and a noun phrase (= the object):
	lin ComplV2 v2 np = { --ComplV2 : V2 -> NP -> VP
		head = v2.s;
		tail = np.s!NPAcc --the verb's object will be in the accusative case
	};
	
	--Build a verb phrase from an adjective phrase, using the verb 'to be' ("big" --> "is big"):
	lin CompAP ap = { --CompAP : AP -> VP
		head = table {
			TPres => table { True => "tá"; False => "níl" };
			TPast => table { True => "bhí"; False => "ní raibh" }
		};
		tail = ap.sg!NNom!Masc!Unmut
	};
	
	
	
	--VERB:
	lincat V = {
		s : TTense => Bool => Str --tense => polarity => verb form
	};
	
	--Some prefabricated verbs:
	lin walk_V = {
		s = table {
			TPres => table { True => "siúlann"; False => "ní shiúlann" };
			TPast => table { True => "shiúil"; False => "níor shiúil" }
		}
	};
	lin arrive_V = {
		s = table {
			TPres => table { True => "tagann"; False => "ní thagann" };
			TPast => table { True => "tháinig"; False => "níor tháinig" }
		}
	};
	
	
	
	--TWO-PLACE VERB:
	lincat V2 = {
		s : TTense => Bool => Str --tense => polarity => verb form
	};
	
	--Some prefabricated two-place verbs:
	lin love_V2 = {
		--The usual Irish equivalent of 'to love' is a periphrastic construction ('to be in love with').
		--There's a verb "gráigh" 'to love' but it is used extremely rarely.
		--So I'm using the verb "póg" 'to kiss' instead here.
		s = table {
			TPres => table { True => "pógann"; False => "ní phógann" };
			TPast => table { True => "phóg"; False => "níor phóg" }
		}
	};
	lin please_V2 = {
		--I can think of several good Irish equivalents of 'to please somebody' but they're all periphrastic constructions.
		--So I'm using the verb "sásaigh" 'to satisfy' instead here.
		s = table {
			TPres => table { True => "sásaíonn"; False => "ní shásaíonn" };
			TPast => table { True => "shásaigh"; False => "níor shásaigh" }
		}
	};


	
	--NOUN PHRASE:
	lincat NP = ResGle.NP;
	
	--Some prefabricated noun phrases:
	lin i_NP		= ResGle.mkPronounNP ResGle.mePron;
	lin youSg_NP	= ResGle.mkPronounNP ResGle.tuPron;
	lin he_NP		= ResGle.mkPronounNP ResGle.sePron;
	lin she_NP		= ResGle.mkPronounNP ResGle.siPron;
	lin we_NP		= ResGle.mkPronounNP ResGle.muidPron;
	lin youPl_NP	= ResGle.mkPronounNP ResGle.sibhPron;
	lin they_NP		= ResGle.mkPronounNP ResGle.siadPron;
	
	--Build a noun phrase from a determiner and a common noun:
	lin DetCN det cn = ResGle.mkNounNP cn det; --DetCN : Det -> CN -> NP
	
	--Build a new noun phrase by connecting two existing noun phrases with a conjunction:
	lin ConjNP co nx ny = ResGle.conjNP co nx ny; --ConjNP : Conj -> NP -> NP -> NP
	
	
	--DETERMINER:
	lincat Det = ResGle.Determiner;
	
	--Some prefabricated determiners:
    lin a_Det		= DetZero Sg;
	lin the_Det		= DetArt Sg DemZero;
	lin every_Det	= DetGach;
    lin this_Det	= DetArt Sg DemSeo;
    lin that_Det	= DetArt Sg DemSin;
	lin these_Det	= DetArt Pl DemSeo;
	lin those_Det	= DetArt Pl DemSin;
	
	
	--COMMON NOUN:
	lincat CN = ResGle.Noun;
	
	--Build a common noun by elevating a noun:
	lin UseN n = n; --UseN : N -> CN
	
	--Build a new common noun by adding an adjective phrase to an existing common noun:
	lin ModCN ap cn = ResGle.addAdjNoun cn ap; --ModCN : AP -> CN -> CN
	
	
	
	--NOUN:
	lincat N = ResGle.Noun;
	
	--Some prefabricated nouns:
	lin man_N = ResGle.fearNoun;
	lin woman_N = ResGle.beanNoun;
	lin house_N = ResGle.teachNoun;
	lin tree_N = ResGle.crannNoun;
	
	
	
	--ADJECTIVE PHRASE:
	lincat AP = ResGle.Adj;
	
	--Build an adjective phrase by elevating an adjective:
	lin UseA a = a; --UseA : A -> AP
	
	--Build a new adjective phrase by adding an ad-adjective to an existing adjective phrase:
	lin AdAP ad ap = prefAdj ap ad; --AdAP : AdA -> AP -> AP
	
	
	--ADJECTIVE:
	lincat A = ResGle.Adj;
	
	--Some prefabricated adjectives:
	lin big_A = ResGle.morAdj;
	lin small_A = ResGle.beagAdj;
	lin green_A = ResGle.glasAdj;
	
	
	
	--AD-ADJECTIVE:
	lincat AdA = ResGle.Pref;
	
	--A prefabricated ad-adjective:
	lin very_AdA = ResGle.anPref;
	
	
	
	--CONJUNCTION:
	lincat Conj = ResGle.Conjunction;
	
	--Two prefabricated conjunctions:
	lin and_Conj = ResGle.ConjAgus;
	lin or_Conj = ResGle.ConjNo;
	
}
