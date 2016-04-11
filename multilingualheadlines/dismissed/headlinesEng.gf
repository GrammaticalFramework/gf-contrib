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
		
		King = mkPersNP "king";
		President = mkPersNP "prime minister";
		LeaderSP = mkPersNP "leader of the socialist party";
		MinisterFA = mkPersNP "minister of foreign affairs";
		Judge = mkPersNP "judge";
		Singer = mkPersNP "singer";
		Actor = mkPersNP "actor";	
		
		Inaugurate = mkVowelV "inaugurate"| mkConsV "open";
		Buy = {s = table {Pas => "bought"; Pf => "has bought"; Fut => "will buy"}};
		Die = {s = "has died" | "has passed away"};
		Meet = {s = table {Pas => "met"; Pf => "has met"; Fut => "will meet"}; rc = Comit};
		Talk = {s = table {Pas => "talked"; Pf => "has talked"; Fut => "will talk"}; rc = Dat};
		Support = mkConsV "support";
		Receive = mkVowelV "receive";
		Criticize = {s = table {Pas => "criticized"; Pf => "has criticized"; Fut => "might criticize"}; rc = Dat};
		Sign = mkConsV "sign";
		Attend = mkConsV "attend";
		
		Exhibition = {s = table {NomAcc_ => "the exhibition"; Dir => "to the exhibition"}};
		Conference = {s = table {NomAcc_ => "the conference"; Dir => "to the conference"}};
		Car = {s = "a car"};
		House = {s = "a house"};
		Agreement = {s = "the agreement"};
		
		ThisMorning = {s = "this morning"; t = Pf};
		ThisEvening = {s = "this evening"; t = Fut};
		TodayBefore = {s = "today"; t = Pf};
		TodayAfter = {s = "today"; t = Fut};
		Tomorrow = {s = "tomorrow"; t = Fut};
		Yesterday = {s = "yesterday"; t = Pas};
		NextWeek = {s = "next week"; t = Fut};
		LastWeek = {s = "last week"; t = Pas};
		DayBeforeYest = {s = "two days ago"; t = Pas};
		DayAfterTom = {s = "in two days"; t = Fut};
		ThreeDaysAgo = {s = "three days ago"; t = Pas};
		InThreeDays = {s = "in three days"; t = Fut};
		AMomentAgo = {s = "a moment ago"; t = Pf};
		
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
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "in Madrid"};
		inBarcelona = {s = "in Barcelona"};
		atHotel = {s = "at a hotel"};
		inCityCenter = {s = "in the city center" | "downtown"};
		atNationalPalace = {s = "at the National Palace"};
		inFrance = {s = "in France"};
		inChina = {s = "in China"};
		inUS = {s = "in the United States" | "in the US"};
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = NomAcc | Dat | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "the"++w; Dat => "to the"++w; Comit => "with the"++w}};
		VType : Type = {s : Time => Str};
		mkConsV : Str -> VType = \v -> {s = table {Pas => v+"ed"; Pf => "has"++v+"ed"; Fut => "will"++v}};
		mkVowelV : Str -> VType = \v -> {s = table {Pas => v+"d"; Pf => "has"++v+"d"; Fut => "will"++v}};
}