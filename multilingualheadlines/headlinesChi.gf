concrete headlinesChi of headlines = {
	lincat 
		Headline = Str;
		PersNP = PersNPType;
		ObjNP, DocNP, PlaceNP = {s : Str};
		GenTrV, OpenV, GoV, WriteV, PersV = VType;
		WithV = WithVType;
		ChgV = {s : Str};
		TimeAdv = {s : Str; t : Time};
		HiddenTime = {t : Time};
		PlaceAdv = {s : Str};

	lin

		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = p.s ! Dict ++ v.bef ! h.t ++ o.s ++ v.aft ! h.t;
		headlineGenTime p v o ta = p.s ! Dict ++ ta.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineGenTimePlace p v o ta pa = p.s ! Dict ++ ta.s ++ pa.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineOpen p v o h = p.s ! Dict ++ v.bef ! h.t ++ o.s ++ v.aft ! h.t;
		headlineOpenTime p v o ta = p.s ! Dict ++ ta.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineOpenTimePlace p v o ta pa = p.s ! Dict ++ ta.s ++ pa.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineChg v p = p.s ! Dict ++ v.s;
		headlineChgPlace v p pa = p.s ! Dict ++ pa.s ++ v.s;
		headlineWithTime p v p2 ta = p.s ! Dict ++ ta.s ++ p2.s ! v.rc ++ v.s ! ta.t;
		headlineWithTimePlace p v p2 ta pa = p.s ! Dict ++ ta.s ++ pa.s ++ p2.s ! v.rc ++ v.s ! ta.t;
		headlinePersTime p v p2 ta = p.s ! Dict ++ ta.s ++ v.bef ! ta.t ++ p2.s ! Dict ++ v.aft ! ta.t;
		headlinePersTimePlace p v p2 ta pa = p.s ! Dict ++ ta.s ++ pa.s ++ v.bef ! ta.t ++ p2.s ! Dict ++ v.aft ! ta.t;
		headlineGoTime p v o ta = p.s ! Dict ++ ta.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineGoTimePlace p v o ta pa = p.s ! Dict ++ ta.s ++ pa.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		headlineWrite p v o h = p.s ! Dict ++ v.bef ! h.t ++ o.s ++ v.aft ! h.t;
		headlineWriteTime p v o ta = p.s ! Dict ++ ta.s ++ v.bef ! ta.t ++ o.s ++ v.aft ! ta.t;
		
		King = mkPersNP "国王"; --guówáng
		President = mkPersNP "总统"; --zôngtông
		LeaderSP = mkPersNP "社会党领袖"; --shèhuìdâng lîngxiù
		MinisterFA = mkPersNP "外交部"; --wàijiäo bù
		Judge = mkPersNP "法官"; --fâguän
		Singer = mkPersNP "歌手"; --gëshôu
		Actor = mkPersNP "演员"; --yânyuán
		
		Inaugurate = mkV "开幕"; --käimù (X kaimu Y le, X yao kaimu Y, X time place kaimu Y le)
		Buy = mkV "购买"; --gòumâi
		Die = {s = "死了"}; --sîle
		Meet = mkVXleY "见面" "见了面" Gen; --jiàn-le-miàn yàojiànmiàn (X gen Y jianlemian, X yao gen Y jianmian)
		Talk = mkVXleY "说话" "说了话" Yu; --shuöhuà
		Support = mkV "支持"; --zhïchí
		Receive = mkV "收到"; --shöudào
		Criticize = mkV "批评"; --pïpíng
		Sign = mkV "签"; --qiän
		Attend = mkV "出席"; --chüxí
		
		Exhibition = {s = "展览会"}; --zhânlànhuì
		Conference = {s = "会议"}; --huìyì
		Car = {s = "一辆车"}; --yï liàng chë
		House = {s = "一套房子"}; --yï tào fángzi
		Agreement = {s = "协议"}; --xiéyì
		
		ThisMorning = {s = "今天上午"; t = NoMark};  --jïntiän shàngwû
		ThisEvening = {s = "今天晚上"; t = NoMark}; --jïntiän wânshàng
		TodayBefore = {s = "今天"; t = Pas}; --jïntiän
		TodayAfter = {s = "今天"; t = NoMark}; --jïntiän
		Tomorrow = {s = "明天"; t = NoMark}; --míngtiän
		Yesterday = {s = "昨天"; t = NoMark}; --zuótiän
		NextWeek = {s = "下个星期"; t = NoMark}; --xiàge xïngqí
		LastWeek = {s = "上星期"; t = NoMark}; --shàng xïngqí
		DayBeforeYest = {s = "前天"; t = NoMark}; --qiántiän
		DayAfterTom = {s = "后天"; t = NoMark}; --hòutiän
		ThreeDaysAgo = {s = "三天前"; t = NoMark}; --sän tiän qián
		InThreeDays = {s = "在三天"; t = NoMark}; --zaì sän tiän
		AMomentAgo = {s = "刚才"; t = NoMark}; --gängcái
		
		MonBef = {s = "上星期一"; t = NoMark}; --shàng...
		TueBef = {s = "上星期二"; t = NoMark};
		WedBef = {s = "上星期三"; t = NoMark};
		ThuBef = {s = "上星期四"; t = NoMark};
		FriBef = {s = "上星期五"; t = NoMark};
		SatBef = {s = "上星期六"; t = NoMark};
		SunBef = {s = "上星期日" | "上星期天"; t = NoMark};
		
		MonAft = {s = "下星期一"; t = NoMark}; --xià xïngqíyï
		TueAft = {s = "下星期二"; t = NoMark}; --xià xïngqí'èr
		WedAft = {s = "下星期三"; t = NoMark}; --xià xïngqísän
		ThuAft = {s = "下星期四"; t = NoMark}; --xià xïngqísì
		FriAft = {s = "下星期五"; t = NoMark}; --xià xïngqíwû
		SatAft = {s = "下星期六"; t = NoMark}; --xià xïngqíliù
		SunAft = {s = "下星期日" | "下星期天"; t = NoMark}; --xià xïngqírì xià xïngqítiän
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
				
		inMadrid = {s = "在马德里"}; --zài mâdélî
		inBarcelona = {s = "在巴塞罗那"}; --zài bäsèluönà
		atHotel = {s = "在饭店"}; --zaì fàndiàn
		inCityCenter = {s = "在市中心"}; --zài shì zhöngxïn
		atNationalPalace = {s = "在国家宫"}; --zài guójiä-göng
		inFrance = {s = "在法国"}; --zài fàguó
		inChina = {s = "在中国"}; --zài zhöngguó
		inUS = {s = "在美国"}; --zài mêiguó
				
	param
		Time = Pas | Fut | NoMark;
		PersNPCase = Dict | Gen | Yu;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		mkPersNP: Str -> PersNPType = \w -> {s = table {Dict => w; Gen => "跟"++w; Yu => "与"++w }};
		VType : Type = {bef,aft : Time => Str};
		WithVType : Type = {s : Time => Str; rc : PersNPCase};
		mkV : Str -> VType = \v -> {bef = table {NoMark => v; Pas => v; Fut => "要"++v};
									aft = table {NoMark => ""; Pas => "了"; Fut => ""}};
		mkVXleY : Str -> Str -> PersNPCase -> WithVType = \x,y,c -> {s = table {NoMark => x; Pas => y; Fut => x}; rc = c};
}