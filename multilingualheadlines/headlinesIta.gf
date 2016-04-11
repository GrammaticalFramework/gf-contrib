concrete headlinesIta of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WriteV, PersV = VType;
		WithV = {s : Time => Str; rc : PersNPCase}; --rc: required case
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t: Time};
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
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "re";
		President = mkPersNP "presidente";
		LeaderSP = mkPersNP "leader del partito socialista";
		MinisterFA = mkPersNP "ministro degli affari esteri";
		Judge = mkPersNP "giudice";
		Singer = mkPersNP "cantante";
		Actor = {s = table {NomAcc => "l'attore"; Comit => "con l'attore"}};	
		
		Inaugurate = mkV "inaugur";
		Buy = mkV "compr";
		Die = {s = "è morto"};
		Meet = {s = table {Pf => "ha incontrato"; Fut => "incontrerà"}; rc = NomAcc};
		Talk = {s = table {Pf => "ha parlato"; Fut => "parlerà"}; rc = Comit};
		Support = {s = table {Pf => "ha sostenuto"; Fut => "sosterrà"}};
		Receive = {s = table {Pf => "ha ricevuto"; Fut => "riceverà"}};
		Criticize = {s = table {Pf => "ha criticato"; Fut => "potrebbe criticare"}};
		Sign = mkV "firm";
		Attend = {s = table {Pf => "ha assistito"; Fut => "assisterà"}};
		
		Exhibition = {s = table {NomAcc_ => "l'esposizione"; Dir => "all'esposizione"} |
						  table {NomAcc_ => "la mostra"; Dir => "alla mostra"}};
		Conference = {s = table {NomAcc_ => "la conferenza"; Dir => "alla conferenza"}};
		Car = {s = "una macchina"};
		House = {s = "una casa"};
		Agreement = {s = "l'accordo"};
		
		ThisMorning = {s = "stamattina"; t = Pf};
		ThisEvening = {s = "stasera"; t = Fut};
		TodayBefore = {s = "oggi"; t = Pf};
		TodayAfter = {s = "oggi"; t = Fut};
		Tomorrow = {s = "domani"; t = Fut};
		Yesterday = {s = "ieri"; t = Pf};
		NextWeek = {s = "la settimana prossima"; t = Fut};
		LastWeek = {s = "la settimana scorsa"; t = Pf};
		DayBeforeYest = {s = "l'altro ieri"; t = Pf};
		DayAfterTom = {s = "dopodomani"; t = Fut};
		ThreeDaysAgo = {s = "tre giorni fa"; t = Pf};
		InThreeDays = {s = "fra tre giorni"; t = Fut};
		AMomentAgo = {s = "un attimo fa"; t = Pf};
		
		MonBef = {s = "lunedì"; t = Pf};
		TueBef = {s = "martedì"; t = Pf};
		WedBef = {s = "mercoledì"; t = Pf};
		ThuBef = {s = "giovedì"; t = Pf};
		FriBef = {s = "venerdì"; t = Pf};
		SatBef = {s = "sabato"; t = Pf};
		SunBef = {s = "domenica"; t = Pf};
		
		MonAft = {s = "lunedì"; t = Fut};
		TueAft = {s = "martedì"; t = Fut};
		WedAft = {s = "mercoledì"; t = Fut};
		ThuAft = {s = "giovedì"; t = Fut};
		FriAft = {s = "venerdì"; t = Fut};
		SatAft = {s = "sabato"; t = Fut};
		SunAft = {s = "domenica"; t = Fut};
		
		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "a Madrid"};
		inBarcelona = {s = "a Barcellona"};
		atHotel = {s = "in un albergo"};
		inCityCenter = {s = "nel centro città"};
		atNationalPalace = {s = "al Palazzo Nazionale"};
		inFrance = {s = "in Francia"};
		inChina = {s = "in Cina"};
		inUS = {s = "negli Stati Uniti"};
		
	param
		Time = Pf | Fut;
		PersNPCase = NomAcc | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "il"++w; Comit => "con il"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pf => "ha"++v+"ato"; Fut => v+"erà"}};
}