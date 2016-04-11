concrete headlinesHeb of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP = {s : Str};
		PlaceNP = {s : PlaceNPCase => Str};
		GenTrV, OpenV, GoV, WithV, WriteV = VType;
		PersV = PersVType;
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
		headlineChg v p = p.s ! Nom ++ v.s;
		headlineChgPlace v p pa =  p.s ! Nom ++ v.s ++ pa.s;
		headlineWithTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! Comit ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = p.s ! Nom ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Loc_ ++ ta.s;
		headlineGoTimePlace p v o ta pa = p.s ! Nom ++ v.s ! ta.t ++ o.s ! Loc_ ++ ta.s ++ pa.s;
		headlineWrite p v o h = p.s ! Nom ++ v.s ! h.t ++ o.s;
		headlineWriteTime p v o ta = p.s ! Nom ++ v.s ! ta.t ++ o.s ++ ta.s;
		
		King = mkPersNP "מלך"; --meleJ
		President = mkPersNP "נשיא"; --naSi'
		LeaderSP = mkPersNPCompl "מנהיג המפלגה הסוציאליסטית"; --manhig ha-miflagah ha-sotsi'alistit
		MinisterFA = mkPersNPCompl "שר החוץ"; --xar ha-jutz
		Judge = mkPersNP "שופט"; --xofeT
		Singer = mkPersNP "זמר"; --zammar
		Actor = mkPersNP "שחקן"; --xajqan	
		
		Inaugurate = mkV "חנך" "יחנוך"; --janaJ ?yijnoJ 
		Buy = mkV "קנה" "יקנה";  --qanah yiqneh
		Die = {s = "מת"}; --met (s-v)
		Meet = mkV "נפגש" "יפגש"; --nifgax (ºim) yipagex
		Talk = mkV "דיבר" "ידבר"; --diber yedaber
		Support = mkPersV "תמך" "יתמוך" Loc; --tamaJ (b-) yitmoJ
		Receive = mkPersV "קיבל" "יקבל" Acc; --qibel yeqabel
		Criticize = mkPersV "מתח ביקורת על" "הוא לבקר את" Nom; --matah biqoret ºal, ho' lebiqer 'et
		Sign = mkV "חתם על" "יחתום על"; --jatam ºal, yitjom ºal
		Attend = mkV "השתתף" "השתתף"; --hixtatef (b-) fut igual?
		
		Exhibition = {s = table {Acc_ => "את התערוכה"; Loc_ => "בתערוכה"}}; --ha-taºaruJah
		Conference = {s = table {Acc_ => "את הכנס"; Loc_ => "בכנס"}}; --ha-kenes
		Car = {s = "מכונית"}; --mJonit
		House = {s = "בית"}; --bayt
		Agreement = {s = "ההסכם"}; --ha-heskem
		
		ThisMorning = {s = "הבוקר"; t = Pas}; --ha-boqer
		ThisEvening = {s = "הערב"; t = Fut}; --ha-ºereb
		TodayBefore = {s = "היום"; t = Pas}; --ha-yom
		TodayAfter = {s = "היום"; t = Fut};
		Tomorrow = {s = "מחר"; t = Fut}; --majar
		Yesterday = {s = "אתמול"; t = Pas}; --etmol
		NextWeek = {s = "בשבוע הבא"; t = Fut}; --ba-xabuºa haba'
		LastWeek = {s = "בשבוע שעבר"; t = Pas}; --ba-xabuºa xe-ºabar
		DayBeforeYest = {s = "שלשום"; t = Pas}; --xilxom
		DayAfterTom = {s = "מחרתיים"; t = Fut};	--majarateyim
		ThreeDaysAgo = {s = "לפני שלושה ימים"; t = Pas}; --lifney xloxah yomim
		InThreeDays = {s = "לאחר שלושה ימים"; t = Fut}; --l'ajar xloxah yomim
		AMomentAgo = {s = "לפני רגע"; t = Pas};  --lifney regah
		
		MonBef = {s = "ביום שני"; t = Pas}; --bayom xeni
		TueBef = {s = "ביום שלישי"; t = Pas}; --bayom xlixi
		WedBef = {s = "ביום רביעי"; t = Pas}; --bayom rbiºi
		ThuBef = {s = "ביום חמישי"; t = Pas}; --bayom jamixiy
		FriBef = {s = "ביום שישי"; t = Pas}; --bayom xixi
		SatBef = {s = "בשבת"; t = Pas}; --bxabat
		SunBef = {s = "ביום ראשון"; t = Pas}; --bayom ri'xon
		
		MonAft = {s = "ביום שני"; t = Fut};
		TueAft = {s = "ביום שלישי"; t = Fut};
		WedAft = {s = "ביום רביעי"; t = Fut};
		ThuAft = {s = "ביום חמישי"; t = Fut};
		FriAft = {s = "ביום שישי"; t = Fut};
		SatAft = {s = "בשבת"; t = Fut};
		SunAft = {s = "ביום ראשון"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "במדריד"}; --b-madrid
		inBarcelona = {s = "בברצלונה"}; --b-bartzelonah
		atHotel = {s = "במלון"}; --b-malon
		inCityCenter = {s = "במרכז העיר"}; --b-merkaz ha-ºir
		atNationalPalace = {s = "בארמון הלאומי"}; --ba-'armon ha-l'umi
		inFrance = {s = "בצרפת"}; --b-tsarfat
		inChina = {s = "בסין"}; --b-sin
		inUS = {s = "בארצות הברית"}; --ba-'artsot habrit
		
	param
		Time = Pas | Fut;
		PersNPCase = Nom | Acc | Comit | Loc;
		PlaceNPCase =  Acc_ | Loc_;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		VType : Type = {s : Time => Str};
		PersVType : Type = {s : Time => Str; rc : PersNPCase};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Nom => "ה"+w; Acc => "את ה"+w; Comit => "עם ה"+w; Loc => "ב"+w }};
		mkPersNPCompl: Str -> PersNPType = \w -> {s = table {Nom => w; Acc => "את"++w; Comit => "עם"++w; Loc => "ב"+w }};
		mkV : Str -> Str -> VType = \pas, fut -> {s = table {Pas => pas; Fut => fut}};
		mkPersV : Str -> Str -> PersNPCase -> PersVType = \pas, fut, c -> {s = table {Pas => pas; Fut => fut}; rc = c};
}