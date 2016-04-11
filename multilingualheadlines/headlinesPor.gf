concrete headlinesPor of headlines = {
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
		headlineGen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineGenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s ! NomAcc_;
		headlineOpenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s;
		headlineOpenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! NomAcc;
		headlineChgPlace v p pa = v.s ++ p.s ! NomAcc ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! Dir ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "rei";
		President = mkPersNP "presidente";
		LeaderSP = mkPersNP "líder do partido socialista";
		MinisterFA = mkPersNP "ministro dos negócios estrangeiros";
		Judge = mkPersNP "juiz";
		Singer = mkPersNP "cantor";
		Actor = mkPersNP "ator";	
		
		Inaugurate = mkV "inaugur";
		Buy = mkV "compr";
		Die = {s = "morreu"};
		Meet = {s = table {Pas => "se reuniu"; Fut => "se reunirá"}};
		Talk = mkV "fal";
		Support = mkV "apoi";
		Receive = {s = table {Pas => "recebeu"; Fut => "receberá"}};
		Criticize = {s = table {Pas => "criticou"; Fut => "poderia criticar"}};
		Sign = mkV "assin";
		Attend = {s = table {Pas => "assistiu"; Fut => "assistirá"}};
		
		Exhibition = {s = table {NomAcc_ => "a exposição"; Dir => "à exposição"}};
		Conference = {s = table {NomAcc_ => "a conferência"; Dir => "à conferência"}};
		Car = {s = "um carro"};
		House = {s = "uma casa"};
		Agreement = {s = "o acordo"};
		
		ThisMorning = {s = "esta manhã"; t = Pas};
		ThisEvening = {s = "esta tarde"; t = Fut};
		TodayBefore = {s = "hoje"; t = Pas};
		TodayAfter = {s = "hoje"; t = Fut};
		Tomorrow = {s = "amanhã"; t = Fut};
		Yesterday = {s = "ontem"; t = Pas};
		NextWeek = {s = "na próxima semana" | "na semana que vem"; t = Fut};
		LastWeek = {s = "na semana passada"; t = Pas};
		DayBeforeYest = {s = "anteontem"; t = Pas};
		DayAfterTom = {s = "depois de amanhã"; t = Fut};
		ThreeDaysAgo = {s = "há três dias"; t = Pas};
		InThreeDays = {s = "em três dias"; t = Fut};
		AMomentAgo = {s = "há pouco"; t = Pas};
		
		MonBef = {s = "na segunda-feira"; t = Pas};
		TueBef = {s = "na terça-feira"; t = Pas};
		WedBef = {s = "na quarta-feira"; t = Pas};
		ThuBef = {s = "na quinta-feira"; t = Pas};
		FriBef = {s = "na sexta-feira"; t = Pas};
		SatBef = {s = "no sábado"; t = Pas};
		SunBef = {s = "no domingo"; t = Pas};
		
		MonAft = {s = "na segunda-feira"; t = Fut};
		TueAft = {s = "na terça feira"; t = Fut};
		WedAft = {s = "na quarta-feira"; t = Fut};
		ThuAft = {s = "na quinta-feira"; t = Fut};
		FriAft = {s = "na sexta-feira"; t = Fut};
		SatAft = {s = "no sábado"; t = Fut};
		SunAft = {s = "no domingo"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "em Madrid"};
		inBarcelona = {s = "em Barcelona"};
		atHotel = {s = "em um hotel"};
		inCityCenter = {s = "no centro da cidade"};
		atNationalPalace = {s = "no Palácio Nacional"};
		inFrance = {s = "na França"};
		inChina = {s = "na China"};
		inUS = {s = "nos Estados Unidos"};
		
	param
		Time = Pas | Fut;
		PersNPCase = NomAcc | Comit;
		PlaceNPCase = NomAcc_ | Dir;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => "o"++w; Comit => "com o"++w}};
		VType : Type = {s : Time => Str};
		mkV : Str -> VType = \v -> {s = table {Pas => v+"ou"; Fut => v+"ará"}};
}