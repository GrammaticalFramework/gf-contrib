concrete headlinesFre of headlines = {
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
		headlineChg v p = p.s ! NomAcc ++ v.s ;
		headlineChgPlace v p pa = p.s ! NomAcc ++ v.s ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "roi";
		President = mkPersNP "président";
		LeaderSP = mkPersNP "leader du parti socialiste";
		MinisterFA = mkPersNP "ministre des affaires étrangères";
		Judge = mkPersNP "juge";
		Singer = mkPersNP "chanteur";
		Actor = {s = table {NomAcc => "l'acteur"; Comit => "avec l'acteur"}};	
		
		Inaugurate = mkV "inaugur";
		Buy = {s = table {Pf => "a acheté"; Fut => "achètera"}};
		Die = {s = "est mort"};
		Meet = {s = table {Pf => "a rencontré"; Fut => "rencontrera"}; rc = NomAcc};
		Talk = {s = table {Pf => "a parlé"; Fut => "parlera"}; rc = Comit};
		Support = {s = table {Pf => "a soutenu"; Fut => "soutiendra"}};
		Receive = {s = table {Pf => "a reçu"; Fut => "recevra"}};
		Criticize = {s = table {Pf => "a critiqué"; Fut => "pourrait critiquer"}};
		Sign = mkV "sign";
		Attend = mkV "assist";
		
		Exhibition = {s = table {NomAcc_ => "l'exposition"; Dir => "à l'exposition"}};
		Conference = {s = table {NomAcc_ => "la conférence"; Dir => "à la conférence"}};
		Car = {s = "une voiture"};
		House = {s = "une maison"};
		Agreement = {s = "l'accord"};
		
		ThisMorning = {s = "ce matin"; t = Pf};
		ThisEvening = {s = "ce soir"; t = Fut};
		TodayBefore = {s = "aujourd'hui"; t = Pf};
		TodayAfter = {s = "aujourd'hui"; t = Fut};
		Tomorrow = {s = "demain"; t = Fut};
		Yesterday = {s = "hier"; t = Pf};
		NextWeek = {s = "la semaine prochaine"; t = Fut};
		LastWeek = {s = "la semaine dernière"; t = Pf};
		DayBeforeYest = {s = "avant-hier"; t = Pf};
		DayAfterTom = {s = "après-demain"; t = Fut};
		ThreeDaysAgo = {s = "il y a trois jours"; t = Pf};
		InThreeDays = {s = "dans trois jours"; t = Fut};
		AMomentAgo = {s = "il y a un moment"; t = Pf};
		
		MonBef = {s = "lundi"; t = Pf};
		TueBef = {s = "mardi"; t = Pf};
		WedBef = {s = "mercredi"; t = Pf};
		ThuBef = {s = "jeudi"; t = Pf};
		FriBef = {s = "vendredi"; t = Pf};
		SatBef = {s = "samedi"; t = Pf};
		SunBef = {s = "dimanche"; t = Pf};
		
		MonAft = {s = "lundi"; t = Fut};
		TueAft = {s = "mardi"; t = Fut};
		WedAft = {s = "mercredi"; t = Fut};
		ThuAft = {s = "jeudi"; t = Fut};
		FriAft = {s = "vendredi"; t = Fut};
		SatAft = {s = "samedi"; t = Fut};
		SunAft = {s = "dimanche"; t = Fut};
		
		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "à Madrid"};
		inBarcelona = {s = "à Barcelone"};
		atHotel = {s = "à un hôtel"};
		inCityCenter = {s = "en centre-ville"};
		atNationalPalace = {s = "au Palais National"};
		inFrance = {s = "en France"};
		inChina = {s = "en Chine"};
		inUS = {s = "aux États-Unis"};
		
	param
		Time = Pf | Fut;
		PersNPCase = NomAcc | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "le"++w; Comit => "avec le"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pf => "a"++v+"é"; Fut => v+"era"}};
}