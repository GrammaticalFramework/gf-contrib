--TODO: add feminine forms
concrete headlinesPol of headlines = {
	lincat 
		Headline = Str;
		PersNP = {s : PersNPCase => Str};
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str; p : Participation};
		GoV= {s: Participation => TimeCase => Str};
		GenTrV, OpenV, WriteV, PersV, WithV = {s : TimeCase => Str};
		ChgV = {s : Str};	
		TimeAdv = {s : Str; t : TimeCase};
		HiddenTime = {t: TimeCase};
		PlaceAdv = {s : Str};


	lin
		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = ta.s ++ p.s ! Nom ++ v.s ! ta.t ++ o.s;
		headlineGenTimePlace p v o ta pa = ta.s ++p.s ! Nom ++ v.s ! ta.t ++ o.s ++ pa.s;
		headlineOpen p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s ! Acc_;
		headlineOpenTime p v o ta = ta.s++ p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_;
		headlineOpenTimePlace p v o ta pa = ta.s ++ p.s ! Nom ++ v.s ! ta.t ++ o.s ! Acc_ ++  pa.s;
		headlineChg v p = p.s ! Nom ++ "nie żyje";
		headlineChgPlace v p pa = pa.s ++ v.s ++ p.s ! Nom;
		headlineWithTime p v p2 ta = ta.s ++ p.s ! Nom ++v.s ! ta.t ++ p2.s ! Comit ;
		headlineWithTimePlace p v p2 ta pa = ta.s ++p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ pa.s;
		headlinePersTime p v p2 ta = ta.s ++ p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc;
		headlinePersTimePlace p v p2 ta pa = ta.s ++ p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Acc ++  pa.s;
		headlineGoTime p v o ta = ta.s ++ p.s ! Nom ++ v.s! o.p! ta.t ++ o.s ! Loc; 
		headlineGoTimePlace p v o ta pa = ta.s ++ p.s ! Nom ++ v.s! o.p! ta.t ++ o.s ! Loc ++  pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = ta.s ++ p.s ! Nom ++ v.s ! ta.t ++ o.s;
		
		King = {s = table {Nom => "król"; Acc => "króla"; Comit => "z królem"}};	
		President = {s = table {Nom => "prezydent"; Acc => "prezydenta"; Comit => "z prezydentem"}};	
		LeaderSP = {s = table {Nom => "lider partii socjalistycznej"; Acc => "lidera partii socjalistycznej"; Comit => "z liderem partii socjalistycznej"}};	
		MinisterFA = {s = table {Nom => "minister spraw zagranicznych"; Acc => "ministra spraw zagranicznych"; Comit => "z Ministrem Spraw Zagranicznych"}};	
		Judge = {s = table {Nom => "sędzia"; Acc => "sędziego"; Comit => "z sędzią"}};	
		Singer = {s = table {Nom => "piosenkarz"; Acc => "piosenkarza"; Comit => "z piosenkarzem"}};	
		Actor = {s = table {Nom => "aktor"; Acc => "aktora"; Comit => "z aktorem"}};	
		
		Inaugurate = {s = table {Pf => "zainaugurował"; Fut => "zainauguruje"}};
		Buy = {s = table {Pf => "kupił"; Fut => "kupi"}};
		Die = {s = "zmarł"};
		Meet = {s = table {Pf => "spotkał się"; Fut => "spotka się"}};
		Talk = {s = table {Pf => "rozmawiał"; Fut => "będzie rozmawiać"}};
		Support = {s = table {Pf => "poparł"; Fut => "poprze"}};
		Receive = {s = table {Pf => "przyjął"; Fut => "przyjmie"}};
		Criticize = {s = table {Pf => "skrytykował"; Fut => "skrytykuje"}};
		Sign = {s = table {Pf => "podpisał"; Fut => "podpisze"}};
		Attend = {s = table {Aur=>  table {Pf => "uczestniczył w"; Fut => "uczestniczy w"};
							Vis=> table {Pf=> "był obecny"; Fut=>"będzie obecny"}};};
		--TODO: "zwiedził wystawę" is a better option but requires an object in the Acc case

		Exhibition = {s = table {Nom_ => "wystawa"; Acc_ => "wystawę"; Loc => "na wystawie"}; p= Vis};
		Conference = {s = table {Nom_ => "konferencja"; Acc_ => "konferencję"; Loc => "konferencji"}; p=Aur};

		Car = {s = "samochód"}; 
		House = {s = "dom"};
		Agreement = {s = "umowę"}; 

		ThisMorning = {s = "rano"; t = Pf};
		ThisEvening = {s = "wieczorem"; t = Fut};
		TodayBefore = {s = "dziś"; t = Pf};
		TodayAfter = {s = "dziś"; t = Fut};
		Tomorrow = {s = "jutro"; t = Fut};
		Yesterday = {s = "wczoraj"; t = Pf};
		NextWeek = {s = "w przyszłym tygodniu"; t = Fut};
		LastWeek = {s = "w zeszłym tygodniu"; t = Pf};
		DayBeforeYest = {s = "przedwczoraj"; t = Pf};
		DayAfterTom = {s = "pojutrze"; t = Fut};
		ThreeDaysAgo = {s = "trzy dni temu"; t = Pf};
		InThreeDays = {s = "za trzy dni"; t = Fut}; 
		AMomentAgo = {s = "z ostatniej chwili: "; t = Pf};

		MonBef = {s = "w poniedziałek"; t = Pf};
		TueBef = {s = "we wtorek"; t = Pf};
		WedBef = {s = "w środę"; t = Pf};
		ThuBef = {s = "w czwartek"; t = Pf};
		FriBef = {s = "w piątek"; t = Pf};
		SatBef = {s = "w sobotę"; t = Pf};
		SunBef = {s = "w niedzielę"; t = Pf};

		MonAft = {s = "w poniedziałek"; t = Fut};
		TueAft = {s = "we wtorek"; t = Fut};
		WedAft = {s = "w środę"; t = Fut};
		ThuAft = {s = "w czwartek"; t = Fut};
		FriAft = {s = "w piątek"; t = Fut};
		SatAft = {s = "w sobotę"; t = Fut};
		SunAft = {s = "w niedzielę"; t = Fut};

		HiddenPas = {t = Pf};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "w Madrydzie"};
		inBarcelona = {s = "w Barcelonie"};
		atHotel = {s = "w hotelu"};
		inCityCenter = {s = "w śródmieściu"};
		atNationalPalace = {s = "w Pałacu Narodowym"};
		inFrance = {s = "we Francji"};
		inChina = {s = "w Chinach"};
		inUS = {s = "w Stanach Zjednaczonych"};
		
	param
		TimeCase = Pf | Fut ;
		PersNPCase = Nom | Acc | Comit;
		PlaceNPCase =  Nom_ | Acc_ | Loc;
		Participation= Vis | Aur;
}



