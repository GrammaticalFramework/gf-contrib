concrete headlinesTgl of headlines = {
	lincat 
		Headline = Str;
		PersNP, ObjNP, DocNP, PlaceNP = Noun;
		GenTrV, OpenV, GoV, WithV, WriteV, PersV = VType;
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t : Time};
		PlaceAdv = {s : Str};

	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = v.s ! h.t ++ p.s ! v.sc ++ o.s ! v.oc;
		headlineGenTime p v o ta = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s;
		headlineGenTimePlace p v o ta pa = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s ++ pa.s;
		headlineOpen p v o h = v.s ! h.t ++ p.s ! v.sc ++ o.s ! v.oc;
		headlineOpenTime p v o ta = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s;
		headlineOpenTimePlace p v o ta pa = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! Ang;
		headlineChgPlace v p pa = v.s ++ p.s ! Ang ++ pa.s;
		headlineWithTime p v p2 ta = v.s ! ta.t ++ p.s ! v.sc ++ p2.s ! v.oc ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = v.s ! ta.t ++ p.s ! v.sc ++ p2.s ! v.oc ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = v.s ! ta.t ++ p.s ! v.sc ++ p2.s ! v.oc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = v.s ! ta.t ++ p.s ! v.sc ++ p2.s ! v.oc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s;
		headlineGoTimePlace p v o ta pa = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s ++ pa.s;
		headlineWrite p v o h = v.s ! h.t ++ p.s ! v.sc ++ o.s ! v.oc;
		headlineWriteTime p v o ta = v.s ! ta.t ++ p.s ! v.sc ++ o.s ! v.oc ++ ta.s;
		
		King = mkN "hari";
		President = mkN "pangulo";
		LeaderSP = mkN "pinuno ng partidong sosyalista";
		MinisterFA = mkN "ministro ng ugnayang panlabas";
		Judge = mkN "hukom";
		Singer = mkN "manganganta";
		Actor = mkN "artista";
		
		Inaugurate = mkV "pinasinayaan" "papasinayaan" Ng Ang;
		Buy = mkV "bumili" "bibili" Ang Ng;
		Die = {s = "namatay"};
		Meet = mkV "nakitagpo" "makikitagpo" Ang Sa;
		Talk = mkV "nakipag-usap" "makikipag-usap" Ang Sa;
		Support = mkV "sinuportahan" "susuportahan" Ng Ang;
		Receive = mkV "tinanggap" "tatanggapin" Ang Ng;
		Criticize = mkV "binatikos" "maaaring batikusin" Ang Ng;
		Sign = mkV "pumirma" "pipirma" Ang Sa;
		Attend = mkV "dumalo" "dadalo" Ang Sa;
		
		Exhibition = mkN "tanghalan";
		Conference = mkN "pagpupulong";
		Car = mkN "kotse";
		House = mkN "bahay";
		Agreement = mkN "kasunduan";
		
		ThisMorning = {s = "kaninang umaga"; t = Pas};
		ThisEvening = {s = "mamayang gabi"; t = Fut};
		TodayBefore = {s = "ngayon"; t = Pas};
		TodayAfter = {s = "ngayon"; t = Fut};
		Tomorrow = {s = "bukas"; t = Fut};
		Yesterday = {s = "kahapon"; t = Pas};
		NextWeek = {s = "sa susunod na linggo"; t = Fut};
		LastWeek = {s = "sa nakaraang linggo" | "noong isang linggo"; t = Pas};
		DayBeforeYest = {s = "kamakalawa"; t = Pas};
		DayAfterTom = {s = "sa makalawa"; t = Fut};
		ThreeDaysAgo = {s = "noong tatlong araw"; t = Pas};
		InThreeDays = {s = "sa tatlong araw"; t = Fut};
		AMomentAgo = {s = "noong isang sandali lang"; t = Pas};
		
		MonBef = {s = "noong Lunes"; t = Pas};
		TueBef = {s = "noong Martes"; t = Pas};
		WedBef = {s = "noong Miyerkules"; t = Pas};
		ThuBef = {s = "noong Huwebes"; t = Pas};
		FriBef = {s = "noong Biyernes"; t = Pas};
		SatBef = {s = "noong Sabado"; t = Pas};
		SunBef = {s = "noong Linggo"; t = Pas};
		
		MonAft = {s = "sa Lunes"; t = Fut};
		TueAft = {s = "sa Martes"; t = Fut};
		WedAft = {s = "sa Miyerkules"; t = Fut};
		ThuAft = {s = "sa Huwebes"; t = Fut};
		FriAft = {s = "sa Biyernes"; t = Fut};
		SatAft = {s = "sa Sabado"; t = Fut};
		SunAft = {s = "sa Linggo"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
				
		inMadrid = {s = "sa Madrid"};
		inBarcelona = {s = "sa Barcelona"};
		atHotel = {s = "sa isang hotel"};
		inCityCenter = {s = "sa sentro ng lungsod"};
		atNationalPalace = {s = "sa Pambansang Palasyo"};
		inFrance = {s = "sa Pransiya"};
		inChina = {s = "sa Tsina"};
		inUS = {s = "sa Estados Unidos"};
				
	param
		Time = Pas | Fut;
		Case = Ang | Ng | Sa; --named after the three 'articles' or markers in Tagalog

		
	oper
		Noun : Type = {s : Case => Str};
		mkN: Str -> Noun = \w -> {s = table {Ang => "ang"++w; Ng => "ng"++w; Sa => "sa"++w}};
		VType : Type = {s : Time => Str; sc : Case; oc : Case}; --sc: subject case, oc: object case
		mkV : Str -> Str -> Case -> Case -> VType = \p, f, c1, c2 -> {s = table {Pas => p; Fut => f}; sc = c1; oc = c2};
}