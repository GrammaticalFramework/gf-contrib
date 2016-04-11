concrete headlinesTur of headlines = {
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
		headlineGen p v o h = p.s ! Nom ++ o.s ++ v.s ! h.t;
		headlineGenTime p v o ta = p.s ! Nom ++ ta.s ++ o.s ++ v.s ! ta.t;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ o.s ++ v.s ! ta.t;
		headlineOpen p v o h = p.s ! Nom ++ o.s ! Acc_ ++ v.s ! h.t;
		headlineOpenTime p v o ta = p.s ! Nom ++ ta.s ++ o.s ! Acc_ ++ v.s ! ta.t;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ o.s ! Acc_ ++ v.s ! ta.t;
		headlineChg v p = p.s ! Nom ++ v.s;
		headlineChgPlace v p pa = p.s ! Nom ++ pa.s ++ v.s;
		headlineWithTime p v p2 ta = p.s ! Nom ++ ta.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlinePersTime p v p2 ta = p.s ! Nom ++ ta.s ++ p2.s ! Acc ++ v.s ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ p2.s ! Acc ++ v.s ! ta.t;
		headlineGoTime p v o ta = p.s ! Nom ++ ta.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineWrite p v o h = p.s ! Nom ++ o.s ++ v.s ! h.t;
		headlineWriteTime p v o ta = p.s ! Nom ++ ta.s ++ o.s ++ v.s ! ta.t;
		
		King = mkPersNP "kral" "kralı" "kralla";
		President = mkPersNP "başkan" "başkanı" "başkanla";
		LeaderSP = mkPersNPCompl "sosyalist partinin" "lideri" "liderini" "liderinle";
		MinisterFA = mkPersNPCompl "dışişleri" "bakanı" "bakanını" "bakanınla";
		Judge = mkPersNP "yargıç" "yargıcı" "yargıçla";
		Singer = mkPersNP "şarkıcı" "şarkıcıyı" "şarkıcıla";
		Actor = mkPersNP "aktör" "aktörü" "aktörle";
		
		Inaugurate = mkV "açılış yaptı" "açılış yapacak";
		Buy = mkV "aldı" "alacak";
		Die = {s = "öldü"};
		Meet = mkV "görüştü" "görüşecek";
		Talk = mkV "konuştu" "konuşacak";
		Support = mkV "destekledi" "destekleyecek";
		Receive = mkV "aldı" "alacak";
		Criticize = mkV "eleştirmedi" "eleştirebilir";
		Sign = mkV "imzaladı" "imzalayacak";
		Attend = mkV "katıldı" "katılacak";
		
		Exhibition = {s = table {Acc_ => "sergiyi"; Dir => "sergiye"}};
		Conference = {s = table {Acc_ => "konferansı"; Dir => "konferansa"}};
		Car = {s = "bir araba"};
		House = {s = "bir ev"};
		Agreement = {s = "anlaşmayı"};
		
		ThisMorning = {s = "bu sabah"; t = Pas};
		ThisEvening = {s = "bu akşam"; t = Fut};
		TodayBefore = {s = "bugün"; t = Pas};
		TodayAfter = {s = "bugün"; t = Fut};
		Tomorrow = {s = "yarın"; t = Fut};
		Yesterday = {s = "dün"; t = Pas};
		NextWeek = {s = "gelecek hafta"; t = Fut};
		LastWeek = {s = "geçen hafta"; t = Pas};
		DayBeforeYest = {s = "önceki gün"; t = Pas};
		DayAfterTom = {s = "öbür gün"; t = Fut};
		ThreeDaysAgo = {s = "üç gün önce"; t = Pas};
		InThreeDays = {s = "üç gün içinde"; t = Fut};
		AMomentAgo = {s = "az önce"; t = Pas};
		
		MonBef = {s = "pazartesi günü"; t = Pas};
		TueBef = {s = "salı günü"; t = Pas};
		WedBef = {s = "çarşamba günü"; t = Pas};
		ThuBef = {s = "perşembe günü"; t = Pas};
		FriBef = {s = "cuma günü"; t = Pas};
		SatBef = {s = "cumartesi günü"; t = Pas};
		SunBef = {s = "pazar günü"; t = Pas};
		
		MonAft = {s = "pazartesi günü"; t = Fut};
		TueAft = {s = "salı günü"; t = Fut};
		WedAft = {s = "çarşamba günü"; t = Fut};
		ThuAft = {s = "perşembe günü"; t = Fut};
		FriAft = {s = "cuma günü"; t = Fut};
		SatAft = {s = "cumartesi günü"; t = Fut};
		SunAft = {s = "pazar günü"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "Madrid'de"};
		inBarcelona = {s = "Barselona'da"};
		atHotel = {s = "bir otelde"};
		inCityCenter = {s = "şehir merkezinde"};
		atNationalPalace = {s = "Ulusal Sarayda"};
		inFrance = {s = "Fransa'da"};
		inChina = {s = "Çin'de"};
		inUS = {s = "Birleşik Devletlerde"};
		
	param
		Time = Pas | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = Acc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> Str -> Str -> PersNPType = \n,a,c -> {s = table {Nom => n; Acc => a; Comit => c}};
		mkPersNPCompl: Str -> Str -> Str -> Str -> PersNPType = \compl,n,a,c -> {s = table {Nom => compl++n; Acc => compl++a; Comit => compl++c}};
		VType : Type = {s : Time => Str};
		mkV : Str -> Str -> VType = \p, f -> {s = table {Pas => p; Fut => f}};
}