concrete headlinesQue of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WithV, WriteV = VType;
		PersV = {s : Time => Str; rc : PersNPCase}; --rc: required case
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t : Time};
		PlaceAdv = {s : Str};
	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! Topic ++ o.s ++ v.s ! h.t;
		headlineGenTime p v o ta = p.s ! Topic ++ ta.s ++ o.s ++ v.s ! ta.t;
		headlineGenTimePlace p v o ta pa = p.s ! Topic ++ ta.s ++ pa.s ++ o.s ++ v.s ! ta.t;
		headlineOpen p v o h = p.s ! Topic ++ o.s ! Acc_ ++ v.s ! h.t;
		headlineOpenTime p v o ta = p.s ! Topic ++ ta.s ++ o.s ! Acc_ ++ v.s ! ta.t;
		headlineOpenTimePlace p v o ta pa = p.s ! Topic ++ ta.s ++ pa.s ++ o.s ! Acc_ ++ v.s ! ta.t;
		headlineChg v p = v.s ++ p.s ! Nom;
		headlineChgPlace v p pa = v.s ++ p.s ! Nom ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! Topic ++ ta.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlineWithTimePlace p v p2 ta pa = p.s ! Topic ++ ta.s ++ pa.s ++ p2.s ! Comit ++ v.s ! ta.t;
		headlinePersTime p v p2 ta = p.s ! Topic ++ ta.s ++ p2.s ! v.rc ++ v.s ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! Topic ++ ta.s ++ pa.s ++ p2.s ! v.rc ++ v.s ! ta.t;
		headlineGoTime p v o ta = p.s ! Topic ++ ta.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineGoTimePlace p v o ta pa = p.s ! Topic ++ ta.s ++ pa.s ++ o.s ! Dir ++ v.s ! ta.t;
		headlineWrite p v o h = p.s ! Topic ++ o.s ++ v.s ! h.t;
		headlineWriteTime p v o ta = p.s ! Topic ++ ta.s ++ o.s ++ v.s ! ta.t;
		
		King = mkPersNP "qhapaq";
		President = mkPersNP "umalliq";
		LeaderSP = mkPersNP "partidu susyalistaq kamachiqñin";
		MinisterFA = mkPersNP "hawa yuyanakunaq ministrun";
		Judge = mkPersNP "taripakuq";
		Singer = mkPersNP "takiq";
		Actor = mkPersNP "aranwaq";
		
		Inaugurate = mkV "kicha";
		Buy = mkV "ranti";
		Die = {s = "wañurqan"};
		Meet = mkV "huñuku";
		Talk = mkV "rima";
		Support = {s = table {Pas => "llank'arqan"; Pf => "llank'an"; Fut => "llank'anqa"}; rc = For};
		Receive = {s = table {Pas => "chaskirqan"; Pf => "chaskin"; Fut => "chaskinqa"}; rc = Acc};
		Criticize = {s = table {Pas => "mana allinta rimarqanchu"; Pf => "mana allinta rimanchu"; Fut => "mana allinta rimanmanchu"}; rc = About};
		Sign = mkV "suti silq'u";
		Attend = mkV "ri";
		
		Exhibition = {s = table {Nom_ => "ikspusisyun"; Acc_ => "ikspusisyunta"; Dir => "ikspusisyunman"}};
		Conference = {s = table {Nom_ => "huñunakuy"; Acc_ => "huñunakuyta"; Dir => "huñunakuyman"}};
		Car = {s = "huk awtuta"};
		House = {s = "huk wasita"};
		Agreement = {s = "rimanakuyta"};
		
		ThisMorning = {s = "tutamantan"; t = Pf};
		ThisEvening = {s = "ch'isimantan"; t = Fut};
		TodayBefore = {s = "kunan p'unchay"; t = Pf};
		TodayAfter = {s = "kunan p'unchay"; t = Fut};
		Tomorrow = {s = "paqarin"; t = Fut};
		Yesterday = {s = "qayna"; t = Pas};
		NextWeek = {s = "q'aya simana"; t = Fut};
		LastWeek = {s = "qayna simana"; t = Pas};
		DayBeforeYest = {s = "iskay p'unchayña"; t = Pas};
		DayAfterTom = {s = "mincha"; t = Fut};
		ThreeDaysAgo = {s = "kimsa p'unchayña"; t = Pas};
		InThreeDays = {s = "kimsa p'unchaymantawan"; t = Fut};
		AMomentAgo = {s = "ñaqha"; t = Pf};
		
		MonBef = {s = "lunista"; t = Pas};
		TueBef = {s = "martista"; t = Pas};
		WedBef = {s = "mirkulista"; t = Pas};
		ThuBef = {s = "huywista"; t = Pas};
		FriBef = {s = "wirnista"; t = Pas};
		SatBef = {s = "sawaruta"; t = Pas};
		SunBef = {s = "duminguta"; t = Pas};
		
		MonAft = {s = "lunista"; t = Fut};
		TueAft = {s = "martista"; t = Fut};
		WedAft = {s = "mirkulista"; t = Fut};
		ThuAft = {s = "huywista"; t = Fut};
		FriAft = {s = "wirnista"; t = Fut};
		SatAft = {s = "sawaruta"; t = Fut};
		SunAft = {s = "duminguta"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pf};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "Madrid llaqtapi"};
		inBarcelona = {s = "Barsiluna llaqtapi"};
		atHotel = {s = "huk qurpa wasipi"};
		inCityCenter = {s = "llaqta chawpinpi"};
		atNationalPalace = {s = "Llaqtaq Kanchanpi"};
		inFrance = {s = "Phransya suyupi"};
		inChina = {s = "China suyupi"};
		inUS = {s = "Hukllachasqa Suyukunapi"};
		
	param
		Time = Pas | Pf | Fut;
		PersNPCase = Nom | Topic | Acc | Comit | For | About;
		PlaceNPCase = Nom_ | Acc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Nom => w; Topic => w+"qa"; Acc => w+"ta"; Comit => w+"wan"; For => w+"rayku"; About => w+"manta"}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => v+"rqan"; Pf => v+"n"; Fut => v+"nqa"}};
}