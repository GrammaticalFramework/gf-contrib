concrete headlinesHrv of headlines = {
	lincat 
		Headline = Str;
		PersNP = {s : PersNPCase => Str};
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WriteV, PersV, WithV = VType;
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t: Time};
		PlaceAdv = {s : Str};
	lin
		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! Acc_;
		headlineOpenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! Nom;
		headlineChgPlace v p pa = v.s ++ p.s ! Nom ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Dat ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Dat ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = {s = table {Nom => "kralj"; Acc => "kralja"; Comit => "s kraljem"}};	
		President = {s = table {Nom => "predsjednik"; Acc => "predsjednika"; Comit => "s predsjednikom"}};	
		LeaderSP = {s = table {Nom => "čelnik socijalističke stranke"; Acc => "čelnika socijalističke stranke"; Comit => "s čelnikom socijalističke stranke"}};	
		MinisterFA = {s = table {Nom => "ministar vanjskih poslova"; Acc => "ministra vanjskih poslova"; Comit => "s ministrom vanjskih poslova"}};	
		Judge = {s = table {Nom => "sudac"; Acc => "suca"; Comit => "sa sucem"}};	
		Singer = {s = table {Nom => "pjevač"; Acc => "pjevača"; Comit => "s pjevačem"}};	
		Actor = {s = table {Nom => "glumac"; Acc => "glumca"; Comit => "s glumcem"}};	
		
		Inaugurate = mkV "inaugurira";
		Buy = mkV "kupi";
		Die = {s = "umro je"};
		Meet = {s = table {Pf => "se sastao"; Fut => "će se sastati"}};
		Talk = mkV "razgovara";
		Support = mkV "podrža";
		Receive = mkV "primi";
		Criticize = {s = table {Pf => "je kritizirao"; Fut => "bi mogao kritizirati"}};
		Sign = mkV "potpisa";
		Attend = mkV "prisustvova";
		
		Exhibition = {s = table {Nom_ => "izložba"; Acc_ => "izložbu"; Dat => "izložbi"}};
		Conference = {s = table {Nom_ => "konferencija"; Acc_ => "konferencije"; Dat => "konferenciji"}};
		Car = {s = "auto"};
		House = {s = "kuću"};
		Agreement = {s = "sporazum"};
		
		ThisMorning = {s = "jutros"; t = Pf};
		ThisEvening = {s = "večeras"; t = Fut};
		TodayBefore = {s = "danas"; t = Pf};
		TodayAfter = {s = "danas"; t = Fut};
		Tomorrow = {s = "sutra"; t = Fut};
		Yesterday = {s = "jučer"; t = Pf};
		NextWeek = {s = "sljedećeg tjedna"; t = Fut};
		LastWeek = {s = "prošlog tjedna"; t = Pf};
		DayBeforeYest = {s = "prekjučer"; t = Pf};
		DayAfterTom = {s = "prekosutra"; t = Fut};
		ThreeDaysAgo = {s = "prije tri dana"; t = Pf};
		InThreeDays = {s = "kroz tri dana"; t = Fut};
		AMomentAgo = {s = "trenutak prije"; t = Pf};
		
		MonBef = {s = "u ponedjeljak"; t = Pf};
		TueBef = {s = "u utorak"; t = Pf};
		WedBef = {s = "u srijedu"; t = Pf};
		ThuBef = {s = "u četvrtak"; t = Pf};
		FriBef = {s = "u petak"; t = Pf};
		SatBef = {s = "u subotu"; t = Pf};
		SunBef = {s = "u nedjelju"; t = Pf};
		
		MonAft = {s = "u ponedjeljak"; t = Fut};
		TueAft = {s = "u utorak"; t = Fut};
		WedAft = {s = "u srijedu"; t = Fut};
		ThuAft = {s = "u četvrtak"; t = Fut};
		FriAft = {s = "u petak"; t = Fut};
		SatAft = {s = "u subotu"; t = Fut};
		SunAft = {s = "u nedjelju"; t = Fut};
		
		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "u Madridu"};
		inBarcelona = {s = "u Barceloni"};
		atHotel = {s = "u hotelu"};
		inCityCenter = {s = "u centru grada"};
		atNationalPalace = {s = "na Nacionalnoj Palači"};
		inFrance = {s = "u Francuskoj"};
		inChina = {s = "u Kini"};
		inUS = {s = "u Sjedinjenim Državama"};
		
	param
		Time = Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = Nom_ | Acc_ | Dat;
		
	oper
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pf => "je"++v+"o"; Fut => "će"++v+"ti"}};
}