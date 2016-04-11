concrete headlinesAra of headlines = {
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
		headlineGen p v o h = v.s ! h.t ++ p.s ! NomAcc ++ o.s;
		headlineGenTime p v o ta = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s;
		headlineGenTimePlace p v o ta pa = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s ++ pa.s;
		headlineOpen p v o h = v.s ! h.t ++ p.s ! NomAcc ++ o.s;
		headlineOpenTime p v o ta = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s;
		headlineOpenTimePlace p v o ta pa = v.s ! ta.t ++  p.s ! NomAcc ++ o.s ++ ta.s ++ pa.s;
		headlineChg v p = v.s ++ p.s ! NomAcc;
		headlineChgPlace v p pa =  v.s ++ p.s ! NomAcc ++ pa.s;
		headlineWithTime p v p2 ta = v.s ! ta.t ++ p.s ! NomAcc ++ p2.s ! v.rc ++ ta.s;
		headlineWithTimePlace p v p2 ta pa = v.s ! ta.t ++ p.s ! NomAcc ++ p2.s ! v.rc ++ ta.s ++ pa.s;
		headlinePersTime p v p2 ta = v.s ! ta.t ++ p.s ! NomAcc ++ p2.s ! NomAcc ++ ta.s;
		headlinePersTimePlace p v p2 ta pa = v.s ! ta.t ++ p.s ! NomAcc ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
		headlineGoTime p v o ta = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s;
		headlineGoTimePlace p v o ta pa = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s ++ pa.s;
		headlineWrite p v o h = v.s ! h.t ++ p.s ! NomAcc ++ o.s;
		headlineWriteTime p v o ta = v.s ! ta.t ++ p.s ! NomAcc ++ o.s ++ ta.s;
		
		King = mkPersNP "الملك"; --al-malik
		President = mkPersNP "الرئيس"; --ar-ra'îs
		LeaderSP = mkPersNP "زعيم الحزب الاشتراكي"; --zaºîmu l-Hizbi l-'ixtirakiyyi
		MinisterFA = mkPersNP "وزير الخارجية"; --wazîru l-jariýiyyat
		Judge = mkPersNP "القاضي"; --al-qaDi
		Singer = mkPersNP "المغني"; --al-mugannî
		Actor = mkPersNP "الممثل"; --al-mumaththil	
		
		Inaugurate = mkV "افتتح" "سيفتتح"; --ifatataHa sa-yaftatiHu
		Buy = mkV "اشترى" "سيشتري";  --ixtarà sa-yaxtarî
		Die = {s = "توفي"}; --tawaffi (v-s)
		Meet = mkWithV "التقى" "سيلتقي" Bi; --iltaqà sa-yaltaqî (bi)
		Talk = mkWithV "تحدث" "سيتحدث" Comit; --taHaddatha sa-yataHaddathu (maºa)
		Support = mkV "أيد" "سيؤيد"; --'ayyada sa-yu'ayyidu
		Receive = mkV "إستقبل" "سيستقبل"; --istaqbala sayastaqbilu
		Criticize = mkV "انتقد" "قد ينتقد"; --intaqada, qad yantaqidu
		Sign = mkV "وقع" "سيوقع"; --waqqaºa sa-yuwaqqiºu
		Attend = mkV "حضر" "سيحضر"; --HaDara sa-yaHDuru
		
		Exhibition = {s = "المعرض"}; --al-maºriD
		Conference = {s = "المؤتمر"}; --al-mu'tamar
		Car = {s = "سيارة"}; --sayârät
		House = {s = "بيتا" | "منزلا"}; --baytan / manzilan
		Agreement = {s = "على الاتفاق"}; --ºala al-ittifâq --included prep for verb 'sign' in Arabic; if there were more writeVs, it would be necessary to re-write in withV style
		
		ThisMorning = {s = "هذا الصباح"; t = Pas}; --hadhâ s-saHâb
		ThisEvening = {s = "هذا المساء"; t = Fut}; --hadhâ l-masâ'
		TodayBefore = {s = "اليوم"; t = Pas}; --al-yawma
		TodayAfter = {s = "اليوم"; t = Fut};
		Tomorrow = {s = "غداً"; t = Fut}; --gadhän
		Yesterday = {s = "أمس"; t = Pas}; --'amsi
		NextWeek = {s = "لأسبوع القادم"; t = Fut}; --al-usbuºa l-qâdim
		LastWeek = {s = "الإسبوع الماضي"; t = Pas}; --al-usbûºa l-mâdî
		DayBeforeYest = {s = "أمس الأول"; t = Pas}; --'amsi l-awwal
		DayAfterTom = {s = "بعد غد"; t = Fut};	--baºda gad
		ThreeDaysAgo = {s = "قبل ثلاثة أيام"; t = Pas}; --qabla thalathati ayyâm
		InThreeDays = {s = "بعد ثلاثة أيام"; t = Fut}; --baºda thalathati 'ayyâm
		AMomentAgo = {s = "منذ لحظة"; t = Pas};  --mundhu laHZHatin
		
		MonBef = {s = "يوم الإثنين"; t = Pas}; --yawma l-'ithnayn
		TueBef = {s = "يوم الثلاثاء"; t = Pas}; --yawma th-thulâthâ'
		WedBef = {s = "يوم الاربعاء"; t = Pas}; --yawma l-'arbiºâ'
		ThuBef = {s = "يوم الخميس"; t = Pas}; --yawma l-jamîs
		FriBef = {s = "يوم الجمعة"; t = Pas}; --yawma l-ýumºa
		SatBef = {s = "يوم السبت"; t = Pas}; --yawma s-sabt
		SunBef = {s = "يوم الأحد"; t = Pas}; --yawma l-'aHad
		
		MonAft = {s = "يوم الإثنين"; t = Fut};
		TueAft = {s = "يوم الثلاثاء"; t = Fut};
		WedAft = {s = "يوم الاربعاء"; t = Fut};
		ThuAft = {s = "يوم الخميس"; t = Fut};
		FriAft = {s = "يوم الجمعة"; t = Fut};
		SatAft = {s = "يوم السبت"; t = Fut};
		SunAft = {s = "يوم الأحد"; t = Fut};
		
		HiddenPas = {t = Pas};
		HiddenPf = {t = Pas};
		HiddenFut = {t = Fut};
		
		inMadrid = {s = "في مدريد"}; --fî madrîd
		inBarcelona = {s = "في برشلونة"}; --fî barxilûnä
		atHotel = {s = "في فندق"}; --fî funduq
		inCityCenter = {s = "في مركز المدينة"}; --fî markazi l-madînäti
		atNationalPalace = {s = "في القصر الوطني"}; --fî l-qaSri l-waTaniyyi
		inFrance = {s = "في فرنسا"}; --fî faransâ
		inChina = {s = "في الصين"}; --fî Sîn
		inUS = {s = "في الولايات المتحدة"}; --fî l-wilâyâti l-mutaHidat
		
	param
		Time = Pas | Fut;
		PersNPCase = NomAcc | Comit | Bi;
		
	oper
		PersNPType : Type = {s : PersNPCase => Str};
		VType : Type = {s : Time => Str};
		WithVType : Type = {s : Time => Str; rc : PersNPCase};
		mkPersNP: Str -> PersNPType = \w -> {s = table {NomAcc => w; Comit => "مع"++w; Bi => "ب"+w }};
		mkV : Str -> Str -> VType = \pas, fut -> {s = table {Pas => pas; Fut => fut}};
		mkWithV : Str -> Str -> PersNPCase -> WithVType = \pas, fut, c -> {s = table {Pas => pas; Fut => fut}; rc = c};
}