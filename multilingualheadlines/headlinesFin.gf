concrete headlinesFin of headlines = open SyntaxFin, (S = SyntaxFin), ParadigmsFin, (P = ParadigmsFin) in {
	lincat 
		Headline = Utt ;
		PersNP = NP ;
		ObjNP = NP ;
		DocNP = NP ;
		PlaceNP = NP ;
		GenTrV, OpenV, GoV, WriteV, PersV = V2 ;
		WithV = V2 ;
		ChgV = V ;
		TimeAdv = {adv : Adv ; t : Tense} ;
		HiddenTime = Tense ;
		PlaceAdv = Adv ;
		
	lin
		--p person, v verb, o object, ta time adverbial, pa place adverbial, h hidden
		headlineGen p v o h = mkUtt (mkS h (mkCl p v o)) ;
		headlineGenTime p v o ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v o) ta.adv))) ; 
		headlineGenTimePlace p v o ta pa = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP (mkVP v o) ta.adv) pa))) ; 
		headlineOpen p v o h = mkUtt (mkS h (mkCl p v o)) ; 
		headlineOpenTime p v o ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v o) ta.adv))) ; 
		headlineOpenTimePlace p v o ta pa = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP (mkVP v o) ta.adv) pa))) ;
		headlineChg v p = mkUtt (mkS pastTense (mkCl p v)) ; 
		headlineChgPlace v p pa = mkUtt (mkS pastTense (mkCl p (mkVP (mkVP v) pa))) ; 
		headlineWithTime p v p2 ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v p2) ta.adv))) ; 
		headlineWithTimePlace p v p2 ta pa = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP (mkVP v p2) ta.adv) pa))) ; 
		headlinePersTime p v p2 ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v p2) ta.adv))) ; 
		headlinePersTimePlace p v p2 ta pa = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP (mkVP v p2) ta.adv) pa))) ; 
		headlineGoTime p v o ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v o) ta.adv))) ;
		headlineGoTimePlace p v o ta pa = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP (mkVP v o) ta.adv) pa))) ;
		headlineWrite p v o h = mkUtt (mkS h (mkCl p v o)) ;
		headlineWriteTime p v o ta = mkUtt (mkS ta.t (mkCl p (mkVP (mkVP v o) ta.adv))) ; 

		King = mkNP (mkN "kuningas") ;
		President = mkNP (mkN "pääministeri") ;
		LeaderSP = mkNP (mkN "sosialistijohtaja") ;
		MinisterFA = mkNP (mkN "ulkoministeri") ;
		Judge = mkNP (mkN "tuomari") ;
		Singer = mkNP (mkN "laulaja") ;
		Actor = mkNP (mkN "näyttelijä") ;	
		
		Inaugurate = mkV2 "vihkiä"| mkV2 (mkV "avata" "avasi") ;
		Buy = mkV2 "ostaa" ;
		Die = mkV "kuolla" ;
		Meet = mkV2 "tavata" ;
		Talk = mkV2 (mkV "keskustella") with_Prep ;
		Support = mkV2 (mkV "kannattaa") partitive ;
		Receive = mkV2 "vastaanottaa";
		Criticize = mkV2 (mkV "arvostella") partitive ;
		Sign = mkV2 "allekirjoittaa";
		Attend = mkV2 (mkV "osallistua") illative ;
		
		Exhibition = mkNP (mkN "näyttely") ;
		Conference = mkNP (mkN "konferenssi") ;
		Car = mkNP (mkN "auto" "auton" "autoja") ;
		House = mkNP (mkN "talo") ;
		Agreement = mkNP (mkN "sopimus") ;
		
		ThisMorning = {adv = P.mkAdv "tänä aamuna"; t = presentTense};
		ThisEvening = {adv = P.mkAdv "tänä iltana"; t = futureTense};
		TodayBefore = {adv = P.mkAdv "tänään"; t = presentTense};
		TodayAfter = {adv = P.mkAdv "tänään"; t = futureTense};
		Tomorrow = {adv = P.mkAdv "huomenna"; t = futureTense};
		Yesterday = {adv = P.mkAdv "eilen"; t = pastTense};
		NextWeek = {adv = P.mkAdv "ensi viikolla"; t = futureTense};
		LastWeek = {adv = P.mkAdv "viime viikolla"; t = pastTense};
		DayBeforeYest = {adv = P.mkAdv "toissapäivänä"; t = pastTense};
		DayAfterTom = {adv = P.mkAdv "ylihuomenna"; t = futureTense};
		ThreeDaysAgo = {adv = P.mkAdv "kolme päivää sitten"; t = pastTense};
		InThreeDays = {adv = P.mkAdv "kolmen päivän päästä"; t = futureTense};
		AMomentAgo = {adv = P.mkAdv "hetki sitten"; t = pastTense};
		
		MonBef = {adv = P.mkAdv "maanantaina"; t = pastTense};
		TueBef = {adv = P.mkAdv "tiistaina"; t = pastTense};
		WedBef = {adv = P.mkAdv "keskiviikkona"; t = pastTense};
		ThuBef = {adv = P.mkAdv "torstaina"; t = pastTense};
		FriBef = {adv = P.mkAdv "perjantaina"; t = pastTense};
		SatBef = {adv = P.mkAdv "lauantaina"; t = pastTense};
		SunBef = {adv = P.mkAdv "sunnuntaina"; t = pastTense};
		
		MonAft = {adv = P.mkAdv "maanantaina"; t = futureTense};
		TueAft = {adv = P.mkAdv "tiistaina"; t = futureTense};
		WedAft = {adv = P.mkAdv "keskiviikkona"; t = futureTense};
		ThuAft = {adv = P.mkAdv "torstaina"; t = futureTense};
		FriAft = {adv = P.mkAdv "perjantaina"; t = futureTense};
		SatAft = {adv = P.mkAdv "lauantaina"; t = futureTense};
		SunAft = {adv = P.mkAdv "sunnuntaina"; t = futureTense};
		
		HiddenPas = pastTense ;
		HiddenPf = pastTense ; 
		HiddenFut = futureTense ;
		
		inMadrid = S.mkAdv in_Prep (mkNP (mkPN "Madrid")) ;
		inBarcelona = S.mkAdv in_Prep (mkNP (mkPN "Barcelona")) ;
		atHotel = S.mkAdv in_Prep (mkNP (mkN "hotelli")) ;
		inCityCenter = S.mkAdv in_Prep (mkNP (mkN "hotelli")) ;
		atNationalPalace = S.mkAdv in_Prep (mkNP (mkN "kansallispalatsi")) ;
		inFrance = S.mkAdv in_Prep (mkNP (mkPN "Ranska")) ;
		inChina = S.mkAdv in_Prep (mkNP (mkPN "Kiina")) ;
		inUS = P.mkAdv "USA:ssa" | S.mkAdv in_Prep (mkNP thePl_Det (mkN "Yhdysvalta")) ;
		
}