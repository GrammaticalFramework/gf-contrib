abstract headlines = {

{-
	Headline: a news healdine, several trees are possible combining the following categories so that the resulting sentence makes sense (semantically)
	PersNP: a personal noun phrase (eg the minister of foreign affairs), in Nominative, Accusative and Comitative ("with X") cases
	ObjNP: an object (eg, a thing than can be bought: a car, a house), indefinite
	PlaceNP: a place that can be opened (exhibition, meeting, etc -accusative-) or to which one can go (to the exhibition, etc), definite
	DocNP: an object that can be written on, signed etc (in this example, agreement); definite
	GenTrV: general verb that requires a person subject and a thing object (in this example, buy)
	OpenV: person as subject, place name as object (in this example, open/inaugurate)
	GoV: a verb that takes a person and a place name as directional object (in this example, attend -translated in very different ways depending on the language-)
	ChgV: an intransitive verb that represents a change of state; in this example, only 'die/pass away' (which, unlike the other verbs, is only included in present perfect)
	WithV: an intransitive action that a person does 'with' another person. In this example, meet and talk (usually used with the preoposition with in many languages)
	PersV: a transitive verb that require both personal subject and direct object (in most languages). Examples: support, receive, criticize
	WriteV: a person as subject and a document as object (thing can be writen on, signed etc)
	TimeAdv: time adverbial / complement, it thas a time category attached which is then passed to the verb of the sentence and determines its sense (eg, tomorrow - future)
	HiddenTime: just a time category with no string, it is used to determine the tense of the verb in sentences which do not have a time adverbial
	PlaceAdv : place adverbial / complement, where something can take place (examples: in Madrid, at a hotel, etc.)
-}

	flags startcat = Headline;
	cat Headline; PersNP; ObjNP; PlaceNP; DocNP; GenTrV; OpenV; GoV; ChgV; WithV; PersV; WriteV; TimeAdv; PlaceAdv; HiddenTime;
	fun
		headlineGen : PersNP -> GenTrV -> ObjNP -> HiddenTime -> Headline;
		headlineGenTime : PersNP -> GenTrV -> ObjNP -> TimeAdv -> Headline;
		headlineGenTimePlace : PersNP -> GenTrV -> ObjNP -> TimeAdv -> PlaceAdv -> Headline;
		headlineOpen : PersNP -> OpenV -> PlaceNP -> HiddenTime -> Headline;
		headlineOpenTime : PersNP -> OpenV -> PlaceNP -> TimeAdv -> Headline;
		headlineOpenTimePlace : PersNP -> OpenV -> PlaceNP -> TimeAdv -> PlaceAdv -> Headline;
		headlineChg : ChgV -> PersNP -> Headline;
		headlineChgPlace : ChgV -> PersNP -> PlaceAdv -> Headline;
		headlineWithTime : PersNP -> WithV -> PersNP -> TimeAdv -> Headline;
		headlineWithTimePlace : PersNP -> WithV -> PersNP -> TimeAdv -> PlaceAdv -> Headline;
		headlinePersTime : PersNP -> PersV -> PersNP -> TimeAdv -> Headline;
		headlinePersTimePlace : PersNP -> PersV -> PersNP -> TimeAdv -> PlaceAdv -> Headline;	
		headlineGoTime : PersNP -> GoV -> PlaceNP -> TimeAdv -> Headline;
		headlineGoTimePlace : PersNP -> GoV -> PlaceNP -> TimeAdv -> PlaceAdv -> Headline;
		headlineWrite : PersNP -> WriteV -> DocNP -> HiddenTime -> Headline;
		headlineWriteTime : PersNP -> WriteV -> DocNP -> TimeAdv -> Headline;
		
		King: PersNP;
		President: PersNP;
		LeaderSP: PersNP;
		MinisterFA: PersNP;
		Judge: PersNP;
		Singer: PersNP;
		Actor: PersNP;
		
		Inaugurate: OpenV;
		Buy: GenTrV;
		Die: ChgV;
		Meet: WithV;
		Talk: WithV;
		Support: PersV;
		Receive: PersV;
		Criticize: PersV; --Future tense replaced by 'may criticize'
		Sign: WriteV;
		Attend: GoV;
		
		Exhibition: PlaceNP;
		Conference: PlaceNP;
		Car: ObjNP;
		House: ObjNP;
		Agreement: DocNP;

		ThisMorning: TimeAdv;
		ThisEvening: TimeAdv;
		TodayBefore: TimeAdv;
		TodayAfter: TimeAdv;
		Tomorrow: TimeAdv;
		Yesterday: TimeAdv;
		NextWeek: TimeAdv;
		LastWeek: TimeAdv;
		DayBeforeYest: TimeAdv;
		DayAfterTom: TimeAdv;
		ThreeDaysAgo: TimeAdv;
		InThreeDays: TimeAdv;
		AMomentAgo: TimeAdv;
		
		MonBef: TimeAdv;
		TueBef: TimeAdv;
		WedBef: TimeAdv;
		ThuBef: TimeAdv;
		FriBef: TimeAdv;
		SatBef: TimeAdv;
		SunBef: TimeAdv;
		
		MonAft: TimeAdv;
		TueAft: TimeAdv;
		WedAft: TimeAdv;
		ThuAft: TimeAdv;
		FriAft: TimeAdv;
		SatAft: TimeAdv;
		SunAft: TimeAdv;
		
		HiddenPas : HiddenTime;
		HiddenPf : HiddenTime;
		HiddenFut : HiddenTime;		
		
		inMadrid: PlaceAdv;
		inBarcelona: PlaceAdv;
		atHotel: PlaceAdv;
		inCityCenter: PlaceAdv;
		atNationalPalace: PlaceAdv;
		inFrance: PlaceAdv;
		inChina: PlaceAdv;
		inUS: PlaceAdv;
		
}
