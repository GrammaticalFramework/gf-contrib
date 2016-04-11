concrete headlinesRus of headlines = {
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
		headlineGenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! Acc_;
		headlineOpenTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! Nom;
		headlineChgPlace v p pa = pa.s ++ v.s ++ p.s ! Nom;
		headlineWithTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Loc ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Loc ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = {s = table {Nom => "король"; Acc => "короля"; Comit => "с королем"}};	
		President = {s = table {Nom => "президент"; Acc => "президента"; Comit => "с президентом"}};	
		LeaderSP = {s = table {Nom => "лидер социалистической партии"; Acc => "лидера социалистической партии"; Comit => "с лидером социалистической партии"}};	
		MinisterFA = {s = table {Nom => "министр иностранных дел"; Acc => "министра иностранных дел"; Comit => "с министром иностранных дел"}};	
		Judge = {s = table {Nom => "судья"; Acc => "судью"; Comit => "с судьей"}};	
		Singer = {s = table {Nom => "певец"; Acc => "певца"; Comit => "с певцом"}};	
		Actor = {s = table {Nom => "актер"; Acc => "актера"; Comit => "с актером"}};	
		
		Inaugurate = {s = table {Pf => "открыл"; Fut => "откроет"}};
		Buy = {s = table {Pf => "купил"; Fut => "купит"}};
		Die = {s = "умер"};
		Meet = {s = table {Pf => "встретился"; Fut => "встретится"}};
		Talk = {s = table {Pf => "поговорил"; Fut => "будет говорить"}};
		Support = {s = table {Pf => "поддержал"; Fut => "поддержит"}};
		Receive = {s = table {Pf => "принял"; Fut => "примет"}};
		Criticize = {s = table {Pf => "критиковал"; Fut => "мог бы критиковать"}};
		Sign = {s = table {Pf => "подписал"; Fut => "подпишет"}};
		Attend = {s = table {Pf => "присутствовал"; Fut => "будет присутствовать"}};
		
		Exhibition = {s = table {Nom_ => "выставка"; Acc_ => "выставку"; Loc => "на выставке"}};
		Conference = {s = table {Nom_ => "конференция"; Acc_ => "конференцию"; Dat => "на конференции"}};
		Car = {s = "машину"};
		House = {s = "дом"};
		Agreement = {s = "соглашение"};
		
		ThisMorning = {s = "сегодня утром"; t = Pf};
		ThisEvening = {s = "сегодня вечером"; t = Fut};
		TodayBefore = {s = "сегодня"; t = Pf};
		TodayAfter = {s = "сегодня"; t = Fut};
		Tomorrow = {s = "завтра"; t = Fut};
		Yesterday = {s = "вчера"; t = Pf};
		NextWeek = {s = "на следующей неделе"; t = Fut};
		LastWeek = {s = "на прошлой неделе"; t = Pf};
		DayBeforeYest = {s = "позавчера"; t = Pf};
		DayAfterTom = {s = "послезавтра"; t = Fut};
		ThreeDaysAgo = {s = "три дня назад"; t = Pf};
		InThreeDays = {s = "через три дня"; t = Fut};
		AMomentAgo = {s = "момент назад"; t = Pf};
		
		MonBef = {s = "в понедельник"; t = Pf};
		TueBef = {s = "во вторник"; t = Pf};
		WedBef = {s = "в среду"; t = Pf};
		ThuBef = {s = "в четверг"; t = Pf};
		FriBef = {s = "в пятницу"; t = Pf};
		SatBef = {s = "в субботу"; t = Pf};
		SunBef = {s = "в воскресенье"; t = Pf};
		
		MonAft = {s = "в понедельник"; t = Fut};
		TueAft = {s = "во вторник"; t = Fut};
		WedAft = {s = "в среду"; t = Fut};
		ThuAft = {s = "в четверг"; t = Fut};
		FriAft = {s = "в пятницу"; t = Fut};
		SatAft = {s = "в субботу"; t = Fut};
		SunAft = {s = "в воскресенье"; t = Fut};
		
		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "в Мадриде"};
		inBarcelona = {s = "в Барселоне"};
		atHotel = {s = "в гостинице"};
		inCityCenter = {s = "в центре города"};
		atNationalPalace = {s = "в Националном Дворце"};
		inFrance = {s = "во Франции"};
		inChina = {s = "в Китае"};
		inUS = {s = "в Соединенных Штатах"};
		
	param
		Time = Pf | Fut;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase = Nom_ | Acc_ | Loc;

}