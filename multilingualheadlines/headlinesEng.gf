concrete headlinesEng of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WriteV, PersV = VType;
		WithV = {s : Time => Str; rc : PersNPCase}; --rc: required case
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t : Time};
		PlaceAdv = {s : Str};
	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s ! NomAcc_;
		headlineOpenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s ++ pa.s;
		headlineChg v p = p.s ! NomAcc ++ v.s;
		headlineChgPlace v p pa = p.s ! NomAcc ++ v.s ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "King";
		President = mkPersNP "Prime minister";
		LeaderSP = mkPersNP "Socialist Party Leader";
		MinisterFA = mkPersNP "Minister of Foreign Affairs";
		Judge = mkPersNP "Judge";
		Singer = mkPersNP "Singer";
		Actor = mkPersNP "Actor";	
		
		Inaugurate = mkVowelV "inaugurate"| mkConsV "open";
		Buy = {s = table {Pas => "bought"; Pres => "buys"; Fut => "to buy"}}; --previous version: will buy; 'to' is more common in headlines
		Die = {s = "dies"};
		Meet = {s = table {Pas => "met"; Pres => "meets"; Fut => "to meet"}; rc = Comit};
		Talk = {s = table {Pas => "talked"; Pres => "talks"; Fut => "to talk"}; rc = Dat};
		Support = mkConsV "support";
		Receive = mkVowelV "receive";
		Criticize = {s = table {Pas => "criticized"; Pres => "criticizes"; Fut => "might criticize"}};
		Sign = mkConsV "sign";
		Attend = mkConsV "attend";
		
		Exhibition = {s = table {NomAcc_ => "exhibition"; Dir => "to exhibition"}}; --dir not used (attend is transitive in English)
		Conference = {s = table {NomAcc_ => "conference"; Dir => "to conference"}};
		Car = {s = "car"}; --car and house are indefinite in other grammars
		House = {s = "house"};
		Agreement = {s = "agreement"};
		
		ThisMorning = {s = "this morning"; t = Pres};
		ThisEvening = {s = "this evening"; t = Fut};
		TodayBefore = {s = "today"; t = Pres};
		TodayAfter = {s = "today"; t = Fut};
		Tomorrow = {s = "tomorrow"; t = Fut};
		Yesterday = {s = "yesterday"; t = Pas};
		NextWeek = {s = "next week"; t = Fut};
		LastWeek = {s = "last week"; t = Pas};
		DayBeforeYest = {s = "two days ago"; t = Pas};
		DayAfterTom = {s = "in two days"; t = Fut};
		ThreeDaysAgo = {s = "three days ago"; t = Pas};
		InThreeDays = {s = "in three days"; t = Fut};
		AMomentAgo = {s = "a moment ago"; t = Pres};
		
		MonBef = {s = "on Monday"; t = Pas};
		TueBef = {s = "on Tuesday"; t = Pas};
		WedBef = {s = "on Wednesday"; t = Pas};
		ThuBef = {s = "on Thursday"; t = Pas};
		FriBef = {s = "on Friday"; t = Pas};
		SatBef = {s = "on Saturday"; t = Pas};
		SunBef = {s = "on Sunday"; t = Pas};
		
		MonAft = {s = "on Monday"; t = Fut};
		TueAft = {s = "on Tuesday"; t = Fut};
		WedAft = {s = "on Wednesday"; t = Fut};
		ThuAft = {s = "on Thursday"; t = Fut};
		FriAft = {s = "on Friday"; t = Fut};
		SatAft = {s = "on Saturday"; t = Fut};
		SunAft = {s = "on Sunday"; t = Fut};
		
		HiddenPas = {t = Pres}; --Usually translated as past in the other grammars
		HiddenPf = {t = Pres}; --Usually translated as present perfect or past in the other grammars (English uses present in these cases)
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "in Madrid"};
		inBarcelona = {s = "in Barcelona"};
		atHotel = {s = "at hotel"};
		inCityCenter = {s = "in the city center" | "downtown"};
		atNationalPalace = {s = "at National Palace"};
		inFrance = {s = "in France"};
		inChina = {s = "in China"};
		inUS = {s = "in the United States" | "in the US"};
		
	param
		Time = Pas | Pres | Fut;
		PersNPCase = NomAcc | Dat | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => w; Dat => "to"++w; Comit => "with"++w}}; --removed 'the' because of headline style
		VType : Type = {s : Time => Str};
		mkConsV : Str -> VType = \v -> {s = table {Pas => v+"ed"; Pres => v+"s"; Fut => "to"++v}};
		mkVowelV : Str -> VType = \v -> {s = table {Pas => v+"d"; Pres => v+"s"; Fut => "to"++v}};
}