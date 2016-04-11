concrete headlinesGre of headlines = {
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
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! Acc_;
		headlineOpenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s ++ pa.s;
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
		
		King = mkPersNP "βασιλιά";
		President = mkPersNP_n "πρόεδρο";
		LeaderSP = mkPersNPCompl_n "ηγέτη" "του σοσιαλιστικού κόμματος";
		MinisterFA = mkPersNPCompl_n "υπουργό" "εξωτερικών";
		Judge = mkPersNP "δικαστή";
		Singer = mkPersNP_n "τραγουδιστή";
		Actor = mkPersNP_n "ηθοποιό";
		
		Inaugurate = mkV "εγκαινίασε" "εγκαινιάσει";
		Buy = mkV "αγόρασε" "αγοράσει";
		Die = {s = "πέθανε"};
		Meet = mkV "συναντήθηκε" "συναντήσει";
		Talk = mkV "μίλησε" "μιλήσει";
		Support = mkV "υποστήριξε" "υποστηρίξει";
		Receive = mkV "έλαβε" "λάβει";
		Criticize = {s = table {Pas => "επέκρινε"; Pf => "έχει επικρίνει"; Fut => "θα μπορούσε να επικρίνει"}};
		Sign = mkV "υπέγραψε" "υπογράψει";
		Attend = mkV "παρέστησε" "παραστεί";
		
		Exhibition = {s = table {Acc_ => "την έκθεση"; Dir => "στην έκθεση"}};
		Conference = {s = table {Acc_ => "τη διάσκεψη"; Dir => "στη διάσκεψη"}};
		Car = {s = "ένα αυτοκίνητο"};
		House = {s = "ένα σπίτι"};
		Agreement = {s = "τη συμφωνία"};
		
		ThisMorning = {s = "το πρωί"; t = Pf};
		ThisEvening = {s = "το βράδυ"; t = Fut};
		TodayBefore = {s = "σήμερα"; t = Pf};
		TodayAfter = {s = "σήμερα"; t = Fut};
		Tomorrow = {s = "αύριο"; t = Fut};
		Yesterday = {s = "χθες"; t = Pas};
		NextWeek = {s = "την επόμενη εβδομάδα"; t = Fut};
		LastWeek = {s = "την περασμένη εβδομάδα"; t = Pas};
		DayBeforeYest = {s = "προχθές"; t = Pas};
		DayAfterTom = {s = "μεθαύριο"; t = Fut};
		ThreeDaysAgo = {s = "πριν τρεις μέρες"; t = Pas};
		InThreeDays = {s = "σε τρεις μέρες"; t = Fut};
		AMomentAgo = {s = "πριν λίγο"; t = Pf};
		
		MonBef = {s = "τη Δευτέρα"; t = Pas};
		TueBef = {s = "την Τρίτη"; t = Pas};
		WedBef = {s = "την Τετάρτη"; t = Pas};
		ThuBef = {s = "την Πέμπτη"; t = Pas};
		FriBef = {s = "την Παρασκευή"; t = Pas};
		SatBef = {s = "το Σάββατο"; t = Pas};
		SunBef = {s = "την Κυριακή"; t = Pas};
		
		MonAft = {s = "τη Δευτέρα"; t = Fut};
		TueAft = {s = "την Τρίτη"; t = Fut};
		WedAft = {s = "την Τετάρτη"; t = Fut};
		ThuAft = {s = "την Πέμπτη"; t = Fut};
		FriAft = {s = "την Παρασκευή"; t = Fut};
		SatAft = {s = "το Σάββατο"; t = Fut};
		SunAft = {s = "την Κυριακή"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
				
		inMadrid = {s = "στη Μαδρίτη"};
		inBarcelona = {s = "στη Βαρκελώνη"};
		atHotel = {s = "σε ένα ξενοδοχείο"};
		inCityCenter = {s = "στο κέντρο της πόλης"};
		atNationalPalace = {s = "στο Εθνικό Μέγαρο"};
		inFrance = {s = "στη Γαλλία"};
		inChina = {s = "στην Κίνα"};
		inUS = {s = "στις Ηνωμένες Πολιτείες"};
				
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = Acc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP : Str -> PersNPType = \w -> {s = table {Nom => "ο"++w+"ς"; Acc => "το"++w; Comit => "με το"++w}};
		mkPersNP_n : Str -> PersNPType = \w -> {s = table {Nom => "ο"++w+"ς"; Acc => "τον"++w; Comit => "με τον"++w}};
		mkPersNPCompl_n : Str -> Str -> PersNPType = \w, c -> {s = table {Nom => "ο"++w+"ς"++c; Acc => "τον"++w++c; Comit => "με τον"++w++c}};
		VType : Type = {s : Time => Str};
		mkV : Str -> Str -> VType = \past, part -> {s = table {Pas => past; Pf => "έχει"++part; Fut => "θα"++part}};
}