concrete headlinesSpa of headlines = {
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
		headlineGen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! NomAcc;
		headlineOpenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! NomAcc ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! NomAcc ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! Nom;
		headlineChgPlace v p pa = v.s ++ p.s ! Nom ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "rey";
		President = mkPersNP "presidente";
		LeaderSP = mkPersNP "líder del partido socialista";
		MinisterFA = mkPersNP "ministro de asuntos exteriores";
		Judge = mkPersNP "juez";
		Singer = mkPersNP "cantante";
		Actor = mkPersNP "actor";
		
		Inaugurate = mkV "inaugur";
		Buy = mkV "compr";
		Die = {s = "ha muerto"};
		Meet = {s = table {Pas => "se reunió"; Pf => "se ha reunido"; Fut => "se reunirá"}};
		Talk = mkV "habl";
		Support = mkV "apoy";
		Receive = {s = table {Pas => "recibió"; Pf => "ha recibido"; Fut => "recibirá"}};
		Criticize = {s = table {Pas => "criticó"; Pf => "ha criticado"; Fut => "podría criticar"}};
		Sign = mkV "firm";
		Attend = {s = table {Pas => "asistió"; Pf => "ha asistido"; Fut => "asistirá"}};
		
		Exhibition = {s = table {NomAcc => "la exposición"; Dir => "a la exposición"}};
		Conference = {s = table {NomAcc => "la conferencia"; Dir => "a la conferencia"}};
		Car = {s = "un coche"};
		House = {s = "una casa"};
		Agreement = {s = "el acuerdo"};
		
		ThisMorning = {s = "esta mañana"; t = Pf};
		ThisEvening = {s = "esta tarde"; t = Fut};
		TodayBefore = {s = "hoy"; t = Pf};
		TodayAfter = {s = "hoy"; t = Fut};
		Tomorrow = {s = "mañana"; t = Fut};
		Yesterday = {s = "ayer"; t = Pas};
		NextWeek = {s = "la semana que viene"; t = Fut};
		LastWeek = {s = "la semana pasada"; t = Pas};
		DayBeforeYest = {s = "anteayer"; t = Pas};
		DayAfterTom = {s = "pasado mañana"; t = Fut};
		ThreeDaysAgo = {s = "hace tres días"; t = Pas};
		InThreeDays = {s = "dentro de tres días"; t = Fut};
		AMomentAgo = {s = "hace un momento"; t = Pf};
		
		MonBef = {s = "el lunes"; t = Pas};
		TueBef = {s = "el martes"; t = Pas};
		WedBef = {s = "el miércoles"; t = Pas};
		ThuBef = {s = "el jueves"; t = Pas};
		FriBef = {s = "el viernes"; t = Pas};
		SatBef = {s = "el sábado"; t = Pas};
		SunBef = {s = "el domingo"; t = Pas};
		
		MonAft = {s = "el lunes"; t = Fut};
		TueAft = {s = "el martes"; t = Fut};
		WedAft = {s = "el miércoles"; t = Fut};
		ThuAft = {s = "el jueves"; t = Fut};
		FriAft = {s = "el viernes"; t = Fut};
		SatAft = {s = "el sábado"; t = Fut};
		SunAft = {s = "el domingo"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
				
		inMadrid = {s = "en Madrid"};
		inBarcelona = {s = "en Barcelona"};
		atHotel = {s = "en un hotel"};
		inCityCenter = {s = "en el centro de la ciudad"};
		atNationalPalace = {s = "en el Palacio Nacional"};
		inFrance = {s = "en Francia"};
		inChina = {s = "en China"};
		inUS = {s = "en Estados Unidos" | "en los Estados Unidos"};
				
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = NomAcc | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Nom => "el"++w; Acc => "al"++w; Comit => "con el"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => v+"ó"; Pf => "ha"++v+"ado"; Fut => v+"ará"}};
}