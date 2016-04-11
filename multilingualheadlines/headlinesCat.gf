concrete headlinesCat of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WithV, WriteV, PersV = VType;
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
		headlineChg v p = v.s ++ p.s ! NomAcc;
		headlineChgPlace v p pa = v.s ++ p.s ! NomAcc ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "rei";
		President = mkPersNP "president";
		LeaderSP = mkPersNP "líder del partit socialista";
		MinisterFA = mkPersNP "ministre d'afers exteriors";
		Judge = mkPersNP "jutge";
		Singer = mkPersNP "cantant";
		Actor = {s = table {NomAcc => "l'actor"; Comit => "amb l'actor"}};	
		
		Inaugurate = mkV "inaugur";
		Buy = mkV "compr";
		Die = {s = "ha mort"};
		Meet = {s = table {Pas => "es va reunir"; Pf => "s'ha reunit"; Fut => "es reunirà"}};
		Talk = mkV "parl";
		Support = mkV "recolz";
		Receive = {s = table {Pas => "va rebre"; Pf => "ha rebut"; Fut => "rebrà"}};
		Criticize = {s = table {Pas => "va criticar"; Pf => "ha criticat"; Fut => "podria criticar"}};
		Sign = mkV "sign";
		Attend = {s = table {Pas => "va assistir"; Pf => "ha assistit"; Fut => "assistirà"}};
		
		Exhibition = {s = table {NomAcc_ => "l'exposició"; Dir => "a l'exposició"}};
		Conference = {s = table {NomAcc_ => "la conferència"; Dir => "a la conferència"}};
		Car = {s = "un cotxe"};
		House = {s = "una casa"};
		Agreement = {s = "l'acord"};
		
		ThisMorning = {s = "aquest matí"; t = Pf};
		ThisEvening = {s = "aquesta tarda"; t = Fut};
		TodayBefore = {s = "avui"; t = Pf};
		TodayAfter = {s = "avui"; t = Fut};
		Tomorrow = {s = "demà"; t = Fut};
		Yesterday = {s = "ahir"; t = Pas};
		NextWeek = {s = "la propera setmana" | "la setmana que ve"; t = Fut};
		LastWeek = {s = "la setmana passada"; t = Pas};
		DayBeforeYest = {s = "abans-d'ahir"; t = Pas};
		DayAfterTom = {s = "demà passat"; t = Fut};
		ThreeDaysAgo = {s = "fa tres dies"; t = Pas};
		InThreeDays = {s = "dins de tres dies"; t = Fut};
		AMomentAgo = {s = "fa un moment"; t = Pf};
		
		MonBef = {s = "dilluns"; t = Pas};
		TueBef = {s = "dimarts"; t = Pas};
		WedBef = {s = "dimecres"; t = Pas};
		ThuBef = {s = "dijous"; t = Pas};
		FriBef = {s = "divendres"; t = Pas};
		SatBef = {s = "dissabte"; t = Pas};
		SunBef = {s = "diumenge"; t = Pas};
		
		MonAft = {s = "dilluns"; t = Fut};
		TueAft = {s = "dimarts"; t = Fut};
		WedAft = {s = "dimecres"; t = Fut};
		ThuAft = {s = "dijous"; t = Fut};
		FriAft = {s = "divendres"; t = Fut};
		SatAft = {s = "dissabte"; t = Fut};
		SunAft = {s = "diumenge"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "a Madrid"};
		inBarcelona = {s = "a Barcelona"};
		atHotel = {s = "a un hotel"};
		inCityCenter = {s = "al centre de la ciutat"};
		atNationalPalace = {s = "al Palau Nacional"};
		inFrance = {s = "a França"};
		inChina = {s = "a la Xina"};
		inUS = {s = "als Estats Units"};
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = NomAcc | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "el"++w; Comit => "amb el"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => "va"++v+"ar"; Pf => "ha"++v+"at"; Fut => v+"arà"}};
}