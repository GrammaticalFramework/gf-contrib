concrete headlinesGlg of headlines = {
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
		President = mkPersNP "presidente";
		LeaderSP = mkPersNP "líder do partido socialista";
		MinisterFA = mkPersNP "ministro de asuntos exteriores";
		Judge = mkPersNP "xuíz";
		Singer = mkPersNP "cantante";
		Actor = mkPersNP "actor";	
		
		Inaugurate = mkV "inaugur";
		Buy = mkV "compr";
		Die = {s = "morreu"};
		Meet = {s = table {Pas => "reuniuse"; Fut => "se reunirá"}};
		Talk = mkV "fal";
		Support = mkV "apoi";
		Receive = {s = table {Pas => "recebeu"; Fut => "receberá"}};
		Criticize = {s = table {Pas => "criticou"; Fut => "podería criticar"}};
		Sign = mkV "asin";
		Attend = {s = table {Pas => "asistiu"; Fut => "asistirá"}};
		
		Exhibition = {s = table {NomAcc_ => "a exposición"; Dir => "á exposición"}};
		Conference = {s = table {NomAcc_ => "a conferencia"; Dir => "á conferencia"}};
		Car = {s = "un coche"};
		House = {s = "unha casa"};
		Agreement = {s = "o acordo"};
		
		ThisMorning = {s = "esta mañá"; t = Pas};
		ThisEvening = {s = "esta tarde"; t = Fut};
		TodayBefore = {s = "hoxe"; t = Pas};
		TodayAfter = {s = "hoxe"; t = Fut};
		Tomorrow = {s = "mañá"; t = Fut};
		Yesterday = {s = "onte"; t = Pas};
		NextWeek = {s = "a semana vindeira"; t = Fut};
		LastWeek = {s = "a semana pasada"; t = Pas};
		DayBeforeYest = {s = "antonte"; t = Pas};
		DayAfterTom = {s = "pasado mañá"; t = Fut};
		ThreeDaysAgo = {s = "hai tres días"; t = Pas};
		InThreeDays = {s = "dentro de tres días"; t = Fut};
		AMomentAgo = {s = "hai un momento"; t = Pas};
		
		MonBef = {s = "o luns"; t = Pas};
		TueBef = {s = "o martes"; t = Pas};
		WedBef = {s = "o mércores"; t = Pas};
		ThuBef = {s = "o xoves"; t = Pas};
		FriBef = {s = "o venres"; t = Pas};
		SatBef = {s = "o sábado"; t = Pas};
		SunBef = {s = "o domingo"; t = Pas};
		
		MonAft = {s = "o luns"; t = Fut};
		TueAft = {s = "o martes"; t = Fut};
		WedAft = {s = "o mércores"; t = Fut};
		ThuAft = {s = "o xoves"; t = Fut};
		FriAft = {s = "o venres"; t = Fut};
		SatAft = {s = "o sábado"; t = Fut};
		SunAft = {s = "o domingo"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "en Madrid"};
		inBarcelona = {s = "en Barcelona"};
		atHotel = {s = "nun hotel"};
		inCityCenter = {s = "no centro da cidade"};
		atNationalPalace = {s = "no Pazo Nacional"};
		inFrance = {s = "en Francia"};
		inChina = {s = "na China"};
		inUS = {s = "nos Estados Unidos"};
		
	param
		Time = Pas | Fut;
		PersNPCase = NomAcc | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "o"++w; Comit => "co"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => v+"ou"; Fut => v+"ará"}};
}