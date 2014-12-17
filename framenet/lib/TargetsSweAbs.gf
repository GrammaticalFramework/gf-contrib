abstract TargetsSweAbs = Cat ** {

	flags coding = utf8 ;

	fun

		glömma_V2_Abandonment : V2 ; -- <Agent>[Tjänstemän] kan [GLÖMMA] <Theme>[handlingar i en portfölj]
		glömma_kvar_V2_Abandonment : V2 ; -- <Agent>[Läkare] [GLÖMDE KVAR] <Theme>[kompress]
		lämna_V2_Abandonment : V2 ; -- <Agent>[Jag] har [LÄMNAT] <Theme>[bilen]
		överge_V2_Abandonment : V2 ; -- <Agent>[Besättningen på Skandia] tvingades att [ÖVERGE] <Theme>[båten]
		lämna_i_sticket_V2_Abandonment : V2 ; -- <Theme>[väljarna] [LÄMNAS I STICKET]
		lämna_kvar_V2_Abandonment : V2 ; -- <Theme>[En sju dagar gammal pojke] [LÄMNADES KVAR]

		drälla_V_Abounding_with : V ; -- <Location>[Världen] [DRÄLLER] <Theme>[av receptböcker]
		myllra_V_Abounding_with : V ; -- [MYLLRA] <Theme>[av lekande barn]
		svämma_över_V_Abounding_with : V ; -- <Location>[ett bord som] [SVÄMMAR ÖVER] <Theme>[av bullar]
		vimla_V_Abounding_with : V ; -- <Location>[Hela huset] [VIMLAR] <Theme>[av folk]

		grädda_V_Absorb_heat : V ; -- <Entity>[den] [GRÄDDA]
		koka_V_Absorb_heat : V ; -- [KOKAR] <Entity>[de]
		puttra_V_Absorb_heat : V ; -- <Entity>[stuvningen] [PUTTRA]
		sjuda_V_Absorb_heat : V ; -- <Entity>[Den] får [SJUDA] <Heat_source>[i ugnen]
		småkoka_V_Absorb_heat : V ; -- <Entity>[anrättningen] får [SMÅKOKA]
		steka_V_Absorb_heat : V ; -- <Entity>[de] får [STEKA]

		krylla_V_Abundance : V ; -- <Collection>[Myror och kackerlackor] [KRYLLAR] <Place>[i det gigantiska växthuset i Arizonas öken]

		misshandla_V2_Abusing : V2 ; -- <Abuser>[en kvinna] [MISSHANDLAR] <Victim>[en man]
		utnyttja_V2_Abusing : V2 ; -- <Abuser>[en man som] [UTNYTTJAR] <Victim>[henne]

		åstadkomma_V2_Accomplishment : V2 ; -- <Agent>[ett brittiskt plan] bomber över Lund och [ÅSTADKOMMER] <Goal>[förödelse]
		genomföra_V2_Accomplishment : V2 ; -- <Goal>[Prövningen] [GENOMFÖRDES]

		mynta_V2_Achieving_first : V2 ; -- <Cognizer>[Carl Bildt] [MYNTADE] <New_idea>[uttrycket ' skvalpvaluta ']
		uppfinna_V2_Achieving_first : V2 ; -- <Cognizer>[Blaise Pascal] [UPPFANN] <New_idea>[den första mekaniska räknemaskinen]
		upptäcka_VS_Achieving_first : VS ; -- <Cognizer>[Forskarna] [UPPTÄCKTE] <New_idea>[att bakterien Rickettsia finns i svenska fästingar]

		absolvera_V2_Activity_finish : V2 ; -- <Agent>[Man] kan [ABSOLVERA] <Activity>[delar av kursen]
		avlägga_V2_Activity_finish : V2 ; -- <Agent>[Hon] specialiserade sig på käkkirurgi och [AVLADE] <Activity>[läkarexamen]
		fullgöra_V2_Activity_finish : V2 ; -- <Agent>[Han] [FULLGJORDE] <Activity>[sin värnplikt]
		fasa_ut_V2_Activity_finish : V2 ; -- <Activity>[västvärldens kärnkraft] ska [FASAS UT]

		fortfara_VV_Activity_ongoing : VV ; -- <Agent>[Hon] [FORTFOR] <Activity>[att tiga]
		fortsätta_VV_Activity_ongoing : VV ; -- <Agent>[Hon] [FORTSATTE] <Activity>[att plocka de glänsande sillarna ur näten]

		frysa_V2_Activity_pause : V2 ; -- <Agent>[Iran] åtog sig då att [FRYSA] <Activity>[all verksamhet som relaterar till anrikning av uran , däribland framställning av urangas och tillverkning av gascentrifuger]

		bereda_sig_V_Activity_prepare : V ; -- <Agent>[De politiska motståndarna] får [BEREDA SIG] <Activity>[på att möta ett tuffare Miljöparti]
		förbereda_V_Activity_prepare : V ; -- <Agent>[Dom] vill [FÖRBEREDA] <Activity>[på att det antagligen kommer att ta slut]
		förbereda_sig_V_Activity_prepare : V ; -- <Agent>[laget] hade börjat [FÖRBEREDA SIG] <Activity>[för kval]

		återuppta_V2_Activity_resume : V2 ; -- <Agent>[Hon] ville [ÅTERUPPTA] <Activity>[sin ridning]

		börja_V_Activity_start : V ; -- [BÖRJADE] <Activity>[med tv- reklam och animation]
		börja_V2_Activity_start : V2 ; -- <Agent>[Pablo] är född i Guinea , men uppvuxen i Tyskland och [BÖRJADE] <Activity>[sin karriär]
		ingå_V2_Activity_start : V2 ; -- <Agent>[Han] har nämligen [INGÅTT] <Activity>[äktenskap med en finsk kvinna , som nu väntar barn]
		inleda_V2_Activity_start : V2 ; -- [INLEDA] <Activity>[pollenmätningarna]
		sluta_V2_Activity_start : V2 ; -- <Agent>[Sydkorea] vill gärna [SLUTA] <Activity>[överenskommelser med Sverige om till exempel ökat forsknings- och utvecklingssamarbete eller kanske någon gemensam fond]
		slå_sig_på_V2_Activity_start : V2 ; -- <Agent>[Han och hans bröder] flyttade till El Salvador 1896 för att [SLÅ SIG PÅ] <Activity>[sockerodling]
		träffa_V2_Activity_start : V2 ; -- [TRÄFFAT] <Activity>[noggranna förberedelser]
		begynna_VV_Activity_start : VV ; -- <Agent>[han] inte [BEGYNNER] <Activity>[slå mor]
		börja_VV_Activity_start : VV ; -- <Agent>[Ford och framför allt GM] måste [BÖRJA] <Activity>[tillverka attraktiva bilar som säljer]
		ge_sig_på_VV_Activity_start : VV ; -- <Agent>[jag] [GE MIG PÅ] <Activity>[att tillverka ett eget mönster]
		komma_VV_Activity_start : VV ; -- <Agent>[hon] [KOM] <Activity>[att tänka på det uttalandet]
		uppta_V2_Activity_start : V2 ; -- [UPPTOGS] <Activity>[vägarbetena]

		ava_V2_Activity_stop : V2 ; -- <Agent>[en kommentator] [AVAR] <Activity>[en match]
		avsluta_V2_Activity_stop : V2 ; -- <Agent>[han] [AVSLUTADE] <Activity>[samtalet]
		lägga_ner_V2_Activity_stop : V2 ; -- <Agent>[Nimbus] beslöt [LÄGGA NER] <Activity>[sin tillverkning]
		stoppa_V2_Activity_stop : V2 ; -- <Agent>[inrikesministeriet] [STOPPADE] <Activity>[sändningarna]
		ställa_in_V2_Activity_stop : V2 ; -- <Agent>[GM] börjar [STÄLLA IN] <Activity>[betalningar till återförsäljare i USA]
		sluta_VV_Activity_stop : VV ; -- <Agent>[många av dem] att [SLUTA] <Activity>[arbeta]
		avlysa_V2_Activity_stop : V2 ; -- <Activity>[Tävlingen] [AVLYSTES]
		inhibera_V2_Activity_stop : V2 ; -- <Activity>[Madeiraresan] [INHIBERADES]
		seponera_V2_Activity_stop : V2 ; -- <Activity>[Patientens diuretikaterapi] [SEPONERAS]
		sätta_V2_Activity_stop : V2 ; -- <Activity>[Pulmicort] [UTSATTES]

		lägga_ihop_V2_Adding_up : V2 ; -- [LÄGGER IHOP] <Numbers>[det nationella stödet och gemenskapens regionala och sociala stöd]
		räkna_ihop_V2_Adding_up : V2 ; -- [RÄKNA IHOP] <Numbers>[5438799+]
		räkna_samman_V2_Adding_up : V2 ; -- [RÄKNA SAMMAN] <Result>[publikens poäng]

		anföra_V2_Adducing : V2 ; -- <Speaker>[Nämnden] [ANFÖRDE] <Specified_entity>[en mängd argument emot att ge bygglov]
		åberopa_V2_Adducing : V2 ; -- <Speaker>[åklagarna] kommer att [ÅBEROPA] <Specified_entity>[taxichaufförens uppgifter]
		andra_V2_Adducing : V2 ; -- <Specified_entity>[Några omständigheter] brukar dock [ANDRAGAS]

		ställa_om_V_Adjusting : V ; -- [STÄLLA OM] <Part>[telefonen]
		ställa_in_V2_Adjusting : V2 ; -- <Agent>[vi] kan [STÄLLA IN] <Feature>[temperatur]
		anpassa_V2_Adjusting : V2 ; -- <Agent>[jag] [ANPASSA] <Part>[henne]
		justera_V2_Adjusting : V2 ; -- <Agent>[Alla] går igenom cykeln , [JUSTERAR] <Part>[bromsar och växlar]
		kalibrera_V2_Adjusting : V2 ; -- <Agent>[Nasa] ska nu använda bilderna för att [KALIBRERA] <Part>[kamerorna]
		stämma_V2_Adjusting : V2 ; -- [STÄMMA] <Part>[instrument]

		anta_V2_Adopt_selection : V2 ; -- <Agent>[man] ska [ANTA] <Value>[hälsosamma yttringar]
		inta_V2_Adopt_selection : V2 ; -- <Agent>[USA] vill inte [INTA] <Value>[en attityd som riskerar att förvärra situationen]
		omfamna_V2_Adopt_selection : V2 ; -- <Agent>[göteborgarna] kommer att [OMFAMNA] <Value>[de nya stadsdelsnamnen]
		adoptera_V2_Adopt_selection : V2 ; -- <Value>[Näringslivets processer] [ADOPTERAS]

		pryda_V2_Adorning : V2 ; -- <Theme>[Symbolen] , däremot , ska [PRYDA] <Location>[brevpapper , tjänstebilar , pennor , arbetskläder , snöröjningsmaskiner m m m m]
		översvämma_V2_Adorning : V2 ; -- <Theme>[Motorbåtar från USA , snabba , fräcka , lyxiga] , väntas [ÖVERSVÄMMA] <Location>[marknaden]
		smycka_V2_Adorning : V2 ; -- <Location>[en öppen loggia som] [SMYCKAS] <Theme>[av fresker med landskapsmotiv]
		täcka_V2_Adorning : V2 ; -- <Location>[väggar , golv och möbler] [TÄCKS] <Theme>[av det ätbara och knastriga materialet]

		eftermogna_V_Aging : V ; -- <Entity>[de] inte [EFTERMOGNAR]
		mogna_V_Aging : V ; -- <Entity>[de] [MOGNAR]
		åldras_V2_Aging : V2 ; -- <Entity>[kroppen] [ÅLDRAS]

		avböja_VV_Agree_or_refuse_to_act : VV ; -- <Speaker>[SEB] har [AVBÖJT] <Proposed_action>[att kommentera hans uttalande]
		vägra_VV_Agree_or_refuse_to_act : VV ; -- <Speaker>[Mannen] [VÄGRADE] <Proposed_action>[släppa kniven]

		bruka_V2_Agriculture : V2 ; -- <Agriculturist>[Vi] [BRUKAR] <Ground>[jorden]
		kultivera_V2_Agriculture : V2 ; -- [KULTIVERA] <Ground>[åkrarna]

		rikta_V2_Aiming : V2 ; -- <Agent>[Skurken] [RIKTAR] <Instrument>[sitt vapen] <Targeted>[mot den obeväpnade hjälten]
		rikta_in_V2_Aiming : V2 ; -- <Agent>[Utredningen] [RIKTAR IN] <Instrument>[utvecklingen] <Targeted>[mot tydliga regionala parlament och regeringar]

		ackumulera_V2_Amassing : V2 ; -- [ACKUMULERA] <Mass_theme>[kadmium]
		hamstra_V2_Amassing : V2 ; -- <Recipient>[Konsumenterna] har att börja [HAMSTRA] <Mass_theme>[dagligvaror]
		lagra_V2_Amassing : V2 ; -- <Recipient>[Honan] kan nämligen [LAGRA] <Mass_theme>[hannens spermier]
		ansamla_V2_Amassing : V2 ; -- <Mass_theme>[kvicksilver] [ANSAMLAS]

		belöpa_sig_V_Amounting_to : V ; -- <Attribute>[De samlade resurser som vi ger i detta sammanhang] [BELÖPER SIG] i det närmaste <Value>[till 300 milj]

		besvära_sig_V_Appeal : V ; -- <Convict>[Murto och de sex övriga som] [BESVÄRADE SIG]
		besvärja_sig_V_Appeal : V ; -- <Convict>[FPA] kan [BESVÄRA SIG] <Decision>[över beslutet]

		baka_V2_Apply_heat : V2 ; -- [BAKADE] annorlunda <Food>[bröd]
		grilla_V2_Apply_heat : V2 ; -- [STEK] eller [GRILLA] <Food>[köttet]
		koka_V2_Apply_heat : V2 ; -- [KOKA] <Food>[betorna]
		koka_upp_V2_Apply_heat : V2 ; -- [KOKA UPP] och [SJUD] <Food>[rödbetorna]
		mikra_V2_Apply_heat : V2 ; -- [MIKRA] <Food>[dem]
		sjuda_V2_Apply_heat : V2 ; -- [KOKA UPP] och [SJUD] <Food>[rödbetorna]
		steka_V2_Apply_heat : V2 ; -- [STEKA] <Food>[kött] <Container>[i en värmetålig stekpåse]
		woka_V2_Apply_heat : V2 ; -- [WOKA] <Food>[grönsakerna]
		röka_V2_Apply_heat : V2 ; -- <Temperature_setting>[varm] [RÖKA] <Food>[min hemgjorda ost]

		ackreditera_V2_Appointing : V2 ; -- <Official>[Ambassadörer] [ACKREDITERAS] <Role>[till statschefer]

		alfabetisera_V2_Arranging : V2 ; -- [ALFABETISERA] <Theme>[orden ur en existerande roman]
		arrangera_V2_Arranging : V2 ; -- <Agent>[Nederländaren Maarten Bon] 1933-2003 arbetade under en period med att [ARRANGERA] <Theme>[fyra pianosatser i Stravinskys berömda Våroffer]
		gruppera_V2_Arranging : V2 ; -- <Agent>[Lasse] [GRUPPERAR] <Theme>[olika märken]
		lägga_upp_V2_Arranging : V2 ; -- <Agent>[Man] kan även [LÄGGA UPP] <Theme>[ett tak] <Configuration>[i form av en segelduk eller ett vackert parasoll]

		gripa_V2_Arrest : V2 ; -- <Authorities>[polisen , som] lyckas komma tillräckligt snabbt för att [GRIPA] <Suspect>[tjuven]

		ankomma_V_Arriving : V ; -- <Theme>[Tåget mot Norsborg] [ANKOMMER]
		anlända_V_Arriving : V ; -- [ANLÄNDE] <Theme>[Kris Beech] <Goal>[till Jönköping]
		komma_V_Arriving : V ; -- <Theme>[Vi] [KOM] <Goal>[till Sverige]
		landa_V_Arriving : V ; -- <Theme>[Dottern] har [LANDAT] <Goal>[i New York]
		smita_in_V_Arriving : V ; -- <Theme>[vi] [SMITER IN] <Goal>[på en krog där vi blir ensamma]

		kongressa_V_Assemble : V ; -- <Group>[Det miljöparti som] [KONGRESSAR]
		sammanträda_V_Assemble : V ; -- <Group>[Forskningsrådet] kommer att [SAMMANTRÄDA]

		bedöma_V2_Assessing : V2 ; -- <Assessor>[han] [BEDÖMDE] <Phenomenon>[sin egen form]
		estimera_V2_Assessing : V2 ; -- <Assessor>[Han] [ESTIMERADE] <Phenomenon>[vikten]
		evaluera_V2_Assessing : V2 ; -- <Phenomenon>[Ansökningarna] [EVALUERADES] <Assessor>[av program kommittén för delprogrammet]
		ranka_V2_Assessing : V2 ; -- <Phenomenon>[Sverige] [RANKAS]
		vikta_V2_Assessing : V2 ; -- <Phenomenon>[Betyg i dessa relativt krävande ämnen] ska kunna [VIKTAS]
		övervärdera_V2_Assessing : V2 ; -- <Phenomenon>[Trivselfaktorn] [ÖVERVÄRDERAS]

		hjälpa_V2_Assistance : V2 ; -- <Helper>[jag] kan [HJÄLPA] <Benefited_party>[henne]
		stödja_V2_Assistance : V2 ; -- <Helper>[Du] ska [STÖDJA] <Benefited_party>[mig] <Focal_entity>[i allt jag gör]
		tjäna_V2_Assistance : V2 ; -- <Helper>[Han] hade gett sitt liv för att [TJÄNA] <Benefited_party>[sin husbonde]
		hjälpa_V2V_Assistance : V2V ; -- <Helper>[sanden] [HJÄLPER] <Benefited_party>[dig] <Goal>[att flyta]

		gottgöra_V2_Atonement : V2 ; -- <Agent>[Jag] vill härmed [GOTTGÖRA] <Wrong>[denna försummelse]
		sona_V2_Atonement : V2 ; -- <Agent>[Marie] har [SONAT] <Wrong>[sitt brott]

		bränna_fast_V2_Attaching : V2 ; -- <Agent>[man] [BRÄNNER FAST] <Item>[det]
		fästa_V2_Attaching : V2 ; -- <Agent>[man] [FÄSTER] <Item>[en knapp] <Goal>[i ett plagg]
		förtöja_V2_Attaching : V2 ; -- <Agent>[en man och kvinna] [FÖRTÖJA] <Item>[sin segelbåt]
		haka_fast_V2_Attaching : V2 ; -- <Agent>[Jag] släcker alla ljus , [HAKAR FAST] <Item>[fönstret]
		montera_V2_Attaching : V2 ; -- <Agent>[man] [MONTERAR] <Item>[bilbarnstolen]
		spika_fast_V2_Attaching : V2 ; -- <Agent>[Vi] flyttade bort boden , rev bort masoniten och [SPIKADE FAST] <Item>[hattlist] <Goal>[på ytterväggarna]
		säkra_V2_Attaching : V2 ; -- <Agent>[man] [SÄKRAR] <Item>[sin last]
		koppla_ihop_V2_Attaching : V2 ; -- <Agent>[entreprenörerna Staffan Jonasson och Magnus Westin] på att [KOPPLA IHOP] <Items>[kablar]
		slå_fast_V2_Attaching : V2 ; -- [SLÅ FAST] <Item>[ramarna] <Goal>[i den] <Connector>[med spik]
		dra_fast_V2_Attaching : V2 ; -- <Item>[bogvisiret] [DRAS FAST] <Connector>[med vantskruvar] <Goal>[i durken]
		slå_på_V2_Attaching : V2 ; -- <Item>[panel] ska [SLÅS PÅ] <Goal>[på utsidan]

		angripa_V2_Attack : V2 ; -- <Assailant>[Naturvårdsverket] vill [ANGRIPA] <Victim>[de fem stora källorna till dioxinutsläppen : sopförbränningen , bilavgaserna , järn- och stålverken , skogsindustrin och sjukhusugnarna]
		atombomba_V2_Attack : V2 ; -- <Assailant>[Sovjetunionen] att [ATOMBOMBA] <Victim>[London och Paris]
		bomba_V2_Attack : V2 ; -- <Assailant>[ryssarna] och [BOMBADE] <Victim>[Bornholm]
		bombardera_V2_Attack : V2 ; -- <Assailant>[han] måste [BOMBARDERA] <Victim>[sin deserterade tornsoldat]
		ge_sig_på_V2_Attack : V2 ; -- <Assailant>[Mannen] [GAV SIG PÅ] <Victim>[60-åringen]

		anstränga_sig_V_Attempt : V ; -- <Agent>[Hon] [ANSTRÄNGER SIG] <Goal>[för att ta seden dit hon kommer]
		bjuda_till_V_Attempt : V ; -- <Agent>[vi] vågar [BJUDA TILL]
		anstränga_sig_VV_Attempt : VV ; -- <Agent>[Dessa journalister] är professionella som [ANSTRÄNGER SIG] <Goal>[att varna allmänheten i sitt land , att kritisera korruptionen i regimen]
		försöka_VV_Attempt : VV ; -- <Agent>[Hon] kommer också att [FÖRSÖKA] <Goal>[få sin häst stambokförd]
		söka_VV_Attempt : VV ; -- <Agent>[dem , som med den bästa ambition och redlighet] vilja [SÖKA] <Goal>[göra sitt bästa]

		försöka_V2_Attempt_means : V2 ; -- <Agent>[parterna] ut och var överens om att [FÖRSÖKA] med <Means>[fortsatta samtal]
		pröva_V2_Attempt_means : V2 ; -- <Agent>[Naturvårdsverket] [PRÖVAR] <Means>[dumpning i havet]
		försöka_VV_Attempt_means : VV ; -- [FÖRSÖKT] med att <Means>[gå ut med rabatterade biljetter]

		advocera_V_Attempt_suasion : V ; -- <Speaker>[Här] har han tydligt strävat efter att ge sitt diktarobjekt ett slags litteratuvetenskaplig upprättelse genom att konsekvent och med betvingande argument och vidsynt blick [ADVOCERA] <Content>[för Hoffmanns centrala ledmotiv och estetiska intentioner]
		agitera_V_Attempt_suasion : V ; -- <Speaker>[Jag] predikar neurologisk mångfald , och [AGITERAR] <Content>[för rätten att vara sig själv]
		lirka_V_Attempt_suasion : V ; -- <Speaker>[journalister som] ställer närgångna frågor och [LIRKAR]
		lobba_V_Attempt_suasion : V ; -- <Speaker>[Bilindustrin] började [LOBBA] <Content>[för statliga hjälpinsatser]
		pressa_V2_Attempt_suasion : V2 ; -- <Speaker>[Anders] [PRESSAR] <Addressee>[Annika]
		anbefalla_V2_Attempt_suasion : V2 ; -- <Speaker>[jag] [ANBEFALLA] <Content>[Ulf Starks senaste bilderbok , När mamma blev indian]
		föreslå_V2_Attempt_suasion : V2 ; -- [FÖRESLÅR] <Speaker>[regeringen] <Content>[införande av en 18-årsgräns för köp av receptfria läkemedel utanför apotek]

		bevista_V2_Attending : V2 ; -- <Agent>[han] [BEVISTADE] <Event>[matchen]
		övervara_V2_Attending : V2 ; -- <Agent>[Disponenten] var på väg till skolhuset för att [ÖVERVARA] och leda <Event>[Norra Sandsjö skyttegilles årsmöte]

		undvika_V2_Avoiding : V2 ; -- <Agent>[jag] [UNDVIKA] <Undesirable_situation>[dessa smärtor]
		undgå_VV_Avoiding : VV ; -- <Agent>[vi] kunnat [UNDGÅ] <Undesirable_situation>[att bli indragna i 1900-talets båda världskrig]
		undvika_VV_Avoiding : VV ; -- [UNDVIKA] <Undesirable_situation>[att bli sjuk]

		veta_V_Awareness : V ; -- <Cognizer>[vi] [VET] inte <Content>[om framtidens apparater kan avläsa det vi arkiverar i dag]
		ana_V2_Awareness : V2 ; -- [ANAR] <Cognizer>[man] <Content>[ett engagemang som slagit över i överkänslighet]
		känna_V2_Awareness : V2 ; -- <Content>[sjukdomar som] <Cognizer>[vi] inte [KÄNNER] <Content>[orsaken till]
		tro_V2_Awareness : V2 ; -- [TRODDE] <Cognizer>[jag] <Content>[hon var kär i mig]
		tro_VS_Awareness : VS ; -- <Cognizer>[Läkarna] [TRODDE] <Content>[att hon hade sköldkörtelinflammation]
		veta_VS_Awareness : VS ; -- <Cognizer>[Jag] [VET] inte <Content>[om det finns någon röd tråd]
		föreställa_sig_VV_Awareness : VV ; -- <Content>[Att beta cellernas funktion haltar när genen för glukokinas muteras] kunde <Cognizer>[man] väl [FÖRESTÄLLA SIG]

		få_medhåll_V_Be_in_agreement_on_assessment : V ; -- <Cognizer_1>[Grön Ungdom] [FÅR MEDHÅLL] <Cognizer_2>[av bland annat Mufaren Fredrik Axelsson]

		klå_V2_Beat_opponent : V2 ; -- <Winner>[Finland] inledde med att [KLÅ] <Loser>[Ryssland]
		slå_V2_Beat_opponent : V2 ; -- <Winner>[Tre utmanare] lyckades [SLÅ] <Loser>[Filip & Fredrik]
		slå_ner_V2_Beat_opponent : V2 ; -- <Winner>[den kinesiska kommunistregimens styrkor] [SLOG NER] <Loser>[revolten]
		slå_ut_V2_Beat_opponent : V2 ; -- <Winner>[brottarna] mötte varandra , för att därefter [SLÅ UT] <Loser>[varandra]
		spöa_V2_Beat_opponent : V2 ; -- [SPÖADE] <Winner>[jag] <Loser>[en polack]
		ta_V2_Beat_opponent : V2 ; -- <Winner>[vi] [TA] <Loser>[dem]
		utklassa_V2_Beat_opponent : V2 ; -- <Winner>[Italien] igen och [UTKLASSADE] <Loser>[Egypten]

		hålla_babblan_V_Become_silent : V ; -- <Speaker>[Jag] kunde sitta stilla och [HÅLLA BABBLAN]
		hålla_flabben_V_Become_silent : V ; -- <Speaker>[du] [HÅLLA FLABBEN]
		hålla_gafflan_V_Become_silent : V ; -- <Speaker>[Jag] förväntades helt enkelt [HÅLLA GAFFLAN]
		hålla_klaffen_V_Become_silent : V ; -- <Speaker>[jag] borde kanske [HÅLLA KLAFFEN]
		tiga_V_Become_silent : V ; -- [TEG] <Speaker>[Johansson]

		bli_V_Becoming : V ; -- <Entity>[Jag] [BLEV] <Final_state>[arg och upprörd]
		göra_sig_V_Becoming : V ; -- <Entity>[Föräldern] [GÖR SIG] <Final_state>[skyldig]
		utfalla_V_Becoming : V ; -- <Entity>[allt] har [UTFALLIT] <Final_state>[väl]
		bli_V2_Becoming : V2 ; -- <Entity>[jag] [BLEV] <Final_category>[artist]

		ansluta_sig_V_Becoming_a_member : V ; -- <Group>[Till deras lilla trupp] [ANSLUTER SIG] <New_member>[fler personer]
		inträda_V_Becoming_a_member : V ; -- <New_member>[Kroatien] lämnade in sin medlemsansökan till EU i februari och hoppas få [INTRÄDA] <Group>[i unionen]
		gå_in_i_V2_Becoming_a_member : V2 ; -- <New_member>[Georgien] för att [GÅ IN I] <Group>[den stora försvarsalliansen]
		gå_med_i_V2_Becoming_a_member : V2 ; -- <New_member>[Maria] hade varit <New_member>[hon] [GICK MED I] <Group>[kristdemokraterna]

		bli_varse_V_Becoming_aware : V ; -- <Cognizer>[Jag] har [BLIVIT VARSE] <Phenomenon>[om att tid verkligen kan vara en bristvara]
		märka_V2_Becoming_aware : V2 ; -- <Cognizer>[Många människor] kommer att [MÄRKA] <Phenomenon>[höjningen]
		varsna_V2_Becoming_aware : V2 ; -- <Cognizer>[man] ska [VARSNA] <Phenomenon>[faran]
		lägga_märke_till_VQ_Becoming_aware : VQ ; -- <Cognizer>[du] att [LÄGGA MÄRKE TILL] <Phenomenon>[hur all ansträngning och anspänning försvinner]
		upptäcka_VS_Becoming_aware : VS ; -- [UPPTÄCKA] , <Phenomenon>[att den man trott på inte håller måttet]

		lösgöra_sig_V_Becoming_detached : V ; -- <Item>[Satelliten] [LÖSGJORDE SIG] dock <Source>[från bärraketens tredje steg]
		slita_sig_V_Becoming_detached : V ; -- <Item>[namnlapparna] [SLET SIG]
		släppa_V_Becoming_detached : V ; -- <Item>[Linan] skar in i halsen men [SLÄPPTE] <Source>[från staketet]

		lufttorka_V_Becoming_dry : V ; -- <Entity>[nyponen] [LUFTTORKA]
		soltorka_V_Becoming_dry : V ; -- <Entity>[de skördade lökarna] [SOLTORKA]
		torka_V_Becoming_dry : V ; -- <Entity>[Spacklet] måste [TORKA]
		torka_bort_V_Becoming_dry : V ; -- <Entity>[All fukt] [TORKAR BORT]
		torka_in_V_Becoming_dry : V ; -- <Entity>[knopparna] [TORKAR IN]
		torka_upp_V_Becoming_dry : V ; -- <Entity>[banan] [TORKADE UPP]
		torka_ut_V_Becoming_dry : V ; -- <Entity>[Floderna vi passerar] har [TORKAT UT]

		dela_sig_V_Becoming_separated : V ; -- <Whole>[kräftan] [DELAR SIG] <Parts>[i två halvor]
		smula_V_Becoming_separated : V ; -- <Whole>[ett saftigare bröd som] [SMULAR]
		smula_sig_V_Becoming_separated : V ; -- <Whole>[Min grovhackade kycklingleverpaté] [SMULAR SIG]

		dirigera_V2_Behind_the_scenes : V2 ; -- <Artist>[Lehtinen] hade förmånen att få [DIRIGERA] <Production>[Ingvar Lindholms dramatiska och magnifikt svärtade Kontakion som repeterades under sista tävlingsomgången]
		filmatisera_V2_Behind_the_scenes : V2 ; -- [FILMATISERA] <Production>[böckerna om 007]
		producera_V2_Behind_the_scenes : V2 ; -- <Artist>[ScanTV] ska [PRODUCERA] <Production>[färre egna program]
		regissera_V2_Behind_the_scenes : V2 ; -- <Artist>[Hon] har [REGISSERAT] <Production>[fem långfilmer]
		rollbesätta_V2_Behind_the_scenes : V2 ; -- <Artist>[Anna] [ROLLBESATTE] <Production>[Vita lögner]
		smalfilma_V2_Behind_the_scenes : V2 ; -- <Artist>[Konstgrafikern Tuulikki Pietilä] [SMALFILMADE] <Scene>[parets vistelse och hur de bar sig åt på ön]

		hålla_ihop_V_Being_attached : V ; -- <Item>[dykparen] hela tiden [HÅLLER IHOP] <Goal>[med linan]

		föda_V2_Being_born : V2 ; -- <Child>[Jag] [FÖDDES]

		arbeta_V_Being_employed : V ; -- <Employee>[Många] kan [ARBETA]
		jobba_V_Being_employed : V ; -- <Employee>[Hon] har [JOBBAT] <Place_of_employment>[på arkivet]
		yrkesarbeta_V_Being_employed : V ; -- <Employee>[modern] inte [YRKESARBETAR]

		ligga_V_Being_located : V ; -- <Theme>[Tågstationen] [LIGGER] <Location>[under jord]
		sitta_V_Being_located : V ; -- <Location>[På balkongräcket utanför fönstret] [SITTER] <Theme>[julbelysningen]
		stå_V_Being_located : V ; -- <Location>[På bordet] [STÅR] <Theme>[en tidstypisk bag]
		vara_V_Being_located : V ; -- <Theme>[Dottern] [ÄR] <Location>[hos sin far]

		belägra_V2_Besieging : V2 ; -- <Assailant>[De som blir lottlösa] [BELÄGRAR] <Victim>[bussen]
		omringa_V2_Besieging : V2 ; -- <Assailant>[Polisen] [OMRINGAR] <Victim>[olika aktivtistcenter]
		ringa_V2_Besieging : V2 ; -- [INRINGAR] <Assailant>[den kommunistiska gerillarörelsen Vietminh] <Victim>[den franska fästningen Dien Bien Phu]

		embarkera_V2_Board_vehicle : V2 ; -- <Traveller>[Passagerarna] kan [EMBARKERA] <Vehicle>[livbåtarna]
		stiga_på_V2_Board_vehicle : V2 ; -- <Traveller>[alla] att [STIGA PÅ] <Vehicle>[bussen]

		bocka_sig_V_Body_movement : V ; -- <Agent>[hon] [BOCKAR SIG]
		buga_V_Body_movement : V ; -- <Agent>[Olga Danilova] [KORSAR SIG] och [BUGAR]
		fingra_V_Body_movement : V ; -- <Agent>[Farmor] ligger och [HALVBLUNDAR] , [FINGRAR]
		gäspa_V_Body_movement : V ; -- <Agent>[hon] [GÄSPA]
		halvblunda_V_Body_movement : V ; -- <Agent>[Farmor] ligger och [HALVBLUNDAR] , [FINGRAR]
		hovniga_V_Body_movement : V ; -- <Agent>[Alla damer] oavsett ålder [HOVNEG]
		jucka_V_Body_movement : V ; -- <Agent>[Jag] tror att jag hjälpte genom att sitta och [JUCKA] <Body_part>[med rumpan]
		klippa_med_ögonen_V_Body_movement : V ; -- <Agent>[Hon] [KLIPPER MED ÖGONEN]
		klippa_med_öronen_V_Body_movement : V ; -- <Agent>[Hon] ser på mig med mörkbruna sammetsögon och [KLIPPER MED ÖRONEN]
		knixa_V_Body_movement : V ; -- <Agent>[en ung tjej] [KNIXA]
		korsa_sig_V_Body_movement : V ; -- <Agent>[Olga Danilova] [KORSAR SIG] och [BUGAR]
		leda_V_Body_movement : V ; -- <Agent>[Hon] kunde inte [LEDA] <Body_part>[på foten]
		masturbera_V_Body_movement : V ; -- <Agent>[90 procent av alla män , inklusive katolska präster] , [MASTURBERAR]
		onanera_V_Body_movement : V ; -- <Agent>[Han] hade [ONANERAT]
		runka_V_Body_movement : V ; -- <Agent>[Han] [RUNKAR]
		röra_V_Body_movement : V ; -- <Agent>[hon] [RÖRDE] <Body_part>[på huvudet]
		vicka_V_Body_movement : V ; -- <Agent>[Paul Stanley] [VICKAR] <Body_part>[på höfterna]
		korsa_V2_Body_movement : V2 ; -- <Agent>[Hon] [KORSAR] <Body_part>[armarna]

		förfalla_V_Bond_maturation : V ; -- <Financial_instrument>[dyra femåriga lån] [FÖRFALLER]
		löpa_ut_V_Bond_maturation : V ; -- <Financial_instrument>[obligationen] [LÖPER UT]

		bravera_V_Bragging : V ; -- <Speaker>[hon] skulle [BRAVERA] <Topic>[med sin konst]
		göra_sig_fin_V_Bragging : V ; -- <Speaker>[blomman] slutade att [GÖRA SIG FIN]
		skryta_V_Bragging : V ; -- <Speaker>[Jag] vill inte [SKRYTA] <Topic>[om nånting]

		inhalera_V2_Breathing : V2 ; -- <Agent>[hon] ertappats med att [INHALERA] <Air>[lustgas]
		andas_in_V2_Breathing : V2 ; -- <Air>[Vissa mediciner] [INHALERAS] , d.v.s [ANDAS IN]

		bära_upp_V2_Bringing : V2 ; -- <Agent>[han] Cecilia och börjar sedan [BÄRA UPP] <Theme>[soppåsar med gamla blöjor]
		flotta_V2_Bringing : V2 ; -- [FLOTTADE] <Agent>[han] <Theme>[timmer]
		forsla_V2_Bringing : V2 ; -- [FORSLAR] <Agent>[de] <Goal>[dit] <Theme>[flera kubik med sand]
		forsla_fram_V2_Bringing : V2 ; -- <Agent>[vi] [FORSLA FRAM] <Theme>[kompressorer och långa slangar]
		forsla_in_V2_Bringing : V2 ; -- <Agent>[De] [FORSLAR IN] <Theme>[militär utrustning]
		köra_V2_Bringing : V2 ; -- <Agent>[ni] skulle [KÖRA] <Theme>[henne] <Goal>[till skolan]
		forsla_ned_V2_Bringing : V2 ; -- <Theme>[de 23 från 89:e våningen] [FORSLADES NED] <Path>[genom trapporna och ut ur den brinnande byggnaden]

		anlägga_V2_Building : V2 ; -- <Agent>[Norge] rustar upp och [ANLÄGGER] <Created_entity>[fästningar]
		bygga_V2_Building : V2 ; -- <Agent>[Sjökaptenen] [BYGGDE] <Created_entity>[sitt hus] <Components>[av holländskt tegel]
		bygga_om_V2_Building : V2 ; -- <Agent>[Vi] [BYGGER OM] <Created_entity>[vårt kök]
		bygga_ut_V2_Building : V2 ; -- <Agent>[man] antagligen måste [BYGGA UT] <Created_entity>[stadshuset]
		göra_V2_Building : V2 ; -- <Agent>[Möbelakrobaterna] [GÖR] <Created_entity>[möbler] <Components>[av slitna skor och gamla badkar]
		lyxrenovera_V2_Building : V2 ; -- <Agent>[tjejen] i full färd med att [LYXRENOVERA] <Created_entity>[lägenheten]
		montera_V2_Building : V2 ; -- <Agent>[man] [MONTERADE] endast <Created_entity>[sex flygplan]
		renovera_V2_Building : V2 ; -- <Agent>[han] på att [RENOVERA] <Created_entity>[hallen]
		slå_upp_V2_Building : V2 ; -- <Agent>[Olika företag och sponsorer] har [SLAGIT UPP] <Created_entity>[sina tält]
		sätta_ihop_V2_Building : V2 ; -- <Agent>[En smart student] kan [SÄTTA IHOP] <Created_entity>[en persondator]
		timra_V2_Building : V2 ; -- <Agent>[De] [TIMRAR] <Created_entity>[en ny trappa]
		uppföra_V2_Building : V2 ; -- <Agent>[han] [UPPFÖRA] <Created_entity>[en byggnad som kallas Beckford ' s torn]
		sätta_samman_V2_Building : V2 ; -- <Agent>[vi] däremot [SÄTTER SAMMAN] <Components>[delarna till ett hus eller en motor]

		blanda_ihop_V2_Bungling : V2 ; -- <Agent>[ni] [BLANDAR IHOP] <Patient>[kommunikation och dialog]
		schabbla_bort_V2_Bungling : V2 ; -- <Patient>[Hallströms samer] [SJABBLAS BORT]

		föra_V2_Carry_goods : V2 ; -- <Distributor>[de] [FÖR] inte <Goods>[försvarets hudsalva]
		saluföra_V2_Carry_goods : V2 ; -- [SALUFÖRA] <Goods>[livsmedel som är så rena och fria från tillsatser som möjligt]

		råka_illa_ut_V_Catastrophe : V ; -- <Undergoer>[Den som bygger sin verksamhet på sponsorpengar] [RÅKAR ILLA UT]
		råka_ut_V_Catastrophe : V ; -- <Undergoer>[hundarna] [RÅKA UT] <Undesirable_Event>[för en massa svansolyckor]
		drabba_V2_Catastrophe : V2 ; -- <Undesirable_Event>[Fusionen] kommer att [DRABBA] <Undergoer>[en tredjedel av de sammanlagt 18500 anställda i bankerna]

		artbestämma_V2_Categorization : V2 ; -- <Cognizer>[Experten Mikael Krikorev] berättar och [ARTBESTÄMMER] <Item>[besökarnas egna svampar]
		kategorisera_V2_Categorization : V2 ; -- <Item>[Orkaners styrka] [KATEGORISERAS] <Criteria>[enligt ett system som kallas Saffir-Simpsonskalan]

		leda_V_Causation : V ; -- <Cause>[Bedrägerier] [LEDDE] <Effect>[till fängelse]
		framkalla_V2_Causation : V2 ; -- <Actor>[Ormen] kan [FRAMKALLA] <Effect>[svåra symtom]
		väcka_V2_Causation : V2 ; -- <Actor>[jag] ville [VÄCKA] <Effect>[uppmärksamhet]
		åsamka_V2_Causation : V2 ; -- <Actor>[Hajar] har setts använda för att [ÅSAMKA] <Effect>[skada] <Affected>[på sina bytesdjur]
		göra_V2_Causation : V2 ; -- <Actor>[Du] [GJORDE] <Affected>[mig] <Effect>[jätteglad]
		förorsaka_V2_Causation : V2 ; -- <Cause>[Händelsen] [FÖRORSAKADE] <Effect>[totalstopp på riksväg 26]
		orsaka_V2_Causation : V2 ; -- <Cause>[Fattigdom] [ORSAKAR] <Effect>[sjuklighet]
		utlösa_V2_Causation : V2 ; -- <Cause>[Hängdrivor] kan också [UTLÖSA] <Effect>[laviner]
		vålla_V2_Causation : V2 ; -- <Cause>[en utlösande infektion som] [VÅLLAR] <Effect>[sjukdomen]
		få_V2V_Causation : V2V ; -- <Cause>[Bilderna på mormors morfar] [FICK] <Affected>[mig] <Effect>[att drömma om att också bli äventyrare]
		komma_V2V_Causation : V2V ; -- <Cause>[Det våldsamma septemberovädret det året] [KOM] <Affected>[floden] <Effect>[att svämma över]
		tvinga_V2V_Causation : V2V ; -- <Cause>[Bostadsbristen] [TVINGADE] <Affected>[henne] <Effect>[flytta]

		arrangera_V2_Cause_change : V2 ; -- <Agent>[Han] skrev musiken till kända filmer som Mannen på taket ( 1976 ) och Jägarna ( 1996 ) samt komponerade och [ARRANGERADE] <Attribute>[musik för radio , tv och teater]
		förändra_V2_Cause_change : V2 ; -- <Agent>[Många ungdomar] [FÖRÄNDRAR] också <Entity>[sitt beteende]
		göra_V2_Cause_change : V2 ; -- <Agent>[Jag] vill också [GÖRA] <Entity>[världen] <Final_category>[till en lite bättre plats]
		omdana_V2_Cause_change : V2 ; -- <Agent>[Gandhi] [OMDANAR] <Entity>[Indiens ekonomi]
		ändra_V2_Cause_change : V2 ; -- <Agent>[hon] [ÄNDRAR] <Entity>[formuleringar som hon har grubblat på , ord som skimrar i hennes minne]
		omvandla_V2_Cause_change : V2 ; -- <Entity>[de] [OMVANDLAS] <Final_category>[till ännu finare smycken]
		omändra_V2_Cause_change : V2 ; -- <Entity>[den] [OMÄNDRAS] <Final_category>[till laståsna] eller <Final_category>[till konferensutrymme]

		lösa_V2_Cause_change_of_consistency : V2 ; -- <Agent>[man] behöver göra är att [LÖSA] <Undergoer>[pigmentet]
		reda_ut_V2_Cause_change_of_consistency : V2 ; -- [REDA UT] <Undergoer>[såsen]
		lösa_upp_V2_Cause_change_of_consistency : V2 ; -- <Undergoer>[Tabletten är en brustablett som] ska [LÖSAS UPP]

		frysa_V2_Cause_change_of_phase : V2 ; -- [FRYSA] <Undergoer>[surdegsbas]
		smälta_V2_Cause_change_of_phase : V2 ; -- [SMÄLTA] <Undergoer>[maten]
		tina_V2_Cause_change_of_phase : V2 ; -- <Agent>[De] hade ställt in för att [TINA] <Undergoer>[ett fruset rör]
		tina_upp_V2_Cause_change_of_phase : V2 ; -- <Agent>[Arkeologerna] för att [TINA UPP] <Undergoer>[tjälen]
		förgasa_V2_Cause_change_of_phase : V2 ; -- <Undergoer>[natriumet] [FÖRGASATS]
		förånga_V2_Cause_change_of_phase : V2 ; -- <Undergoer>[Metalliskt bly] [FÖRÅNGAS]

		befästa_V2_Cause_change_of_strength : V2 ; -- <Agent>[USA] [BEFÄSTER] <Patient>[sin makt över nätet]
		förstärka_V2_Cause_change_of_strength : V2 ; -- <Agent>[politikerna och tjänstemännen] [FÖRSTÄRKER] <Patient>[vårdkedjan]
		aggravera_V2_Cause_change_of_strength : V2 ; -- <Cause>[Den nedsatta näsandningen] [AGGRAVERAR] <Patient>[snarkning och sömnapné]
		försvaga_V2_Cause_change_of_strength : V2 ; -- <Cause>[Vi har en cancerkris orsakad av hiv , som] [FÖRSVAGAR] <Patient>[kroppens immunförsvar]

		missfirma_V2_Cause_emotion : V2 ; -- <Agent>[tonåringar] bör avstå från att råna och [MISSFIRMA] <Experiencer>[pensionärer]
		smickra_V2_Cause_emotion : V2 ; -- <Agent>[han] [SMICKRADE] <Experiencer>[mig]
		smäda_V2_Cause_emotion : V2 ; -- <Agent>[Man] ska lyfta fram sitt lag och [SMÄDA] <Experiencer>[motståndarna]

		droppa_V2_Cause_fluidic_motion : V2 ; -- <Agent>[man] antingen [DROPPA] <Goal>[i] <Fluid>[oljan]
		skvalpa_ut_V2_Cause_fluidic_motion : V2 ; -- <Agent>[prästen] som skred fram för att inte [SKVALPA UT] <Fluid>[den glittrande pölen]
		slå_V2_Cause_fluidic_motion : V2 ; -- <Agent>[Hon] hade en skopa i handen och [SLOG] <Fluid>[vatten] <Goal>[på stenarna som låg på bastuelementet]
		slå_på_V2_Cause_fluidic_motion : V2 ; -- [SLÅ PÅ] <Fluid>[vitt vin]
		slå_ut_V2_Cause_fluidic_motion : V2 ; -- <Agent>[Hon] stökade omkring , [SLOG UT] <Fluid>[vattnet]
		strila_V2_Cause_fluidic_motion : V2 ; -- <Agent>[hon] [STRILADE] <Fluid>[den ruttna urinen] <Goal>[över jorden]
		tappa_V2_Cause_fluidic_motion : V2 ; -- <Agent>[den förste libanesiske vintillverkare som] [TAPPADE] <Fluid>[vin] <Goal>[på flaska]

		hugga_V_Cause_harm : V ; -- [HUGGER] <Agent>[hon] <Victim>[på honom]
		daska_V2_Cause_harm : V2 ; -- [DASKADE] <Agent>[vårdbiträdet] <Victim>[93-åringen] <Body_part>[i ansiktet]
		daska_till_V2_Cause_harm : V2 ; -- <Agent>[han] [DASKADE TILL] <Victim>[henne]
		golva_V2_Cause_harm : V2 ; -- <Agent>[Han] fläskade till två brudar på truten , [GOLVADE] <Victim>[en snubbe]
		hugga_V2_Cause_harm : V2 ; -- <Agent>[hon] och [HÖGG] <Victim>[honom] <Body_part>[i halsen]
		klå_upp_V2_Cause_harm : V2 ; -- <Agent>[han] skulle [KLÅ UPP] <Victim>[cykeltjuvar]
		knäa_V2_Cause_harm : V2 ; -- <Agent>[hon] [KNÄADE] <Victim>[sin konkurrent] <Body_part>[i ansiktet] utan <Body_part>[i pannan]
		slå_V2_Cause_harm : V2 ; -- <Agent>[en av dem] hann [SLÅ] <Victim>[festdeltagaren] <Body_part>[i huvudet]
		slå_ner_V2_Cause_harm : V2 ; -- <Agent>[tre yngre män upp] och [SLOG NER] <Victim>[artisten]
		smocka_till_V2_Cause_harm : V2 ; -- <Agent>[han] [SMOCKADE TILL] <Victim>[en politisk motståndare]
		sparka_V2_Cause_harm : V2 ; -- <Victim>[en snubbe som] <Agent>[han] [SPARKADE] <Body_part>[i ansiktet]
		spöa_V2_Cause_harm : V2 ; -- <Agent>[de] inte fick [SPÖA] <Victim>[eleverna]
		spöa_upp_V2_Cause_harm : V2 ; -- <Agent>[möss] kan [SPÖA UPP] <Victim>[katten]
		slåss_V2_Cause_harm : V2 ; -- <Victim>[En man] har [SLAGITS] <Agent>[av ett par andra män]

		banka_V_Cause_impact : V ; -- [BANKAR] <Agent>[man] <Impactor>[med lämplig tillhygge] <Impactee>[på den tjocka nedre delen]
		drämma_V2_Cause_impact : V2 ; -- <Agent>[Soldat] [DRÄMDE] <Impactor>[dörr] <Impactee>[på sin fru]
		dänga_V2_Cause_impact : V2 ; -- <Agent>[en vuxen spelfantast] som undertecknad får lust att [DÄNGA] <Impactor>[konsolen] <Impactee>[i väggen]
		slå_V2_Cause_impact : V2 ; -- <Agent>[Emil] [SLOG] <Impactor>[näven] <Impactee>[i bordet]
		daska_till_V2_Cause_impact : V2 ; -- <Agent>[Ulf Jängnemyr som] [DASKADE TILL] <Impactee>[bollen]
		drämma_till_V2_Cause_impact : V2 ; -- <Agent>[Jag] ropade på hjälp och [DRÄMDE TILL] <Impactee>[honom] <Impactor>[med armbågen]
		slå_ihop_V2_Cause_impact : V2 ; -- <Agent>[Frieda] [SLOG IHOP] <Impactors>[händerna]
		köra_V2_Cause_impact : V2 ; -- [KÖRS] <Impactor>[nålen]

		röra_V_Cause_motion : V ; -- <Theme>[den] gick inte att [RÖRA]
		toppa_V_Cause_motion : V ; -- [TOPPAR] <Theme>[bollen]
		flytta_V2_Cause_motion : V2 ; -- [FLYTTA] <Theme>[bord]
		skjuta_V2_Cause_motion : V2 ; -- <Agent>[De] [SKJUTER] <Area>[omkring] <Theme>[bordet och sängen]
		skjuta_ut_V2_Cause_motion : V2 ; -- <Agent>[Han] [SKÖT UT] <Theme>[sig]
		släpa_V2_Cause_motion : V2 ; -- <Agent>[Tonårspojkarna] tejpade en yngre skolkamrat över hela kroppen och [SLÄPADE] <Theme>[honom] <Area>[över golvet]
		vältra_av_V2_Cause_motion : V2 ; -- <Agent>[Jag] försökte vända mig om och [VÄLTRA AV] <Theme>[honom]
		vältra_undan_V2_Cause_motion : V2 ; -- <Agent>[Assim] [VÄLTRADE UNDAN] <Theme>[en sten]
		bogsera_V2_Cause_motion : V2 ; -- <Agent>[Min pappa och jag] [BOGSERADE] <Theme>[Forden] <Source>[från verkstaden] <Goal>[till min arbetskamrat]
		fira_ner_V2_Cause_motion : V2 ; -- <Agent>[De] [FIRADE NER] <Theme>[två plankor] <Goal>[till lagom höjd]
		kasta_V2_Cause_motion : V2 ; -- <Agent>[Mannen] [KASTADE] <Theme>[trädgårdsmöbeln] <Goal>[i ryggen på kvinnan]
		skjuta_iväg_V2_Cause_motion : V2 ; -- <Agent>[De] snor deras boll och [SKJUTER IVÄG] <Theme>[den] <Goal>[åt helvete]
		toppa_V2_Cause_motion : V2 ; -- <Agent>[Pelle] [TOPPAR] <Theme>[bollen] <Goal>[i sanden]
		vältra_V2_Cause_motion : V2 ; -- [VÄLTRA] ett <Theme>[klippblock] <Goal>[uppför ett berg]
		nicka_V2_Cause_motion : V2 ; -- <Agent>[Jag] hoppades kunna [NICKA] <Path>[bort] <Theme>[bollen]
		rulla_V2_Cause_motion : V2 ; -- <Agent>[Man] [RULLADE] <Theme>[boll] <Path>[längs marken]
		vältra_upp_V2_Cause_motion : V2 ; -- <Agent>[UCK] stängt av huvudvägen mellan Pristina och Pec genom att [VÄLTRA UPP] <Theme>[högar med jord] <Path>[tvärs över vägen]
		toppa_V3_Cause_motion : V3 ; -- <Agent>[jag] [TOPPAR] <Theme>[bollen]
		hala_V2_Cause_motion : V2 ; -- <Theme>[Flaggan] [HALAS]
		hissa_V2_Cause_motion : V2 ; -- <Theme>[Flaggan] [HISSAS]

		hetta_upp_V2_Cause_temperature_change : V2 ; -- <Agent>[man] bara [HETTA UPP] <Item>[köttet] <Hot_Cold_source>[i såsen]
		kyla_V2_Cause_temperature_change : V2 ; -- <Hot_Cold_source>[Med saltblandningen] [KYLER] <Agent>[man] <Item>[berget]
		kyla_ner_V2_Cause_temperature_change : V2 ; -- [KYLA NER] <Item>[bron]
		svalka_av_V2_Cause_temperature_change : V2 ; -- [SVALKA AV] <Item>[kroppen]
		svalka_ner_V2_Cause_temperature_change : V2 ; -- [SVALKA NER] <Item>[vår överhettade planet]
		värma_upp_V2_Cause_temperature_change : V2 ; -- <Agent>[Allt fler] [VÄRMER UPP] <Item>[huset] <Hot_Cold_source>[med ved]
		överhetta_V2_Cause_temperature_change : V2 ; -- [ÖVERHETTA] <Item>[ångan]
		värma_V2_Cause_temperature_change : V2 ; -- <Cause>[solen] [VÄRMDE] <Item>[barackväggarna]

		förena_V2_Cause_to_amalgamate : V2 ; -- <Agent>[Hon] [FÖRENAR] <Part_1>[drömmen] <Part_2>[med verkligheten] , <Part_1>[natten] <Part_2>[med dagen]
		kombinera_V2_Cause_to_amalgamate : V2 ; -- <Agent>[Hon] jobbar extra i växeln , [KOMBINERAR] <Part_1>[arbetet] <Part_2>[med studier]
		bunta_ihop_V2_Cause_to_amalgamate : V2 ; -- <Agent>[USA] har [BUNTAT IHOP] <Parts>[Irak , Iran och Nordkorea] <Whole>[till " ondskans axelmakter "]
		korsa_V2_Cause_to_amalgamate : V2 ; -- <Agent>[forskarna] ska kunna [KORSA] <Parts>[sädesslag]

		föna_V2_Cause_to_be_dry : V2 ; -- <Agent>[Mamman] bär numera smink och smycken ibland och [FÖNAR] <Dryee>[håret]
		hässja_V2_Cause_to_be_dry : V2 ; -- <Agent>[man] [HÄSSJADE] <Dryee>[hö]
		torka_V2_Cause_to_be_dry : V2 ; -- <Agent>[Hon] [TORKAR] <Dryee>[håret]
		torktumla_V2_Cause_to_be_dry : V2 ; -- <Agent>[jag] få komma in hos en familj och värma mig och [TORKTUMLA] <Dryee>[mina kläder]
		ugnstorka_V2_Cause_to_be_dry : V2 ; -- <Agent>[Jag] brukar skära bort fettet och [UGNSTORKA] <Dryee>[bacon]
		torka_ut_V2_Cause_to_be_dry : V2 ; -- <Cause>[Låsspray] kan [TORKA UT] <Dryee>[låsen]
		avfukta_V2_Cause_to_be_dry : V2 ; -- <Dryee>[Huset] har [AVFUKTATS]
		soltorka_V2_Cause_to_be_dry : V2 ; -- <Dryee>[den] [SOLTORKAS]
		torka_bort_V2_Cause_to_be_dry : V2 ; -- <Dryee>[75 % av vattenhalten i frukt och grönsaker] [TORKAS BORT]

		adjungera_V2_Cause_to_be_included : V2 ; -- <Agent>[Styrelsen] har sitt säte i Enköping och kan vid behov till sig [ADJUNGERA] <New_member>[ledamöter]
		införliva_V2_Cause_to_be_included : V2 ; -- <Agent>[tsaren] tänkte inte [INFÖRLIVA] <New_member>[östra rikshalvan] <Group>[med Ryssland]
		infoga_V2_Cause_to_be_included : V2 ; -- <New_member>[Ett nytt namn] kan [INFOGAS] <Group>[i den ädla listan]
		inlemma_V2_Cause_to_be_included : V2 ; -- <New_member>[han] [INLEMMATS] <Group>[i Bror Janssons Trio]
		integrera_V2_Cause_to_be_included : V2 ; -- <New_member>[Film och biografer] bör [INTEGRERAS] <Group>[i skolans verksamhet]
		tillfoga_V2_Cause_to_be_included : V2 ; -- [TILLFOGAS] <New_member>[ett elfte bud , som brukar kallas ' Jantelagens strafflag ']
		uppta_V2_Cause_to_be_included : V2 ; -- <New_member>[Den som] [UPPTOGS] <Group>[i klostret]

		skärpa_V2_Cause_to_be_sharp : V2 ; -- <Agent>[Ingela Gustafsson] och [SKÄRPTE] <Patient>[eggen på sin lie]
		vässa_V2_Cause_to_be_sharp : V2 ; -- <Agent>[Chili-Nisse] kommer att älska att [VÄSSA] <Patient>[klorna]

		dränka_V2_Cause_to_be_wet : V2 ; -- [DRÄNKER] <Agent>[du] <Undergoer>[dem] <Liquid>[i citron]
		läska_V2_Cause_to_be_wet : V2 ; -- <Agent>[Den som inte bara vill väta utsidan] kan även [LÄSKA] <Undergoer>[insidan]
		bevattna_V2_Cause_to_be_wet : V2 ; -- <Undergoer>[Sälgsnåren] [BEVATTNAS] <Liquid>[med tippens starkt kvävehaltiga lakvatten]

		fortsätta_VV_Cause_to_continue : VV ; -- <Agent>[de] [FORTSÄTTER] <Process>[att driva en eurostödslinje man för stunden inte kan omfatta]

		bryta_V2_Cause_to_end : V2 ; -- <Agent>[ringdomaren] [BRYTA] <Process>[matchen]
		fuska_bort_V2_Cause_to_end : V2 ; -- <Agent>[hon] kan inte [FUSKA BORT] <Process>[timmar]
		arbeta_bort_V2_Cause_to_end : V2 ; -- <Agent>[De] skall vara med och [ARBETA BORT] <State>[fattigdomen]
		lyfta_V2_Cause_to_end : V2 ; -- <Agent>[FN] [LYFTER] <State>[sanktionerna mot Irak]
		slå_upp_V2_Cause_to_end : V2 ; -- <Agent>[Florence] [SLÅR UPP] <State>[sin förlovning med ' Stilton ']

		förlusta_V2_Cause_to_experience : V2 ; -- <Agent>[han] uppenbart [FÖRLUSTADE] <Experiencer>[hela sällskapet]
		terrorisera_V2_Cause_to_experience : V2 ; -- <Agent>[En man i Linköping] döms till fyra månaders fängelse för att ha [TERRORISERAT] <Experiencer>[sin före detta flickvän]

		bryta_av_V2_Cause_to_fragment : V2 ; -- [BRYTA AV] <Whole_patient>[skivan]
		paja_V2_Cause_to_fragment : V2 ; -- <Agent>[Han] [PAJAR] <Whole_patient>[rutor]
		slå_in_V2_Cause_to_fragment : V2 ; -- <Agent>[De] [SLOG IN] <Whole_patient>[ytterdörren]
		slå_sönder_V2_Cause_to_fragment : V2 ; -- <Agent>[Han] börjar [SLÅ SÖNDER] <Whole_patient>[allt han kommer över]

		pingla_V2_Cause_to_make_noise : V2 ; -- <Sound_maker>[den] <Agent>[kokerskan] brukade [PINGLA]
		spela_V2_Cause_to_make_noise : V2 ; -- <Agent>[Mr Gillis] [SPELAR] <Sound_maker>[skivor]

		förbättra_V2_Cause_to_make_progress : V2 ; -- <Agent>[du] [FÖRBÄTTRA] <Project>[svenska servicen]
		förnya_V2_Cause_to_make_progress : V2 ; -- <Agent>[Man] höll på att [FÖRNYA] och [MODERNISERA] <Project>[verksamheten]
		modernisera_V2_Cause_to_make_progress : V2 ; -- <Agent>[Man] höll på att [FÖRNYA] och [MODERNISERA] <Project>[verksamheten]
		utveckla_V2_Cause_to_make_progress : V2 ; -- <Agent>[Bolaget Faxell 2.0] , som har till uppgift att [UTVECKLA] <Project>[Dalsbruks centrum]
		öka_värdet_på_V2_Cause_to_make_progress : V2 ; -- <Agent>[arbetare som] [ÖKAR VÄRDET PÅ] <Project>[det arbete som utförs av andra]

		skaka_V2_Cause_to_move_in_place : V2 ; -- <Agent>[Jag] [SKAKADE] <Theme>[flaskan]
		vicka_V2_Cause_to_move_in_place : V2 ; -- <Agent>[Love] [VICKAR] <Theme>[stolen]
		rotera_V2_Cause_to_move_in_place : V2 ; -- <Theme>[Bilden] [ROTERAS]

		förevisa_V2_Cause_to_perceive : V2 ; -- [FÖREVISAR] <Phenomenon>[stjärnhimlen]

		starta_om_V2_Cause_to_resume : V2 ; -- <Agent>[jag] tänkt gå upp i vettig tid , [STARTA OM] <Process>[den biologiska klockan]
		återuppliva_V2_Cause_to_resume : V2 ; -- <Agent>[Han kan räknas som den person som] [ÅTERUPPLIVADE] <Process>[IRA]

		driva_fram_V2_Cause_to_start : V2 ; -- <Cause>[Ekonomiska skillnader] [DRIVER FRAM] <Effect>[migration]
		få_till_stånd_V2_Cause_to_start : V2 ; -- <Cause>[Svenska försök] att [FÅ TILL STÅND] <Effect>[en internationell överenskommelse om minskade kväveoxidutsläpp]
		tända_V2_Cause_to_start : V2 ; -- <Cause>[Gnistan] hade [TÄNT] <Effect>[ilska hos många muslimer]
		provocera_fram_V2_Cause_to_start : V2 ; -- <Effect>[kriget i Tjetjenien] [PROVOCERADES FRAM] <Cause>[av makthavarna i Kreml]

		uppväcka_V2_Cause_to_wake : V2 ; -- [UPPVÄCKER] <Agent>[han] <Sleeper>[en död]
		väcka_V2_Cause_to_wake : V2 ; -- <Agent>[de] [VÄCKA] <Sleeper>[föraren]
		återuppväcka_V2_Cause_to_wake : V2 ; -- <Agent>[man] nu börjat försöka [ÅTERUPPVÄCKA] <Sleeper>[tasmanskan]

		bortgå_V_Ceasing_to_be : V ; -- <Entity>[en lämnande grupp] [BORTGÅR]
		dö_bort_V_Ceasing_to_be : V ; -- <Entity>[motorljudet] [DÖR BORT]
		dö_ut_V_Ceasing_to_be : V ; -- <Entity>[Seden] [DOG UT]
		försvinna_V_Ceasing_to_be : V ; -- <Entity>[Tre arbetsplatser] [FÖRSVINNER]
		gå_upp_i_rök_V_Ceasing_to_be : V ; -- <Entity>[Bensinen] bara [GÅR UPP I RÖK]
		förgå_V2_Ceasing_to_be : V2 ; -- <Entity>[jag] på att [FÖRGÅS]
		upplösa_V2_Ceasing_to_be : V2 ; -- <Entity>[chokladbitarna] [UPPLÖSTS]

		tvivla_V_Certainty : V ; -- <Cognizer>[jag] [TVIVLA] <Content>[på att spelarna är överens att förlora matchen för att vinna pengar på oddset]
		tro_VS_Certainty : VS ; -- <Cognizer>[Läkarna] [TRODDE] <Content>[att hon hade sköldkörtelinflammation]

		böja_av_V_Change_direction : V ; -- <Theme>[vinden] [BÖJER AV] <Direction>[mot öster] och { böjer av } <Direction>[åt väster]
		slå_V_Change_direction : V ; -- <Theme>[seglarna] blev instruerade om att lägga sig brevid varandra på samma bog och [SLÅ]
		svänga_V_Change_direction : V ; -- <Theme>[en bil] skulle [SVÄNGA] <Direction>[upp]
		ta_V_Change_direction : V ; -- <Theme>[Jag] [TAR] <Direction>[höger]
		ta_av_V_Change_direction : V ; -- <Theme>[Sam] [TAR AV] <Direction>[åt höger]
		vända_V_Change_direction : V ; -- <Theme>[En långtradare] fick [VÄNDA] <Direction>[tillbaka]
		ändra_kurs_V_Change_direction : V ; -- <Theme>[Han] [ÄNDRADE KURS]

		förkorta_V2_Change_event_duration : V2 ; -- <Agent>[Arbetsministeriet] vill [FÖRKORTA] <Event>[tiden för civiltjänstgöring]
		förlänga_V2_Change_event_duration : V2 ; -- <Agent>[Jag] vill inte [FÖRLÄNGA] <Event>[diskussionen]
		fördröja_V2_Change_event_duration : V2 ; -- <Cause>[utredningen] bara [FÖRDRÖJER] <Event>[förverkligandet]

		skjuta_upp_V2_Change_event_time : V2 ; -- <Cause>[Regn] [SKÖT UPP] <Event>[första rundan]
		försena_V2_Change_event_time : V2 ; -- <Event>[humanitära insatser] avbryts eller [FÖRSENAS]

		gelea_sig_V_Change_of_consistency : V ; -- <Undergoer>[det] ändå inte [GELEAR SIG]
		skära_sig_V_Change_of_consistency : V ; -- <Undergoer>[såsen] [SKÄR SIG]
		stelna_V_Change_of_consistency : V ; -- <Undergoer>[lavan] [STELNAR]
		tjockna_V_Change_of_consistency : V ; -- <Undergoer>[krämen] [TJOCKNAR]

		upphöja_V2_Change_of_leadership : V2 ; -- <Selector>[Milosevics] senaste drag var att [UPPHÖJA] <New_leader>[Bulatovic] <Role>[till federal premiärminister]
		fälla_V2_Change_of_leadership : V2 ; -- <Selector>[Carl I Hagens fremskrittsparti , som] [FÄLLT] <Old_order>[en borgerlig regering]

		bottenfrysa_V_Change_of_phase : V ; -- <Undergoer>[den] [BOTTENFRYSER]
		evaporera_V_Change_of_phase : V ; -- <Undergoer>[De] tycks ha [EVAPORERAT]
		frysa_V_Change_of_phase : V ; -- <Undergoer>[kadavret] [FRYSA]
		frysa_till_V_Change_of_phase : V ; -- <Undergoer>[Bottenhavet] håller på att [FRYSA TILL]
		fördunsta_V_Change_of_phase : V ; -- <Undergoer>[det] [FÖRDUNSTADE]
		förfrysa_V_Change_of_phase : V ; -- <Undergoer>[mina tår] [FÖRFRUSIT]
		kondensera_V_Change_of_phase : V ; -- <Undergoer>[ångan] att [KONDENSERA]
		smälta_V_Change_of_phase : V ; -- <Undergoer>[Arktis is] kan [SMÄLTA]
		tillfrysa_V_Change_of_phase : V ; -- <Undergoer>[sjöarna] mera allmänt [TILLFRYSA]
		tina_V_Change_of_phase : V ; -- <Undergoer>[snön] [TINADE]
		tina_upp_V_Change_of_phase : V ; -- <Undergoer>[De små tårna] börjar [TINA UPP]

		anskaffa_V2_Change_of_quantity_of_possession : V2 ; -- <Owner>[Statens järnvägar som] [ANSKAFFADE] <Possession>[en generator]
		tappa_bort_V2_Change_of_quantity_of_possession : V2 ; -- <Owner>[jag] kommer att [TAPPA BORT] <Possession>[min personlighet och mitt sätt att fotografera]

		knäppa_på_V2_Change_operational_state : V2 ; -- <Agent>[Han] [KNÄPPTE PÅ] <Device>[bandspelaren]
		slå_av_V2_Change_operational_state : V2 ; -- <Agent>[Sofia] fått normala arbetstider och kan för det mesta [SLÅ AV] <Device>[datorn]
		slå_på_V2_Change_operational_state : V2 ; -- <Agent>[Jag] [SLÅR PÅ] <Device>[teven]
		aktivera_V2_Change_operational_state : V2 ; -- <Cause>[alkohol] kan [AKTIVERA] <Device>[belöningssystemet]

		växla_V_Change_position_on_a_scale : V ; -- <Attribute>[temperaturen] [VÄXLAR]

		luta_sig_V_Change_posture : V ; -- <Protagonist>[Hans-Kristian Skaag på Föglö] [LUTA SIG]
		resa_sig_V_Change_posture : V ; -- <Protagonist>[Peter] [RESTE SIG]
		sträcka_V_Change_posture : V ; -- <Protagonist>[ni] [STRÄCKER]
		sträcka_sig_V_Change_posture : V ; -- <Protagonist>[Han] [STRÄCKER SIG]
		stå_upp_V_Change_posture : V ; -- <Protagonist>[folk] [STOD UPP]

		byta_V_Change_tool : V ; -- <Agent>[Finnlines] [BYTA] <New_tool>[till finsk flagga]
		gå_över_V_Change_tool : V ; -- <Agent>[Jag själv] [GICK ÖVER] <New_tool>[till epilering , som rycker ut stråt med flera minipincetter]

		slå_sig_i_slang_V_Chatting : V ; -- <Interlocutor_1>[ett gäng] [SLÅ SIG I SLANG] <Interlocutor_2>[med oss]
		småprata_V_Chatting : V ; -- <Interlocutor_1>[Jag] satt och [SMÅPRATADE] <Interlocutor_2>[med Patrik]
		prata_V_Chatting : V ; -- <Interlocutors>[De] [PRATADE]
		samtala_V_Chatting : V ; -- <Interlocutors>[De] skrattade och [SAMTALADE]
		sladdra_V_Chatting : V ; -- <Interlocutors>[De] [SLADDRA]
		snacka_V_Chatting : V ; -- <Interlocutors>[Vi] åt frukost och satt och [SNACKADE]

		dra_V2_Choosing : V2 ; -- <Cognizer>[man] [DRAR] <Chosen>[ett kort] <Possibilities>[ur en kortlek]
		handplocka_V2_Choosing : V2 ; -- <Cognizer>[Vi] [HANDPLOCKAR] <Chosen>[lärare]
		se_ut_V2_Choosing : V2 ; -- <Cognizer>[Vi] har [SETT UT] <Chosen>[tre pristagare]
		selektera_V2_Choosing : V2 ; -- [SELEKTERA] <Chosen>[informationsbruset]
		toppa_V2_Choosing : V2 ; -- <Cognizer>[Örkelljunga] [TOPPAR] <Chosen>[laget] <Possibilities>[med fyra amerikaner]
		välja_V2_Choosing : V2 ; -- <Cognizer>[Årsmötet] [VÄLJER] <Chosen>[Christer]
		välja_VV_Choosing : VV ; -- <Cognizer>[Allt fler] [VÄLJER] <Chosen>[att studera i Australien]
		plocka_ut_V2_Choosing : V2 ; -- <Chosen>[Tolv lyckliga] har [PLOCKATS UT]

		göra_anspråk_på_V2_Claim_ownership : V2 ; -- <Claimant>[vetenskapen] inte [GÖR ANSPRÅK PÅ] <Property>[en slutgiltig sanning]
		muta_in_V2_Claim_ownership : V2 ; -- <Claimant>[Vi] måste [MUTA IN] <Property>[vårt revir]

		borra_upp_V2_Closure : V2 ; -- <Agent>[De] [BORRADE UPP] <Container_portal>[lagningen]
		bryta_upp_V2_Closure : V2 ; -- [BRYTA UPP] <Container_portal>[dörren]
		dyrka_upp_V2_Closure : V2 ; -- <Agent>[dom] försöker [DYRKA UPP] <Container_portal>[garage dörren]
		fälla_ut_V2_Closure : V2 ; -- <Agent>[Vi] rullade in på vår plats , [FÄLLDE UT] <Container_portal>[markisen]
		nödöppna_V2_Closure : V2 ; -- <Agent>[Missnöjda resenärer] tog saken i egna händer , [NÖDÖPPNADE] <Container_portal>[dörrarna]
		skalka_V2_Closure : V2 ; -- <Agent>[jag] senare installerat mig ombord i god tid och [SKALKAT] <Container_portal>[luckorna]
		slå_upp_V2_Closure : V2 ; -- <Agent>[S : t Görans sommarkafé] [SLOG UPP] <Container_portal>[portarna]
		ta_upp_V2_Closure : V2 ; -- [TA UPP] <Container_portal>[laddningshål]
		tillsluta_V2_Closure : V2 ; -- [TILLSLUTA] <Container_portal>[gränsen]
		fästa_ihop_V2_Closure : V2 ; -- [FÄST IHOP] <Containing_object>[degen]
		försegla_V2_Closure : V2 ; -- <Agent>[Guden Allah] beslutar sig för att [FÖRSEGLA] <Containing_object>[deras öron]
		sabrera_V2_Closure : V2 ; -- <Agent>[man] enkelt kan [SABRERA] <Containing_object>[en flaska bubbel från Rotari]
		spärra_upp_V2_Closure : V2 ; -- <Agent>[Tjejen] [SPÄRRAR UPP] <Containing_object>[ögonen]
		försluta_V2_Closure : V2 ; -- [FÖRSLUTA] <Containing_object>[vinflaskor] <Fastener>[med det självklara materialet kork]
		korka_upp_V2_Closure : V2 ; -- <Containing_object>[flaskorna] [KORKAS UPP]

		grubbla_V_Cogitation : V ; -- <Cognizer>[hon] ändå att [GRUBBLA] <Topic>[över saken]
		tänka_V_Cogitation : V ; -- [TÄNKTE] <Cognizer>[jag] ofta <Topic>[på dem]
		fråga_sig_VQ_Cogitation : VQ ; -- <Cognizer>[Man] kan [FRÅGA SIG] <Topic>[hur den dagliga syrebristen påverkar barnens fysiska utveckling]
		tänka_över_VQ_Cogitation : VQ ; -- <Cognizer>[han] sitta och [TÄNKA ÖVER] <Topic>[hur han ska kunna bli en ny människa när han kommer ut]
		undra_VQ_Cogitation : VQ ; -- <Cognizer>[Hon] [UNDRADE] <Topic>[vad hisspojken tänkte]
		tänka_VS_Cogitation : VS ; -- <Cognizer>[Svedberg] [TÄNKTE] <Topic>[att han hade begått ett misstag]

		jobba_ihop_V_Collaboration : V ; -- <Partner_1>[Niclas] [JOBBAR IHOP] <Partner_2>[med dem]
		kooperera_V_Collaboration : V ; -- <Partner_1>[Hon] [KOOPERERADE] också <Partner_2>[med industriföretag i Venezuela , Hongkong , Tyskland och Finland ( Artek och Björneborgs Bomull )]
		medarbeta_V_Collaboration : V ; -- [MEDARBETADE] <Partner_1>[han] <Undertaking>[i tidningen Arbetaren]
		samarbeta_V_Collaboration : V ; -- <Partner_1>[Hoppets Stjärna] [SAMARBETAR] också <Partner_2>[med organisationen Vacha Charitable Trust]
		samverka_V_Collaboration : V ; -- <Partner_1>[Teatern] skall [SAMVERKA] <Partner_2>[med utbildningsanstalterna] <Undertaking>[inom scenkonsternas och musikens område]
		stå_i_maskopi_V_Collaboration : V ; -- <Partner_1>[polismästaren som hade kontor mitt emot kyrkan] [STOD I MASKOPI] <Partner_2>[med Forell]
		arbeta_ihop_V_Collaboration : V ; -- <Partners>[vi] får [ARBETA IHOP]

		gadda_ihop_sig_V_Come_together : V ; -- <Configuration>[samtliga media] [GADDAR IHOP SIG]
		stöta_samman_V_Come_together : V ; -- <Party_1>[han] [STÖTTE SAMMAN] <Party_2>[med en och annan övrig udda existens]
		församla_V2_Come_together : V2 ; -- <Individuals>[gestalterna] [FÖRSAMLAS]
		möta_V2_Come_together : V2 ; -- <Individuals>[Östersjöländernas ministrar] ska [MÖTAS]
		tränga_V2_Come_together : V2 ; -- <Individuals>[sluminvånarna] [TRÄNGS]

		uppkomma_V_Coming_to_be : V ; -- [UPPKOMMER] <Entity>[figurornament]

		bestämma_V2_Coming_to_believe : V2 ; -- [BESTÄMMA] <Content>[nya signalkällor i de radarsystem för stridsledning och luftbevakning som Sovjetunionen byggde upp längs baltiska kusten]
		finna_VS_Coming_to_believe : VS ; -- <Cognizer>[Vi] har [FUNNIT] <Content>[att vissa mutationer och subtyper av viruset är kopplade till en något högre grad av skadeutveckling]
		tippa_VS_Coming_to_believe : VS ; -- <Cognizer>[Jag] [TIPPAR] <Content>[att det var svårare för 50-talets hemmafruar]
		lära_sig_VV_Coming_to_believe : VV ; -- <Cognizer>[jag] har [LÄRT MIG] <Content>[att inte oroa mig för saker som inte inträffat än]

		designa_V2_Coming_up_with : V2 ; -- [DESIGNAR] <Cognizer>[hon] <Idea>[sina nya kollektioner]
		dikta_ihop_V2_Coming_up_with : V2 ; -- <Cognizer>[42-åringen] [DIKTADE IHOP] <Idea>[en historia om hur främlingar hade rusat in i lägenheten och skjutit]
		formulera_V2_Coming_up_with : V2 ; -- [FORMULERADE] <Cognizer>[gruppen] <Idea>[ett brev till kommunledningen]
		kläcka_V2_Coming_up_with : V2 ; -- [KLÄCKA] <Idea>[höstens uppslag]
		koka_ihop_V2_Coming_up_with : V2 ; -- <Cognizer>[jag] på att [KOKA IHOP] <Idea>[någonting]
		sätta_ihop_V2_Coming_up_with : V2 ; -- <Cognizer>[en teatergrupp] som ska [SÄTTA IHOP] <Idea>[en revy]
		upprätta_V2_Coming_up_with : V2 ; -- <Idea>[obligatoriska rivningsplaner] [UPPRÄTTAS]

		fynda_V2_Commerce_buy : V2 ; -- <Goods>[Byxorna] [FYNDADE] <Buyer>[jag]
		handla_V2_Commerce_buy : V2 ; -- <Buyer>[man] att [HANDLA] <Goods>[svenskt kött]
		köpa_V2_Commerce_buy : V2 ; -- <Buyer>[Jag] har [KÖPT] <Goods>[en resa]
		ropa_in_V2_Commerce_buy : V2 ; -- <Buyer>[Berit] [ROPADE IN] <Goods>[en säng]

		överdebitera_V2_Commerce_collect : V2 ; -- <Seller>[bolag som] [ÖVERDEBITERAR] <Buyer>[sina kunder]

		betala_V2_Commerce_pay : V2 ; -- <Buyer>[Han] [BETALADE] <Money>[50 kronor] <Goods>[för kaffet]
		betala_för_kalaset_V2_Commerce_pay : V2 ; -- <Money>[425 000 kronor] fick <Buyer>[de] [BETALA FÖR KALASET]
		delbetala_V2_Commerce_pay : V2 ; -- [DELBETALA] <Money>[beloppet]
		ge_V2_Commerce_pay : V2 ; -- <Buyer>[Vi] [GAV] <Money>[129 kronor] <Goods>[för ryggbiffen] och <Money>[92 kronor] <Goods>[för burgaren]
		arvodera_V2_Commerce_pay : V2 ; -- <Buyer>[Partiet] [ARVODERAR] <Goods>[partiledarposten]

		kränga_av_V_Commerce_sell : V ; -- <Goods>[Prylarna som stjäls] är att [KRÄNGA AV]
		auktionera_bort_V2_Commerce_sell : V2 ; -- <Seller>[Knut Knutson] [AUKTIONERAR BORT] <Goods>[en gustaviansk byrå]
		saluföra_V2_Commerce_sell : V2 ; -- <Seller>[Företaget ekokul] [SALUFÖR] <Goods>[ekologiska leksaker som är gjord av majs , Happy Mais]
		sälja_V2_Commerce_sell : V2 ; -- <Seller>[15-åringen] [SÅLDE] <Goods>[knark] <Buyer>[till andra ungdomar]
		avyttra_V2_Commerce_sell : V2 ; -- <Goods>[Innehavet] har [AVYTTRATS]

		anmäla_sig_V_Commitment : V ; -- <Speaker>[de] är för gamla för att [ANMÄLA SIG]
		avlägga_ämbetseden_V_Commitment : V ; -- <Speaker>[Övriga i regeringen] bör [AVLÄGGA ÄMBETSEDEN]
		svära_sig_V_Commitment : V ; -- [SVÄR SIG] <Speaker>[bolaget] <Message>[fritt från ansvar]
		svära_VS_Commitment : VS ; -- <Speaker>[Jag] [SVÄR] <Addressee>[inför Gud] <Message>[att jag inte har gjort det]
		utfästa_sig_VV_Commitment : VV ; -- <Speaker>[Börje Carlsson] ska [UTFÄSTA SIG] <Message>[att avstå från facklig verksamhet]

		föröva_V2_Committing_crime : V2 ; -- <Crime>[Mordet] [FÖRÖVADES]

		adressera_V2_Communication : V2 ; -- <Communicator>[Vi] måste [ADRESSERA] <Message>[våra krav]
		delge_V2_Communication : V2 ; -- <Communicator>[Mike] [DELGAV] <Message>[sin syn på produktionsstrategi]
		meddela_V2_Communication : V2 ; -- <Communicator>[EG-domstolen] [MEDDELADE] <Message>[sin dom i Laval-målet]
		ringa_in_V2_Communication : V2 ; -- <Medium>[klockorna] [RINGER IN] <Message>[det nya året]
		meddela_VS_Communication : VS ; -- <Communicator>[Elisabeth] [MEDDELADE] <Message>[att lägget just nu är lugnt på lågstadiet]

		babbla_V_Communication_manner : V ; -- <Speaker>[Han] var förresten på radio häromveckan och [BABBLADE] <Topic>[om sin pensionärstillvaro]
		bryta_V_Communication_manner : V ; -- <Speaker>[Bartendern , som] [BRYTER]
		orera_V_Communication_manner : V ; -- <Speaker>[jag] ska inte [ORERA] <Topic>[om mitt omsusade privatliv]
		pladdra_V_Communication_manner : V ; -- <Speaker>[Hon] kunde ingen engelska men [PLADDRADE]
		sjunga_V_Communication_manner : V ; -- [SJÖNG] <Speaker>[hon]
		stamma_V_Communication_manner : V ; -- <Speaker>[Jag] [STAMMADE]
		tassla_V_Communication_manner : V ; -- <Speaker>[Alla] [TISSLAR] och [TASSLAR]
		tissla_V_Communication_manner : V ; -- <Speaker>[Alla] [TISSLAR] och [TASSLAR]
		viska_V_Communication_manner : V ; -- <Speaker>[Domaren] lutade sig framåt och [VISKADE]
		artikulera_V2_Communication_manner : V2 ; -- <Speaker>[man som medborgare] kunna [ARTIKULERA] <Message>[kritik mot makten]
		sjunga_V2_Communication_manner : V2 ; -- <Speaker>[Carola] [SJÖNG] <Message>[låten Tänk om] <Addressee>[för kronprinsessparet]
		skråla_V2_Communication_manner : V2 ; -- <Speaker>[några blågula kalhyggen] och [SKRÅLADE] : ' <Message>[Du tysta du glädjerika sköna]

		faxa_V_Communication_means : V ; -- <Communicator>[Han] [RINGDE] och [FAXADE] flera gånger om dagen <Addressee>[till kunder som han visste hade pengar]
		messa_V_Communication_means : V ; -- <Communicator>[hon] [MESSADE]
		ringa_V_Communication_means : V ; -- <Communicator>[Han] [RINGDE] och [FAXADE] flera gånger om dagen <Addressee>[till kunder som han visste hade pengar]
		emaila_V2_Communication_means : V2 ; -- <Message>[digitala foton] som de senare ska [E-MAILA]
		faxa_V2_Communication_means : V2 ; -- [FAXA] <Message>[svaren] <Addressee>[till din läkare]
		ringa_upp_V2_Communication_means : V2 ; -- [RINGA UPP] <Addressee>[PcCity]
		ringa_in_V2_Communication_means : V2 ; -- <Communicator>[Vi] bestämde att [RINGA IN] <Message>[en beställning som jag åker och hämtar vid 18-tiden]

		hoa_V2_Communication_noise : V2 ; -- <Speaker>[Han] [HOADE] <Message>[glåpord]
		skrika_V2_Communication_noise : V2 ; -- <Message>[Dom skjuter på mig] , [SKREK] <Speaker>[hon]
		skrika_VS_Communication_noise : VS ; -- <Speaker>[han] blev rädd , sprang ut och runt i trapphuset , bultade på alla dörrar och [SKREK] <Message>[att alla skulle gå ut]

		svara_V_Communication_response : V ; -- <Speaker>[Miljöpartiet] [SVARADE] <Trigger>[på frågor]
		replikera_VS_Communication_response : VS ; -- <Speaker>[en av entusiasterna] [REPLIKERADE] <Message>[att ' Det är inte bilen det är fel på - Det är träden . ']
		svara_VS_Communication_response : VS ; -- <Speaker>[Hon] [SVARADE] <Message>[att han oftast åkte till henne på helgerna]

		förvandla_V2_Commutation : V2 ; -- <Executive_authority>[president Rutherford B. Hayes] [FÖRVANDLADE] <Original_punishment>[straffet]
		omvandla_V2_Commutation : V2 ; -- [OMVANDLADES] <Original_punishment>[straffet]

		passa_V_Compatibility : V ; -- <Item_1>[ett rödvin som] [PASSAR] <Item_2>[med älg,hjort,ren,oxe,får och grillspett]
		passa_ihop_V_Compatibility : V ; -- <Item_1>[föreställningarnas speltider] [PASSAR IHOP] <Item_2>[med skärgårdsfärjornas turlistor]
		matcha_V2_Compatibility : V2 ; -- <Item_1>[neutrala färger] [MATCHAS] <Item_2>[med starka och sprakande kulörer]

		tävla_V_Competition : V ; -- <Participants>[Deltagarna] [TÄVLADE] <Competition>[i tio grenar]
		curla_V_Competition : V ; -- <Participant_1>[Sverige] [CURLAR]
		konkurrera_V_Competition : V ; -- <Participant_1>[Sverige] har möjligheten att [KONKURRERA] <Participant_2>[med vem som helst]

		gnälla_V_Complaining : V ; -- <Complainer>[Jag] [GNÖLAR] och [GNÄLLER] <Complaint>[över att det tar sån tid och att det hela tiden är så långt kvar]
		gnöla_V_Complaining : V ; -- <Complainer>[Jag] [GNÖLAR] och [GNÄLLER] <Complaint>[över att det tar sån tid och att det hela tiden är så långt kvar]
		klaga_V_Complaining : V ; -- <Complainer>[folk] [KLAGA] <Complaint>[över att maten blivit dyr]
		lamentera_V_Complaining : V ; -- <Complainer>[vi] [LAMENTERAR] <Topic>[över tiderna]
		älta_V2_Complaining : V2 ; -- <Complainer>[Vi] måste tydligen [ÄLTA] <Complaint>[futtiga problem]

		hålla_sig_V_Compliance : V ; -- [HÅLLA SIG] <Norm>[till de bestämmelser som finns]
		följa_V2_Compliance : V2 ; -- <Protagonist>[Jag] ska också försöka [FÖLJA] <Norm>[receptet till min mormor Hannas bröd]
		överträda_V2_Compliance : V2 ; -- <Protagonist>[Den som] [ÖVERTRÄDER] <Norm>[förbudet]

		bete_sig_V_Conduct : V ; -- <Agent>[Den hopslagna cellen] kommer att [BETE SIG] <Manner>[som ett nybefruktat ägg]
		bära_sig_åt_V_Conduct : V ; -- <Agent>[De] [BÄR SIG ÅT] <Manner>[som barn]
		uppföra_sig_V_Conduct : V ; -- <Agent>[hon] [UPPFÖR SIG] <Manner>[taktfullt] och <Manner>[diplomatiskt]
		vara_V_Conduct : V ; -- <Agent>[Andy Warhol] [VAR] <Manner>[trevlig]

		bemöta_V2_Confronting_problem : V2 ; -- <Agent>[Ledningsgruppen] har ännu inte [BEMÖTT] <Issue>[kritiken]
		konfrontera_V2_Confronting_problem : V2 ; -- [KONFRONTERA] <Issue>[den]
		stå_inför_V2_Confronting_problem : V2 ; -- <Agent>[vi] att [STÅ INFÖR] <Issue>[några väldigt allvarliga utmaningar]

		falla_V_Conquering : V ; -- <Theme>[staden] [FÖLL] <Conqueror>[för rebellerna]
		annektera_V2_Conquering : V2 ; -- <Conqueror>[Israel] [ANNEKTERADE] <Theme>[Golan]
		besätta_V2_Conquering : V2 ; -- [BESATTE] <Conqueror>[bataljonen] <Theme>[nya ställningar]
		erövra_V2_Conquering : V2 ; -- <Conqueror>[de ryska trupperna] [ERÖVRADE] <Theme>[byn]
		ta_i_besittning_V2_Conquering : V2 ; -- <Conqueror>[judiska kolonister] [TOG I BESITTNING] <Theme>[fyra byggnader]

		kontakta_V2_Contacting : V2 ; -- <Communicator>[Man] kan [KONTAKTA] <Addressee>[Watson] <Address>[på nigelwatson1 @ gmail.com]

		innehålla_V2_Containing : V2 ; -- <Container>[ett antal genomskinliga plastpåsar som] [INNEHÅLLER] <Contents>[den rekvisita som används]
		rymma_V2_Containing : V2 ; -- <Container>[Reservoaren] [RYMMER] <Contents>[424 miljoner kubikmeter]

		bero_V_Contingency : V ; -- [BERODDE] <Outcome>[det] <Determinant>[på att han var så stor]
		bero_på_V_Contingency : V ; -- <Outcome>[Det] [BEROR PÅ]
		komma_an_V_Contingency : V ; -- <Outcome>[det marknära ozonet] [KOMMER AN] <Determinant>[på utsläpp av svaveloxid ( SOx ) och lättflyktiga kolväten ( CxHx )]

		känna_sig_skyldig_V_Contrition : V ; -- <Experiencer>[min faster] [KÄNNER SIG SKYLDIG] <Action>[för att hon inte gjorde något för att rädda sin bror]

		accentuera_V2_Convey_importance : V2 ; -- <Medium>[publikationen] [ACCENTUERAR] <Message>[Östersjöns södra operationsområde]
		poängtera_V2_Convey_importance : V2 ; -- <Medium>[Shintoismen] ger trots allt inga etiska eller moraliska regler för hur man skall fungera , utan [POÄNGTERAR] <Message>[ärlighet och själens renhet samt människans kontakt med naturen]
		poängtera_VS_Convey_importance : VS ; -- <Speaker>[Han] [POÄNGTERAR] <Message>[att teatern är mer än skådespelare och regissörer]

		koka_V_Cooking_creation : V ; -- [KOKA] <Produced_food>[sylt eller kräm]
		baka_V2_Cooking_creation : V2 ; -- <Cook>[Jag] brukar oftast [BAKA] <Produced_food>[brödet]
		göra_V2_Cooking_creation : V2 ; -- [GÖRA] <Produced_food>[middag]
		laga_V2_Cooking_creation : V2 ; -- [LAGA] <Produced_food>[en kinainspirerad middag]
		laga_till_V2_Cooking_creation : V2 ; -- <Cook>[man] [LAGA TILL] <Produced_food>[en apelsinsaft]
		tillreda_V2_Cooking_creation : V2 ; -- <Produced_food>[Kaffe] kan [TILLREDAS]

		korrodera_V_Corroding : V ; -- <Undergoer>[Järn] [KORRODERAR]
		rosta_V_Corroding : V ; -- <Undergoer>[behållarna] [ROSTA]

		förfölja_V2_Cotheme : V2 ; -- <Theme>[De] [FÖRFÖLJDE] <Cotheme>[henne]
		guida_V2_Cotheme : V2 ; -- <Theme>[Olle] [GUIDAR] <Cotheme>[oss] <Direction>[mot havsisen]
		lotsa_V2_Cotheme : V2 ; -- <Theme>[Polisen] planerade [LOTSA] <Direction>[in] <Cotheme>[kalven]
		följa_V2_Cotheme : V2 ; -- <Theme>[Vi] hade [FÖLJT] <Cotheme>[Lina] <Goal>[till ladugården]
		leda_V2_Cotheme : V2 ; -- <Theme>[Han] [LEDDE] <Cotheme>[barnet] <Goal>[till kunskap]
		eskortera_V2_Cotheme : V2 ; -- <Theme>[Två bilar från gruvbolaget] [ESKORTERADE] <Cotheme>[journalisterna] <Source>[bort från området]

		korsförhöra_V2_Court_examination : V2 ; -- [KORSFÖRHÖRT] <Witness>[åklagarens vittnen]

		dreja_V2_Create_physical_artwork : V2 ; -- <Creator>[Krukmakaren] [DREJAR] <Representation>[krukor , fat och andra föremål]
		måla_V2_Create_physical_artwork : V2 ; -- <Creator>[Han] har börjat [MÅLA] <Representation>[Bell von Wendens självportätt]
		rita_V2_Create_physical_artwork : V2 ; -- <Creator>[Jag] [RITADE] <Representation>[bilden]
		teckna_V2_Create_physical_artwork : V2 ; -- <Creator>[jag] fortsatte att [TECKNA] <Representation>[hans porträtt]

		avbilda_V2_Create_representation : V2 ; -- <Creator>[Goya] [AVBILDAR] <Represented>[honom]
		avporträttera_V2_Create_representation : V2 ; -- <Creator>[Ulla Rusk] har [AVPORTRÄTTERAT] <Represented>[sin man Karl-Johan Rusk] och då <Represented>[han]
		måla_V2_Create_representation : V2 ; -- [MÅLADE] <Creator>[han] <Represented>[sina närmaste]
		måla_av_V2_Create_representation : V2 ; -- <Creator>[Jag] hade [MÅLAT AV] <Represented>[henne]
		porträttera_V2_Create_representation : V2 ; -- <Creator>[Andy] har [PORTRÄTTERAT] <Represented>[Sverige]
		smygfilma_V2_Create_representation : V2 ; -- <Creator>[hon] [SMYGFILMAT] <Represented>[unga flickor i duschen]
		mikrofilma_V2_Create_representation : V2 ; -- <Represented>[Manuskriptet] [MIKROFILMADES]

		frambringa_V2_Creating : V2 ; -- <Cause>[evolutionen] [FRAMBRINGAT] <Created_entity>[ett medfött så kallad anknytningssystem]
		ge_V2_Creating : V2 ; -- <Cause>[Träden] [GER] <Created_entity>[frukt]
		skapa_V2_Creating : V2 ; -- <Cause>[En jordbävning] [SKAPAR] <Created_entity>[flodvågor som tar över 300 000 människors liv i Sydasien]
		sätta_ihop_V2_Creating : V2 ; -- <Creator>[4 tjejer] [SÄTTER IHOP] <Created_entity>[ett lag]

		undersöka_V2_Criminal_investigation : V2 ; -- <Investigator>[Polisen som] [UNDERSÖKER] <Incident>[mordet]
		utreda_V2_Criminal_investigation : V2 ; -- <Investigator>[Polisen] [UTREDER] <Incident>[händelsen]

		beskära_V2_Cutting : V2 ; -- <Agent>[man] också vara riktigt drastisk och [BESKÄRA] <Item>[hela busken]
		flänsa_V2_Cutting : V2 ; -- [FLÄNSA] <Item>[henne]
		hacka_V2_Cutting : V2 ; -- [HACKADE] <Agent>[jag] <Item>[löken , räkorna och zuccinin]
		hugga_V2_Cutting : V2 ; -- <Agent>[kvinnor] [HUGGER] <Item>[ved]
		hugga_ned_V2_Cutting : V2 ; -- <Agent>[PRO] [HÖGG NED] <Item>[barnens päronträd]
		klippa_ner_V2_Cutting : V2 ; -- <Agent>[jag] [KLIPPA NER] <Item>[syrenhäcken]
		klyfta_V2_Cutting : V2 ; -- <Agent>[Vi] köper hela rödbetor på burk och [KLYFTAR] <Item>[dem]
		pincera_V2_Cutting : V2 ; -- <Agent>[min man] [PINCERAT] <Item>[trädet]
		skära_upp_V2_Cutting : V2 ; -- <Agent>[jag] började [SKÄRA UPP] <Item>[skinka , ost och andra ingredienser till toasten]
		snedskära_V2_Cutting : V2 ; -- [SNEDSKÄR] <Item>[baguetten]
		snida_V2_Cutting : V2 ; -- <Agent>[vi] [SNIDAT] <Item>[en trägren]
		snitta_V2_Cutting : V2 ; -- [SNITTA] <Item>[vaniljstången]
		sprätta_V2_Cutting : V2 ; -- <Agent>[jag] [SPRÄTTAR] <Item>[kuvertet]
		sprätta_upp_V2_Cutting : V2 ; -- <Agent>[man] [SPRÄTTAR UPP] <Item>[sidorna i den vackra lilla volymen]
		sönderdela_V2_Cutting : V2 ; -- [SÖNDERDELAR] <Item>[materialet]
		tillskära_V2_Cutting : V2 ; -- [TILLSKÄRA] och sy fast <Item>[siffrorna]
		toppa_V2_Cutting : V2 ; -- <Agent>[Hon] skulle bara [TOPPA] <Item>[mitt långa hår]
		tärna_V2_Cutting : V2 ; -- [TÄRNAR] <Agent>[du] <Item>[kycklingfilén]
		skiva_V2_Cutting : V2 ; -- <Item>[Stora potatisar] däremot kan [TÄRNAS] , [SKIVAS] eller [KLYFTAS]

		rista_V2_Damaging : V2 ; -- [RISTA] <Patient>[honom]
		vandalisera_V2_Damaging : V2 ; -- <Agent>[Två killar] [VANDALISERAR] <Patient>[en bil]
		äta_V2_Damaging : V2 ; -- <Cause>[maskinen] [ÄTER] <Patient>[ditt kort]

		våga_sig_på_V2_Daring : V2 ; -- <Agent>[Bush] [VÅGADE SIG PÅ] <Action>[en öppning mot Kuba]
		ta_risken_VV_Daring : VV ; -- <Agent>[Båda parter] [TAR RISKEN] <Action>[att gå i en fälla]
		våga_sig_på_VV_Daring : VV ; -- <Agent>[Upplands Väsby kommun] hade tillsammans med ABF [VÅGAT SIG PÅ] <Action>[att anordna ett utomhusarrangemang]

		avsomna_V_Death : V ; -- [AVSOMNADE] <Protagonist>[fru Emilia Petersen]
		dö_V_Death : V ; -- <Protagonist>[Urkyrkans martyrer] [DOG]
		dö_bort_V_Death : V ; -- <Protagonist>[barn] smittas och [DÖR BORT]
		dö_ut_V_Death : V ; -- <Protagonist>[Arten] [DOG UT]
		gå_bort_V_Death : V ; -- <Protagonist>[Hans morfar] [GICK BORT]
		insomna_V_Death : V ; -- [INSOMNADE] <Protagonist>[Mary Ann Walter]
		omkomma_V_Death : V ; -- <Protagonist>[En 65-årig man] [OMKOM]
		stryka_med_V_Death : V ; -- <Protagonist>[50 procent av nötväckorna] [STRYKER MED]

		bestämma_VV_Deciding : VV ; -- <Cognizer>[Kommittén] [BESTÄMDE] <Decision>[att inte göra någon ändring i förslaget till riksdagslistan]

		spänna_V_Delimitation_of_diversity : V ; -- <Variable>[åldrarna] [SPÄNNER] <Limit1>[från 35] <Limit2>[till 64 år]

		leverera_V2_Delivery : V2 ; -- <Deliverer>[En del av företagen] [LEVERERAR] <Theme>[vårdtjänster] <Recipient>[till kommunala beställare]
		distribuera_V2_Delivery : V2 ; -- <Theme>[En omfattande bilaga om Åland] ska [DISTRIBUERAS]

		förbjuda_V2V_Deny_permission : V2V ; -- <Authority>[Man] kan inte [FÖRBJUDA] <Protagonist>[oss] <Action>[att tänka]

		lämna_V2_Departing : V2 ; -- <Theme>[De] måste [LÄMNA] <Source>[landet]

		förtjäna_V2_Deserving : V2 ; -- <State_of_affairs>[Ingmar Fornes sakliga inlägg i ÅU den 14 juli] [FÖRTJÄNAR] <Action>[några kommentarer från undertecknad]

		längta_V_Desiring : V ; -- <Experiencer>[Roberte] [LÄNGTADE] <Focal_participant>[hem till Tyskland]
		känna_för_V2_Desiring : V2 ; -- <Experiencer>[Jag] [KÄNNER FÖR] <Focal_participant>[en tur på landet]
		känna_för_VV_Desiring : VV ; -- <Experiencer>[Jag] [KÄNNER FÖR] <Event>[att skriva en bok själv]
		vilja_VV_Desiring : VV ; -- <Experiencer>[jag] [VILJA] <Event>[ha sju sångare som Don Giovanni]

		förinta_V2_Destroying : V2 ; -- <Cause>[den] [FÖRINTAR] <Undergoer>[människor]
		annihilera_V2_Destroying : V2 ; -- <Destroyer>[de att som materia och antimateria] [ANNIHILERA] <Undergoer>[världen]
		spränga_i_luften_V2_Destroying : V2 ; -- <Destroyer>[Vi] [SPRÄNGER I LUFTEN] <Undergoer>[Berlin och Moskva]
		tillintetgöra_V2_Destroying : V2 ; -- <Destroyer>[de] kan [TILLINTETGÖRA] <Undergoer>[varandra]
		jämna_med_marken_V2_Destroying : V2 ; -- <Undergoer>[städerna Loren och Manatuto] hade [JÄMNATS MED MARKEN]

		kapa_av_V2_Detaching : V2 ; -- <Agent>[vi] [KAPAR AV] <Item>[benen] <Source>[på älgarna]
		lösgöra_V2_Detaching : V2 ; -- <Agent>[en korkliknande grej] for iväg uppför en stålbana och [LÖSGJORDE] <Item>[en anordning]
		kapa_V2_Detaching : V2 ; -- <Item>[vrakets överbyggnad] [KAPADES]

		häkta_V2_Detaining : V2 ; -- <Authorities>[man] [HÄKTAR] <Suspect>[en tidigare ostraffad 15-åring]
		omhäkta_V2_Detaining : V2 ; -- <Suspect>[Han] [OMHÄKTADES]

		urskilja_V2_Differentiation : V2 ; -- <Cognizer>[Brå] bär sig åt för att [URSKILJA] <Phenomena>[de riktiga svenskarna]
		skilja_åt_V2_Differentiation : V2 ; -- <Phenomena>[lagen] [SKILJAS ÅT]

		diskutera_V_Discussion : V ; -- <Interlocutors>[Man] kan [DISKUTERA] <Topic>[om tv var bättre förr]

		beströ_V2_Dispersal : V2 ; -- [BESTRÖ] <Individuals>[de döda]
		sprida_ut_V2_Dispersal : V2 ; -- <Agent>[Arrangerande Nilsby spelmän i Pargas] har också [SPRITT UT] <Individuals>[evenemangen]

		utmärka_V2_Distinctiveness : V2 ; -- [UTMÄRKER] <Entity>[hennes bilder] är just <Feature>[tydligheten och skärpan]

		sidsteppa_V2_Dodging : V2 ; -- <Dodger>[Staten Israel] tar sig rätten att [SIDSTEPPA] <Bad_entity>[internationell lag]

		dominera_V2_Dominate_competitor : V2 ; -- <Agent>[han] [DOMINERA] <Patient>[henne]

		dominera_V2_Dominate_situation : V2 ; -- <Agent>[någon] [DOMINERA] <Situation>[ett bord]

		förklä_sig_V_Dressing : V ; -- <Wearer>[Bond] [FÖRKLÄ SIG]
		klä_om_V_Dressing : V ; -- <Wearer>[hon] [KLÄ OM]
		klä_på_sig_V_Dressing : V ; -- <Wearer>[han] nog vakna och [KLÄ PÅ SIG]
		klä_sig_V_Dressing : V ; -- <Wearer>[Bea] [KLÄR SIG] <Clothing>[i moderna och utmanande kläder och högklackade skor]
		kostymera_sig_V_Dressing : V ; -- <Wearer>[PSL-Klas] var inte ensam om att [KOSTYMERA SIG]
		skruda_sig_V_Dressing : V ; -- <Wearer>[Förra årets studenter] fick [SKRUDA SIG]
		sätta_på_sig_V2_Dressing : V2 ; -- <Wearer>[Han] [SÄTTER PÅ SIG] <Clothing>[mössan]
		ta_på_sig_V2_Dressing : V2 ; -- <Wearer>[De] [TAR PÅ SIG] lite mascara och <Clothing>[en snygg klänning]

		smita_in_V_Drop_in_on : V ; -- <Visitor>[jag] på att [SMITA IN]

		dippa_V2_Dunking : V2 ; -- <Theme>[ditt eget grillspett] och [DIPPA] <Substance>[i olika såser]
		doppa_V2_Dunking : V2 ; -- [DOPPAR] <Agent>[han] <Theme>[skorna] <Substance>[i ett desinfektionsbad]
		doppa_ner_V2_Dunking : V2 ; -- <Agent>[Daniel Ohrgren] [DOPPAR NER] <Theme>[en ros] <Substance>[i flytande kväve som har en temperatur på närmare 200 minusgrader]

		blåkopiera_V2_Duplication : V2 ; -- <Creator>[Daléus] är först med att [BLÅKOPIERA] <Original>[delar av hans framgångsrecept]
		kopiera_V2_Duplication : V2 ; -- <Creator>[de som] [KOPIERAR] <Original>[upphovskyddade verk]
		piratkopiera_V2_Duplication : V2 ; -- <Creator>[Statliga myndigheter] [PIRATKOPIERAR] <Original>[datorprogram]

		hålla_i_sig_V_Duration_relation : V ; -- <Eventuality>[Kräksjukan] [HÅLLER I SIG] <Duration>[i ett-två dygn]
		härda_ut_V_Duration_relation : V ; -- <Entity>[De] får [HÄRDA UT]
		klara_sig_V_Duration_relation : V ; -- <Entity>[Den] yngsta var bara fyra år och [KLARADE SIG]

		tjäna_V_Earnings_and_losses : V ; -- <Earner>[Det finns personer som] [TJÄNAT] <Earnings>[tusentals euro]
		förlora_V2_Earnings_and_losses : V2 ; -- [FÖRLORADE] <Earnings>[stora pengar]
		göra_V2_Earnings_and_losses : V2 ; -- <Earner>[man] [GÖRA] <Earnings>[pengar]
		räkna_hem_V2_Earnings_and_losses : V2 ; -- <Earner>[hon] [RÄKNA HEM] <Earnings>[en årlig pension på närmare 1,5 miljoner kronor om året]
		tjäna_V2_Earnings_and_losses : V2 ; -- <Earner>[Kajander] inte [TJÄNAR] <Earnings>[några pengar]

		avskärma_V_Eclipse : V ; -- <Eclipsed>[Allt] [AVSKÄRMAT] <Obstruction>[med en radda stora reklamskyltar]
		gömma_sig_V_Eclipse : V ; -- <Eclipsed>[solen] [GÖMMA SIG] <Obstruction>[bakom molnen]
		blockera_V2_Eclipse : V2 ; -- <Obstruction>[MetLife Building] [BLOCKERAR] <Eclipsed>[utsikten längs Park Avenue]
		skymma_V2_Eclipse : V2 ; -- <Obstruction>[du] stå i ljuset för att [SKYMMA] <Eclipsed>[dig själv]
		förmörka_V2_Eclipse : V2 ; -- <Eclipsed>[solen] [FÖRMÖRKADES]

		studera_V_Education_teaching : V ; -- <Student>[Han] har licentiatexamen från Kungliga Tekniska högskolan i polymerteknik och [STUDERAR] <Qualification>[till doktorsexamen]
		alfabetisera_V2_Education_teaching : V2 ; -- [ALFABETISERA] <Student>[befolkningen]
		bilda_V2_Education_teaching : V2 ; -- <Teacher>[Hilda Käkikoski] var en skicklig språkbrukare som besökte medborgarinstitut för att [BILDA] <Student>[folket]
		lära_upp_V2_Education_teaching : V2 ; -- <Teacher>[han] [LÄRDE UPP] <Student>[Tompa] <Role>[till telegrafoperatör]
		allmänbilda_V2_Education_teaching : V2 ; -- [ALLMÄNBILDA] <Student>[familjen] <Subject>[om öl]
		instruera_V2V_Education_teaching : V2V ; -- [INSTRUERAT] <Student>[honom] <Skill>[att göra så]

		gäcka_V2_Elusive_goal : V2 ; -- <Desired_goal>[den livsfarliga EHEC O157-bakterien] fortsätter att [GÄCKA] <Experiencer>[expertisen]

		komma_V_Emanating : V ; -- <Emission>[lukten] [KOM] <Source>[från ventilationen]
		ryka_V_Emanating : V ; -- <Emission>[ångan] [RYKER] <Source>[från de bubblande pölarna i marken]
		stråla_V_Emanating : V ; -- <Emission>[värmen] [STRÅLAR] <Source>[från mina hälar]

		ge_ifrån_sig_V2_Emitting : V2 ; -- <Source_emitter>[en del plaster] kan [GE IFRÅN SIG] <Emission>[en bismak]
		utstråla_V2_Emitting : V2 ; -- <Source_emitter>[Graniten i norra Bohuslän] [UTSTRÅLAR] <Emission>[radon]
		utsöndra_V2_Emitting : V2 ; -- <Emission>[Virus] [UTSÖNDRAS]

		bekymra_sig_V_Emotion_active : V ; -- <Experiencer>[En del akademiker] [BEKYMRAR SIG] <Topic>[över vad de ska forska i då disputationen är avklarad]
		oroa_sig_V_Emotion_active : V ; -- <Experiencer>[De] [OROAR SIG] <Topic>[över sin situation]

		brinna_av_iver_V_Emotion_heat : V ; -- <Experiencer>[Jag] [BRANN AV IVER]
		koka_V_Emotion_heat : V ; -- <Experiencer>[En del av fordringsägarna] [KOKAR] <Emotion>[av ilska]
		sjuda_V_Emotion_heat : V ; -- <Experiencer>[Han] [SJUDER] <Emotion>[av livslust]

		finna_nöje_V_Emotions_of_mental_activity : V ; -- <Experiencer>[Jag] [FINNER NÖJE] <Stimulus>[i att städa]
		glädja_sig_V_Emotions_of_mental_activity : V ; -- <Experiencer>[många som] [GLÄDJER SIG] <Stimulus>[åt andras olycka]
		njuta_V_Emotions_of_mental_activity : V ; -- <Experiencer>[jag] [NJUTA] <Stimulus>[av livet]

		anställa_V2_Employing : V2 ; -- <Employer>[Saab] [ANSTÄLLER] <Employee>[100 arbetare]
		förordna_V2_Employing : V2 ; -- <Employee>[Ledamöter och ersättare] [FÖRORDNAS] <Employer>[av regeringen]

		frosta_V_Emptying : V ; -- [AVFROSTA] <Source>[bilens rutor]
		rensa_V_Emptying : V ; -- [RENSA] <Source>[hela Arboga] <Theme>[från knark]
		avhumanisera_V2_Emptying : V2 ; -- <Agent>[Man] [AVHUMANISERAR] <Source>[sina fiender]
		avindividualisera_V2_Emptying : V2 ; -- [AVINDIVIDUALISERA] och dehumanisera <Source>[människor]
		avköna_V2_Emptying : V2 ; -- [AVKÖNA] <Source>[befolkningen]
		avlusa_V2_Emptying : V2 ; -- <Agent>[man] dessutom [AVLUSA] <Source>[kläderna]
		barka_V2_Emptying : V2 ; -- [BARKA] <Source>[slanor]
		dricka_ur_V2_Emptying : V2 ; -- <Agent>[Hon] [DRACK UR] <Source>[glaset]
		duka_av_V2_Emptying : V2 ; -- <Agent>[Servitörerna] [DUKADE AV] <Source>[de tomma borden]
		kratsa_V2_Emptying : V2 ; -- <Agent>[Hon] red och skötte hästar och [KRATSADE] <Source>[hovar]
		kratsa_ut_V2_Emptying : V2 ; -- <Agent>[Jag] är alltid noga med att [KRATSA UT] <Source>[hovarna]
		kvista_V2_Emptying : V2 ; -- <Agent>[man] kunde [KVISTA] <Source>[den raka stammen]
		kvista_av_V2_Emptying : V2 ; -- <Agent>[man] ska barka och [KVISTA AV] <Source>[virke]
		lasta_ur_V2_Emptying : V2 ; -- <Agent>[chauffören] ska inte gå ut och börja [LASTA UR] <Source>[bilen]
		mocka_V2_Emptying : V2 ; -- <Agent>[Jag] är uppvuxen på landet utanför Falun och har faktiskt [MOCKAT] <Source>[kaninburar]
		plocka_V2_Emptying : V2 ; -- <Agent>[hon] [PLOCKAR] <Source>[en kyckling]
		skumtvätta_V2_Emptying : V2 ; -- <Source>[den gamla mattan som] <Agent>[jag] [SKUMTVÄTTADE]
		skura_V2_Emptying : V2 ; -- [SKURA] <Source>[golv]
		snöploga_V2_Emptying : V2 ; -- <Source>[trottoarerna] [SNÖPLOGADE]
		tvätta_V2_Emptying : V2 ; -- <Agent>[frivillig personal från SL och SJ] med att [TVÄTTA] <Source>[nedklottrade vagnar]
		tömma_V2_Emptying : V2 ; -- <Agent>[Jag] [TÖMMER] <Source>[hårddisken] <Theme>[på bilder]
		ösa_V2_Emptying : V2 ; -- <Agent>[Isabelle] tryckte in knappen till nödsändaren som registreras via satellit och började [ÖSA] <Source>[båten]
		avbarka_V2_Emptying : V2 ; -- <Source>[Massaveden som kommer till fabriken] [AVBARKAS]
		avhorna_V2_Emptying : V2 ; -- <Source>[mjölkkor] [AVHORNAS]
		avintellektualisera_V2_Emptying : V2 ; -- <Source>[universiteten] [AVINTELLEKTUALISERAS]
		avnazifiera_V2_Emptying : V2 ; -- <Source>[Det tyska folket] skulle [AVNAZIFIERAS]
		frosta_V2_Emptying : V2 ; -- <Source>[bilrutorna] [AVFROSTAS]
		gälla_V2_Emptying : V2 ; -- <Source>[Kalvar och grisar] [GÄLLAS]
		göra_ren_V2_Emptying : V2 ; -- <Source>[cykelbanan som] [GJORDES REN] <Theme>[från snö]
		magpumpa_V2_Emptying : V2 ; -- <Source>[Han] [MAGPUMPADES]
		skura_av_V2_Emptying : V2 ; -- <Source>[gamla glasskivor] [SKURADES AV]
		skölja_V2_Emptying : V2 ; -- <Source>[Bären] måste [SKÖLJAS]

		formulera_sig_V_Encoding : V ; -- [FORMULERA MIG] <Manner>[försiktigt]
		uttrycka_V_Encoding : V ; -- [UTTRYCKA] <Message>[tanken] <Manner>[indirekt]
		formulera_V2_Encoding : V2 ; -- [FORMULERAS] <Message>[idén om nationen] <Manner>[i allra högsta grad]

		råka_V2_Encounter : V2 ; -- <Party_1>[Jag] [RÅKADE] <Party_2>[honom]
		stöta_på_V2_Encounter : V2 ; -- <Party_1>[man] [STÖTER PÅ] <Party_2>[fiender]
		träffa_på_V2_Encounter : V2 ; -- <Party_1>[man] faktiskt [TRÄFFA PÅ] <Party_2>[flera människor samtidigt]

		riskera_V2_Endangering : V2 ; -- <Agent>[Kapitalägaren] har gjort uppoffringar genom att [RISKERA] <Valued_entity>[sitt sparande för nyttiga projekt]
		vedervåga_V2_Endangering : V2 ; -- <Agent>[hon] [VEDERVÅGAR] <Valued_entity>[det liv hon bär under sitt hjärta]
		sätta_för_fara_V2_Endangering : V2 ; -- <Valued_entity>[de] kan [UTSÄTTAS FÖR FARA]

		genomdriva_V2_Enforcing : V2 ; -- <Agent>[man] [GENOMDREV] <Rule>[lagen]
		genomföra_V2_Enforcing : V2 ; -- <Agent>[den republikanske guvernören John Kasich som] [GENOMFÖRDE] <Rule>[lagen]
		tvinga_fram_V2_Enforcing : V2 ; -- <Agent>[studentgrupper] [TVINGAT FRAM] <Rule>[regler som hindrar universiteten från att investera sina pensionspengar i företag som är verksamma i Sudan utan en strategi för hur man ska hantera Darfur]

		förklara_sig_V_Entering_of_plea : V ; -- <Accused>[Han] [FÖRKLARADE SIG] <Plea>[oskyldig] <Charges>[till anklagelserna]

		rymma_V_Escaping : V ; -- <Escapee>[De] [RYMMER] <Undesirable_location>[från sjukhuset]

		hålla_för_sannolikt_VS_Estimating : VS ; -- <Cognizer>[Han] [HÖLL FÖR SANNOLIKT] <Estimation>[att huvudvärken i början orsakades av läkemedlet]
		hållas_för_sannolikt_VS_Estimating : VS ; -- [HÅLLAS FÖR SANNOLIKT] <Estimation>[att patienten verkligen fick information]

		komma_undan_V_Evading : V ; -- <Evader>[Båda] lyckas [KOMMA UNDAN] <Pursuer>[från sin förföljare]
		slingra_sig_V_Evading : V ; -- <Evader>[plasmat] att [SLINGRA SIG] <Pursuer>[undan magnetfältets grepp]
		gäcka_V2_Evading : V2 ; -- <Evader>[Själva rånarna] har dock [GÄCKAT] <Pursuer>[polisen]
		hålla_sig_undan_V2_Evading : V2 ; -- <Evader>[de] [HÖLL SIG UNDAN] <Pursuer>[förföljarna]
		komma_undan_V2_Evading : V2 ; -- <Evader>[Han] [KOM UNDAN] <Pursuer>[överfallet]
		undkomma_V2_Evading : V2 ; -- <Evader>[han] skulle [UNDKOMMA] <Pursuer>[sina förföljare]

		gå_upp_V_Evaluative_comparison : V ; -- <Profiled_item>[Inget] [GÅR UPP] <Standard_item>[mot en häst som buffar en i magen och vill bli krafsad och blåser varm luft i ens ansikte]
		jämföra_sig_V_Evaluative_comparison : V ; -- <Profiled_item>[högskolan] ska kunna [JÄMFÖRA SIG] <Standard_item>[med topppuniversiteten i Sverige]
		mäta_sig_V_Evaluative_comparison : V ; -- <Profiled_item>[ingen av svenskarna] kan [MÄTA SIG] <Attribute>[bilmässigt] <Standard_item>[med norrmannen]

		gå_V_Event : V ; -- <Event>[Sista föreställningen] [GÅR] <Place>[på Bergakungen] <Time>[på onsdag 3 / 2 kl 10.00]
		gå_av_stapeln_V_Event : V ; -- <Event>[Den stora festkonserten] [GICK AV STAPELN] <Time>[i går]
		gå_fram_V_Event : V ; -- <Event>[en tornado] [GÅTT FRAM]
		inträffa_V_Event : V ; -- <Event>[Händelsen] [INTRÄFFADE] <Time>[1941] <Place>[utanför Marstrand]
		slå_in_V_Event : V ; -- <Event>[Drömmen] [SLOG IN]
		stå_V_Event : V ; -- <Event>[De hårdaste striderna] [STOD] <Place>[vid Surabaya]
		vara_V_Event : V ; -- <Event>[Middag] [ÄR] <Time>[klockan sex]
		äga_rum_V_Event : V ; -- <Event>[Föreställningen] [ÄGER RUM] <Time>[16-18 mars klockan 1900] <Place>[på Teater Giljotin i Stockholm]

		bestyrka_V2_Evidence : V2 ; -- <Support>[Dessa uppgifter] [BESTYRKER] <Proposition>[de klara tendenserna till en ökning av rattfylleriet som avspeglas i antalet anmälningar]
		påvisa_V2_Evidence : V2 ; -- <Support>[studier som] [PÅVISAR] <Proposition>[ett samband mellan vistelse i simhallar som renar med klor och ökad andel luftvägsbesvär pga av kloraminer]
		styrka_V2_Evidence : V2 ; -- <Support>[Nya rön] [STYRKER] <Proposition>[SBU:s slutsatser om östrogen]
		bekräfta_VQ_Evidence : VQ ; -- <Support>[Beslutet] [BEKRÄFTAR] bara <Proposition>[hur svårt det är att hantera de här frågorna som rör EU-medborgares rätt till hjälp i vissa fall]
		visa_VQ_Evidence : VQ ; -- <Support>[Testerna] [VISAR] <Proposition>[hur mycket alkohol man dricker]
		visa_VS_Evidence : VS ; -- <Support>[Statistiken] [VISAR] <Proposition>[att priserna står still just nu]

		påminna_V2_Evoking : V2 ; -- <Stimulus>[en religiös staty] som ska [PÅMINNA] <Cognizer>[dem] <Phenomenon>[om deras döda förfäder]

		byta_V2_Exchange : V2 ; -- <Exchanger_1>[hon] varken gran eller smällkarameller och [BYTER] inte <Themes>[julklappar] <Exchanger_2>[med någon]
		utväxla_V2_Exchange : V2 ; -- <Theme_1>[ni] [UTVÄXLAS] <Theme_2>[mot femton svenskar som har hamnat i polsk fångenskap]

		exkommunicera_V2_Exclude_member : V2 ; -- <Authority>[holländska judar] [EXKOMMUNICERADE] <Member>[Spinoza]

		fisa_V_Excreting : V ; -- [FISA] , [SVETTAS] och [SNORA] blir <Source>[kroppen]
		snora_V_Excreting : V ; -- [FISA] , [SVETTAS] och [SNORA] blir <Source>[kroppen]
		svetta_V_Excreting : V ; -- [FISA] , [SVETTAS] och [SNORA] blir <Source>[kroppen]
		spy_V2_Excreting : V2 ; -- <Excreter>[Han] [SPYDDE] <Excreta>[blod]

		genomföra_V2_Execute_plan : V2 ; -- <Agent>[regeringen] [GENOMFÖRDE] <Plan>[politiken]
		implementera_V2_Execute_plan : V2 ; -- <Agent>[moderaterna] [IMPLEMENTERAR] <Plan>[den politik de egentligen tror på]

		defenestrera_V2_Execution : V2 ; -- <Executioner>[protestanter i Prag] [DEFENESTRERA] <Executed>[två katolska ämbetsmän]
		dekapitera_V2_Execution : V2 ; -- <Executioner>[Ninjamannen] som reste land och rike runt och hotade att [DEKAPITERA] <Executed>[kronprinsessan]
		avrätta_V2_Execution : V2 ; -- <Executed>[fler än 750 fångar] [AVRÄTTATS]
		hänga_V2_Execution : V2 ; -- [HÄNGDES] <Executed>[en 16-årig utvecklingsstörd flicka] <Executioner>[av domaren själv]

		existera_V_Existence : V ; -- <Entity>[världen] [EXISTERAR]
		finna_V2_Existence : V2 ; -- <Entity>[Det Moderna Museet] [FINNS]

		ana_VQ_Expectation : VQ ; -- [ANADE] <Cognizer>[han] <Phenomenon>[vad han skulle ställa till med]
		förutse_VS_Expectation : VS ; -- [FÖRUTSES] <Phenomenon>[att medlemsstaterna skall vidta alla åtgärder som står till buds för att se till att lämplig hjälp ges till offrens anhöriga , och om möjligt tillämpa rambeslutets artikel 4 om bestämmelser för offren i brottmålsprocessen]

		stå_V_Expensiveness : V ; -- <Goods>[aktien] [STÅR] <Asset>[i 472 kronor]

		bryta_V2_Experience_bodily_harm : V2 ; -- <Experiencer>[Han] [BRÖT] <Body_part>[sin arm]
		skada_V2_Experience_bodily_harm : V2 ; -- <Experiencer>[Han] har [SKADAT] <Body_part>[handen]

		akta_sig_V_Experiencer_focus : V ; -- <Experiencer>[presidiets ledamöter] [AKTA SIG] <Content>[för att mästra fullmäktiges ledamöter]
		dampa_V_Experiencer_focus : V ; -- <Experiencer>[Min mamma] kommer [DAMPA]
		hänga_läpp_V_Experiencer_focus : V ; -- <Experiencer>[jag] inte [HÄNGA LÄPP]
		hänga_med_huvudet_V_Experiencer_focus : V ; -- <Experiencer>[Schumacher och Coulthard] [HÄNGDE MED HUVUDET]
		avguda_V2_Experiencer_focus : V2 ; -- <Experiencer>[Bert Karlsson] är inte <Experiencer>[mannen som] [AVGUDAR] <Content>[de byråkratiska , utdragna diskussionerna]
		älska_V2_Experiencer_focus : V2 ; -- <Experiencer>[Jag] [ÄLSKAR] <Content>[komplimanger]

		förblinda_V_Experiencer_obj : V ; -- <Stimulus>[Rockdrömmar] [FÖRBLINDAR]
		lena_V_Experiencer_obj : V ; -- <Stimulus>[Avocadopurén] [LENADE]
		slå_an_V_Experiencer_obj : V ; -- <Stimulus>[idén] [SLAGIT AN] <Experiencer>[på mig]
		smärta_V_Experiencer_obj : V ; -- <Stimulus>[Förluster och motgångar] [SMÄRTAR]
		tillintetgöra_V_Experiencer_obj : V ; -- <Stimulus>[ett skällsord , som] effektivt används för att [TILLINTETGÖRA] <Experiencer>[civilt och fackligt engagemang]
		drabba_V2_Experiencer_obj : V2 ; -- <Stimulus>[en bok som] har [DRABBAT] <Experiencer>[mig]
		egga_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Hennes passivitet] [EGGADE UPP] <Experiencer>[honom]
		elda_V2_Experiencer_obj : V2 ; -- <Stimulus>[Gunnar Sträng och Ivar Lo-Johansson] [ELDADE] <Experiencer>[massorna]
		engagera_V2_Experiencer_obj : V2 ; -- <Stimulus>[Djurfrågor] [ENGAGERAR] <Experiencer>[mig]
		fröjda_V2_Experiencer_obj : V2 ; -- <Stimulus>[Vin] [FRÖJDAR] <Experiencer>[människans hjärta]
		fånga_V2_Experiencer_obj : V2 ; -- [FÅNGA] <Experiencer>[en publik]
		förgöra_V2_Experiencer_obj : V2 ; -- <Stimulus>[Det förflutna] hotar att [FÖRGÖRA] <Experiencer>[honom]
		golva_V2_Experiencer_obj : V2 ; -- <Stimulus>[de] [GOLVADE] <Experiencer>[mig]
		hetsa_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Sådana händelser] [HETSAR UPP] <Experiencer>[folk]
		irritera_V2_Experiencer_obj : V2 ; -- <Stimulus>[en sådan skattehöjning] skulle [IRRITERA] <Experiencer>[människor]
		jaga_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Vi] [JAGAR UPP] <Experiencer>[varandra]
		kittla_V2_Experiencer_obj : V2 ; -- [KITTLAR] <Stimulus>[de] <Experiencer>[publiken]
		lamslå_V2_Experiencer_obj : V2 ; -- <Stimulus>[Den ekonomiska oron] [LAMSLÅR] <Experiencer>[marknaden för Volvos försäljning av lastbilar]
		lugna_V2_Experiencer_obj : V2 ; -- <Stimulus>[Löften] ska [LUGNA] <Experiencer>[protestanterna]
		passivisera_V2_Experiencer_obj : V2 ; -- <Stimulus>[Sossarnas politik] [PASSIVERAR] <Experiencer>[människor]
		plåga_V2_Experiencer_obj : V2 ; -- <Stimulus>[Affären] [PLÅGAR] <Experiencer>[regeringen]
		rubba_V2_Experiencer_obj : V2 ; -- <Stimulus>[Sånt] [RUBBAR] inte <Experiencer>[en härdad tågpendlare]
		röra_V2_Experiencer_obj : V2 ; -- <Stimulus>[Lipims lojalitet] [RÖRDE] <Experiencer>[honom]
		skaka_V2_Experiencer_obj : V2 ; -- <Stimulus>[En falsk ryktesspridning] [SKAKADE] <Experiencer>[honom]
		slå_ner_V2_Experiencer_obj : V2 ; -- <Stimulus>[Men denna vetskap] räcker just då inte till för att [SLÅ NER] <Experiencer>[hans mod]
		stilla_V2_Experiencer_obj : V2 ; -- <Stimulus>[Pingisklubben] [STILLAR] <Experiencer>[vår nostalgiska längtan]
		reta_V2S_Experiencer_obj : V2S ; -- [RETAR] <Experiencer>[honom] <Stimulus>[att han inte lyckats lokalisera tio nålar som getts ut av några klubbar i Göteborg]
		absorbera_V2_Experiencer_obj : V2 ; -- <Experiencer>[barnen] [ABSORBERAS] <Stimulus>[av leken]
		egga_V2_Experiencer_obj : V2 ; -- <Experiencer>[Fantasin] [EGGAS] <Stimulus>[av medeltida dans , sång och musik]
		frappera_VS_Experiencer_obj : VS ; -- [FRAPPERADES] <Experiencer>[hon] av <Stimulus>[att frimärkena var mycket modernare och roligare]

		förklara_VQ_Explaining_the_facts : VQ ; -- <Fact>[Resultaten] [FÖRKLARAR] <Question>[varför så få djurarter är asymmetriska]
		reda_ut_VQ_Explaining_the_facts : VQ ; -- [REDA UT] <Question>[hur vi tänker]

		exportera_V2_Exporting : V2 ; -- <Goods>[Lingonets läromedel] [EXPORTERAS] <Importing_area>[till tiotals länder runtom i världen]

		klä_i_ord_V2_Expressing_publicly : V2 ; -- <Communicator>[Han] har [KLÄTT I ORD] <Content>[det jag känner om dagens samhälle och vad som är fel i det]
		lufta_V2_Expressing_publicly : V2 ; -- <Content>[Mina egna åsikter] kan <Communicator>[jag] [LUFTA]
		ventilera_V2_Expressing_publicly : V2 ; -- <Communicator>[Båda parterna] måste åtminstone ha rätt att [VENTILERA] <Content>[sina främsta krav]

		utlämna_V2_Extradition : V2 ; -- [UTLÄMNA] <Suspect>[honom] <Crime_jurisdiction>[till USA]

		falla_i_sömn_V_Fall_asleep : V ; -- <Sleeper>[förvaltaren] [FALLER I SÖMN]
		slumra_till_V_Fall_asleep : V ; -- <Sleeper>[de på pressläktaren som] [SLUMRADE TILL]
		somna_V_Fall_asleep : V ; -- <Sleeper>[Flickan] [SOMNAR]

		känna_V2_Familiarity : V2 ; -- <Cognizer>[Jag] [KÄNNER] <Entity>[Eva]
		känna_till_V2_Familiarity : V2 ; -- <Cognizer>[Amerikanska musiker] brukar inte [KÄNNA TILL] <Entity>[europeiska musiker]

		känna_sig_V_Feeling : V ; -- <Experiencer>[man] [KÄNNER SIG] <Emotional_state>[trygg]
		uppleva_V2_Feeling : V2 ; -- [UPPLEVA] <Emotion>[den känslan]

		simulera_V2_Feigning : V2 ; -- <Agent>[man] [SIMULERA] <State_of_affairs>[stor smärta]

		agna_V2_Filling : V2 ; -- [AGNA] <Goal>[sina krokar] <Theme>[med död , men färsk strömming]
		dubbelpanera_V2_Filling : V2 ; -- <Agent>[du] [DUBBELPANERA] <Goal>[fiskfilén]
		fylla_V2_Filling : V2 ; -- <Agent>[Tillskärarakademin] [FYLLER] <Goal>[salarna]
		klä_V2_Filling : V2 ; -- [KLÄ] <Goal>[väggarna] <Theme>[med bilder ur bibliska historien och med djurtavlor och porträtt av svenska konungar]
		lasta_V2_Filling : V2 ; -- <Agent>[Vi] [LASTAR] <Goal>[50 finska långtradare] <Theme>[med bananer]
		slå_in_V2_Filling : V2 ; -- <Agent>[De] skall [SLÅ IN] <Goal>[en flaska] <Theme>[i julklappspapper]
		proppa_V2_Filling : V2 ; -- [PROPPA] <Goal>[i dig] <Theme>[massor]
		stryka_V2_Filling : V2 ; -- [STRYKA] <Theme>[färgen]
		anstryka_V2_Filling : V2 ; -- <Goal>[valvet] borde [ANSTRYKAS] <Theme>[med ljus oljefärg]
		måla_över_V2_Filling : V2 ; -- <Goal>[Reproduktionerna] ska sedan [MÅLAS ÖVER] <Theme>[med lasyr]
		panera_V2_Filling : V2 ; -- <Goal>[Varje filé] skall [PANERAS]

		leda_V2_Finish_competition : V2 ; -- <Competitor>[Sverige] [LEDER] <Competition>[matchen]
		vinna_V2_Finish_competition : V2 ; -- <Competitor>[De] [VANN] <Competition>[bortamötet] <Opponent>[mot Polisen]

		förlora_V_Finish_game : V ; -- <Player>[svenskar] [FÖRLORAR]
		vinna_V_Finish_game : V ; -- <Player>[Syd] [VANN]

		focka_V2_Firing : V2 ; -- <Employer>[Utskottet] vill helt enkelt [FOCKA] <Employee>[den nuvarande ledningen för Covent Garden-operan]
		friställa_V2_Firing : V2 ; -- <Employer>[De] [FRISTÄLLER] <Employee>[anställda]
		kicka_V2_Firing : V2 ; -- <Employer>[Färjestad] skulle ha [KICKAT] <Employee>[Melin]
		sparka_ut_V2_Firing : V2 ; -- <Employer>[min förra rektor] [SPARKADE UT] <Employee>[mig]
		säga_upp_V2_Firing : V2 ; -- <Employer>[hans statligt drivna företag , som] [SADE UPP] <Employee>[honom]
		lasa_ut_V2_Firing : V2 ; -- <Employee>[vikarie] inte längre kan [LASAS UT]
		massavskeda_V2_Firing : V2 ; -- <Employee>[Lärare i Chile] [MASSAVSKEDAS]
		pensionera_V2_Firing : V2 ; -- <Employee>[odlare] [PENSIONERAS]
		sjukpensionera_V2_Firing : V2 ; -- <Employee>[han] [SJUKPENSIONERADES]

		skena_V_Fleeing : V ; -- <Self_mover>[Två ystra hästar från Lannäslunds skolor i Jakobstad] [SKENADE] <Goal>[mot en hägrande frihet]
		smita_iväg_V_Fleeing : V ; -- <Self_mover>[Hon] sätter eld på Snapes mantel och lyckas [SMITA IVÄG]
		fly_V_Fleeing : V ; -- <Source>[Från Sarajevo] [FLYDDE] <Self_mover>[människor] <Path>[i tunnlar]

		sippra_ur_V_Fluidic_motion : V ; -- <Fluid>[vätskan] <Area>[i svampen] [SIPPRAT UR]
		svämma_över_V_Fluidic_motion : V ; -- <Area>[I London] har <Fluid>[Themsen] [SVÄMMAT ÖVER]
		cirkulera_V_Fluidic_motion : V ; -- <Fluid>[Vätskan] [CIRKULERAR] <Source>[från hjärnan] <Path>[genom ryggmärgen]
		flyta_fram_V_Fluidic_motion : V ; -- <Fluid>[blodet] [FLYTER FRAM] <Path>[i navelsträngen] och <Path>[i fostrets blodådror]
		rinna_V_Fluidic_motion : V ; -- <Fluid>[Floden] [RINNER] <Source>[från sjön Ilmen] <Path>[norrut] <Goal>[till Europas största insjö Ladoga]
		strömma_V_Fluidic_motion : V ; -- <Fluid>[Vattnet] [STRÖMMADE] <Goal>[in i kök och badrum]

		ha_förfalska_V2_Forging : V2 ; -- <Agent>[Sambon] [HADE FÖRFALSKAT] <Forgery>[hennes namnteckning]

		avstå_V_Forgoing : V ; -- <Forgoer>[Jag] kommer att [AVSTÅ] <Desirable>[från att rösta]
		låta_bli_VV_Forgoing : VV ; -- <Forgoer>[Man] har slösat med tillgängliga resurser och [LÅTIT BLI] <Desirable>[att hjälpa fattiga länder]

		bryta_V_Forming_relationships : V ; -- <Partner_1>[Hon] [BRÖT] <Partner_2>[med pojkvännen]
		gifta_sig_V_Forming_relationships : V ; -- <Partner_1>[Kvinnor] [GIFTER SIG] <Partner_2>[med dem de älskar]
		göra_slut_V_Forming_relationships : V ; -- <Partner_1>[Min kille] [GJORDE SLUT]
		äkta_V2_Forming_relationships : V2 ; -- <Partner_1>[Hon] [ÄKTADE] <Partner_2>[sin Simon]

		knirka_V_Friction : V ; -- <Theme>[mjölkkärrans hjul] [KNIRKA] <Static_object>[mot vägens grus]
		skrapa_V_Friction : V ; -- <Theme>[Pickupnål som] [SKRAPAR] <Static_object>[mot vinyl]

		hålla_masken_V_Front_for : V ; -- <Front>[Ola Lie] tänderna men [HÖLL MASKEN]

		slösa_bort_V2_Frugality : V2 ; -- <Resource_controller>[man] chansen och [SLÖSADE BORT] <Resource>[skattebetalarnas pengar]

		dra_ihop_V2_Gathering_up : V2 ; -- <Agent>[jag] ska försöka [DRA IHOP] <Aggregate>[ett gäng]
		sammankalla_V2_Gathering_up : V2 ; -- <Agent>[Gud] tröttnat på allt elände i världen och har därför [SAMMANKALLAT] <Aggregate>[ett möte]
		båda_upp_V2_Gathering_up : V2 ; -- <Agent>[Gänget] hade [BÅDAT UPP] <Individuals>[alla hedningar de kände]
		föra_ihop_V2_Gathering_up : V2 ; -- <Agent>[hon] skulle [FÖRA IHOP] <Individuals>[Johan med Peter]
		föra_samman_V2_Gathering_up : V2 ; -- <Agent>[Den] [FÖRDE SAMMAN] <Individuals>[22 organisationer från 16 länder]
		kalla_ihop_V2_Gathering_up : V2 ; -- <Agent>[Han] skyndade till sitt rum för att [KALLA IHOP] <Individuals>[sina kollegor]
		samla_V2_Gathering_up : V2 ; -- <Agent>[Orgelparty] [SAMLAR] <Individuals>[virtuoser och sångare]
		uppbåda_V2_Gathering_up : V2 ; -- [UPPBÅDA] <Individuals>[svenskspråkiga poliser]

		vinka_V_Gesture : V ; -- [VINKADE] <Communicator>[han] <Body_part>[med armarna]
		vinka_V2_Gesture : V2 ; -- <Communicator>[jag] [VINKADE] <Message>[farväl] <Addressee>[till den missmodige sonen och kattlådan]
		teckna_VS_Gesture : VS ; -- <Communicator>[Niklas] [TECKNAR] <Message>[att vi ska gå ned]
		vinka_VS_Gesture : VS ; -- <Communicator>[Han] [VINKADE] <Addressee>[på sin gumma] <Message>[att hon skulle komma]
		vinka_VV_Gesture : VV ; -- <Communicator>[Anders Frisk] [VINKADE] <Message>[spela vidare]

		få_jobb_V_Get_a_job : V ; -- <Employee>[alla] [FÅ JOBB]
		mönstra_på_V_Get_a_job : V ; -- <Employee>[Cook] istället av i London och [MÖNSTRAR PÅ] <Employer>[i flottan]
		ta_jobb_V_Get_a_job : V ; -- <Employee>[Jag och en kompis] åkte ner till Kos en sommar och [TOG JOBB]
		ta_värvning_V_Get_a_job : V ; -- <Employee>[jag] [TOG VÄRVNING] <Employer>[i flottans musikkår]

		anskaffa_V2_Getting : V2 ; -- <Recipient>[en fördragsstat] under inga omständigheter [ANSKAFFA] eller inneha <Theme>[biologiska vapen]
		greja_V2_Getting : V2 ; -- <Recipient>[Phelps] [GREJADE] <Theme>[8 guld]
		skaffa_fram_V2_Getting : V2 ; -- <Recipient>[vi] [SKAFFAR FRAM] <Theme>[medel]
		skaffa_sig_V2_Getting : V2 ; -- <Recipient>[Kommunerna] måste [SKAFFA SIG] <Theme>[överblick över all barn- och ungdomsverksamhet]
		säkra_V2_Getting : V2 ; -- <Recipient>[partiet] har [SÄKRAT] <Theme>[ett mandat]

		ge_sig_iväg_V_Getting_underway : V ; -- <Self_mover>[de] [GETT SIG IVÄG]
		ge_sig_ut_V_Getting_underway : V ; -- <Self_mover>[Andra] [GER SIG UT]
		pallra_sig_V_Getting_underway : V ; -- <Self_mover>[Pierre] [PALLRADE SIG]

		stiga_upp_V_Getting_up : V ; -- <Protagonist>[Hans fru] [STIGER UPP]

		köra_ut_V2_Getting_vehicle_underway : V2 ; -- <Driver>[Vi] [KÖRDE UT] <Vehicle>[båten]

		allokera_V2_Giving : V2 ; -- <Donor>[Vi] vill [ALLOKERA] <Theme>[resurserna] <Recipient>[till företagsbanken]
		anslå_V2_Giving : V2 ; -- <Donor>[Danderyd] [ANSLÅR] <Theme>[12 kronor och 75 öre]
		donera_V2_Giving : V2 ; -- <Donor>[Sveriges riksbank] firade 300-årsjubileum år 1968 genom att [DONERA] <Theme>[en stor summa pengar] <Recipient>[till Nobelstiftelsen]
		ge_V2_Giving : V2 ; -- <Donor>[Hon] [GAV] <Theme>[pengar] <Recipient>[till folk som verkligen förtjänade pengarna !]
		ägna_V2_Giving : V2 ; -- <Donor>[Sonen Gustaf] kom att [ÄGNA] <Theme>[sitt liv]

		falla_till_föga_V_Giving_in : V ; -- <Capitulator>[man] inte [FALLA TILL FÖGA] <Issue>[för den här typen av pojkstreck eller vandalism]

		fälla_ihop_sig_V_Go_into_shape : V ; -- <Theme>[Blommorna som] vecklar ut sig i sol och [FÄLLER IHOP SIG]
		krusa_sig_V_Go_into_shape : V ; -- <Theme>[Vattnet] [KRUSAR SIG]
		kröka_sig_V_Go_into_shape : V ; -- <Theme>[Den djupa bukten som] [KRÖKER SIG]
		locka_sig_V_Go_into_shape : V ; -- <Theme>[Det svarta håret] [LOCKADE SIG]
		rulla_ihop_sig_V_Go_into_shape : V ; -- <Theme>[det kloka djuret] svarade inte , gav mig bara ett överseende ögonkast och [RULLADE IHOP SIG]
		räta_sig_V_Go_into_shape : V ; -- <Theme>[Ryggen] [RÄTADE SIG]
		vecka_sig_V_Go_into_shape : V ; -- <Theme>[det] [VECKAR SIG]
		vika_ihop_sig_V_Go_into_shape : V ; -- <Theme>[Han] [VIKER IHOP SIG]

		backa_V_Going_back_on_a_commitment : V ; -- <Protagonist>[Regeringen] har inte [BACKAT] <Commitment>[från löften man gett tidigare]

		okeja_V2_Grant_permission : V2 ; -- <Grantor>[Konservativa grupper] [OKEJAR] <Action>[en liten höjning av lånetaket]
		tillåta_V2_Grant_permission : V2 ; -- <Grantor>[en chef som] [TILLÅTER] <Action>[grundlagsbrott]

		greppa_V2_Grasp : V2 ; -- <Cognizer>[Ojanen och Jalonen] säger sig [GREPPA] <Phenomenon>[historien]
		uppfatta_V2_Grasp : V2 ; -- <Cognizer>[De flesta] har [UPPFATTAT] <Phenomenon>[honom som Carl I Hagens kronprins]
		förstå_VQ_Grasp : VQ ; -- <Cognizer>[De flesta föräldrar] [FÖRSTÅR] <Phenomenon>[hur situationen ser ut]

		krossa_V_Grinding : V ; -- [KROSSA] <Undergoer>[pepparkornen och kanelstången]
		tugga_V_Grinding : V ; -- [TUGGA] <Undergoer>[varje tugga]
		pulvrisera_V2_Grinding : V2 ; -- [PULVRISERA] <Undergoer>[stenblock]
		smula_sönder_V2_Grinding : V2 ; -- <Grinder>[Hon] [SMULAR SÖNDER] <Undergoer>[askan]

		borsta_V_Grooming : V ; -- <Body_part>[Tänderna] är [BORSTADE] och [TANDTRÅDADE]
		tandtråda_V_Grooming : V ; -- <Body_part>[Tänderna] är [BORSTADE] och [TANDTRÅDADE]
		bena_V2_Grooming : V2 ; -- <Agent>[Han] [BENADE] <Body_part>[hennes hår]
		borsta_V2_Grooming : V2 ; -- <Agent>[Liam] [BORSTAR] <Body_part>[tänderna]
		kamma_ned_V2_Grooming : V2 ; -- <Agent>[Han] [KAMMAR NED] <Body_part>[luggen]
		locka_V2_Grooming : V2 ; -- <Agent>[Slava och chefsprovidnissan] fnissar och [LOCKAR] <Body_part>[håret]
		ondulera_V2_Grooming : V2 ; -- [ONDULERADE] <Agent>[du] <Body_part>[håret]
		permanenta_V2_Grooming : V2 ; -- <Agent>[Jag] har alltid velat ha stort och lockigt hår och [PERMANENTADE] <Body_part>[mitt hår]
		permanentondulera_V2_Grooming : V2 ; -- [PERMANENTONDULERAT] <Body_part>[håret]
		slätraka_V2_Grooming : V2 ; -- <Agent>[sumererna] [SLÄTRAKADE] inte bara <Body_part>[läppar och haka] utan också <Body_part>[huvudsvålen]
		tvätta_V2_Grooming : V2 ; -- [TVÄTTADE] <Body_part>[håret]
		tvätta_av_V2_Grooming : V2 ; -- [TVÄTTA AV] <Body_part>[händerna]
		två_V2_Grooming : V2 ; -- <Agent>[Jag] [TVÅR] <Body_part>[mina händer]
		vattenkamma_V2_Grooming : V2 ; -- <Agent>[Felix] hade till och med hunnit [VATTENKAMMA] <Body_part>[håret som alltid var bångstyrigt]
		vaxa_V2_Grooming : V2 ; -- [VAXADE] <Agent>[jag] <Body_part>[benen]
		raka_V2_Grooming : V2 ; -- <Agent>[En bonde] [RAKAR] och [TVÄTTAR] <Patient>[sig]
		rykta_V2_Grooming : V2 ; -- <Agent>[Vi] [RYKTAR] <Patient>[hästarna]
		tvaga_V2_Grooming : V2 ; -- <Body_part>[Pung och penis] [TVAGAS]

		avla_V2_Growing_food : V2 ; -- <Grower>[Vi] [AVLAR] <Food>[sköldpaddor]
		föda_upp_V2_Growing_food : V2 ; -- <Grower>[Odlare] vill [FÖDA UPP] <Food>[gös]
		odla_V2_Growing_food : V2 ; -- <Grower>[Norrmännen] [ODLAR] <Food>[lax]

		knollra_sig_V_Hair_configuration : V ; -- <Hair>[Håret] [KNOLLRAR SIG]

		göra_halt_V_Halt : V ; -- <Theme>[Gaffeln med tomatbiten] [GÖR HALT]
		stanna_V_Halt : V ; -- <Theme>[Kvinnan] [STANNADE]
		stanna_till_V_Halt : V ; -- <Theme>[Ett tåg] hade [STANNAT TILL]
		stanna_upp_V_Halt : V ; -- <Theme>[den enda som] [STANNAR UPP]

		kräva_V2_Have_as_requirement : V2 ; -- <Dependent>[Programmet] [KRÄVER] <Requirement>[ingen installation]

		kunna_översätta_V_Have_as_translation_equivalent : V ; -- <Source_symbol>[Kosher] är ett hebreiskt ord som [KAN ÖVERSÄTTAS] som <Target_symbol>[lämplig eller rätt]

		höra_V_Hear : V ; -- <Hearer>[unge Magnus] [HÖRDE] <Topic>[om svårigheterna att infånga statsrådet Andersson för intervju]
		höra_V2_Hear : V2 ; -- [HÖR] <Hearer>[poliserna] <Message>[ett klonkande ljud bakom mannen]
		höra_VS_Hear : VS ; -- <Hearer>[Jag] [HÖRDE] <Message>[att det var nåt strul med hustrun]

		proklamera_V2_Heralding : V2 ; -- <Communicator>[Efterträdaren Ben Ali] hade [PROKLAMERAT] <Event>[nya tider]
		utbasunera_V2_Heralding : V2 ; -- <Event>[Detta] har <Communicator>[han] meddelat Natohögkvarteret och [UTBASUNERAT]

		dölja_V2_Hiding_objects : V2 ; -- <Agent>[Han] [DÖLJER] <Hidden_object>[sitt ansikte]
		gömma_V2_Hiding_objects : V2 ; -- <Agent>[Max] [GÖMMER] <Hidden_object>[25 000 pund från en kupp i London] <Hiding_place>[i en ananasburk]
		maskera_V2_Hiding_objects : V2 ; -- <Agent>[Angelo] [MASKERAR] inte <Hidden_object>[sina känslor]
		skymma_V2_Hiding_objects : V2 ; -- <Agent>[Han] [SKYMMER] <Hidden_object>[utsikten]

		hindra_V2_Hindering : V2 ; -- <Hindrance>[Lördagens hällregn] [HINDRADE] inte <Protagonist>[besökarna] <Action>[på helgens auktion]
		hämma_V2_Hindering : V2 ; -- <Hindrance>[det] [HÄMMAR] <Action>[utvecklingen]

		leja_V2_Hiring : V2 ; -- <Employer>[Utblottade fastighetsägare] [LEJDE] <Employee>[folk som brände ner deras hus]

		skjuta_V2_Hit_target : V2 ; -- <Agent>[Polisen] [SKJUTER] <Target>[mannen]
		träffa_V2_Hit_target : V2 ; -- <Agent>[en skicklig skytt som] [TRÄFFAR] mitt <Target>[nån som sitter i en bil som är i rörelse]

		dröja_med_VV_Holding_off_on : VV ; -- <Agent>[Pakistan] [DRÖJDE MED] <Desirable_action>[att kommentera det indiska beslutet]
		vänta_med_VV_Holding_off_on : VV ; -- <Agent>[Jag] kommer [VÄNTA MED] <Desirable_action>[att börja äte nyttigare]

		bråka_V_Hostile_encounter : V ; -- <Sides>[Flera män] [BRÅKAR]
		ryka_ihop_V_Hostile_encounter : V ; -- <Sides>[Två kvinnor] [RYKER IHOP]
		ryka_samman_V_Hostile_encounter : V ; -- <Sides>[De båda] [RÖK SAMMAN]

		fiska_V_Hunting : V ; -- [FISKADE] <Hunter>[han]
		jaga_V_Hunting : V ; -- [JAGAR] <Hunter>[vithajarna]
		pilka_V_Hunting : V ; -- <Hunter>[Männen] [PILKADE]

		fälla_V2_Hunting_success_or_failure : V2 ; -- [FÄLLA] <Food>[ett stort villebråd]

		härma_V2_Imitating : V2 ; -- <Agent>[arter] kan [HÄRMA] <Characteristic>[mönstren] <Standard>[på de]
		apa_efter_V2_Imitating : V2 ; -- <Agent>[de] [APAR EFTER] <Standard>[oss]
		efterlikna_V2_Imitating : V2 ; -- <Agent>[Vi] har försökt [EFTERLIKNA] <Standard>[originalen]
		spela_V2_Imitating : V2 ; -- <Agent>[Vem som helst] kan inte heller [SPELA] <Standard>[psykopat]

		bura_in_V2_Immobilization : V2 ; -- <Agent>[han] vill [BURA IN] <Patient>[folk]

		krocka_V_Impact : V ; -- <Impactor>[Han] [KROCKADE] <Impactee>[med en personbil som låg i fel körbana]
		landa_V_Impact : V ; -- <Impactor>[En av granaterna] [LANDADE] <Impactee>[på bordet]
		plöja_in_V_Impact : V ; -- <Impactor>[det] [PLÖJDE IN] <Impactee>[i en bil]
		slå_V_Impact : V ; -- <Impactor>[vågorna] [SLOG] <Impactee>[mot hennes dörr]
		slå_ner_V_Impact : V ; -- <Impactor>[Den granaten] [SLOG NER]
		smattra_V_Impact : V ; -- <Impactor>[Åskregnen som] [SMATTRAR] <Impactee>[mot glastaket]
		snärta_V_Impact : V ; -- <Impactor>[tungan] [SNÄRTAR] <Impactee>[mot gommen]
		ta_V_Impact : V ; -- <Impactor>[bollen] [TOG]
		däcka_V2_Impact : V2 ; -- <Impactor>[han] mindes ingenting av den våldsamma sammanstötningen med den olycklige mittbacken Raoul Kouakou , som skulle reparera sitt eget misstag och då skallade och [DÄCKADE] <Impactee>[sin lagkamrat]
		ramma_V2_Impact : V2 ; -- <Impactor>[Båten] [RAMMADE] <Impactee>[ett betongfundament]
		träffa_V2_Impact : V2 ; -- <Impactor>[Kulan] [TRÄFFADE] <Impactee>[eleven]

		ha_V2_Inclusion : V2 ; -- <Total>[Staden] [HAR] <Part>[12 universitet]
		inkludera_V2_Inclusion : V2 ; -- <Total>[Den lokala faunan] [INKLUDERAR] <Part>[den utrotningshotade jättepandan Ailuropoda melanoleuca och gyllene trubbnäsapan Pygathrix roxellanae roxellanae]
		omfatta_V2_Inclusion : V2 ; -- <Total>[TT:s dragningslista] [OMFATTAR] <Part>[vinster t o m 10 000 kronor]
		uppta_V2_Inclusion : V2 ; -- <Total>[Rollistan] [UPPTAR] <Part>[35 namn]

		ge_V2_Indicating : V2 ; -- <Communicator>[föräldrar] [UPPGETT] <Unresolved_referent>[ett barn som sitt biologiska]
		namnge_V2_Indicating : V2 ; -- <Communicator>[vi] ska identifiera och [NAMNGE] <Unresolved_referent>[personer som skadas eller dödas genom brott]
		peka_ut_V2_Indicating : V2 ; -- <Communicator>[hon] inte [PEKA UT] <Unresolved_referent>[någon favoritchoklad]
		lista_V2_Indicating : V2 ; -- <Medium>[Guiden] [LISTAR] <Unresolved_referent>[museer]

		använda_sig_V_Ingest_substance : V ; -- <Ingestor>[Jag] [ANVÄNDE MIG] <Substance>[av sprit och kokain]
		röka_ner_sig_V_Ingest_substance : V ; -- <Ingestor>[Polaren] [RÖKTE NER SIG] <Substance>[på billigt horse]
		smygröka_V_Ingest_substance : V ; -- <Ingestor>[jag] [SMYGRÖKT]
		tjuvröka_V_Ingest_substance : V ; -- <Ingestor>[Jag] började [TJUVRÖKA]
		röka_V2_Ingest_substance : V2 ; -- <Ingestor>[Han] [RÖKER] <Delivery_device>[cigaretter]
		använda_V2_Ingest_substance : V2 ; -- <Ingestor>[man] [ANVÄNDER] <Substance>[kokain]
		bruka_V2_Ingest_substance : V2 ; -- <Ingestor>[De som] [BRUKAR] <Substance>[alkohol och tobak]
		kedjeröka_V2_Ingest_substance : V2 ; -- <Ingestor>[Jag] låg i min säng , [KEDJERÖKTE] <Substance>[cigaretter]
		sniffa_V2_Ingest_substance : V2 ; -- <Ingestor>[Jag] [SNIFFADE] <Substance>[kokain]
		snorta_V2_Ingest_substance : V2 ; -- <Ingestor>[Drogmisstänkt] ville [SNORTA] <Substance>[kokain]
		ta_V2_Ingest_substance : V2 ; -- <Ingestor>[man] [TAR] <Substance>[GHB]
		inta_V2_Ingest_substance : V2 ; -- <Substance>[Kokain] [INTAS]

		dinera_V_Ingestion : V ; -- <Ingestor>[Vi] ska [DINERA]
		frukostera_V_Ingestion : V ; -- <Ingestor>[Vi] satt och [FRUKOSTERADE]
		fukta_strupen_V_Ingestion : V ; -- <Ingestor>[jag] kunde [FUKTA STRUPEN]
		gnaga_V_Ingestion : V ; -- <Ingestor>[en häst] [GNAGA] <Ingestibles>[på krubbvirket]
		hugga_in_V_Ingestion : V ; -- <Ingestor>[Annie Wegelius] [HUGGER IN] <Ingestibles>[på en korv med bröd]
		idissla_V_Ingestion : V ; -- <Ingestor>[en ensam ko] och [IDISSLAR] <Ingestibles>[på gräset]
		knapra_V_Ingestion : V ; -- [KNAPRAR] <Ingestor>[jag] <Ingestibles>[på morötter]
		proppa_i_sig_V_Ingestion : V ; -- <Ingestor>[Pappa] [PROPPADE I SIG] <Ingestibles>[sherrykaka]
		smälla_i_sig_V_Ingestion : V ; -- <Ingestor>[jag] ska [SMÄLLA I MIG] <Ingestibles>[lite Ben&Jerrys]
		supera_V_Ingestion : V ; -- <Ingestor>[han] [SUPERA]
		sällskapsäta_V_Ingestion : V ; -- <Ingestor>[Jag] kan inte tänka att jag är särskilt sugen på att [SÄLLSKAPSÄTA] <Ingestibles>[av pajen]
		äta_V_Ingestion : V ; -- <Ingestor>[Människor] och <Ingestor>[djur] [ÄTER]
		dricka_V_Ingestion : V ; -- <Ingestibles>[man] [DRICKER]
		dia_V2_Ingestion : V2 ; -- <Ingestor>[fem kalvar] [DIADE] <Ingestibles>[sina mödrar]
		dricka_V2_Ingestion : V2 ; -- <Ingestor>[Vi] [DRICKER] <Ingestibles>[mjölk]
		ha_V2_Ingestion : V2 ; -- <Ingestor>[jag] hungrig och vill [HA] <Ingestibles>[lunch]
		kasta_i_sig_V2_Ingestion : V2 ; -- <Ingestor>[Vanliga ungar] [KASTAR I SIG] <Ingestibles>[lunchen]
		skåpäta_V2_Ingestion : V2 ; -- <Ingestibles>[Saffransskorporna] har jag stoppat långt in i skafferiet så <Ingestor>[jag] inte ska kunna [SKÅPÄTA]
		snaska_V2_Ingestion : V2 ; -- <Ingestor>[jag] gå ned till Anna och Pernilla och måla påskägg och [SNASKA] <Ingestibles>[godis]
		äta_V2_Ingestion : V2 ; -- <Ingestor>[Svenskarna] [ÄTER] <Ingestibles>[17 kilo godis]
		inta_V2_Ingestion : V2 ; -- <Ingestibles>[vitlök] , liksom allt annat , [INTAS]

		fjättra_V_Inhibit_movement : V ; -- <Theme>[De riktigt stora kryssningsfartygen med de riktigt stora plånböckerna ombord] förblir [FJÄTTRADE] <Holding_location>[vid Skandiahamnens kajer]
		hålla_fast_V2_Inhibit_movement : V2 ; -- <Agent>[Han] [HÖLL FAST] <Theme>[honom]
		kvarhålla_V2_Inhibit_movement : V2 ; -- <Agent>[En väktare] [KVARHÅLLER] <Theme>[en man beväpnad med pepparspray]
		uppehålla_V2_Inhibit_movement : V2 ; -- <Agent>[Jag] [UPPEHÖLL] <Theme>[honom]

		mönstra_V2_Inspecting : V2 ; -- <Inspector>[Man] började att [MÖNSTRA] <Ground>[hundar]
		titta_till_V2_Inspecting : V2 ; -- <Inspector>[brandkåren i Rjukan som] [TITTAR TILL] <Ground>[anläggningen]
		visitera_V2_Inspecting : V2 ; -- <Inspector>[Polis] och <Inspector>[ordningsvakter] får då [VISITERA] <Ground>[besökare]

		installera_V2_Installing : V2 ; -- <Agent>[Företaget] [INSTALLERADE] <Component>[105 piratprogram] <Fixed_location>[i 45 datorer]

		hospitalisera_V2_Institutionalization : V2 ; -- <Authority>[Psykiatrin] medicinerar och [HOSPITALISERAR] <Patient>[människor]

		gena_V_Intentional_traversing : V ; -- <Self_mover>[hon] som vanligt [GENADE] <Path>[över en hundgård]
		vada_V_Intentional_traversing : V ; -- <Self_mover>[vi] [VADAR] <Path>[ut]
		bestiga_V2_Intentional_traversing : V2 ; -- <Self_mover>[Cezar Persson] på att [BESTIGA] <Path>[en röd rutschkana]

		göra_V_Intentionally_affect : V ; -- <Agent>[Jag] fick [GÖRA] <Patient>[i detta projekt]

		bilda_V2_Intentionally_create : V2 ; -- <Creator>[Holmen] [BILDAR] <Created_entity>[bolag]
		ge_V2_Intentionally_create : V2 ; -- [GAV] <Creator>[Stockholms stad] <Created_entity>[bankett]
		göra_V2_Intentionally_create : V2 ; -- <Creator>[Jag] [GÖR] <Created_entity>[alla tre målen]
		kreera_V2_Intentionally_create : V2 ; -- [KREERAR] <Creator>[hon] <Created_entity>[sina praliner] och <Created_entity>[tryfflar]

		fånga_upp_V2_Intercepting : V2 ; -- <Interceptor>[Satelliter] [FÅNGAR UPP] <Theme>[samtal och e-post]
		snappa_upp_V2_Intercepting : V2 ; -- <Theme>[Meddelandena som] <Interceptor>[polisen] [SNAPPAT UPP]

		ajournera_V2_Interrupt_process : V2 ; -- [AJOURNERADES] <Process>[förhandlingarna]
		avbryta_V2_Interrupt_process : V2 ; -- <Process>[Deras möte] [AVBRYTS] <Cause>[av Tommys entré]

		invadera_V_Invading : V ; -- <Land>[de] [INVADERADE]
		invadera_V2_Invading : V2 ; -- <Invader>[Irak] [INVADERADE] <Land>[Kuwait]

		beundra_V2_Judgment : V2 ; -- <Cognizer>[Jag] kan [BEUNDRA] <Evaluee>[dem] <Reason>[för deras mod]

		ta_avstånd_V_Judgment_communication : V ; -- <Communicator>[Så gott som alla partidistrikt] [TAR AVSTÅND] <Evaluee>[från partiledningens beslut]
		anklaga_V2_Judgment_communication : V2 ; -- <Communicator>[De båda] [ANKLAGAR] återigen <Evaluee>[regeringen] <Reason>[för passivitet]
		svartmåla_V2_Judgment_communication : V2 ; -- <Communicator>[massmedia] [SVARTMÅLAR] <Evaluee>[ravefesterna]

		gräla_på_V2_Judgment_direct_address : V2 ; -- <Communicator>[hon] har [GRÄLAT PÅ] <Addressee>[oss]
		komplimentera_V2_Judgment_direct_address : V2 ; -- <Communicator>[jag] [KOMPLIMENTERA] <Addressee>[föredraganden] <Reason>[till hans korta och tydliga förklaring]
		tillrättavisa_V2_Judgment_direct_address : V2 ; -- <Communicator>[ni] försöker [TILLRÄTTAVISA] <Addressee>[mig]
		tala_till_rätta_V2_Judgment_direct_address : V2 ; -- <Addressee>[de inblandade] [TALAS TILL RÄTTA] <Communicator>[av polisen]
		förebrå_V2_Judgment_direct_address : V2 ; -- <Addressee>[Detta parlament] [FÖREBRÅS] <Reason>[för att inte alltid vara så ansvarsfullt]

		försvara_V2_Justifying : V2 ; -- <Agent>[idioter] går ut med namn och [FÖRSVARAR] <Act>[sin rätt att dricka sig berusad i sällskap av sina barn]
		rättfärdiga_V2_Justifying : V2 ; -- <Agent>[Jag] [RÄTTFÄRDIGAR] <Act>[publiceringen]

		kidnappa_V2_Kidnapping : V2 ; -- [KIDNAPPAR] <Perpetrator>[han] <Victim>[ett barn]

		dränka_V2_Killing : V2 ; -- <Cause>[Flodvågor orsakade av skalvet] [DRÄNKTE] <Victim>[många människor]
		gasa_V2_Killing : V2 ; -- [GASA] <Victim>[sig själv]
		döda_V2_Killing : V2 ; -- [DÖDAR] <Killer>[de] <Victim>[500 personer]
		slå_ihjäl_V2_Killing : V2 ; -- <Killer>[En tjänare] och [SLOG IHJÄL] <Victim>[honom]

		knyta_V2_Knot_creation : V2 ; -- <Agent>[Jag] [KNYTER] <Knot>[en knut]

		kalla_V2_Labeling : V2 ; -- <Speaker>[Man] kan inte ens [KALLA] <Entity>[bryggan] <Label>[för modern konst]

		lansera_V2_Launch_process : V2 ; -- <Agent>[Förbundet] [LANSERAR] <Process>[projekt Tvärnit]
		sjösätta_V2_Launch_process : V2 ; -- <Agent>[Vi] räknar med att [SJÖSÄTTA] <Process>[projektet]

		leda_V2_Leadership : V2 ; -- <Leader>[Jag] skall [LEDA] <Activity>[arbetet med en förstudie som sedan skall ge ett permanent avtal om samarbete]
		regera_V2_Leadership : V2 ; -- <Leader>[Tage Erlander] [REGERADE] <Governed>[Sverige]
		styra_V2_Leadership : V2 ; -- <Governed>[Marocko] [STYRS] <Leader>[av kung Hassan II]

		betyda_V2_Linguistic_meaning : V2 ; -- <Form>[Ordet kommunikation] kommer <Form>[communicatio] , som [BETYDER] <Meaning>[ömsesidigt utbyte] eller <Meaning>[överföring av information]

		krylla_V_Lively_place : V ; -- <Location>[London] [KRYLLAR] <Activity>[av mysiga caféer och tesalonger]

		finna_V2_Locating : V2 ; -- <Perceiver>[Jag] [FANN] <Sought_entity>[en strömbrytare]
		hitta_V2_Locating : V2 ; -- [HITTAR] <Perceiver>[jag] visst inte <Sought_entity>[korkskruven]

		blinka_V_Location_of_light : V ; -- <Figure>[ett DJ-bås som] [BLINKAR]
		lysa_V_Location_of_light : V ; -- <Figure>[Två ord] [LYSER] <Ground>[i mörkret]
		skimra_V_Location_of_light : V ; -- <Figure>[lågorna] [SKIMRAR] <Ground>[i vinterkvällen]

		omge_V2_Locative_relation : V2 ; -- <Figure>[Kolhydrater] [OMGER] <Ground>[varje hårstrå]

		bli_av_med_V2_Losing : V2 ; -- <Owner>[kommunisterna] [BLIVIT AV MED] <Possession>[makten]
		tappa_V2_Losing : V2 ; -- <Owner>[Hon] opererade hälsenan och fick följdskador och [TAPPADE] <Possession>[intresset]
		tappa_bort_V2_Losing : V2 ; -- <Owner>[jag] [TAPPADE BORT] <Possession>[all min mail]

		förlora_V2_Losing_someone : V2 ; -- <Sufferer>[en man som] [FÖRLORAR] <Deceased>[sin syster]
		mista_V2_Losing_someone : V2 ; -- <Sufferer>[Hans] [MISTE] <Deceased>[sin bäste vän]

		ingå_fred_V_Make_agreement_on_action : V ; -- <Party_1>[Furstbiskopen av Münster] önskade [INGÅ FRED] <Party_2>[med Sverige]
		komma_V_Make_agreement_on_action : V ; -- <Party_1>[Livsmedelskommissionen] [ÖVERENSKOM] <Party_2>[med ledande representanter för restaurangnäringen]
		komma_överens_V_Make_agreement_on_action : V ; -- <Party_1>[Man] kan också [KOMMA ÖVERENS] <Party_2>[med grannar]
		sluta_avtal_V_Make_agreement_on_action : V ; -- <Party_1>[Han] vill [SLUTA AVTAL]
		sluta_fred_V_Make_agreement_on_action : V ; -- <Party_1>[Han] lyckades också [SLUTA FRED] <Party_2>[med en del mindre rebellrörelser]

		associera_V2_Make_cognitive_connection : V2 ; -- <Cognizer>[man] vill [ASSOCIERA] <Concept_1>[julen] <Concept_2>[med kristendomen]
		hänga_ihop_V2_Make_cognitive_connection : V2 ; -- <Cognizer>[Många] tror att <Concept_1>[skotten] [HÄNGER IHOP] <Concept_2>[med bråket]
		sammankoppla_V2_Make_cognitive_connection : V2 ; -- <Cognizer>[Jag] skulle aldrig [SAMMANKOPPLA] <Concept_1>[honom] <Concept_2>[med grov kriminalitet]

		mala_på_V_Make_noise : V ; -- <Noisy_event>[Höstens remissdebatt 1967] [MALDE PÅ]
		ge_V2_Make_noise : V2 ; -- <Sound_source>[Evia] [UPPGAV] <Sound>[ett konstlat skratt]
		säga_V2_Make_noise : V2 ; -- <Sound_source>[Tåget] [SÄGER] <Sound>[tut]

		möjliggöra_V2_Make_possible_to_do : V2 ; -- <Enablement>[Maskinen] [MÖJLIGGÖR] även <Enabled_action>[tillskärning av besvärliga kvaliteer]
		tillåta_V2_Make_possible_to_do : V2 ; -- <Enablement>[Jobbtiderna] [TILLÅTER] ju <Enabled_action>[utgång på lördag]
		möjliggöra_VS_Make_possible_to_do : VS ; -- <Enablement>[Detta kretslopp] [MÖJLIGGÖR] <Enabled_action>[att kroppens alla vävnader kan ta del av syret från inandningsluften]
		tillåta_VS_Make_possible_to_do : VS ; -- <Enablement>[Vädret] [TILLÄT] inte <Enabled_action>[att vi satt ute]

		dra_på_smilbanden_V_Making_faces : V ; -- <Agent>[Vem] kan undvika att [DRA PÅ SMILBANDEN]
		flina_V_Making_faces : V ; -- <Agent>[Emil] och [FLINAR]
		grimasera_V_Making_faces : V ; -- <Agent>[Måns] och [GRIMASERADE]
		hånle_V_Making_faces : V ; -- <Agent>[Jag] [HÅNLOG]

		manipulera_V2_Manipulate_into_doing : V2 ; -- <Victim>[Sara Svensson] hade [MANIPULERATS] <Resulting_action>[till att vilja göra sitt bästa för auktoriteter]

		forma_V2_Manipulate_into_shape : V2 ; -- [FORMA] <Theme>[4 avlånga rullar]
		modellera_V2_Manipulate_into_shape : V2 ; -- <Agent>[jag] försökte mig på att [MODELLERA] <Theme>[nyckelpigor]

		gno_V_Manipulation : V ; -- <Agent>[Jag] [GNODDE]
		nudda_V_Manipulation : V ; -- <Agent>[han] sig mot mig och [NUDDADE] <Entity>[vid mitt öra] <Bodypart_of_agent>[med läpparna]
		ta_V_Manipulation : V ; -- <Agent>[Man] [TAR] inte <Entity>[i folk man inte känner]
		gnussa_V2_Manipulation : V2 ; -- <Agent>[Ciara] började [GNUSSA] <Entity>[ögonen]
		gripa_V2_Manipulation : V2 ; -- <Agent>[Jag] saktade in , [GREP] <Entity>[kameran som låg bredvid mig i framsätet]
		hålla_V2_Manipulation : V2 ; -- <Agent>[Hon] [HÖLL] <Entity>[luren] <Bodypart_of_agent>[i handen]
		smeka_V2_Manipulation : V2 ; -- <Agent>[Erna] [SMEKTE] <Entity>[honom]
		topsa_V2_Manipulation : V2 ; -- <Entity>[Han] [TOPSADES]

		framställa_V2_Manufacturing : V2 ; -- <Factory>[Läkemedelsfabriker] [FRAMSTÄLLER] <Product>[t ex insulin och mänskligt tillväxthormon]

		bre_ut_sig_V_Mass_motion : V ; -- <Mass_theme>[Klätterhortensian] [BREDER UT SIG] <Area>[över husväggen]
		sprida_ut_sig_V_Mass_motion : V ; -- <Mass_theme>[Tjänstemän från Internationella valutafonden IMF] anlände till landet och [SPRED UT SIG] <Area>[över huvudstaden]
		vimla_V_Mass_motion : V ; -- <Mass_theme>[Hundratals säkerhetspoliser] [VIMLADE]
		välla_fram_V_Mass_motion : V ; -- <Mass_theme>[Cyklisterna] [VÄLLER FRAM]
		vältra_fram_V_Mass_motion : V ; -- <Mass_theme>[en virvel av svart rök , som] [VÄLTRADE FRAM]
		tränga_sig_V_Mass_motion : V ; -- <Mass_theme>[En del folk] börjar [TRÄNGA SIG] <Direction>[mot dörrarna]
		hagla_V_Mass_motion : V ; -- <Mass_theme>[bollarna] [HAGLADE] <Goal>[in i boxen]
		strömma_V_Mass_motion : V ; -- [STRÖMMAT] <Goal>[hit] <Mass_theme>[folk]
		välla_in_V_Mass_motion : V ; -- <Mass_theme>[de] [VÄLLER IN] <Path>[över gränserna]
		välla_upp_V_Mass_motion : V ; -- <Mass_theme>[Ett moln av saltsyra] [VÄLLDE UPP] <Source>[från kemijätten Sandoz anläggning]

		fullgöra_V2_Meet_specifications : V2 ; -- <Agent>[folk] [FULLGÖR] <Standard>[sina skyldigheter]
		utföra_V2_Meet_specifications : V2 ; -- <Agent>[Han] väntar på det rätta tillfället att [UTFÖRA] <Standard>[sin plikt]
		hålla_V2_Meet_specifications : V2 ; -- <Entity>[Varannan bilbarnstol] [HÅLLER] <Standard>[måttet]
		tillmötesgå_V2_Meet_specifications : V2 ; -- <Entity>[LFV] vägrat [TILLMÖTESGÅ] <Standard>[taxiförarnas krav]
		uppfylla_V2_Meet_specifications : V2 ; -- <Entity>[säkerhetsnormerna] bör [UPPFYLLA] <Standard>[standarden i västländerna]

		träffa_V2_Meet_with : V2 ; -- <Party_1>[jag] [TRÄFFA] <Party_2>[Linnéa]

		möta_V2_Meet_with_response : V2 ; -- <Trigger>[Janssons idé] [MÖTS] <Response>[med skepsis]
		ta_V2_Meet_with_response : V2 ; -- <Trigger>[Olika förslag och idéer] [MOTTAGES] <Response>[med tacksamhet]
		uppta_V2_Meet_with_response : V2 ; -- <Trigger>[Detta] [UPPTOGS]

		lägga_på_minnet_V2_Memorization : V2 ; -- <Pattern>[det nya telefonnumret] <Cognizer>[vi] ska [LÄGGA PÅ MINNET]
		lära_sig_V2_Memorization : V2 ; -- <Pattern>[kartor som] <Cognizer>[han] [LÄR SIG]
		memorera_V2_Memorization : V2 ; -- <Cognizer>[han] [MEMORERAT] <Pattern>[hela anförandet]
		memorera_in_V2_Memorization : V2 ; -- <Cognizer>[jag] lyckas [MEMORERA IN] <Pattern>[varje ord , varje tecken , varje mellanslag]

		komma_ihåg_V2_Memory : V2 ; -- <Cognizer>[folk] kan [KOMMA IHÅG] <Content>[ett namn som Schwarzenegger]
		glömma_VS_Memory : VS ; -- <Cognizer>[vi] [GLÖMMER] <Content>[att orättvisorna faktiskt sker i den fysiska världen]
		hålla_i_minnet_VS_Memory : VS ; -- <Cognizer>[Vi] måste [HÅLLA I MINNET] <Content>[att regionen är heterogen]

		nämna_V2_Mention : V2 ; -- <Communicator>[Ingen av dem] [NÄMNER] <Specified_content>[Brännkyrka]
		nämna_VS_Mention : VS ; -- <Communicator>[jag] [NÄMNDE] <Message>[att jag skulle få ett nytt rum]

		synda_V_Misdeed : V ; -- <Wrongdoer>[Den som sover] [SYNDAR]

		asa_V_Motion : V ; -- <Theme>[han] , [ASAR]
		curla_V_Motion : V ; -- <Theme>[stenen] glider och hur kraftigt den vrider sig eller [CURLAR]
		driva_bort_V_Motion : V ; -- <Theme>[Oljan] [DRIVER BORT] <Direction>[från Sverige]
		gå_V_Motion : V ; -- <Theme>[Mannen] [GICK] <Direction>[ut]
		halka_V_Motion : V ; -- <Theme>[En bil] [HALKADE] och [SLADDADE]
		orma_V_Motion : V ; -- <Theme>[Han] började [ORMA] <Direction>[fram]
		sladda_V_Motion : V ; -- <Theme>[En bil] [HALKADE] och [SLADDADE]
		leda_V_Motion : V ; -- <Theme>[E 4:an] [LEDDE] <Source>[från Lissabon] <Goal>[till Helsingfors]
		spela_V_Motion : V ; -- <Theme>[Solljuset] [SPELADE] <Path>[mellan vasstråna]

		slå_över_V_Motion_directional : V ; -- <Theme>[Hon] bråkade , stegrade sig och [SLOG ÖVER]
		stiga_upp_V_Motion_directional : V ; -- <Theme>[Vattnet] [STEG UPP]
		trilla_V_Motion_directional : V ; -- <Theme>[En person] ska ha [TRILLAT] <Goal>[i vattnet]
		störta_V_Motion_directional : V ; -- <Theme>[De två klättrarna] [STÖRTADE] <Source>[från en isvägg på Kebnekaise]

		svirra_V_Motion_noise : V ; -- <Theme>[En FN-helikopter] [SVIRRAR] <Path>[förbi]
		svischa_V_Motion_noise : V ; -- <Theme>[Tåg efter tåg] [SVISCHADE] <Path>[förbi]
		tuffa_V_Motion_noise : V ; -- <Theme>[Tåget] [TUFFADE]
		vina_V_Motion_noise : V ; -- [VEN] <Theme>[han] <Path>[ner för backen]
		slamra_V2_Motion_noise : V2 ; -- <Theme>[Den tunga bilen] [SLAMRADE] <Path>[lång väg]

		dallra_V_Moving_in_place : V ; -- <Theme>[hängkinderna] [DALLRADE]
		kränga_V_Moving_in_place : V ; -- <Theme>[däcket] [KRÄNGER]
		orma_sig_V_Moving_in_place : V ; -- <Theme>[Love] och börjar vrida och [ORMA SIG]
		slå_V_Moving_in_place : V ; -- <Theme>[Hjärtat] [SLOG]
		slå_runt_V_Moving_in_place : V ; -- <Theme>[Lastfartyget Nordersand] var nära att [SLÅ RUNT]
		sno_runt_V_Moving_in_place : V ; -- <Theme>[Hon] [SNODDE RUNT]
		svänga_V_Moving_in_place : V ; -- <Theme>[lyktan , som] [SVÄNGDE]
		vicka_V_Moving_in_place : V ; -- <Theme>[Pinnen] [VICKAR]
		vända_sig_V_Moving_in_place : V ; -- <Theme>[hon] [VÄNDE SIG]

		döpa_V2_Name_conferral : V2 ; -- <Entity>[ett grovt saftigt bröd som] <Speaker>[jag] [DÖPER]
		döpa_om_V2_Name_conferral : V2 ; -- [DÖPA OM] <Entity>[makt]
		dubba_V2_Name_conferral : V2 ; -- <Entity>[Webbens upphovsman riddare Tim Berners-Lee] [DUBBADES] <Name>[till riddare] <Speaker>[av drottning Elizabeth II]

		behöva_V2_Needing : V2 ; -- <Cognizer>[Barn] [BEHÖVER] <Requirement>[fett]

		anmäla_V2_Notification_of_charges : V2 ; -- <Arraign_authority>[polisen] [ANMÄLDE] <Accused>[mannen] <Charges>[för framkallande av fara för annan]
		åtala_V2_Notification_of_charges : V2 ; -- <Accused>[en man] [ÅTALATS] <Charges>[för innehav av barnporr]

		sönderfalla_V_Nuclear_process : V ; -- <Element>[en atom] [SÖNDERFALLER]
		ansamla_V2_Nuclear_process : V2 ; -- <Element>[den radioaktivitet som] [ANSAMLATS]
		smälta_samman_V2_Nuclear_process : V2 ; -- <Element>[atomkärnor] [SMÄLTAS SAMMAN]

		visa_sig_V_Obviousness : V ; -- <Phenomenon>[Solen] [VISAR SIG]

		toppa_V_Occupy_rank : V ; -- <Item>[Volvo] [TOPPAR]

		erbjuda_V2_Offering : V2 ; -- <Offerer>[Vi] kan [ERBJUDA] <Theme>[svensk service]

		båda_V_Omen : V ; -- <Phenomenon_1>[det] [BÅDAR] <Outcome>[gott]
		bebåda_V2_Omen : V2 ; -- <Phenomenon_1>[det] anses [BEBÅDA] <Phenomenon_2>[ond tid]
		förutspå_V2_Omen : V2 ; -- <Phenomenon_1>[Galluparna] [FÖRUTSPÅR] <Phenomenon_2>[valframgång]

		cykla_V_Operate_vehicle : V ; -- [CYKLADE] <Driver>[en 69-årig man] <Area>[på en grusväg]
		köra_V_Operate_vehicle : V ; -- <Driver>[vi] [KÖRDE]
		rida_V_Operate_vehicle : V ; -- <Driver>[Eunices far] , till exempel , [RIDER]
		skejta_V_Operate_vehicle : V ; -- <Driver>[vi] ska dra ut och [SKEJTA]
		hoja_V_Operate_vehicle : V ; -- <Driver>[han] [HOJAT] <Path>[norrut] <Goal>[på väg till mormor]
		paddla_V_Operate_vehicle : V ; -- <Driver>[Jag] [PADDLADE] <Path>[genom det lilla sundet mellan Hasselön och Grindholmen]

		driva_V2_Operating_a_system : V2 ; -- <Operator>[Min fru] [DRIVER] <System>[en liten enskild firma]
		förvalta_V2_Operating_a_system : V2 ; -- <Operator>[Statens fastighetsverk] [FÖRVALTAR] <System>[flera militära befästningar från olika tidsåldrar]
		handha_V2_Operating_a_system : V2 ; -- <Operator>[Omsorgsförvaltningen] [HANDHAR] <System>[de fonder som berör vård och hälsa]
		operera_V2_Operating_a_system : V2 ; -- <Operator>[Företaget] utvecklar och [OPERERAR] <System>[system för distribution och administration av digitalt innehåll via bredband]

		pröva_V2_Operational_testing : V2 ; -- <Tester>[4 500 testpiloter] att [PRÖVA] <Product>[NTT Docomos 3G-nät]
		testa_V2_Operational_testing : V2 ; -- <Tester>[han] blev testpilot och fick [TESTA] <Product>[nya flygplan]

		anse_VS_Opinion : VS ; -- <Cognizer>[Jag] [ANSER] <Opinion>[att dessa kvinnor är ett föredöme för unga tjejer]
		tycka_VS_Opinion : VS ; -- <Cognizer>[Hon] [TYCKER] <Opinion>[att jag shoppar för mycket]

		emanera_V_Origin : V ; -- <Entity>[Ångesten] [EMANERAR] <Origin>[från en förgiftad kropp och ett trassligt psyke]
		komma_V_Origin : V ; -- <Entity>[hon] [KOMMER] <Origin>[från Island]

		sympatisera_V_Others_situation_as_stimulus : V ; -- <Experiencer>[vi] [SYMPATISERAR] <Other>[med dem]
		tycka_synd_V_Others_situation_as_stimulus : V ; -- <Experiencer>[Jag] [TYCKTE SYND] <Other>[om honom]
		känna_med_V2_Others_situation_as_stimulus : V2 ; -- <Experiencer>[man] blir glad av deras framgångar och [KÄNNER MED] <Other>[dem]

		benåda_V2_Pardon : V2 ; -- <Authority>[presidenten] ska [BENÅDA] <Offender>[en kalkon]

		gynna_V2_Partiality : V2 ; -- [GYNNA] <Side_1>[den egna produktionen]

		röra_sig_V_Participation : V ; -- <Participant_1>[Thomas] [RÖRDE SIG]

		gå_V_Path_shape : V ; -- <Road>[Den enda vägen] [GÅR] <Direction>[norrut] , <Direction>[mot Augsburg]
		slingra_sig_V_Path_shape : V ; -- <Road>[Vägen] [SLINGRAR SIG] <Direction>[upp och ned]
		stiga_V_Path_shape : V ; -- [STIGER] <Road>[terrängen] <Direction>[mot norr]
		svänga_V_Path_shape : V ; -- <Road>[Avfarten] [SVÄNGER] <Direction>[upp]
		löpa_V_Path_shape : V ; -- [LÖPER] <Road>[en smal stig] <Source>[från beteshagen i öster]
		korsa_V2_Path_shape : V2 ; -- <Road>[Vägen] [KORSAR] <Area>[ett område av riksintresse för kulturmiljövård]

		kisa_V_Perception_active : V ; -- <Perceiver_agentive>[Han] [KISADE] <Body_part>[med ett blåsvullet öga]
		se_på_V_Perception_active : V ; -- <Perceiver_agentive>[Flera människor] [SÅG PÅ]
		titta_V_Perception_active : V ; -- <Perceiver_agentive>[De] [TITTADE] <Body_part>[med stora ögon]
		titta_på_V_Perception_active : V ; -- <Perceiver_agentive>[Klasslärarna] [TITTAR PÅ]
		fästa_blicken_V_Perception_active : V ; -- <Perceiver_agentive>[Man] bör [FÄSTA BLICKEN] <Phenomenon>[på något fast föremål] <Direction>[åt sidan]
		lukta_V_Perception_active : V ; -- <Perceiver_agentive>[han] och [LUKTAR] <Phenomenon>[på colognen han just fått i julklapp]
		se_V_Perception_active : V ; -- <Perceiver_agentive>[Hon] [SÅG] <Phenomenon>[på Maria bredvid sig]
		avlyssna_V2_Perception_active : V2 ; -- [AVLYSSNAR] <Perceiver_agentive>[dottern] <Phenomenon>[ett samtal mellan fadern och en rumänsk författare]
		betrakta_V2_Perception_active : V2 ; -- <Perceiver_agentive>[Hon] [BETRAKTAR] <Phenomenon>[Giacomettis alltför uttänjda skulpterade kroppar]
		beundra_V2_Perception_active : V2 ; -- <Perceiver_agentive>[Johanna] står och [BEUNDRAR] <Phenomenon>[utsikten] <Direction>[från vårt hotellrum]
		känna_V2_Perception_active : V2 ; -- <Perceiver_agentive>[läkaren] tycker sig [KÄNNA] <Phenomenon>[en tumör]
		observera_V2_Perception_active : V2 ; -- <Perceiver_agentive>[Man] kan [OBSERVERA] <Phenomenon>[rester av den röda cement som täckte salens golv]
		åse_V2_Perception_active : V2 ; -- <Perceiver_agentive>[publiken] komma in och [ÅSE] <Phenomenon>[den inburade konstnären]

		hugga_V_Perception_body : V ; -- [HÖGG] <Body_part>[i bröstet]
		kittla_V_Perception_body : V ; -- [KITTLAR] <Body_part>[i hennes vader]
		sticka_V_Perception_body : V ; -- [STICKER] <Body_part>[i hans högra arm]
		göra_ont_V_Perception_body : V ; -- <Body_part>[Magen] [GÖR ONT]
		värka_V_Perception_body : V ; -- <Body_part>[Huvudet] [VÄRKER]

		känna_V2_Perception_experience : V2 ; -- <Perceiver_passive>[jag] också [KÄNNA] <Phenomenon>[oro]
		se_V2_Perception_experience : V2 ; -- <Perceiver_passive>[Jag] [SÅG] ingen <Phenomenon>[automat]
		skönja_V2_Perception_experience : V2 ; -- [SKÖNJA] <Phenomenon>[katastrofens verkliga och möjliga omfattning i Pakistan och Indien]
		urskönja_V2_Perception_experience : V2 ; -- <Phenomenon>[Stigande kreditspreadar] kunde <Perceiver_passive>[man] bland annat [URSKÖNJA]
		återse_V2_Perception_experience : V2 ; -- <Perceiver_passive>[Han] [ÅTERSÅG] <Phenomenon>[Bel-ka-Trazet]
		bevittna_VQ_Perception_experience : VQ ; -- <Perceiver_passive>[de själva] hunnit [BEVITTNA] <Phenomenon>[hur en epok tagit slut]
		beskåda_V2_Perception_experience : V2 ; -- <Phenomenon>[Resultatet] kan [BESKÅDAS]
		syna_V2_Perception_experience : V2 ; -- [SYNTES] <Phenomenon>[den tunna vita hårflätan]

		uppträda_ihop_V_Performers_and_roles : V ; -- <Performer1>[Madonna] [UPPTRÄDDE IHOP] <Performer2>[med en gospelkör]
		spela_V2_Performers_and_roles : V2 ; -- <Performer>[han] [SPELADE] <Role>[Romeo] <Performance>[i Shakespears klassiska drama]
		framträda_V2_Performers_and_roles : V2 ; -- [FRAMTRÄDDE] bland andra <Performer>[Madonna , Bruce Springsteen , Mary J Blige , Shakira och Sting]

		medge_V2_Permitting : V2 ; -- <Principle>[reglerna] [MEDGER] <State_of_affairs>[ränteanstånd]
		sanktionera_V2_Permitting : V2 ; -- <Principle>[Genevekonventionen] [SANKTIONERAR] inte <State_of_affairs>[mord pa civilister]
		tillåta_V2_Permitting : V2 ; -- <Principle>[principer] [TILLÅTER] <State_of_affairs>[oss dock inte att gå med på ett sådant synsätt]

		flörta_V_Personal_relationship : V ; -- <Partner_1>[Han] vill inget hellre än att bli av med oskulden och [FLÖRTAR] <Partner_2>[med Nillan]
		ha_ihop_det_V_Personal_relationship : V ; -- <Partner_1>[Hon] [HAR IHOP DET] <Partner_2>[med en av de utbildade kirurgerna på sjukhuset - Derek Shepherd ( även kallad McDreamy )]
		sammanbo_V_Personal_relationship : V ; -- <Partner_1>[hon] [SAMMANBODDE] <Partner_2>[med Alberto Moravia]
		adoptera_V2_Personal_relationship : V2 ; -- <Partner_1>[Äldre Göteborgspar] får [ADOPTERA] <Partner_2>[flicka]
		dejta_V2_Personal_relationship : V2 ; -- <Partner_1>[Carolina ( som bor och arbetar i Oslo )] [DEJTAR] <Partner_2>[en norsk halvkändis]
		kurtisera_V2_Personal_relationship : V2 ; -- <Partner_1>[Han] är känd som en stor förförare , och [KURTISERAR] <Partner_2>[alla kvinnor han ser]

		kapa_V2_Piracy : V2 ; -- <Perpetrator>[Pirater] [KAPADE] <Vehicle>[tre thailändska fiskefartyg]
		uppbringa_V2_Piracy : V2 ; -- [UPPBRINGA] <Vehicle>[fartygen]

		ge_tyngd_V_Place_weight_on : V ; -- [GE TYNGD] <Consideration>[åt vissa politiska krav]
		lägga_tyngden_V_Place_weight_on : V ; -- <Agent>[vi] försöker [LÄGGA TYNGDEN] <Consideration>[på att barnen själva skall synas i rutan]

		adressera_V2_Placing : V2 ; -- <Agent>[jag] mig vid skrivbordet och [ADRESSERADE] <Theme>[kuvertet] <Goal>[till doktor Gothard]
		burka_V2_Placing : V2 ; -- <Agent>[jag] [BURKADE] <Theme>[maten]
		dra_V2_Placing : V2 ; -- <Agent>[Man] hade [DRAGIT] <Theme>[en ledning]
		lasta_V2_Placing : V2 ; -- <Agent>[Man] [LASTADE] <Theme>[sina instrument] <Goal>[på bilar och mopeder och cyklar]
		packa_V2_Placing : V2 ; -- <Agent>[De båda konstnärerna] [PACKADE] <Theme>[sina tillhörigheter]
		packa_in_V2_Placing : V2 ; -- <Agent>[Jag] [PACKADE IN] <Theme>[S90] <Goal>[i bilen]
		packa_ner_V2_Placing : V2 ; -- <Agent>[flyttkillarna] [PACKA NER] <Theme>[allt]
		parkera_V2_Placing : V2 ; -- <Agent>[Folk] [PARKERAR] också <Theme>[sina stora båtar]
		placera_V2_Placing : V2 ; -- <Agent>[Tullkvinnan] [PLACERADE] <Theme>[väskan] <Goal>[på ett stort blankt bord]
		slå_V2_Placing : V2 ; -- <Agent>[Cathy] [SLOG] <Theme>[armarna] <Goal>[om min hals]
		stoppa_V2_Placing : V2 ; -- <Agent>[den okände] skulle [STOPPA] <Theme>[sitt mynt] <Goal>[i hennes plånbok]
		tvinga_ned_V2_Placing : V2 ; -- <Agent>[Man] skall aldrig försöka [TVINGA NED] <Theme>[något] <Goal>[i munnen på en medvetslös person]
		toppa_V2_Placing : V2 ; -- [TOPPADE] <Goal>[tårtan]
		förlägga_V2_Placing : V2 ; -- <Theme>[de] ofta [FÖRLÄGGS] <Goal>[till fina och intressanta miljöer]
		lokalisera_V2_Placing : V2 ; -- <Theme>[Myndighetens huvudkontor] [LOKALISERAS] <Goal>[till Stockholm]
		packa_om_V2_Placing : V2 ; -- <Theme>[köttfärs] hade [PACKATS OM]
		stationera_V2_Placing : V2 ; -- <Theme>[Han] [STATIONERAS] <Goal>[på finländska UD i Helsingfors]
		utlokalisera_V2_Placing : V2 ; -- <Theme>[besluten] [UTLOKALISERATS] <Goal>[till Bryssel]

		plantera_V2_Planting : V2 ; -- <Agent>[Jag] har försökt [PLANTERA] <Theme>[ett_och_annat]
		sätta_V2_Planting : V2 ; -- <Agent>[jag] [SÄTTA] <Theme>[potatis]
		så_V2_Planting : V2 ; -- <Agent>[Jussi] [SÅR] <Theme>[frön]
		återplantera_V2_Planting : V2 ; -- [ÅTERPLANTERAR] <Agent>[medlemmar] <Theme>[vattenväxter]
		odla_V2_Planting : V2 ; -- <Theme>[av utvalda frön] [ODLAS]

		framställa_sig_V2_Posing_as : V2 ; -- <Agent>[han] [FRAMSTÄLLER SIG] <Simulated_entity>[som den perfekte SS-officeren som bara lydde order]

		ha_V2_Possession : V2 ; -- <Owner>[man] [HAR] <Possession>[en bil]
		sakna_V2_Possession : V2 ; -- <Owner>[Bolaget] [SAKNAR] <Possession>[tillgångar]

		huka_sig_V_Posture : V ; -- <Agent>[De] satt tysta som kyrkråttor i sina bås och [HUKADE SIG] <Location>[i de allra innersta hörnen]
		kuta_V_Posture : V ; -- <Agent>[Hon] [KUTADE]
		ligga_V_Posture : V ; -- <Agent>[Jag] [LIGGER] <Location>[i hängmattan]
		luta_V_Posture : V ; -- <Agent>[jag] [LUTAR]
		luta_sig_V_Posture : V ; -- <Agent>[Claes Malmberg] [LUTAR SIG]
		sitta_V_Posture : V ; -- <Agent>[En stork] [SITTER] <Location>[på kyrktornet]
		sitta_ner_V_Posture : V ; -- <Agent>[du] välja att [STÅ UPP] eller [SITTA NER]
		stå_V_Posture : V ; -- <Agent>[Gustaf] [STÅ]
		stå_upp_V_Posture : V ; -- <Agent>[du] välja att [STÅ UPP] eller [SITTA NER]
		sätta_sig_V_Posture : V ; -- [SÄTTA SIG] <Location>[bakom ratten]
		sätta_sig_upp_V_Posture : V ; -- <Agent>[Jag] måste [SÄTTA MIG UPP]

		repa_V_Practice : V ; -- <Agent>[Jag] var och [REPADE]
		repa_in_V_Practice : V ; -- <Action>[över 25 melodier som] <Agent>[vi] [REPADE IN]
		repetera_V_Practice : V ; -- <Agent>[man] också nödgas [REPETERA]
		yoga_V_Practice : V ; -- <Agent>[jag] [YOGAR]
		öva_V_Practice : V ; -- <Agent>[jag] förresten [ÖVA] <Action>[på arior för mezzosopran]
		repa_in_V2_Practice : V2 ; -- <Agent>[Vi] hade [REPAT IN] <Action>[l2 låtar]
		träna_V2_Practice : V2 ; -- <Agent>[jag] istället [TRÄNA] <Action>[cirkelträning]
		träna_upp_V2_Practice : V2 ; -- <Agent>[jag] ska försöka [TRÄNA UPP] <Action>[min beslutsamhet]
		öva_in_V2_Practice : V2 ; -- <Action>[schlagersånger som] <Agent>[de] [ÖVAT IN] <Occasion>[för skolmusikfestivalen]
		öva_upp_V2_Practice : V2 ; -- <Agent>[man] [ÖVAT UPP] <Action>[en intuition för vad som är intressant]

		regna_floder_V_Precipitation : V ; -- [REGNAT FLODER]
		snöa_V_Precipitation : V ; -- [SNÖADE] <Place>[i området]

		förutspå_V2_Predicting : V2 ; -- <Speaker>[Galluparna] [FÖRUTSPÅR] <Eventuality>[valframgång för Sannfinländarna]
		prognostisera_V2_Predicting : V2 ; -- <Speaker>[Investerare] ombads att [PROGNOSTISERA] <Eventuality>[ett bolags framtida resultat]
		spå_V2_Predicting : V2 ; -- <Speaker>[de som] [SPÅTT] <Eventuality>[rörelsens död]
		förutspå_VQ_Predicting : VQ ; -- [FÖRUTSPÅ] <Eventuality>[vad sänkt hastighet skulle innebära för kollektivtrafiken]
		spå_VS_Predicting : VS ; -- <Speaker>[Han] [SPÅDDE] <Eventuality>[att avskedandena kommer att leda till ökat våld i konflikten som redan krävt två dödsoffer och 300 skadade arbetare]

		balsamera_V2_Preserving : V2 ; -- <Agent>[vi] [BALSAMERAR] <Undergoer>[kroppen]
		konservera_V2_Preserving : V2 ; -- [KONSERVERA] <Undergoer>[fisken]
		luta_V2_Preserving : V2 ; -- <Agent>[du] fick börja [LUTA] <Undergoer>[fisk]
		lägga_in_V2_Preserving : V2 ; -- <Agent>[du] [LÄGGER IN] <Undergoer>[sill] <Medium>[i klar lag]
		sylta_V2_Preserving : V2 ; -- [SYLTA] <Undergoer>[squash]
		sylta_in_V2_Preserving : V2 ; -- <Agent>[man] kan [SYLTA IN] <Undergoer>[pumpa] <Medium>[i ättikslag eller sockerlag]

		ljuga_V_Prevarication : V ; -- <Speaker>[Hon] [LJÖG] <Topic>[om sin ålder]
		tala_osanning_V_Prevarication : V ; -- <Speaker>[vittnet] [TALADE OSANNING]

		frånta_V3_Prevent_from_having : V3 ; -- <Agent>[jag] inte ville [FRÅNTA] <Protagonist>[någon]

		avvärja_V2_Preventing : V2 ; -- [AVVÄRJA] <Event>[en humanitär katastrof]
		förhindra_V2_Preventing : V2 ; -- [FÖRHINDRAR] <Agent>[man] <Event>[nyrekrytering]
		stoppa_V2_Preventing : V2 ; -- <Agent>[åtalet] ska [STOPPA] <Event>[kriget]
		undanröja_V2_Preventing : V2 ; -- [UNDANRÖJA] <Event>[hotet mot grödornas fortlevnad]

		fortgå_V_Process_continue : V ; -- <Event>[fredsprocessen] [FORTGICK]
		gå_V_Process_continue : V ; -- <Event>[Moores filmer] [GICK]
		hålla_i_sig_V_Process_continue : V ; -- <Event>[Värmen] [HÅLLER I SIG]
		hålla_på_V_Process_continue : V ; -- <Event>[Mötet] [HÖLL PÅ]
		pågå_V_Process_continue : V ; -- [PÅGICK] <Event>[flera tvister med andra britter inblandade]

		avlöpa_V_Process_end : V ; -- <Process>[Min resa] [AVLÖPTE]
		sluta_V_Process_end : V ; -- <Process>[Grillningen] [SLUTADE]
		ta_slut_V_Process_end : V ; -- <Process>[det kalla kriget] [TOG SLUT]
		upphöra_V_Process_end : V ; -- <Process>[Den svenska vapenexporten] måste [UPPHÖRA]
		utmynna_V_Process_end : V ; -- <Process>[konferensen] ska [UTMYNNA]

		återgå_V_Process_resume : V ; -- [ÅTERGICK] <Process>[livet]

		bryta_ut_V_Process_start : V ; -- <Event>[En brand] [BRYTER UT]
		börja_V_Process_start : V ; -- <Event>[Diskussionen om fördelningen av pengarna] [BÖRJADE]
		starta_V_Process_start : V ; -- <Event>[Verksamheten] [STARTADE]
		sätta_fart_V_Process_start : V ; -- <Event>[kurortsverksamheten] [SATTE FART]

		avstanna_V_Process_stop : V ; -- <Process>[byggandet] har [AVSTANNAT]
		stanna_av_V_Process_stop : V ; -- <Process>[bostadsbyggandet] [STANNAR AV]

		arbeta_V2_Processing_materials : V2 ; -- [ARBETA] <Material>[degen]
		bearbeta_V2_Processing_materials : V2 ; -- [BEARBETAR] <Agent>[Kjell Karlsson] <Material>[ett granitblock]
		blåsa_V2_Processing_materials : V2 ; -- <Agent>[Jerker] som tagit upp sin mors yrke ska fortsätta [BLÅSA] <Material>[glas]
		kallpressa_V2_Processing_materials : V2 ; -- <Material>[rapsen] [KALLPRESSAS]
		pastörisera_V2_Processing_materials : V2 ; -- <Material>[Mjölken] [PASTÖRISERAS]

		gå_V_Progress : V ; -- <Entity>[varje dag som] [GÅR]
		utveckla_sig_V_Progress : V ; -- <Entity>[Konstkupper] har [UTVECKLAT SIG]

		förbjuda_V2_Prohibiting : V2 ; -- <Principle>[lagen] [FÖRBJUDER] <State_of_affairs>[fackföreningarna att vara politiskt aktiva]

		gå_ner_V_Proliferating_in_number : V ; -- <Set>[moderaterna] [GÅR NER] <Initial_number>[från 23,8] <Final_number>[till 21,9]
		gå_upp_V_Proliferating_in_number : V ; -- <Set>[Socialdemokraterna] [GÅR UPP] <Initial_number>[från 39,9 procent] <Final_number>[till 43,1]
		krympa_V_Proliferating_in_number : V ; -- <Set>[antalet polisinrättningar] [KRYMPER] <Initial_number>[från 24] <Final_number>[till 11]
		minska_V_Proliferating_in_number : V ; -- <Set>[vänsterpartiet] [MINSKAR] <Initial_number>[från 11,4] <Final_number>[till 10,4]
		uppgå_V_Proliferating_in_number : V ; -- <Set>[Det sammanlagda antalet besök i ateljéerna] [UPPGICK] <Final_number>[till cirka 15 000]
		öka_V_Proliferating_in_number : V ; -- <Set>[antalet öar] [ÖKAR]
		fördubbla_V2_Proliferating_in_number : V2 ; -- <Set>[Antalet kvinnor med hörselskador] har [FÖRDUBBLATS]

		passa_V2_Protecting : V2 ; -- <Protection>[Mamma] ska [PASSA] <Asset>[lillan]
		skydda_V2_Protecting : V2 ; -- <Protection>[Korallreven] [SKYDDAR] <Asset>[kusterna vid stormar]
		säkerställa_V2_Protecting : V2 ; -- [SÄKERSTÄLLER] <Asset>[långvarig överlevnad]
		akta_V2_Protecting : V2 ; -- <Asset>[Nutidens stressade män] måste gunås [AKTAS] <Danger>[för stötar]
		isolera_V2_Protecting : V2 ; -- <Asset>[Stugan] ska [ISOLERAS]

		käfta_V_Quarreling : V ; -- <Arguer1>[Johannesson] brukar [KÄFTA] <Arguer2>[med Wennerholm]
		bråka_V_Quarreling : V ; -- [BRÅKADE] <Arguers>[två västsvenska klubbar] <Issue>[om en övergång]

		fråga_V2_Questioning : V2 ; -- <Speaker>[Vi] har [FRÅGAT] <Addressee>[alla andra]
		förhöra_V2_Questioning : V2 ; -- [FÖRHÖRDE] <Speaker>[polisen] <Addressee>[vittnen]
		konsultera_V2_Questioning : V2 ; -- <Speaker>[Han] förklarade att han hade kommit till London för att [KONSULTERA] <Addressee>[sin läkare]
		pumpa_V2_Questioning : V2 ; -- <Speaker>[Jag] talade en stund med pappa och gjorde ännu ett försök att [PUMPA] <Addressee>[honom] <Topic>[om Terry]
		rådfråga_V2_Questioning : V2 ; -- <Speaker>[Ni] [RÅDFRÅGAR] <Addressee>[era advokater]
		fråga_VQ_Questioning : VQ ; -- <Message>[Varför sover vi så dåligt ?] [FRÅGADE] <Speaker>[GP]
		höra_VQ_Questioning : VQ ; -- <Speaker>[jag] [HÖRA] <Message>[vad tusan jag ska göra]
		grilla_V2_Questioning : V2 ; -- <Addressee>[kändisar] låter sig [GRILLAS] <Speaker>[av komiker]

		abdikera_V_Quitting : V ; -- <Employee>[En drottning] [ABDIKERAR]
		avgå_V_Quitting : V ; -- <Employee>[Hon] [AVGÅR]
		säga_upp_sig_V_Quitting : V ; -- <Employee>[Emma] [SA UPP SIG] <Position>[från sitt jobb som florist]
		frånträda_V2_Quitting : V2 ; -- <Employee>[Samtliga] har fått [FRÅNTRÄDA] <Position>[sina befattningar]

		dra_sig_tillbaka_V_Quitting_a_place : V ; -- <Self_mover>[Gaddafistyrkorna] [DRAGIT SIG TILLBAKA] <Source>[från staden]
		dunsta_V_Quitting_a_place : V ; -- <Self_mover>[du] [DUNSTAR]
		fly_fältet_V_Quitting_a_place : V ; -- <Self_mover>[Huvudpersonen själv] har [FLYTT FÄLTET]
		utrymma_V2_Quitting_a_place : V2 ; -- [UTRYMMA] <Source>[lägenheten]

		ratificera_V2_Ratification : V2 ; -- <Ratifier>[26 EU-länder] har [RATIFICERAT] <Proposal>[Lissabonfördraget]

		förläsa_sig_V_Reading : V ; -- <Reader>[en amerikan som varit i Paris] och [FÖRLÄST SIG] <Text>[på Bourdieu]
		sträckläsa_V_Reading : V ; -- <Text>[en bok] att [STRÄCKLÄSA]
		lusläsa_V2_Reading : V2 ; -- <Reader>[De flesta] bryr sig inte om att [LUSLÄSA] <Text>[häftet med information som följer med biljetten]
		läsa_V2_Reading : V2 ; -- <Reader>[du] [LÄSA] i <Text>[Sensias rapport]
		provläsa_V2_Reading : V2 ; -- [PROVLÄSA] <Text>[texten]
		skumma_V2_Reading : V2 ; -- [SKUMMADE] bara <Text>[texten]
		skumma_igenom_V2_Reading : V2 ; -- <Reader>[åklagaren] [SKUMMADE IGENOM] <Text>[domen]
		sluka_V2_Reading : V2 ; -- <Reader>[miljoner människor] [SLUKAR] <Text>[böcker]
		ögna_igenom_V2_Reading : V2 ; -- <Reader>[jag] kunde få [ÖGNA IGENOM] <Text>[texten]

		deklamera_V2_Reading_aloud : V2 ; -- <Speaker>[Han] [DEKLAMERADE] <Text>[Dalquists dikt En hjälte]
		diktera_V2_Reading_aloud : V2 ; -- <Speaker>[Pippi] [DIKTERAR] <Text>[ett brev]
		förestava_V2_Reading_aloud : V2 ; -- <Speaker>[Ordföranden i Högsta Domstolen , William Rhenquist] , [FÖRESTAVADE] <Text>[presidenteden]
		läsa_V2_Reading_aloud : V2 ; -- [LÄSTE] <Text>[evangeliet]
		läsa_upp_V2_Reading_aloud : V2 ; -- <Speaker>[Wilkens] att inte [LÄSA UPP] just <Text>[den domen]

		argumentera_V_Reasoning : V ; -- <Arguer>[han] även [ARGUMENTERADE] <Content>[för ett starkt EU]
		demonstrera_V_Reasoning : V ; -- <Arguer>[en enda katolsk präst i Sverige som] vill [DEMONSTRERA] <Content>[mot celibatet]
		resonera_V_Reasoning : V ; -- <Arguer>[de fyra heltidspolitikerna i presidiet] [RESONERAR] <Content>[om sina roller]
		bevisa_VS_Reasoning : VS ; -- <Arguer>[Mathias] [BEVISADE] <Content>[att segern i Irland , Smurfit European Open , i slutet av augusti inte var en tillfällighet]

		acceptera_V2_Receiving : V2 ; -- <Recipient>[Kommunen] kan inte [ACCEPTERA] <Theme>[gåvan]
		få_V2_Receiving : V2 ; -- <Recipient>[Jag] [FICK] <Theme>[min väska]
		ta_emot_V2_Receiving : V2 ; -- <Recipient>[Nobelpristagarna] kommer till för att [TA EMOT] <Theme>[sina medaljer]

		anteckna_V2_Recording : V2 ; -- <Agent>[Maja Lundgren] vet mer och [ANTECKNAR] <Phenomenon>[allt hon ser och hör]
		dokumentera_V2_Recording : V2 ; -- <Agent>[Jag] [DOKUMENTERAR] <Phenomenon>[bygget]
		skildra_V2_Recording : V2 ; -- <Agent>[Jag] befann mig med fotograf för att [SKILDRA] <Phenomenon>[valstriden]

		komma_sig_V_Recovery : V ; -- <Patient>[Han] [KOM SIG]
		läka_V_Recovery : V ; -- <Patient>[vissa patienter] <Affliction>[med ryggont] [LÄKER]
		återhämta_sig_V_Recovery : V ; -- <Patient>[Räven] har [ÅTERHÄMTAT SIG] <Affliction>[efter skabben]
		läka_V2_Recovery : V2 ; -- <Body_part>[Mungiporna] höll på att [LÄKAS]

		avleda_V2_Redirecting : V2 ; -- <Agent>[Jag] försöker [AVLEDA] <Theme>[Lokes uppmärksamhet]
		avvända_V2_Redirecting : V2 ; -- [AVVÄNDA] <Theme>[det onda ögat]
		dirigera_om_V2_Redirecting : V2 ; -- <Theme>[några mångmiljonbelopp] kan [DIRIGERAS OM] <Goal>[till just Stockholm]
		styra_om_V2_Redirecting : V2 ; -- <Theme>[Huvuduppdraget] [STYRDES OM] <Goal>[till ett konkret mål : att förmedla jobb]

		se_V2_Reference_text : V2 ; -- [SE] <Source_of_information>[sidan 13]
		se_även_V2_Reference_text : V2 ; -- [SE ÄVEN] <Source_of_information>[hans Djävulssonaten]

		omstrukturera_V2_Reforming_a_system : V2 ; -- <Agent>[Catena] att [OMSTRUKTURERA] <Entity>[bilrörelsen i Europa]
		reformera_V2_Reforming_a_system : V2 ; -- <Agent>[EU] [REFORMERA] <Entity>[sin jordbrukspolitik]

		föryngra_V2_Rejuvenation : V2 ; -- <Agent>[De] vill modernisera och [FÖRYNGRA] <Entity>[kyrkan]
		återställa_V2_Rejuvenation : V2 ; -- <Agent>[han] för att [ÅTERSTÄLLA] <Entity>[den gamla ordningen]
		återuppliva_V2_Rejuvenation : V2 ; -- <Agent>[Irländarna] till exempel försöker [ÅTERUPPLIVA] <Entity>[gaeliskan]
		pånyttföda_V2_Rejuvenation : V2 ; -- <Cause>[den] [PÅNYTTFÖDER] <Entity>[oss]
		vitalisera_V2_Rejuvenation : V2 ; -- <Entity>[Demokratin i kommunerna] behöver [VITALISERAS]

		binda_V2_Relating_concepts : V2 ; -- <Evidence>[inget enskilt bevis] [BINDER] <Concept_1>[45-åringen] <Concept_2>[till dådet]
		förbinda_V2_Relating_concepts : V2 ; -- <Evidence>[beviset , som] [FÖRBAND] <Concept_1>[vasen] <Concept_2>[med Helena Westermarcks hem]
		förena_V2_Relating_concepts : V2 ; -- <Evidence>[26-4 i målskillnad på de åtta kvalmatcherna visar att man lyckats] [FÖRENA] <Concept_1>[anfall] <Concept_2>[med ett väl fungernade försvar]
		relatera_V2_Relating_concepts : V2 ; -- [RELATERA] <Concept_1>[resultatet] <Concept_2>[med analytikers förväntningar]
		sätta_i_relation_V2_Relating_concepts : V2 ; -- <Concept_1>[alla brott] måste också [SÄTTAS I RELATION] <Concept_2>[till det uppdrag man har]

		dra_ut_på_tiden_V_Relative_time : V ; -- <Focal_occasion>[Lektionen] [DRAR UT PÅ TIDEN]
		följa_V_Relative_time : V ; -- [FÖLJDE] <Focal_occasion>[handling]

		frige_V2_Releasing : V2 ; -- [FRIGE] <Theme>[palestinier som har dödat Israeler]
		släppa_loss_V2_Releasing : V2 ; -- [SLÄPP LOSS] <Theme>[mig]

		förlita_sig_V_Reliance : V ; -- <Protagonist>[Politiker och tjänstemän] har nog [FÖRLITAT SIG] <Means>[på att tekniken skulle lösa problemen]

		tro_V_Religious_belief : V ; -- [TROR] <Element>[på Bibeln såsom den är tolkad av Swedenborgs andliga läror]
		tro_VS_Religious_belief : VS ; -- <Believer>[jag] [TRO] <Content>[att Jesus verkligen dött för mej]

		bli_över_V_Remainder : V ; -- <Remainder>[Alla pengar som] [BLIR ÖVER]
		kvarstå_V_Remainder : V ; -- <Remainder>[Oklarheterna kring den känsliga frågan] [KVARSTOD]
		lämna_V2_Remainder : V2 ; -- [LÄMNAT] <Remainder>[skräp]

		erinra_sig_VQ_Remembering_experience : VQ ; -- <Cognizer>[han] och [ERINRAR SIG] <Experience>[hur han blev utbuad av parlamentet för några år sedan]

		dra_sig_till_minnes_VS_Remembering_information : VS ; -- <Cognizer>[Han] [DRAR SIG TILL MINNES] <Mental_content>[att Marks kommun hjälpt honom att arbeta brottsförebyggande]
		påminna_sig_VS_Remembering_information : VS ; -- <Cognizer>[han] kan inte [PÅMINNA SIG] <Mental_content>[att de talade om lerhyddor]

		glömma_VV_Remembering_to_do : VV ; -- <Cognizer>[Man] har [GLÖMT] <Action>[att titta på arbetsorganisationen]
		komma_ihåg_VV_Remembering_to_do : VV ; -- [KOM IHÅG] <Action>[att inte fastna i detaljer]

		göra_sig_av_V_Removing : V ; -- <Agent>[Besökarna] kunde inte [GÖRA SIG AV] <Theme>[med avfallet]
		avtvå_V2_Removing : V2 ; -- [AVTVÅ] <Theme>[dagens damm]
		evakuera_V2_Removing : V2 ; -- <Agent>[Olov Lindgren] hade redan [EVAKUERAT] <Theme>[många hyresgäster]
		hälla_av_V2_Removing : V2 ; -- [HÄLL AV] <Theme>[buljongen]
		kratsa_ut_V2_Removing : V2 ; -- <Agent>[vi] [KRATSADE UT] <Theme>[askan] <Source>[ur pannan]
		kvista_av_V2_Removing : V2 ; -- <Agent>[du] råkat [KVISTA AV] <Theme>[några grenar] <Source>[från en ek]
		lasta_ur_V2_Removing : V2 ; -- <Agent>[Paula Berndtsson] hjälper Björn Bergdahl att [LASTA UR] <Theme>[cyklar] <Source>[från hans bil]
		mocka_V2_Removing : V2 ; -- <Agent>[Vi] [MOCKADE] <Theme>[skit]
		packa_upp_V2_Removing : V2 ; -- <Agent>[Vi] [PACKAR UPP] <Theme>[köksutrustningen och sovsäckarna]
		plocka_ur_V2_Removing : V2 ; -- [PLOCKA UR] <Theme>[dem] <Source>[ur skalet]
		plocka_ut_V2_Removing : V2 ; -- [PLOCKA UT] <Theme>[saker] <Source>[ur bakluckan]
		skrapa_av_V2_Removing : V2 ; -- [SKRAPA AV] <Theme>[resterna]
		skrapa_ut_V2_Removing : V2 ; -- [SKRAPA UT] <Theme>[det mesta av innehållet]
		skrubba_av_V2_Removing : V2 ; -- <Agent>[hon] [SKRUBBA AV] <Theme>[smutsen] <Source>[på tvättbrädan]
		slå_bort_V2_Removing : V2 ; -- [SLÅ BORT] <Theme>[vattnet]
		tvätta_V2_Removing : V2 ; -- <Agent>[jag] [TVÄTTA] <Source>[av mig] <Theme>[sminket]
		tvätta_bort_V2_Removing : V2 ; -- [TVÄTTA BORT] <Theme>[fläcken]
		tömma_V2_Removing : V2 ; -- [TÖMMA] <Theme>[spillvattnet] ( <Source>[från diskhon / handfatet / duschen]
		tömma_ur_V2_Removing : V2 ; -- [TÖMMA UR] <Theme>[vattnet]
		tömma_ut_V2_Removing : V2 ; -- [TÖMMA UT] <Theme>[förbrukad olja]
		vräka_V2_Removing : V2 ; -- <Agent>[Hyresvärden] vill [VRÄKA] <Theme>[nazisterna]
		abortera_V2_Removing : V2 ; -- [ABORTERAS] <Theme>[fostret]
		lossa_V2_Removing : V2 ; -- [LOSSAS] <Theme>[varorna]
		plocka_bort_V2_Removing : V2 ; -- <Theme>[Ordet ' resväska '] [PLOCKADES BORT] <Source>[ur debutboken]
		tvätta_av_V2_Removing : V2 ; -- <Theme>[märkena] inte längre kan [TVÄTTAS AV]
		utvisa_V2_Removing : V2 ; -- <Theme>[En utländsk medborgare] eller <Theme>[en statslös person] [UTVISAS] <Source>[ur Sverige]

		kvadda_V2_Render_nonfunctional : V2 ; -- [KVADDADE] <Agent>[vi] <Artifact>[bilen]
		paja_V2_Render_nonfunctional : V2 ; -- <Agent>[en tredjedel av åkarna som] [PAJAT] <Artifact>[korsbandet]
		ta_sönder_V2_Render_nonfunctional : V2 ; -- <Agent>[man] [TAR SÖNDER] <Artifact>[alla klockor]

		arrendera_V2_Renting : V2 ; -- <Lessee>[26 olika firmor och företag som] [ARRENDERADE] <Goods>[mark i området]
		hyra_V2_Renting : V2 ; -- <Lessee>[31 firmor] [HYR] <Goods>[rum]
		hyra_in_V2_Renting : V2 ; -- <Lessee>[Vi] [HYR IN] <Goods>[bussar]

		arrendera_ut_V2_Renting_out : V2 ; -- <Lessor>[Kommunen] [ARRENDERAR UT] <Goods>[ett stort antal gårdar] <Lessee>[till djurägare]
		hyra_ut_V2_Renting_out : V2 ; -- <Lessor>[Garantiföreningen] [HYR UT] <Goods>[husen] <Lessee>[till sju olika aktörer]

		avsäga_sig_V2_Renunciation : V2 ; -- <Speaker>[en av de som] [AVSADE SIG] <Content>[sin kandidatur]
		frånsäga_sig_V2_Renunciation : V2 ; -- <Speaker>[Föräldrargruppen] [FRÅNSÄGER SIG] <Content>[allt politiskt ansvar]
		ge_upp_V2_Renunciation : V2 ; -- <Speaker>[vi] ska [GE UPP] <Content>[vår egenart]

		stå_emot_V2_Repel : V2 ; -- <Defender>[stenhusen] [STOD EMOT] <Enemy>[projektilerna]

		byta_ut_V2_Replacing : V2 ; -- <Agent>[Jag] beslöt [BYTA UT] <Old>[kameran] <New>[mot penseln] och <Old>[filmen] <New>[mot papper]
		ersätta_V2_Replacing : V2 ; -- <Agent>[Han] har [ERSATT] <Old>[en del reguljära trupper i Irak] <New>[med privatarméer , legosoldater]
		substituera_V2_Replacing : V2 ; -- <Agent>[man] har börjat [SUBSTITUERA] <New>[vete] <Old>[istället för majs som foder]

		gola_V_Reporting : V ; -- <Informer>[Hon] [GOLAR] även <Wrongdoer>[på Lisbet]
		tjalla_V_Reporting : V ; -- <Informer>[Tungt kriminella] [TJALLAR]

		stå_V_Representing : V ; -- <Entity>[1997] [STÅR] <Phenomenon>[för året då Günter och Christina flyttade till gården]

		anropa_V2_Request : V2 ; -- <Speaker>[Fhada] [ANROPAR] <Addressee>[Necker]
		avkräva_V2_Request : V2 ; -- <Speaker>[man] ska [AVKRÄVA] <Addressee>[sin partner] <Message>[totalt avståndstagande från sexuella intryck]
		instämma_V2_Request : V2 ; -- <Speaker>[Pauls och Jamies terapeut] [INSTÄMMER] <Addressee>[dem]
		kommendera_V2_Request : V2 ; -- <Speaker>[Poliskommissarien] [KOMMENDERADE] <Addressee>[en man] <Message>[till Ghandi-salen]
		begära_V2_Request : V2 ; -- [BEGÄRDE] <Speaker>[hon] <Message>[hyran tillbaka plus 1 500 kronor för ' sveda och värk ']
		äska_V2_Request : V2 ; -- <Speaker>[En rödhårig kortväxt bokhållare] [ÄSKADE] <Message>[tystnad]
		befalla_V2V_Request : V2V ; -- <Speaker>[Hon] [BEFALLDE] <Addressee>[flickan] <Message>[att tvätta av sina händer] , <Message>[ta på sig kappan] och <Message>[komma med]
		hemställa_VS_Request : VS ; -- <Speaker>[Jag] [HEMSTÄLLER] därför <Message>[att jag avregistreras som fastighetsmäklare]
		blixtinkalla_V2_Request : V2 ; -- <Addressee>[Myhre] [BLIXTINKALLADES]
		hemkalla_V2_Request : V2 ; -- <Addressee>[Löwenhielm] [HEMKALLADES] <Message>[för att ta befälet över en husarskvadron]
		kalla_ut_V2_Request : V2 ; -- <Addressee>[Stornaways båt] [KALLADES UT] <Message>[för att hjälpa en tankbåt som hade problem utanför Cape Wrath]

		forska_V_Research : V ; -- [FORSKAR] <Researcher>[jag] <Field>[i analytisk ontologi]
		vetenskapa_V_Research : V ; -- <Researcher>[män och idel män som] [VETENSKAPAR]

		hopvika_V_Reshaping : V ; -- <Undergoer>[Manteln] låg [HOPVIKT]
		forma_V2_Reshaping : V2 ; -- <Deformer>[Caroline] och [FORMAR] <Undergoer>[händerna]
		kavla_V2_Reshaping : V2 ; -- <Deformer>[en apparat som] [KAVLAR] och skär <Undergoer>[pasta]
		kavla_ut_V2_Reshaping : V2 ; -- [KAVLA UT] <Undergoer>[degen]
		krossa_V2_Reshaping : V2 ; -- [KROSSAT] <Undergoer>[sin bil]
		platta_till_V2_Reshaping : V2 ; -- <Deformer>[hon] och [PLATTAR TILL] <Undergoer>[mössan]
		rynka_ihop_V2_Reshaping : V2 ; -- <Deformer>[han] [RYNKADE IHOP] <Undergoer>[pannan]
		valsa_V2_Reshaping : V2 ; -- [VALSAR] <Deformer>[du] <Undergoer>[skivor av deg]
		vika_ihop_V2_Reshaping : V2 ; -- <Deformer>[Mannen på bänken] [VIKER IHOP] <Undergoer>[tidningen]

		bo_V_Residence : V ; -- <Resident>[Elisabeth Krantz] [BOR] <Location>[i Kungsbacka]

		komma_till_rätta_V_Resolve_problem : V ; -- <Agent>[vi] [KOMMA TILL RÄTTA] <Problem>[med arbetslösheten]
		fixa_V_Resolve_problem : V ; -- <Problem>[det] går att [FIXA]
		behandla_V2_Resolve_problem : V2 ; -- <Agent>[Högsta domstolen] börjar [BEHANDLA] <Problem>[anklagelserna om valfusk]
		klara_upp_V2_Resolve_problem : V2 ; -- <Agent>[poliserna] på att [KLARA UPP] <Problem>[inbrott och stölder]
		tillrättalägga_V2_Resolve_problem : V2 ; -- <Agent>[vi] [TILLRÄTTALÄGGA] <Problem>[det som gått snett]
		avhjälpa_V2_Resolve_problem : V2 ; -- <Problem>[Det problemet] [AVHJÄLPTES]

		avböja_V2_Respond_to_proposal : V2 ; -- <Speaker>[Algeriet] har [AVBÖJT] <Proposal>[hjälp]
		avslå_V2_Respond_to_proposal : V2 ; -- <Speaker>[man] [AVSLÅR] <Proposal>[verkets krav]
		slå_bort_V2_Respond_to_proposal : V2 ; -- <Proposal>[den tanken] måste <Speaker>[man] [SLÅ BORT]

		reagera_V_Response : V ; -- <Agent>[Jag] har alltid [REAGERAT] <Trigger>[mot chefer som tyckt sig veta bäst]

		anförtro_V_Reveal_secret : V ; -- <Speaker>[grevinnan] hade [ANFÖRTROTT] <Information>[om sina älskogslekar med kavaljerer som gästade slottet]
		anförtro_sig_V_Reveal_secret : V ; -- <Speaker>[du] [ANFÖRTRODDE DIG]
		yppa_V_Reveal_secret : V ; -- <Speaker>[Vuoria] ville inte [YPPA] <Information>[om uppsägningen har något att göra med Fortums framtidsplaner]
		öppna_sig_V_Reveal_secret : V ; -- <Speaker>[folk] att [ÖPPNA SIG] <Topic>[om svåra saker]
		avslöja_V2_Reveal_secret : V2 ; -- [AVSLÖJA] <Information>[hallens nästa namn]
		yppa_V2_Reveal_secret : V2 ; -- <Medium>[Dagboken] [YPPAR] <Information>[hemligheter som får överraskande följder]
		avslöja_VQ_Reveal_secret : VQ ; -- [AVSLÖJADE] <Speaker>[STV] <Information>[hur den privatiserade arbetsförmedlingen i det borgerliga Sverige har resulterat i kurser i virkning och fejkade mentorskap där de arbetslösa har lämnats vind för våg]
		yppa_VQ_Reveal_secret : VQ ; -- <Speaker>[Ministern] vill inte [YPPA] <Information>[vilket parti som bett om dispens]
		avslöja_VS_Reveal_secret : VS ; -- <Medium>[ett samtal till kostplanerare Maarit Ketola] [AVSLÖJAR] <Information>[att den här veckans meny inte bjuder på några konstigheter eller exotiska inslag]
		anförtro_VS_Reveal_secret : VS ; -- <Speaker>[jag] hade [ANFÖRTROTT] <Information>[att jag verkligen inte ville ha fler barn]

		vedergälla_V_Revenge : V ; -- <Avenger>[Jag] vill [VEDERGÄLLA] <Injury>[ont]
		hämna_V2_Revenge : V2 ; -- <Avenger>[Denne] kunde [HÄMNAS] <Punishment>[genom att skvallra på dem]

		straffa_V2_Rewards_and_punishments : V2 ; -- <Agent>[Spararna] kan inte [STRAFFA] <Evaluee>[ett livbolag man är missnöjd med]

		lifta_V_Ride_vehicle : V ; -- <Theme>[jag och min blivande man] [LIFTADE] <Area>[i Australien]
		damma_V_Ride_vehicle : V ; -- [DAMMA] <Path>[genom Stockholm]
		ta_V2_Ride_vehicle : V2 ; -- <Theme>[jag] [TAR] <Vehicle>[bussen] <Goal>[hem]
		åka_V2_Ride_vehicle : V2 ; -- <Source>[Från Cityterminalen] kan <Theme>[du] [ÅKA] <Vehicle>[buss] <Goal>[till hela Sverige]

		komma_i_kapp_V_Rising_to_a_challenge : V ; -- <Protagonist>[jag] gärna [KOMMA I KAPP] <Activity>[med lektionerna]
		svara_V_Rising_to_a_challenge : V ; -- <Protagonist>[jag] att [SVARA] <Activity>[på en utmaning jag fått från Annicas blogg Galen i inredning]
		växa_V_Rising_to_a_challenge : V ; -- <Protagonist>[Hamas] kommer att [VÄXA] <Activity>[med uppgiften]

		be_en_bön_V_Rite : V ; -- <Member>[jag] [BE EN BÖN]
		smörja_V2_Rite : V2 ; -- [SMÖRJA] <Object>[den döda kroppen]
		döpa_V2_Rite : V2 ; -- <Member>[Elisabet] [DÖPTES]

		råna_V2_Robbery : V2 ; -- <Perpetrator>[Två yngre killar] [RÅNAR] <Victim>[två tjejer]

		vara_sig_V_Rotting : V ; -- <Undergoer>[såren] [VARAR SIG]
		vittra_V_Rotting : V ; -- <Undergoer>[Virket] murknar och ruttnar och [VITTRAR]

		riskera_V2_Run_risk : V2 ; -- <Protagonist>[Våghalsiga fallskärmshoppare] har hittat att [RISKERA] <Asset>[livet]
		riskera_VV_Run_risk : VV ; -- <Protagonist>[Han] [RISKERAR] <Bad_outcome>[att dömas till många års fängelse]

		infria_V2_Satisfying : V2 ; -- <Agent>[Sverige] har inte lyckats [INFRIA] <Standard>[förväntningarna]
		komma_på_skam_V2_Satisfying : V2 ; -- <Standard>[legitima förväntningar från kandidatländernas medborgare] [KOMMA PÅ SKAM]
		satisfiera_V2_Satisfying : V2 ; -- <Entity>[en sådan mångfald av olika konfigurationer som] kan [SATISFIERA] <Standard>[samma lagenliga begränsningar]
		tillfredsställa_V2_Satisfying : V2 ; -- <Entity>[Musik som] [TILLFREDSSTÄLLER] <Standard>[många smakriktningar]
		tillgodose_V2_Satisfying : V2 ; -- <Entity>[Kol] [TILLGODOSER] <Standard>[35 procent av vårt energibehov]
		uppfylla_V2_Satisfying : V2 ; -- <Entity>[hästen] [UPPFYLLER] <Standard>[standarden]

		finkamma_V2_Scouring : V2 ; -- <Searcher>[Polisen] har [FINKAMMAT] <Ground>[området kring Edsviken där han bor]
		leta_igenom_V2_Scouring : V2 ; -- <Searcher>[poliserna] [LETADE IGENOM] <Ground>[hans bostad]
		snoka_igenom_V2_Scouring : V2 ; -- <Searcher>[polisen] får [SNOKA IGENOM] <Ground>[Svenssons bokhyllor]

		gå_till_botten_V_Scrutiny : V ; -- <Cognizer>[hon] [GÅ TILL BOTTEN] <Ground>[med oklarheterna]
		skanna_V_Scrutiny : V ; -- <Cognizer>[Kungens och drottningens livvakter] följde dem tätt , tätt och [SKANNADE] <Ground>[över folkmassorna]
		dra_V2_Scrutiny : V2 ; -- <Cognizer>[Fler än 200 svenska skolor] [DROG] <Ground>[sina elever]
		gå_igenom_V2_Scrutiny : V2 ; -- <Cognizer>[Studenterna] [GÅR IGENOM] <Ground>[varandras arbeten]
		hårdgranska_V2_Scrutiny : V2 ; -- <Cognizer>[Många företag] har [HÅRDGRANSKAT] <Ground>[trafiken]
		kartlägga_V2_Scrutiny : V2 ; -- <Cognizer>[danske geologen Lauge Koch] [KARTLÄGGA] <Ground>[området]
		korrekturläsa_V2_Scrutiny : V2 ; -- <Cognizer>[Tormod] sitter och [KORREKTURLÄSER] <Ground>[en av Alexandras texter]
		nagelfara_V2_Scrutiny : V2 ; -- <Cognizer>[Jag] ska dock [NAGELFARA] <Ground>[hela kostnadskedjan]
		sätta_under_lupp_V2_Scrutiny : V2 ; -- <Ground>[Det politiska samtalet] ska [SÄTTAS UNDER LUPP]
		undersöka_V2_Scrutiny : V2 ; -- <Ground>[Läkemedelsrester i slam] [UNDERSÖKS]

		leta_V_Seeking : V ; -- <Cognizer_agent>[vi] [LETADE] <Sought_entity>[efter en öppning]

		eftersträva_V2_Seeking_to_achieve : V2 ; -- <Agent>[Man] [EFTERSTRÄVAR] <Sought_entity>[ett rättvisare samhälle]

		ambulera_V_Self_motion : V ; -- <Self_mover>[Denna norrman] [AMBULERAR] <Area>[runt]
		flänga_V_Self_motion : V ; -- <Self_mover>[Han] [FLÄNGDE] <Area>[runt]
		gnussa_V_Self_motion : V ; -- <Self_mover>[Andra par] " [GNUSSAR]
		gumpa_V_Self_motion : V ; -- <Self_mover>[alla som] trängdes och [GUMPADE]
		hjula_V_Self_motion : V ; -- <Self_mover>[Hon] [HJULAR]
		hoppa_bock_V_Self_motion : V ; -- <Self_mover>[Barn] hade dragkamper och [HOPPADE BOCK]
		pulsa_V_Self_motion : V ; -- <Self_mover>[Vi] [PULSAR] <Area>[i snön]
		röra_sig_V_Self_motion : V ; -- <Self_mover>[Han] får dock [RÖRA SIG]
		skumpa_V_Self_motion : V ; -- <Self_mover>[det] sladdar och [SKUMPAR]
		springa_V_Self_motion : V ; -- <Self_mover>[Två hästar] på rymmen [SPRANG] <Area>[ute på vägbanan i södra Södertälje]
		strosa_V_Self_motion : V ; -- <Self_mover>[Hemingway] [STROSADE] mycket <Area>[runt]
		stryka_V_Self_motion : V ; -- <Self_mover>[Vi] [STRYKER] <Area>[omkring]
		åka_skridskor_V_Self_motion : V ; -- <Self_mover>[Ni] måste verkligen [ÅKA SKRIDSKOR]
		ånga_fram_V_Self_motion : V ; -- <Self_mover>[Hon] sitter inte många stunder utan [ÅNGAR FRAM] <Area>[i det stora kontorslandskapet]
		örla_V_Self_motion : V ; -- <Self_mover>[Servitörerna] [ÖRLAR] <Area>[omkring]
		dyka_V_Self_motion : V ; -- [DÖK] <Self_mover>[han] <Direction>[ned]
		orma_V_Self_motion : V ; -- <Self_mover>[Han] började [ORMA] <Direction>[fram]
		orma_sig_V_Self_motion : V ; -- <Self_mover>[hon] sig och [ORMADE SIG] <Direction>[ner]
		promenera_V_Self_motion : V ; -- <Self_mover>[Vi] [PROMENERAR] <Direction>[söderut]
		styra_kosan_V_Self_motion : V ; -- <Self_mover>[vi] att [STYRA KOSAN] <Direction>[mot Kallax och Luleå]
		stiga_fram_V_Self_motion : V ; -- <Self_mover>[Värden] [STIGER FRAM] <Goal>[till hans bord]
		stäva_V_Self_motion : V ; -- [STÄVADE] <Self_mover>[Nordic] <Goal>[mot Newcastle som var det första delmålet]
		störta_V_Self_motion : V ; -- [STÖRTADE] <Self_mover>[han] <Goal>[ut på gatan]
		hoppa_fallskärm_V_Self_motion : V ; -- <Self_mover>[Jag] har [HOPPAT FALLSKÄRM] <Source>[från ett flygplan]
		jaga_V_Self_motion : V ; -- <Self_mover>[Han] [JAGAR] <Path>[genom vindlande korridorer]

		eftersända_V2_Sending : V2 ; -- [EFTERSÄNT] <Theme>[sin post]
		skeppa_V2_Sending : V2 ; -- <Sender>[Garcia] [SKEPPADE] <Theme>[statyerna] och <Recipient>[till USA]
		skicka_bort_V2_Sending : V2 ; -- <Sender>[Modern] ska [SKICKA BORT] <Theme>[henne]
		skicka_in_V2_Sending : V2 ; -- <Sender>[Många människor] [SKICKAR IN] <Theme>[klagomål om äldrevården]
		skicka_ner_V2_Sending : V2 ; -- <Sender>[man] borde ha [SKICKAT NER] <Theme>[mer folk från Stockholm]
		skicka_ut_V2_Sending : V2 ; -- <Sender>[De] [SKICKAR UT] <Theme>[mail]
		översända_V2_Sending : V2 ; -- <Sender>[Gymnasienämnden i Mölndal] tillstyrker avtalet och har [ÖVERSÄNT] <Theme>[beslutet] <Recipient>[till kommunstyrelsen]
		skicka_med_V2_Sending : V2 ; -- <Theme>[Den kalla såsen] [SKICKAS MED]
		skicka_över_V2_Sending : V2 ; -- <Theme>[Fotografier som visar de aktuella lagbrotten] har nu [SKICKATS ÖVER] <Recipient>[till Lerumspolisen]

		döma_V2_Sentencing : V2 ; -- [DÖMDES] <Convict>[familjens 18-årige son] <Sentence>[till ett och ett halvt års fängelse] <Offense>[för att han rånat ett äldre par]

		avstycka_V2_Separating : V2 ; -- <Agent>[Kommuner] bör [AVSTYCKA] <Part_1>[mark]
		separera_V2_Separating : V2 ; -- <Agent>[En ny påfart] ska kunna [SEPARERA] <Part_1>[trafiken till Köpstaden] <Part_2>[från bostadstrafiken]
		avstava_V2_Separating : V2 ; -- [AVSTAVAS] <Parts>[mellan ” s ” och ” k ”]
		spalta_upp_V2_Separating : V2 ; -- <Whole>[Riskfaktorn] kan i sin tur , menar Justin Jenk , [SPALTAS UPP] <Parts>[i två dimensioner]

		blossa_upp_V_Setting_fire : V ; -- <Flammables>[Restaurangen] [BLOSSAT UPP]
		anlägga_V2_Setting_fire : V2 ; -- <Kindler>[man] till och med [ANLAGT] <Flame>[eld]
		lunta_V2_Setting_fire : V2 ; -- <Kindler>[Mannen] [LUNTADE] <Flammables>[gräs]

		bege_sig_V_Setting_out : V ; -- <Self_mover>[jag] [BEGE MIG]
		bryta_upp_V_Setting_out : V ; -- <Self_mover>[jag] [BRÖT UPP]
		sätta_av_V_Setting_out : V ; -- <Self_mover>[Jag] [SÄTTER AV]

		avfyra_V2_Shoot_projectiles : V2 ; -- <Agent>[Polisen] svarade med att [AVFYRA] <Projectile>[tårgas] och <Projectile>[gummikulor]
		avlossa_V2_Shoot_projectiles : V2 ; -- <Agent>[den som] [AVLOSSADE] <Projectile>[skotten]
		bränna_av_V2_Shoot_projectiles : V2 ; -- <Agent>[man] [BRÄNNER AV] <Projectile>[nödraketer]
		skjuta_V2_Shoot_projectiles : V2 ; -- [SKJUTA] <Projectile>[raketer]
		skjuta_iväg_V2_Shoot_projectiles : V2 ; -- <Agent>[Du] [SKJUTER IVÄG] <Projectile>[fyrverkerier]

		gå_ned_V_Sidereal_appearance : V ; -- <Astronomical_entity>[solen] [GÅR NED]
		gå_upp_V_Sidereal_appearance : V ; -- <Astronomical_entity>[solen] [GÅTT UPP]
		stiga_V_Sidereal_appearance : V ; -- <Astronomical_entity>[Månen] [STIGER]
		stiga_upp_V_Sidereal_appearance : V ; -- <Astronomical_entity>[solen] [STEG UPP]

		skriva_under_V2_Sign_agreement : V2 ; -- <Signatory>[De 19 passagerarna och besättningen] [SKRIVER UNDER] <Agreement>[deportationshandlingar]

		hyssja_ner_V2_Silencing : V2 ; -- <Agent>[En annan] [HYSSJAR NER] <Speaker>[sin baby som har börjat tröttna]
		tysta_V2_Silencing : V2 ; -- <Agent>[någon] [TYSTAR] <Speaker>[henne]

		skilja_sig_V_Similarity : V ; -- <Entity_1>[De angivna priserna] kan därför [SKILJA SIG] <Entity_2>[från priserna i andra butiker]
		stå_V_Similarity : V ; -- <Entity_1>[Den] [STÅR] <Entity_2>[mot det gamla skåpet i grönt med röd utsmyckning]

		infalla_samtidigt_V_Simultaneity : V ; -- <Events>[alla fester] [INFÖLL SAMTIDIGT]
		inträffa_samtidigt_V_Simultaneity : V ; -- <Events>[kriserna] har [INTRÄFFAT SAMTIDIGT]

		slagga_V_Sleep : V ; -- <Sleeper>[Han] låg och [SLAGGADE]
		slumra_V_Sleep : V ; -- <Sleeper>[Lillebror Linus] [SLUMRAR]
		sova_V_Sleep : V ; -- <Sleeper>[Jag] [SOV]

		smuggla_V2_Smuggling : V2 ; -- <Perpetrator>[Hon] [SMUGGLADE] <Goods>[skottet]
		smuggla_in_V2_Smuggling : V2 ; -- <Perpetrator>[hon] [SMUGGLAT IN] <Goods>[en mobiltelefon som en av fångarna skulle använda]

		blötlägga_V2_Soaking : V2 ; -- [BLÖTLÄGG] <Theme>[grillspetten]
		marinera_V2_Soaking : V2 ; -- <Agent>[man] ofta [MARINERAR] <Theme>[tunna köttskivor] <Medium>[i en söt vitlöksstark sojasås]

		absorbera_V2_Soaking_up : V2 ; -- <Item>[Taket] [ABSORBERAR] <Substance>[ljudet]
		adsorbera_V2_Soaking_up : V2 ; -- <Item>[Metallkatalysatorn] [ADSORBERAR] <Substance>[väte]
		suga_upp_V2_Soaking_up : V2 ; -- <Item>[en god pastasort som] [SUGER UPP] <Substance>[såsen]
		uppta_V2_Soaking_up : V2 ; -- <Substance>[Smöret] [UPPTAS] <Item>[av huden]

		eka_V_Sound_movement : V ; -- <Sound>[Hymnen] [EKADE]

		föreläsa_V_Speak_on_topic : V ; -- <Speaker>[Du] [FÖRELÄSER] även <Topic>[om utbrändhet]

		artikulera_V2_Spelling_and_pronouncing : V2 ; -- <Speaker>[barn med Downs syndrom] har svårare att lära sig [ARTIKULERA] <Sign>[ord]
		bokstavera_V2_Spelling_and_pronouncing : V2 ; -- <Speaker>[Tensie] får [BOKSTAVERA] <Sign>[sitt förnamn]
		säga_V2_Spelling_and_pronouncing : V2 ; -- <Speaker>[Invånarna] är oerhört snåla och kan inte [SÄGA] <Sign>[R]

		bli_V_State_continue : V ; -- <Entity>[Han] [BLEV]
		förbli_V_State_continue : V ; -- <Entity>[Funktionen hos sådana kraftiga armar med raka klor] [FÖRBLIR]
		gå_V_State_continue : V ; -- <Entity>[Var femte amerikan] [GÅR]
		hålla_V_State_continue : V ; -- <Entity>[vagnen] [HÖLL]
		stå_V_State_continue : V ; -- <Entity>[En av hans traktorer] [STOD]

		rapportera_V_Statement : V ; -- <Speaker>[Andreas] [RAPPORTERADE]
		skriva_V_Statement : V ; -- <Message>[I Sverige döms flera hundra utvecklingsstörda till fängelse varje år] , [SKRIVER] <Speaker>[Svenska Dagbladet]
		glunka_V_Statement : V ; -- <Speaker>[kulturministern och borgerliga debattörer som] [GLUNKAR] <Topic>[om att smalna av statstelevisionens uppdrag]
		tala_V_Statement : V ; -- <Speaker>[Brittiska drottningen Elizabeth II] [TALADE] <Topic>[för världsfreden]
		stadga_V2_Statement : V2 ; -- <Medium>[Andra ändringar i lagen] [STADGAR] <Message>[fängelsestraff för sexuellt ofredande av barn , handel med mänskliga organ och miljöförstörelse]
		stadga_VS_Statement : VS ; -- <Medium>[Lagen] [STADGAR] <Message>[att en sådan stämma måste hållas]
		annonsera_VS_Statement : VS ; -- <Speaker>[Andersson] [ANNONSERA] <Message>[att ett hotell byggts upp]
		fastslå_VS_Statement : VS ; -- <Speaker>[Länsrätten] [FASTSLÅR] <Message>[att det finns inget sagt om löpande vite]
		säga_VS_Statement : VS ; -- <Speaker>[mannen] mager och [SADE] <Message>[att han var sjuk]
		ge_VV_Statement : VV ; -- [UPPGAV] <Speaker>[militären] <Message>[att ytterligare två soldater gripits , misstänkta för inblanding i dödsskjutningen]
		kommentera_V2_Statement : V2 ; -- [KOMMENTERAS] <Speaker>[av läraren]
		dödförklara_V2_Statement : V2 ; -- <Topic>[Teorin om det öppna polarhavet] [DÖDFÖRKLARADES]

		lagra_V2_Storing : V2 ; -- <Agent>[man] [LAGRA] på sig <Theme>[ljusa sommarminnen]

		ligga_V_Studying : V ; -- <Student>[en student som] [LIGGER] <Institution>[vid universitet]
		studera_V2_Studying : V2 ; -- <Student>[han] och [STUDERAR] <Subject>[litteraturvetenskap]

		övertala_V2S_Suasion : V2S ; -- <Speaker>[jag] [ÖVERTALAT] <Addressee>[honom] och han säger någonting om <Content>[att han ska ringa och väcka mig sju på morgonen någon gång]
		förmå_V2V_Suasion : V2V ; -- <Speaker>[Hon] måste [FÖRMÅ] <Addressee>[honom] <Content>[att bli förtröstansfull]
		övertala_V2V_Suasion : V2V ; -- <Speaker>[man] nog kunna [ÖVERTALA] <Addressee>[honom] <Content>[att hjälpa till]
		övertala_V2_Suasion : V2 ; -- <Addressee>[Han] hade [ÖVERTALATS] <Content>[till räddningsaktionen]

		lämna_in_V2_Submitting_documents : V2 ; -- <Submittor>[Jag] har [LÄMNAT IN] <Documents>[en hemtenta om Gustav Vasas brev]
		skicka_in_V2_Submitting_documents : V2 ; -- <Submittor>[Sveriges kommuner och landsting] har [SKICKAT IN] <Documents>[en skrivelse] <Authority>[till socialdepartementet]
		sända_in_V2_Submitting_documents : V2 ; -- <Submittor>[Vi] har [SÄNT IN] <Documents>[våra brev] <Authority>[till arrangörerna]

		bita_i_gräset_V_Success_or_failure : V ; -- <Agent>[Han] fick [BITA I GRÄSET]
		göra_bort_sig_V_Success_or_failure : V ; -- <Agent>[Jag] kommer att [GÖRA BORT MIG]
		ta_V_Success_or_failure : V ; -- <Agent>[Holm] [TOG] <Goal>[2,20]
		torska_V_Success_or_failure : V ; -- <Agent>[jag] [TORSKADE] <Goal>[på ett hål]
		klara_VV_Success_or_failure : VV ; -- <Agent>[Jag] hade [KLARAT] <Goal>[att hjälpa den tjejen]
		klara_av_VV_Success_or_failure : VV ; -- <Agent>[Vissa cd-spelare] [KLARAR AV] <Goal>[att spela upp skivor av andra typer än cd , som exempelvis dvd eller cd-rom]
		misslyckas_V2_Success_or_failure : V2 ; -- <Agent>[hon] [MISSLYCKATS]

		göra_susen_V_Successful_action : V ; -- <Instrument>[En nypa socker] [GÖR SUSEN]
		bära_frukt_V_Successful_action : V ; -- <Means>[Målmedvetet arbete] [BÄR FRUKT]
		gå_bra_V_Successful_action : V ; -- <Means>[Allt] [GÅR BRA]
		slå_bakut_V_Successful_action : V ; -- <Means>[Det specifika för filmen] [SLÅR BAKUT]
		slå_fel_V_Successful_action : V ; -- <Means>[Skördar som] [SLOG FEL]

		förankra_V2_Successfully_communicate_message : V2 ; -- <Communicator>[De] har rest runt i delstaterna för att [FÖRANKRA] <Message>[förslagen]
		förmedla_V2_Successfully_communicate_message : V2 ; -- <Communicator>[Aschberg och hans redaktion] lyckades i alla fall [FÖRMEDLA] <Message>[kärnan av skandalen]

		förslå_V_Sufficiency : V ; -- <Item>[Ändringar i organisationen] [FÖRSLÅR]
		räcka_V_Sufficiency : V ; -- <Item>[Pengarna] [RÄCKTE] förstås inte <Enabled_situation>[till allt]
		räcka_till_V_Sufficiency : V ; -- <Item>[vaccinet] inte [RÄCKER TILL]

		ekipera_V2_Supply : V2 ; -- <Supplier>[Jag] hade tagit bussen de två milen till Borlänge och [EKIPERAT] <Recipient>[mig]
		mata_V2_Supply : V2 ; -- <Supplier>[en informatör] är autentisk ( korrekt ) inte att <Supplier>[den] [MATAR] <Recipient>[folk] <Theme>[med önskade uppgifter]
		pimpa_V2_Supply : V2 ; -- <Supplier>[smålänningen] [PIMPA] <Recipient>[sin Honda CRX v-tec]
		tanka_V2_Supply : V2 ; -- <Supplier>[pastorn tillsammans med sin älskarinna] och [TANKADE] <Recipient>[bilen]
		tillföra_V2_Supply : V2 ; -- <Supplier>[man] alltså [TILLFÖRA] <Theme>[fukt eller fett]
		förse_V2_Supply : V2 ; -- [FÖRSÅGS] <Recipient>[kyrkorummet]

		stödja_V2_Supporting : V2 ; -- <Supporter>[Min roll] är att [STÖDJA] <Supported>[Fredrik]
		stötta_V2_Supporting : V2 ; -- <Supporter>[de] bära och [STÖTTA] <Supported>[den sjuke]

		överlämna_sig_V_Surrendering : V ; -- <Fugitive>[De flesta av de upproriska soldaterna] [ÖVERLÄMNADE SIG] <Authorities>[till de pakistanska myndigheterna]

		avträda_V2_Surrendering_possession : V2 ; -- <Surrenderer>[Danmark] tvingats [AVTRÄDA] <Theme>[Norge] <Recipient>[till Sverige]
		lämna_ifrån_sig_V2_Surrendering_possession : V2 ; -- <Surrenderer>[Chauffören] [LÄMNADE IFRÅN SIG] <Theme>[pengarna]
		överlämna_V2_Surrendering_possession : V2 ; -- <Surrenderer>[Regeringssoldater] [ÖVERLÄMNADE] <Theme>[vapen]

		misstänkliggöra_V2_Suspicion : V2 ; -- [MISSTÄNKLIGGJORDES] <Suspect>[han] <Incident>[efter mordet]

		avlösa_V2_Take_place_of : V2 ; -- <New>[Vice statsminister Mona Sahlin] [AVLÖSTE] <Old>[Jonsson] <Role>[i talarstolen]
		efterträda_V2_Take_place_of : V2 ; -- <New>[Han] [EFTERTRÄDDE] <Old>[Tony Blair]
		ersätta_V2_Take_place_of : V2 ; -- <New>[Hälsan] har [ERSATT] <Old>[religionen] <Role>[som samhällelig ordning och ideologi]
		substituera_V2_Take_place_of : V2 ; -- <New>[Moralen , som] skall [SUBSTITUERA] <Old>[skolans religion]

		beslagta_V2_Taking : V2 ; -- <Agent>[Den grekiska regimen] svarade med att [BESLAGTA] <Theme>[motståndsmännens egendomar]
		hugga_V2_Taking : V2 ; -- <Agent>[Ni som bor i Skövde] kan [HUGGA] <Theme>[en gratis SN]
		lägga_rabarber_på_V2_Taking : V2 ; -- <Agent>[företagsamma individer som] [LA RABARBER PÅ] <Theme>[det dom kunde]
		nappa_V2_Taking : V2 ; -- <Agent>[Jag] ska i alla fall [NAPPA] <Theme>[en till flaska]
		nappa_åt_sig_V2_Taking : V2 ; -- <Agent>[Xtrem] lyckas [NAPPA ÅT SIG] <Theme>[en tugga hö]
		snappa_V2_Taking : V2 ; -- <Agent>[Mössen] [SNAPPADE] <Theme>[osten]
		snappa_upp_V2_Taking : V2 ; -- <Agent>[Georgiern] [SNAPPADE UPP] <Theme>[en tappad boll av Simon Nurme]
		snappa_åt_sig_V2_Taking : V2 ; -- <Agent>[jag] [SNAPPA ÅT MIG] <Theme>[kryddor]
		ta_V2_Taking : V2 ; -- <Agent>[S] [TAR] <Theme>[röster] <Source>[från v]
		avhämta_V2_Taking : V2 ; -- <Theme>[Kostymen] kan [AVHÄMTAS]

		motsätta_sig_V2_Taking_sides : V2 ; -- <Cognizer>[vpk] [MOTSATTE SIG] <Action>[en skattesänkning]
		gå_emot_V2_Taking_sides : V2 ; -- <Cognizer>[Socialdemokraterna i Stadshuset] har tagit intryck av kritiken och [GÅR EMOT] <Issue>[förslaget]

		prova_V2_Tasting : V2 ; -- <Agent>[Vi] [PROVAR] även <Food>[den möra kycklingfilén med currysås med sting av senap]
		provsmaka_V2_Tasting : V2 ; -- <Agent>[Linda] [PROVSMAKADE] <Food>[en pralin]
		smaka_av_V2_Tasting : V2 ; -- <Food>[moset] och [SMAKA AV]

		annonsera_V_Telling : V ; -- <Speaker>[man] [ANNONSERA] <Topic>[om att man förlorat bankboken .]
		berätta_V_Telling : V ; -- <Speaker>[David Eberhard , läkare i psykiatri ,] [BERÄTTAR] <Topic>[om sin syn på det svenska paniksyndromet]
		mala_på_V_Telling : V ; -- <Speaker>[hon] inte kan sluta [MALA PÅ] <Topic>[om hur fel han har i Oh how wrong]
		berätta_V2_Telling : V2 ; -- <Message>[Halv tolv i går kväll fick jag meddelande att stallet där alla tävlingshästar var hade blåst bort] , [BERÄTTAR] <Speaker>[Rolf-Göran Bengtsson] <Addressee>[för TT]
		dra_V2_Telling : V2 ; -- <Speaker>[Killen] [DRAR] <Message>[ett skämt]
		avisera_VS_Telling : VS ; -- <Speaker>[Patrik Järbyn och Anja Pärson] har [AVISERAT] <Message>[att OS-säsongen blir deras sista]
		berätta_VS_Telling : VS ; -- <Speaker>[Chauffören] har [BERÄTTAT] <Message>[att det plötsligt bara small till]
		ge_till_känna_VS_Telling : VS ; -- <Speaker>[prästerskapets midjemåttunder århundradens lopp] [GER TILL KÄNNA] <Message>[att denna regel inte har följts]

		befinna_sig_V_Temporary_stay : V ; -- <Guest>[Bloggarna] ska [BEFINNA SIG] <Location>[runt om i världen]
		bo_V_Temporary_stay : V ; -- <Guest>[Jag] [BOR] <Location>[på hotell Örnsköld bakom Dramaten]
		hänga_V_Temporary_stay : V ; -- <Guest>[Det lokala innefolket] [HÄNGER] <Location>[på barerna runt Halles St Gery]
		hålla_till_V_Temporary_stay : V ; -- <Guest>[Du] får [HÅLLA TILL] <Location>[i Grå salen]
		uppehålla_sig_V_Temporary_stay : V ; -- <Location>[I Japan] kan <Guest>[man] [UPPEHÅLLA SIG] <Duration>[i tre månader]
		sova_över_V_Temporary_stay : V ; -- <Guest>[Issa] [SOV ÖVER] <Host>[hos mig]
		vistas_V2_Temporary_stay : V2 ; -- <Guest>[han] [VISTAS]

		sammanskriva_V2_Text_creation : V2 ; -- <Author>[Peter Schönström , överste , fånge i Sibirien] , använde sin tid i Sibirien att [SAMMANSKRIVA] <Text>[anmärkningar] och <Text>[betraktelser över landet och dess invånare]
		skriva_V2_Text_creation : V2 ; -- <Author>[författaren] [SKRIVIT] <Text>[dikten]
		säga_V2_Text_creation : V2 ; -- <Author>[Prästen] [SÄGER] <Text>[några ord av förmaning , råd och uppmuntran]
		blogga_VS_Text_creation : VS ; -- <Author>[Jessica Andersson] [BLOGGAR] <Text>[om stödet hemifrån]
		anmäla_V2_Text_creation : V2 ; -- <Text>[boken] [ANMÄLDES]

		snatta_V_Theft : V ; -- <Perpetrator>[Två 13-åriga flickor] ertappas när de [SNATTAT] <Source>[på NK]
		förskingra_V2_Theft : V2 ; -- <Perpetrator>[En polisman med fackligt uppdrag] misstänks ha [FÖRSKINGRAT] <Goods>[en stor summa pengar] <Victim>[från sin fackförening i Västerbotten]
		nalla_V2_Theft : V2 ; -- [NALLADE] <Perpetrator>[han] <Goods>[en godislåda]

		blomstra_V_Thriving : V ; -- [BLOMSTRAR] <Entity>[Sveriges turistnäring]
		rasa_V_Thriving : V ; -- <Entity>[Priserna på bredband] [RASAR]
		frodas_V2_Thriving : V2 ; -- <Entity>[Bluffakturorna] [FRODAS]

		blockera_V2_Thwarting : V2 ; -- <Preventing_cause>[En medlemsstat hotar med att] [BLOCKERA] <Action>[utvecklingen i riktning mot en europeisk arresteringsorder]
		lamslå_V2_Thwarting : V2 ; -- <Preventing_cause>[Nervositeten] hotade att [LAMSLÅ] <Protagonist>[världen]
		stänga_av_V2_Thwarting : V2 ; -- <Protagonist>[Blomdahl] [STÄNGS AV]

		stå_pall_V_Tolerating : V ; -- <Experiencer>[mjukisar] som inte [STÅR PALL] <Content>[för några glas med jobbkollegorna]

		gälla_V_Topic : V ; -- [GÄLLER] <Topic>[ett skeende som i sin komplexitet överträffar det mesta Finland har sett]
		ta_upp_V2_Topic : V2 ; -- <Communicator>[jag] [TA UPP] <Topic>[problemet med Europaparlamentet]
		behandla_V2_Topic : V2 ; -- <Text>[sångtexterna] [BEHANDLAR] <Topic>[de stora frågorna i livet]
		röra_V2_Topic : V2 ; -- <Text>[mitt brev] [RÖRDE] <Topic>[frågor som i hög grad var aktuella under den senaste delsessionen]

		ryggsäcksluffa_V_Travel : V ; -- [RYGGSÄCKSLUFFAT] <Area>[i Australien och Nya Zeeland]
		båtpendla_V_Travel : V ; -- <Traveler>[Annica] [BÅTPENDLADE] <Goal>[till Sverige]
		pendla_V_Travel : V ; -- <Traveler>[Jag] [PENDLADE]
		tågpendla_V_Travel : V ; -- <Traveler>[Göteborgs nye trafikdirektör] tänker fortsätta [TÅGPENDLA] <Goal>[till jobbet]
		arbetspendla_V_Travel : V ; -- [ARBETSPENDLADE] <Traveler>[500 personer] <Mode_of_transportation>[med tåg] <Path>[mellan Varberg och Göteborg]
		veckopendla_V_Travel : V ; -- <Traveler>[Christer] [VECKOPENDLAT] <Path>[mellan hemmet i Lerum och arbetet på Naturhistoriska riksmuseet i Stockholm]

		kretsa_V_Traversing : V ; -- <Path>[Runt omkring oss] [KRETSAR] <Theme>[stewarden Salvatore]
		sicksacka_V_Traversing : V ; -- [SICKSACKADE] <Theme>[brevbäraren] <Path>[i motlutet]
		tvära_V_Traversing : V ; -- <Theme>[Vi] [TVÄRAR] <Path>[in] <Source>[från stigen]
		passera_V2_Traversing : V2 ; -- <Theme>[Du] ämnade [PASSERA] <Path>[Lund]

		provrida_V2_Trying_out : V2 ; -- <Evaluator>[Lisa] att [PROVRIDA] <Entity>[några av de andra ridskolehästarna]
		provspela_V2_Trying_out : V2 ; -- <Evaluator>[alla som ville] fick [PROVSPELA] <Entity>[ett nytt bilspel till Xbox]
		pröva_V2_Trying_out : V2 ; -- [PRÖVAR] <Evaluator>[skivbranschen] <Entity>[en mjukare taktik]
		pröva_på_V2_Trying_out : V2 ; -- <Evaluator>[Besökarna] ska få [PRÖVA PÅ] <Entity>[olika aktiviteter]
		testköra_V2_Trying_out : V2 ; -- <Evaluator>[Vi] ska [TESTKÖRA] <Entity>[verken]

		säga_VS_Unattributed_information : VS ; -- [SÄGS] <Reported_fact>[att han föredrog ett glas vin med vänner som S A Hedlund och Viktor Rydberg]

		slå_om_V_Undergo_change : V ; -- <Entity>[signalen] [SLÅR OM]
		svänga_V_Undergo_change : V ; -- <Entity>[Matchen] [SVÄNGDE]

		undergå_V2_Undergoing : V2 ; -- <Entity>[Marie] fick [UNDERGÅ] <Event>[operation och mycket arbetsam medicinering]
		underkasta_sig_V2_Undergoing : V2 ; -- <Entity>[han] grips och får [UNDERKASTA SIG] <Event>[provtagning]

		dra_av_sig_V2_Undressing : V2 ; -- <Wearer>[Hon] [DRAR AV SIG] <Clothing>[mössan]
		klä_V2_Undressing : V2 ; -- <Wearer>[Man] [AVKLÄDDE] <Clothing>[allt]

		avfyra_V2_Use_firearm : V2 ; -- <Agent>[terroristerna] [AVFYRAT] <Firearm>[sina maskingevär]

		begagna_V2_Using : V2 ; -- <Instrument>[Dräkter] , <Instrument>[kulisser] och <Instrument>[rekvisita] [BEGAGNAR] <Agent>[man]
		ta_till_V2_Using : V2 ; -- <Agent>[Forskare i USA] vill [TA TILL] <Instrument>[drastiska medicinska åtgärder] <Purpose>[för att få bukt med fetmaepidemin]
		ta_tillvara_V2_Using : V2 ; -- [TA TILLVARA] <Instrument>[kompetensen]
		tillämpa_V2_Using : V2 ; -- <Agent>[Swebus] [TILLÄMPAR] <Instrument>[en strikt företagspolicy] <Purpose>[för att behålla en drogfri arbetsmiljö]
		ta_i_anspråk_V2_Using : V2 ; -- <Instrument>[Säve flygplats] [TAS I ANSPRÅK]

		finna_V2_Verdict : V2 ; -- <Judge>[Tingsrätten] [FINNER] <Defendant>[honom] <Finding>[skyldig på samtliga åtalspunkter]

		styrka_V2_Verification : V2 ; -- <Inspector>[41-åringen] påstås ha [STYRKT] <Unconfirmed_content>[detta] <Medium>[genom falska eller felaktiga dokument]
		fastställa_VS_Verification : VS ; -- <Inspector>[de] [FASTSTÄLLA] <Unconfirmed_content>[att det verkligen rörde sig om en sprängladdning av något slag]

		besöka_V2_Visiting : V2 ; -- [BESÖKTE] <Agent>[jag] <Entity>[hemsidan för FNs klimatmöte i Köpenhamn]

		slå_vad_VS_Wagering : VS ; -- <Gambler>[Jag] kan [SLÅ VAD] <Outcome>[om att Häckens 16-årige Dulee Johnsson har bättre teknik än alla damer i hela Sverige]

		vänta_V_Waiting : V ; -- <Protagonist>[man] få [VÄNTA] <Salient_entity>[på sin första uppkörning]

		vakna_V_Waking_up : V ; -- <Sleeper>[Jättarna] börjar [VAKNA] <Sleep_state>[ur sin slummer]
		vakna_upp_V_Waking_up : V ; -- <Sleeper>[Ett splittrat USA] [VAKNADE UPP]

		tveka_V_Waver_between_options : V ; -- <Cognizer>[Jag] bara [TVEKAR] <Issue>[mellan vilken metod jag ska välja]
		vackla_V_Waver_between_options : V ; -- <Cognizer>[oppositionen] [VACKLAR]
		hatta_V_Waver_between_options : V ; -- <Cognizer>[Jag] har [HATTAT] <Options>[mellan 100 och 200 meter]
		vela_V_Waver_between_options : V ; -- <Cognizer>[Jag] stod först och [VELADE] , <Options>[mellan vitt och svart]

		bära_V2_Wearing : V2 ; -- [BÄR] <Wearer>[de] dessutom <Clothing>[kilten]

		erövra_V2_Win_prize : V2 ; -- <Competitor>[hon] koras både till Årets idrottskvinna och [ERÖVRA] <Prize>[radions Jerringpris]
		ta_hem_V2_Win_prize : V2 ; -- [TA HEM] <Prize>[bucklan]
		vinna_V2_Win_prize : V2 ; -- <Competitor>[hon] [VANN] <Prize>[en Oscar]

		dra_sig_tillbaka_V_Withdraw_from_participation : V ; -- <Participant>[en överförmyndare] [DRAR SIG TILLBAKA]

}
