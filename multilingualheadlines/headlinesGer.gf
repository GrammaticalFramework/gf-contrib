concrete headlinesGer of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP, PlaceNP = {s : Str};
		GenTrV, OpenV, GoV, WriteV, PersV, WithV = VType;
		ChgV = {infl,noninfl : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t : Time};
		PlaceAdv = {s : Str};
	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden, infl = inflected for person
		headlineGen p v o h = p.s ! Nom ++ v.infl ! h.t ++ o.s ++ v.noninfl ! h.t;
		headlineGenTime p v o ta = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ v.noninfl ! ta.t;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ pa.s ++ v.noninfl ! ta.t;
		headlineOpen p v o h = p.s ! Nom ++ v.infl ! h.t ++ o.s ++ v.noninfl ! h.t;
		headlineOpenTime p v o ta = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ v.noninfl ! ta.t;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ pa.s ++ v.noninfl ! ta.t;
		headlineChg v p = p.s ! Nom ++ v.infl ++ v.noninfl;
		headlineChgPlace v p pa = p.s ! Nom ++ v.infl ++ pa.s ++ v.noninfl;
		headlineWithTime p v p2 ta = p.s ! Nom ++ v.infl ! ta.t ++ p2.s ! Comit ++ ta.s ++ v.noninfl ! ta.t;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ v.infl ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s ++ v.noninfl ! ta.t;
		headlinePersTime p v p2 ta = p.s ! Nom ++ v.infl ! ta.t ++ p2.s ! Acc ++ ta.s ++ v.noninfl ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ v.infl ! ta.t ++ p2.s ! Acc ++ ta.s ++ pa.s ++ v.noninfl ! ta.t;
		headlineGoTime p v o ta = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ v.noninfl ! ta.t;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ pa.s ++ v.noninfl ! ta.t;
		headlineWrite p v o h = p.s ! Nom ++ v.infl ! h.t ++ o.s ++ v.noninfl ! h.t;
		headlineWriteTime p v o ta = p.s ! Nom ++ v.infl ! ta.t ++ o.s ++ ta.s ++ v.noninfl ! ta.t;
		
		King = mkPersNP "König";
		President = {s = table {Nom => "der Präsident"; Acc => "den Präsidenten"; Comit => "mit dem Präsidenten"}};
		LeaderSP = mkPersNP "Chef der sozialistischen Partei";
		MinisterFA = mkPersNP "Außenminister";
		Judge = mkPersNP "Richter";
		Singer = mkPersNP "Sänger";
		Actor = mkPersNP "Schauspieler";	
		
		Inaugurate = mkVePref "eröffn";
		Buy = mkV "kauf";
		Die = {infl = "ist"; noninfl = "gestorben"};
		Meet = {infl = table { Pas => "traf sich"; Pf => "hat sich"; Fut => "wird sich"};
				noninfl = table { Pas => ""; Pf => "getroffen" ; Fut => "treffen" }};
		Talk = mkVe "red";
		Support = mkVPref "unterstüz";
		Receive = {infl = table { Pas => "empfing"; Pf => "hat"; Fut => "wird"};
				   noninfl = table { Pas => ""; Pf => "empfangen" ; Fut => "empfangen" }};
		Criticize = {infl = table { Pas => "kritisierte"; Pf => "hat"; Fut => "könnte"};
				     noninfl = table { Pas => ""; Pf => "kritisiert" ; Fut => "kritisieren" }};
		Sign = mkVePref "unterzeichn";
		Attend = mkVPref "besuch";
		
		Exhibition = {s = "die Ausstellung"};
		Conference = {s = "die Konferenz"};
		Car = {s = "einen Wagen"};
		House = {s = "ein Haus"};
		Agreement = {s = "das Abkommen"};
		
		ThisMorning = {s = "heute Morgen"; t = Pf};
		ThisEvening = {s = "heute Abend"; t = Fut};
		TodayBefore = {s = "heute"; t = Pf};
		TodayAfter = {s = "heute"; t = Fut};
		Tomorrow = {s = "morgen"; t = Fut};
		Yesterday = {s = "gestern"; t = Pas};
		NextWeek = {s = "nächste Woche"; t = Fut};
		LastWeek = {s = "letzte Woche"; t = Pas};
		DayBeforeYest = {s = "vorgestern"; t = Pas};
		DayAfterTom = {s = "übermorgen"; t = Fut};
		ThreeDaysAgo = {s = "vor drei Tagen"; t = Pas};
		InThreeDays = {s = "in drei Tagen"; t = Fut};
		AMomentAgo = {s = "vor einem Moment"; t = Pf};
		
		MonBef = {s = "am Montag"; t = Pas};
		TueBef = {s = "am Dienstag"; t = Pas};
		WedBef = {s = "am Mittwoch"; t = Pas};
		ThuBef = {s = "am Donnerstag"; t = Pas};
		FriBef = {s = "am Freitag"; t = Pas};
		SatBef = {s = "am Samstag"; t = Pas};
		SunBef = {s = "am Sonntag"; t = Pas};
		
		MonAft = {s = "am Montag"; t = Fut};
		TueAft = {s = "am Dienstag"; t = Fut};
		WedAft = {s = "am Mittwoch"; t = Fut};
		ThuAft = {s = "am Donnerstag"; t = Fut};
		FriAft = {s = "am Freitag"; t = Fut};
		SatAft = {s = "am Samstag"; t = Fut};
		SunAft = {s = "am Sonntag"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "in Madrid"};
		inBarcelona = {s = "in Barcelona"};
		atHotel = {s = "in einem Hotel"};
		inCityCenter = {s = "im Stadtzentrum"};
		atNationalPalace = {s = "im Nationalen Palast"};
		inFrance = {s = "in Frankreich"};
		inChina = {s = "in China"};
		inUS = {s = "in den Vereinigten Staaten"};
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Nom => "der"++w; Acc =>"den"++w; Comit => "mit dem"++w}};
		VType : Type = {infl,noninfl : Time => Str};
		mkV : Str -> VType = \v -> {infl = table { Pas => v+"te"; Pf => "hat"; Fut => "wird"};
									noninfl = table { Pas => ""; Pf => "ge"+v+"t" ; Fut => v + "en" }};
		mkVe : Str -> VType = \v -> {infl = table { Pas => v+"ete"; Pf => "hat"; Fut => "wird"};
									noninfl = table { Pas => ""; Pf => "ge"+v+"et" ; Fut => v + "en" }};
		mkVPref : Str -> VType = \v -> {infl = table { Pas => v+"te"; Pf => "hat"; Fut => "wird"};
									noninfl = table { Pas => ""; Pf => v+"t" ; Fut => v + "en" }};
		mkVePref : Str -> VType = \v -> {infl = table { Pas => v+"ete"; Pf => "hat"; Fut => "wird"};
									noninfl = table { Pas => ""; Pf => v+"et" ; Fut => v + "en" }};
}