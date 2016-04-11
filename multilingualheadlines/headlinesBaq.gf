concrete headlinesBaq of headlines = {
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
		headlineGen p v o h = p.s ! Erg ++ o.s ++ v.s ! h.t;
		headlineGenTime p v o ta = p.s ! Erg ++ ta.s ++ o.s ++ v.s ! ta.t;
		headlineGenTimePlace p v o ta pa = p.s ! Erg ++ ta.s ++ pa.s ++ o.s ++ v.s ! ta.t;
		headlineOpen p v o h = p.s ! Erg ++ o.s ! Abs_ ++ v.s ! h.t;
		headlineOpenTime p v o ta = p.s ! Erg ++ ta.s ++ o.s ! Abs_ ++  v.s ! ta.t;
		headlineOpenTimePlace p v o ta pa = p.s ! Erg ++ ta.s ++ pa.s ++ o.s ! Abs_ ++ v.s ! ta.t;
		headlineChg v p = v.s ++ p.s ! Abs;
		headlineChgPlace v p pa = v.s ++ p.s ! Abs ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! Abs ++ ta.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlineWithTimePlace p v p2 ta pa = p.s ! Abs ++ ta.s ++ pa.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlinePersTime p v p2 ta = p.s ! Erg ++ ta.s ++ p2.s ! Abs ++ v.s ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! Erg ++ ta.s ++ pa.s ++ p2.s ! Abs ++ v.s ! ta.t;
		headlineGoTime p v o ta = p.s ! Abs ++ ta.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineGoTimePlace p v o ta pa = p.s ! Abs ++ ta.s ++ pa.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineWrite p v o h = p.s ! Erg ++ o.s ++ v.s ! h.t;
		headlineWriteTime p v o ta = p.s ! Erg ++ ta.s ++ o.s ++ v.s ! ta.t;
		
		King = mkPersNP "errege";
		President = mkPersNP "lehendakari";
		LeaderSP = mkPersNP "alderdi sozialistaren liderr";
		MinisterFA = mkPersNP "atzerri ministro";
		Judge = mkPersNP "epaile";
		Singer = mkPersNP "abeslari";
		Actor = mkPersNP "aktore";		
		
		Inaugurate = mkV "inauguratu";
		Buy = mkV "erosi";
		Die = {s = "hil da"};
		Meet = {s = table {Pas => "bildu zen"; Pf => "bildu da"; Fut => "bilduko da"}};
		Talk = {s = table {Pas => "hitz egin zuen"; Pf => "hitz egin du"; Fut => "hitz egingo du"}};
		Support = mkV "lagundu";
		Receive = mkV "hartu";
		Criticize = {s = table {Pas => "kritikatu zuen"; Pf => "kritikatu du"; Fut => "kritikatu lezake"}};
		Sign = mkV "sinatu";
		Attend = {s = table {Pas => "zihoan"; Pf => "joan da"; Fut => "joango da"}};
		
		Exhibition = {s = table {Abs_ => "erakusketa"; Dir => "erakusketara"}};
		Conference = {s = table {Abs_ => "hitzaldia"; Dir => "hitzaldira"}};
		Car = {s = "kotxea"};
		House = {s = "etxea"};
		Agreement = {s = "akordioa"};
		
		ThisMorning = {s = "goiz honetan"; t = Pf};
		ThisEvening = {s = "arratsalde honetan"; t = Fut};
		TodayBefore = {s = "gaur"; t = Pf};
		TodayAfter = {s = "gaur"; t = Fut};
		Tomorrow = {s = "bihar"; t = Fut};
		Yesterday = {s = "atzo"; t = Pas};
		NextWeek = {s = "hurrengo astean"; t = Fut};
		LastWeek = {s = "joan den astean"; t = Pas};
		DayBeforeYest = {s = "herenegun"; t = Pas};
		DayAfterTom = {s = "etzi"; t = Fut};
		ThreeDaysAgo = {s = "duela hiru egun"; t = Pas};
		InThreeDays = {s = "hiru egun barru"; t = Fut};
		AMomentAgo = {s = "duela momentu bat"; t = Pf};
		
		MonBef = {s = "astelehenean"; t = Pas};
		TueBef = {s = "asteartean"; t = Pas};
		WedBef = {s = "asteazkenean"; t = Pas};
		ThuBef = {s = "ostegunean"; t = Pas};
		FriBef = {s = "ostiralean"; t = Pas};
		SatBef = {s = "larunbatean"; t = Pas};
		SunBef = {s = "igandean"; t = Pas};
		
		MonAft = {s = "astelehenean"; t = Fut};
		TueAft = {s = "asteartean"; t = Fut};
		WedAft = {s = "asteazkenean"; t = Fut};
		ThuAft = {s = "ostegunean"; t = Fut};
		FriAft = {s = "ostiralean"; t = Fut};
		SatAft = {s = "larunbatean"; t = Fut};
		SunAft = {s = "igandean"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "Madrilen"};
		inBarcelona = {s = "Bartzelonan"};
		atHotel = {s = "hotel batean"};
		inCityCenter = {s = "hiriaren erdigunean"};
		atNationalPalace = {s = "Nazio Jauregian"};
		inFrance = {s = "Frantzian"};
		inChina = {s = "Txinan"};
		inUS = {s = "Estatu Batuetan"};
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Abs | Erg | Comit;
		PlaceNPCase = Abs_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Abs => w+"a"; Erg => w+"ak"; Comit => w+"arekin"}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => v++"zuen"; Pf => v++"du"; Fut => v+"ko du"}};
}