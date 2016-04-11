concrete headlinesSwa of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP, PlaceNP = {s : Str};
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
		headlineOpen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineOpenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineChg v p = p.s ! NomAcc ++ v.s;
		headlineChgPlace v p pa = p.s ! NomAcc ++ v.s ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "mfalme";
		President = mkPersNP "rais";
		LeaderSP = mkPersNP "kiongozi wa chama cha ujamaa";
		MinisterFA = mkPersNP "waziri wa mambo ya nje";
		Judge = mkPersNP "hakimu";
		Singer = mkPersNP "mwimbaji";
		Actor = mkPersNP "mwigizaji";
		
		Inaugurate = mkV "fungua";
		Buy = mkV "nunua";
		Die = {s = "amekufa"}; --s-v
		Meet = mkV "kutana";
		Talk = mkV "ongea";
		Support = mkV "mposha"; --only valid for a person sg direct object ('m-')
		Receive = mkV "mpokea";
		Criticize = {s = table {Pas => "alimkosoa"; Pf => "amemkosoa"; Fut => "angeweza kumkosoa"}};
		Sign = mkV "tia saini";
		Attend = mkV "hudhuria";
		
		Exhibition = {s = "maonyesho"};
		Conference = {s = "mkutano"};
		Car = {s = "gari"};
		House = {s = "nyumba"};
		Agreement = {s = "makubaliano"};
		
		ThisMorning = {s = "asubuhi"; t = Pf};
		ThisEvening = {s = "leo jioni"; t = Fut};
		TodayBefore = {s = "leo"; t = Pf};
		TodayAfter = {s = "leo"; t = Fut};
		Tomorrow = {s = "kesho"; t = Fut};
		Yesterday = {s = "jana"; t = Pas};
		NextWeek = {s = "juma lijalo"; t = Fut};
		LastWeek = {s = "juma lililopita"; t = Pas};
		DayBeforeYest = {s = "juzi"; t = Pas};
		DayAfterTom = {s = "kesho kutwa"; t = Fut};
		ThreeDaysAgo = {s = "siku tatu zilizopita"; t = Pas};
		InThreeDays = {s = "kwa siku tatu"; t = Fut};
		AMomentAgo = {s = "wakati iliyopita"; t = Pf};
		
		MonBef = {s = "Jumatatu"; t = Pas};
		TueBef = {s = "Jumanne"; t = Pas};
		WedBef = {s = "Jumatano"; t = Pas};
		ThuBef = {s = "Alhamisi"; t = Pas};
		FriBef = {s = "Ijumaa"; t = Pas};
		SatBef = {s = "Jumamosi"; t = Pas};
		SunBef = {s = "Jumapili"; t = Pas};
		
		MonAft = {s = "Jumatatu"; t = Fut};
		TueAft = {s = "Jumanne"; t = Fut};
		WedAft = {s = "Jumatano"; t = Fut};
		ThuAft = {s = "Alhamisi"; t = Fut};
		FriAft = {s = "Ijumaa"; t = Fut};
		SatAft = {s = "Jumamosi"; t = Fut};
		SunAft = {s = "Jumapili"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "mjini Madrid"};
		inBarcelona = {s = "mjini Barcelona"};
		atHotel = {s = "katika hoteli moja"};
		inCityCenter = {s = "katika kituo cha mji"};
		atNationalPalace = {s = "Jumbani mwa Kitaifa"};
		inFrance = {s = "nchini Ufaransa"};
		inChina = {s = "nchini China"};
		inUS = {s = "nchini Marekani"};
				
	param
		Time = Pas | Pf | Fut;
		PersNPCase = NomAcc | Comit;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => w; Comit => "na"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => "ali"+v; Pf => "ame"+v; Fut => "ata"+v}};
}