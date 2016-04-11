concrete headlinesLav of headlines = {
	lincat
		Headline = Str;
		PersNP = {s : PersNPCase => Str};
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WriteV, PersV, WithV = {s : Time => Str};
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t: Time};
		PlaceAdv = {s : Str};
	lin
		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ o.s;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ v.s ! ta.t ++ o.s;
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! Acc_;
		headlineOpenTime p v o ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ o.s ! Acc_;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ v.s ! ta.t ++ o.s ! Acc_;
		headlineChg v p = v.s ++ p.s ! Nom;
		headlineChgPlace v p pa =  pa.s ++ v.s ++ p.s ! Nom;
		headlineWithTime p v p2 ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ p2.s ! Comit;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ v.s ! ta.t ++ p2.s ! Comit;
		headlinePersTime p v p2 ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ p2.s ! Acc;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ ta.s ++ pa.s ++ v.s ! ta.t ++ p2.s ! Acc;
		headlineGoTime p v o ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ o.s ! Loc;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ o.s ! Loc ++ pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! Nom ++ ta.s ++ v.s ! ta.t ++ o.s;

		King = {s = table {Nom => "karalis"; Acc => "karali"; Comit => "ar karali"}};
		President = {s = table {Nom => "prezidents"; Acc => "prezidentu"; Comit => "ar prezidentu"}};
		LeaderSP = {s = table {Nom => "sociālistiskās partijas vadītājs"; Acc => "sociālistiskās partijas vadītāju"; Comit => "ar sociālistiskās partijas vadītāju"}};
		MinisterFA = {s = table {Nom => "ārlietu ministrs"; Acc => "ārlietu ministru"; Comit => "ar ārlietu ministru"}};
		Judge = {s = table {Nom => "tiesnesis"; Acc => "tiesnesi"; Comit => "ar tiesnesi"}};
		Singer = {s = table {Nom => "dziedātājs"; Acc => "dziedātāju"; Comit => "ar dziedātāju"}};
		Actor = {s = table {Nom => "aktieris"; Acc => "aktieri"; Comit => "ar aktieri"}};

		Inaugurate = {s = table {Pf => "atklāja"; Fut => "atklās"}};
		Buy = {s = table {Pf => "nopirka"; Fut => "pirks"}};
		Die = {s = "miris"};
		Meet = {s = table {Pf => "tikās"; Fut => "tiksies"}};
		Talk = {s = table {Pf => "runāja"; Fut => "runās"}};
		Support = {s = table {Pf => "atbalstīja"; Fut => "atbalstīs"}};
		Receive = {s = table {Pf => "pieņēma"; Fut => "pieņems"}};
		Criticize = {s = table {Pf => "kritizēja"; Fut => "varētu kritizēt"}};
		Sign = {s = table {Pf => "parakstīja"; Fut => "parakstīs"}};
		Attend = {s = table {Pf => "devās"; Fut => "dosies"}}; -- should be 'apmeklēt', but this verb has an "incompatible" valence

		Exhibition = {s = table {Nom_ => "izstāde"; Acc_ => "izstādi"; Loc => "uz izstādi"}};
		Conference = {s = table {Nom_ => "konference"; Acc_ => "konferenci"; Dat => "uz konferenci"}};
		Car = {s = "automašīnu"};
		House = {s = "māju"};
		Agreement = {s = "vienošanos"};

		ThisMorning = {s = "šorīt"; t = Pf};
		ThisEvening = {s = "šovakar"; t = Fut};
		TodayBefore = {s = "šodien"; t = Pf};
		TodayAfter = {s = "šodien"; t = Fut};
		Tomorrow = {s = "rīt"; t = Fut};
		Yesterday = {s = "vakar"; t = Pf};
		NextWeek = {s = "nākamnedēļ"; t = Fut};
		LastWeek = {s = "pagājušajā nedēļā"; t = Pf};
		DayBeforeYest = {s = "aizvakar"; t = Pf};
		DayAfterTom = {s = "parīt"; t = Fut};
		ThreeDaysAgo = {s = "pirms trīs dienām"; t = Pf};
		InThreeDays = {s = "pēc trīs dienām"; t = Fut};
		AMomentAgo = {s = "pirms brīža"; t = Pf};

		MonBef = {s = "pirmdien"; t = Pf};
		TueBef = {s = "otrdien"; t = Pf};
		WedBef = {s = "trešdien"; t = Pf};
		ThuBef = {s = "ceturtdien"; t = Pf};
		FriBef = {s = "piektdien"; t = Pf};
		SatBef = {s = "sestdien"; t = Pf};
		SunBef = {s = "svētdien"; t = Pf};

		MonAft = {s = "pirmdien"; t = Fut};
		TueAft = {s = "otrdien"; t = Fut};
		WedAft = {s = "trešdien"; t = Fut};
		ThuAft = {s = "ceturtdien"; t = Fut};
		FriAft = {s = "piektdien"; t = Fut};
		SatAft = {s = "sestdien"; t = Fut};
		SunAft = {s = "svētdien"; t = Fut};

		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};

		inMadrid = {s = "Madridē"};
		inBarcelona = {s = "Barselonā"};
		atHotel = {s = "viesnīcā"};
		inCityCenter = {s = "pilsētas centrā"};
		atNationalPalace = {s = "Nacionālajā pilī"};
		inFrance = {s = "Francijā"};
		inChina = {s = "Ķīnā"};
		inUS = {s = "ASV"};

	param
		Time = Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = Nom_ | Acc_ | Loc;

}