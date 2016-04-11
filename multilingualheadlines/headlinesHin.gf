concrete headlinesHin of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP, PlaceNP = ObjNPType;
		GenTrV, OpenV, GoV, WithV = VType;
		PersV, WriteV = PersVType;
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time; sc : PersNPCase}; --sc = subject case
		HiddenTime = {t : Time; sc : PersNPCase};
		PlaceAdv = {s : Str};
	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = case h.t of { Pas => p.s ! h.sc ++ o.s ! Abs_ ++ v.s ! h.t ! o.g; 
										  Pf => p.s ! h.sc ++ o.s ! Abs_ ++ v.s ! h.t ! o.g;
										  Fut => p.s ! h.sc ++ o.s ! Abs_ ++ v.s ! h.t ! p.g};
										  
		headlineGenTime p v o ta = case ta.t of { Pas => p.s ! ta.sc ++ ta.s ++ o.s ! Abs_ ++ v.s ! ta.t ! o.g; 
												 Pf =>  p.s ! ta.sc ++ ta.s ++ o.s ! Abs_ ++ v.s ! ta.t ! o.g;
												 Fut => p.s ! ta.sc ++ ta.s ++ o.s ! Abs_ ++ v.s ! ta.t ! p.g};
		
		headlineGenTimePlace p v o ta pa = case ta.t of { Pas => p.s ! ta.sc ++ ta.s ++ pa.s ++ o.s ! Abs_ ++ v.s ! ta.t ! o.g;
														  Pf =>  p.s ! ta.sc ++ ta.s ++ pa.s ++ o.s ! Abs_ ++ v.s ! ta.t ! o.g;
														  Fut => p.s ! ta.sc ++ ta.s ++ pa.s ++ o.s ! Abs_ ++ v.s ! ta.t ! p.g};
		
		headlineOpen p v o h = p.s ! h.sc ++ o.s ! DefAcc ++ v.s ! h.t ! Masc;
		headlineOpenTime p v o ta = p.s ! ta.sc ++ ta.s ++ o.s ! DefAcc ++ v.s ! ta.t ! Masc;
		headlineOpenTimePlace p v o ta pa = p.s ! ta.sc ++ ta.s ++ pa.s ++ o.s ! DefAcc ++ v.s ! ta.t ! Masc;
		headlineChg v p = p.s ! Abs ++ v.s;
		headlineChgPlace v p pa = p.s ! Abs ++ pa.s ++ v.s;
		headlineWithTime p v p2 ta = p.s ! ta.sc ++ ta.s ++ p2.s ! Comit ++ v.s ! ta.t ! p.g;
		headlineWithTimePlace p v p2 ta pa = p.s ! Abs ++ ta.s ++ pa.s ++ p2.s ! Comit ++ v.s ! ta.t ! p.g;
		headlinePersTime p v p2 ta = p.s ! ta.sc ++ ta.s ++ p2.s ! Abs ++ v.s ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! ta.sc ++ ta.s ++ pa.s ++ p2.s ! Abs ++ v.s ! ta.t;
		headlineGoTime p v o ta = p.s ! Abs ++ ta.s ++ o.s ! Abs_ ++ v.s ! ta.t ! p.g;
		headlineGoTimePlace p v o ta pa = p.s ! Abs ++ ta.s ++ pa.s ++ o.s ! Abs_ ++ v.s ! ta.t ! p.g;
		headlineWrite p v o h = p.s ! h.sc ++ o.s ! Par ++ v.s ! h.t;
		headlineWriteTime p v o ta = p.s ! ta.sc ++ ta.s ++ o.s ! Par ++ v.s ! ta.t;
		
		King = mkInvPersNP "राजा" Masc; --rájá
		President = mkInvPersNP "राष्ट्रपति" Masc; --raxtrapati
		LeaderSP = mkInvPersNP "समाजवादी पार्टी के नेता" Masc; --samájavádí parti ke netá
		MinisterFA = mkInvPersNP "विदेश मंत्री" Masc; --videsh mantrí
		Judge = mkInvPersNP "न्यायाधीश" Masc; --nyáyádhíx
		Singer = mkInvPersNP "गायक" Masc; --gáyak
		Actor = mkInvPersNP "अभिनेता" Masc; --abhinetá		
		
		--Pas Masc, Pas Fem, Fut Masc, Fut Fem
		Inaugurate = mkV "खोला" "खोली" "खोलेगा" "खोलेगी"; --kholá kholí kholegá kholegí
		Buy = mkV "खरीदा" "ख़रीदी" "ख़रीदेगा" "ख़रीदेगी"; --kharidá kharidí kharidegá kharidegí;
		Die = {s = "मर गया"}; --mar gayá
		Meet = mkV "मिला" "मिली" "मिलेगा" "मिलेगी"; --milá milí, milegá milegí not a ne verb
		Talk = mkV "बोला" "बोली" "बोलेगा" "बोलेगी"; --bolá bolí, bolegá bolegí, not a ne verb
		Support = mkInvV "का समर्थन किया" "का समर्थन करेगा"; --ká samartan kiyá, ká samartan karegá
		Receive = mkInvV "का स्वागत किया" "का स्वागत करेगा"; --ká svágat kiyá, ká svágat karegá
		Criticize = mkInvV "की आलोचना की" "की आलोचना कर सख्ता है"; --kí alochná kí, kí alochná kar sakhtá hai
		Sign = mkInvV "हस्ताक्षर किए" "हस्ताक्षर करेगा"; --hastashkar kie, hastashkar karegá
		Attend = mkV "गया" "गई" "जाएगा" "जाएगी"; --gayá gaí jaegá jaegí
		
		Exhibition = mkInvObjNP "प्रदर्शनी" Fem; --pradarxaní
		Conference = mkInvObjNP "सम्मेलन" Masc; --sammelan
		Car = mkInvObjNP "गाड़ी" Fem; --gharí
		House = mkInvObjNP "घर" Masc; --ghar
		Agreement = mkObjNP "समझौता" "समझौते" Masc; --samajhauta, samajhaute par
		
		ThisMorning = {s = "आज सुबह"; t = Pf; sc = Erg}; --áj subah
		ThisEvening = {s = "आज शाम"; t = Fut; sc = Abs}; --áj xám
		TodayBefore = {s = "आज"; t = Pf; sc = Erg}; --áj
		TodayAfter = {s = "आज"; t = Fut; sc = Abs};
		Tomorrow = {s = "कल"; t = Fut; sc = Abs}; --kal
		Yesterday = {s = "कल"; t = Pas; sc = Erg};
		NextWeek = {s = "अगले हफ़्ते"; t = Fut; sc = Abs}; --agle hafte
		LastWeek = {s = "पिछले हफ़्ते"; t = Pas; sc = Erg}; --pichle hafte
		DayBeforeYest = {s = "परसों"; t = Pas; sc = Erg}; --parsô
		DayAfterTom = {s = "परसों"; t = Fut; sc = Abs};
		ThreeDaysAgo = {s = "तीन दिन पहले"; t = Pas; sc = Erg}; --tín din pahle
		InThreeDays = {s = "तीन दिन में"; t = Fut; sc = Abs}; --tín din mê
		AMomentAgo = {s = "एक क्षण पहले"; t = Pf; sc = Erg}; --ek kshaN pahle
		
		MonBef = {s = "सोमवार को"; t = Pas; sc = Erg}; --somvár ko
		TueBef = {s = "मंगलवार को"; t = Pas; sc = Erg}; --manglavár ko
		WedBef = {s = "बुधवार को"; t = Pas; sc = Erg}; --budhvár ko
		ThuBef = {s = "गुरुवार को"; t = Pas; sc = Erg}; --guruvár ko
		FriBef = {s = "शुक्रवार को"; t = Pas; sc = Erg}; --xukravár ko
		SatBef = {s = "शनिवार को"; t = Pas; sc = Erg}; --xanivár ko
		SunBef = {s = "रविवार को"; t = Pas; sc = Erg}; --ravivár ko
		
		MonAft = {s = "सोमवार को"; t = Fut; sc = Abs};
		TueAft = {s = "मंगलवार को"; t = Fut; sc = Abs};
		WedAft = {s = "बुधवार को"; t = Fut; sc = Abs};
		ThuAft = {s = "गुरुवार को"; t = Fut; sc = Abs};
		FriAft = {s = "शुक्रवार को"; t = Fut; sc = Abs};
		SatAft = {s = "शनिवार को"; t = Fut; sc = Abs};
		SunAft = {s = "रविवार को"; t = Fut; sc = Abs};
		
		HiddenPas = {t = Pas; sc = Erg};
		HiddenPf = {t = Pf; sc = Erg};
		HiddenFut = {t = Fut; sc = Abs};
		
		inMadrid = {s = "मैड्रिड में"}; --madrid mê
		inBarcelona = {s = "बार्सिलोना में"}; --bársiloná mê
		atHotel = {s = "एक होटल में"}; --ek hoTal mê
		inCityCenter = {s = "शहर के केंद्र में"}; --xahar ke kendr mê
		atNationalPalace = {s = "राष्ट्रीय पैलेस में "}; --rastriy pailes mê
		inFrance = {s = "फ्रांस में"}; --phrans mê
		inChina = {s = "चीन में"}; --cín mê
		inUS = {s = "अमेरीका में"}; --ameríka mê
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Abs | Erg | Comit; --oblicuous case not necessary by now
		ObjNPCase =  Abs_ | DefAcc | Par;  
		Gender = Masc | Fem;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str; g : Gender};
		ObjNPType : Type = {s : ObjNPCase => Str; g : Gender};
		mkInvPersNP: Str -> Gender -> PersNPType = \w, gen -> {s = table {Abs => w; Erg => w++"ने"; Comit => w++"से"}; g = gen};
		mkInvObjNP: Str -> Gender -> ObjNPType = \w, gen -> {s = table {Abs_ => w; DefAcc => w++"को"; Par => w++"पर"}; g = gen};
		mkObjNP: Str -> Str -> Gender -> ObjNPType = \w, obl, gen -> {s = table {Abs_ => w; DefAcc => obl++"को"; Par => obl++"पर"}; g = gen};

		VType : Type = {s : Time => Gender => Str};
		PersVType : Type = {s : Time => Str};
		mkV : Str -> Str -> Str -> Str -> VType = \pm,pf,fm,ff -> {s = table {Pas => table {Masc => pm; Fem => pf}; 
															Pf => table{Masc => pm++"है"; Fem => pf++"है"} ; 
															Fut => table {Masc => fm; Fem => ff} }};
		mkV :  Str -> Str -> Str -> Str -> VType = \pm,pf,fm,ff -> {s = table {Pas => table {Masc => pm; Fem => pf}; 
															Pf => table{Masc => pm++"है"; Fem => pf++"है"} ; 
															Fut => table {Masc => fm; Fem => ff} }};
		mkInvV : Str -> Str -> PersVType = \p,f -> {s = table{Pas => p; Pf => p++"है"; Fut => f}};
}