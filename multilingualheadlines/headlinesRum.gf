--# -coding=utf-8
concrete headlinesRum of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WriteV, PersV, WithV = VType;
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
		
		King = mkPersNP_le "rege";
		President = mkPersNP_le "preşedinte";
		LeaderSP = mkPersNP_cu "liderul partidului socialist";
		MinisterFA = mkPersNP_cu "ministrul afacerilor externe";
		Judge = mkPersNP "judecător";
		Singer = mkPersNP "cântăreţ";
		Actor = mkPersNP "actor";	
		
		Inaugurate = mkV "inaugura";
		Buy = mkV "cumpăra";
		Die = {s = "a murit"};
		Meet = mkV2 "s-a întâlnit" "se va întâlni";
		Talk = mkV "vorbi";
		Support = mkV2 "l-a sprijinit" "îl va sprijini";
		Receive = mkV2 "l-a primit" "îl va primi";
		Criticize = mkV2 "l-a criticat" "ar putea să-l critice";
		Sign = mkV "semna";
		Attend = mkV "participa";
		
		Exhibition = {s = table {NomAcc => "expoziţia"; Dir => "la expoziţia"}};
		Conference = {s = table {NomAcc => "conferinţa"; Dir => "la conferinţa"}};
		Car = {s = "o maşină"};
		House = {s = "o casă"};
		Agreement = {s = "acordul"};
		
		ThisMorning = {s = "în această dimineaţă" | "azi dimineaţă"; t = Pf};
		ThisEvening = {s = " în această seară"; t = Fut};
		TodayBefore = {s = "astăzi" | "azi"; t = Pf};
		TodayAfter = {s = "astăzi" | "azi"; t = Fut};
		Tomorrow = {s = "mâine"; t = Fut};
		Yesterday = {s = "ieri"; t = Pf};
		NextWeek = {s = "săptămâna viitoare"; t = Fut};
		LastWeek = {s = "săptămâna trecută"; t = Pf};
		DayBeforeYest = {s = "alaltăieri"; t = Pf};
		DayAfterTom = {s = "poimâine"; t = Fut};
		ThreeDaysAgo = {s = "acum trei zile"; t = Pf};
		InThreeDays = {s = "în trei zile"; t = Fut};
		AMomentAgo = {s = "acum un moment"; t = Pf};
		
		MonBef = {s = "luni"; t = Pf};
		TueBef = {s = "marţi"; t = Pf};
		WedBef = {s = "miercuri"; t = Pf};
		ThuBef = {s = "joi"; t = Pf};
		FriBef = {s = "vineri"; t = Pf};
		SatBef = {s = "sâmbătă"; t = Pf};
		SunBef = {s = "duminică"; t = Pf};
		
		MonAft = {s = "luni"; t = Fut};
		TueAft = {s = "marţi"; t = Fut};
		WedAft = {s = "miercuri"; t = Fut};
		ThuAft = {s = "joi"; t = Fut};
		FriAft = {s = "vineri"; t = Fut};
		SatAft = {s = "sâmbătă"; t = Fut};
		SunAft = {s = "duminică"; t = Fut};
		
		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "în Madrid"};
		inBarcelona = {s = "în Barcelona"};
		atHotel = {s = "la un hotel"};
		inCityCenter = {s = "în centrul oraşului"};
		atNationalPalace = {s = "la Palatul Naţional"};
		inFrance = {s = "în Franţa"};
		inChina = {s = "în China"};
		inUS = {s = "în Statele Unite"};
		
	param
		Time = Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = NomAcc | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Nom => w+"ul"; Acc => "pe"++w+"ul"; Comit => "cu"++w+"ul"}};
		mkPersNP_le: Str -> PersNPType = \w -> {s = table {Nom => w+"le"; Acc => "pe"++w+"le"; Comit => "cu"++w+"le"}};
		mkPersNP_cu: Str -> PersNPType = \w -> {s = table {Nom => w; Acc => "pe"++w; Comit => "cu"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pf => "a"++v+"t"; Fut => "va"++v}};
		mkV2 : Str -> Str -> VType = \pf, f -> {s = table {Pf => pf; Fut => f}};
}