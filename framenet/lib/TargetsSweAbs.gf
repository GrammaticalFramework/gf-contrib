abstract TargetsSweAbs = Cat ** {

	flags coding = utf8 ;

	fun

		glömma_V2_Abandonment : V2 ; -- <Agent>[Han] [GLÖMDE] inte bara <Theme>[sina glasögon] utan också <Theme>[en visselpipa]
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

		misshandla_V2_Abusing : V2 ; -- <Abuser>[en kvinna] [MISSHANDLAR] <Victim>[en man]

		åstadkomma_V2_Accomplishment : V2 ; -- <Agent>[ett brittiskt plan] bomber och [ÅSTADKOMMER] <Goal>[förödelse]
		genomföra_V2_Accomplishment : V2 ; -- <Goal>[Prövningen] [GENOMFÖRDES]

		mynta_V2_Achieving_first : V2 ; -- <Cognizer>[Carl Bildt] [MYNTADE] <New_idea>[uttrycket ' skvalpvaluta ']
		uppfinna_V2_Achieving_first : V2 ; -- <Cognizer>[Blaise Pascal] [UPPFANN] <New_idea>[den första mekaniska räknemaskinen]
		upptäcka_VS_Achieving_first : VS ; -- <Cognizer>[Forskarna] [UPPTÄCKTE] <New_idea>[att bakterien Rickettsia finns i svenska fästingar]

		absolvera_V2_Activity_finish : V2 ; -- <Agent>[Man] kan [ABSOLVERA] <Activity>[delar av kursen]
		fullgöra_V2_Activity_finish : V2 ; -- <Agent>[Han] [FULLGJORDE] <Activity>[sin värnplikt]

		fortfara_VV_Activity_ongoing : VV ; -- <Agent>[Hon] [FORTFOR] <Activity>[att tiga]
		fortsätta_VV_Activity_ongoing : VV ; -- <Agent>[Hon] [FORTSATTE] <Activity>[att plocka de glänsande sillarna ur näten]

		frysa_V2_Activity_pause : V2 ; -- <Agent>[Iran] åtog sig då att [FRYSA] <Activity>[all verksamhet som relaterar till anrikning av uran , däribland framställning av urangas och tillverkning av gascentrifuger]

		bereda_sig_V_Activity_prepare : V ; -- <Agent>[De politiska motståndarna] får [BEREDA SIG] <Activity>[på att möta ett tuffare Miljöparti]
		förbereda_V_Activity_prepare : V ; -- <Agent>[Dom] vill [FÖRBEREDA] <Activity>[på att det antagligen kommer att ta slut]
		förbereda_sig_V_Activity_prepare : V ; -- <Agent>[laget] hade börjat [FÖRBEREDA SIG] <Activity>[för kval]

		återuppta_V2_Activity_resume : V2 ; -- <Agent>[Hon] ville [ÅTERUPPTA] <Activity>[sin ridning]

		börja_V_Activity_start : V ; -- [BÖRJADE] <Activity>[med tv- reklam och animation]
		börja_V2_Activity_start : V2 ; -- <Agent>[Pablo] är född i Guinea , men uppvuxen i Tyskland och [BÖRJADE] <Activity>[sin karriär]
		inleda_V2_Activity_start : V2 ; -- [INLEDA] <Activity>[pollenmätningarna]
		begynna_VV_Activity_start : VV ; -- <Agent>[han] inte [BEGYNNER] <Activity>[slå mor]
		börja_VV_Activity_start : VV ; -- <Agent>[Ford] och framför allt <Agent>[GM] måste [BÖRJA] <Activity>[tillverka attraktiva bilar som säljer]
		ge_sig_på_VV_Activity_start : VV ; -- <Agent>[jag] [GE MIG PÅ] <Activity>[att tillverka ett eget mönster]
		komma_VV_Activity_start : VV ; -- <Agent>[hon] [KOM] <Activity>[att tänka på det uttalandet]
		uppta_V2_Activity_start : V2 ; -- [UPPTOGS] <Activity>[vägarbetena]

		avsluta_V2_Activity_stop : V2 ; -- <Agent>[han] [AVSLUTADE] <Activity>[samtalet]
		lägga_ner_V2_Activity_stop : V2 ; -- <Agent>[Nimbus] beslöt [LÄGGA NER] <Activity>[sin tillverkning]
		stoppa_V2_Activity_stop : V2 ; -- <Agent>[inrikesministeriet] [STOPPADE] <Activity>[sändningarna]
		ställa_in_V2_Activity_stop : V2 ; -- <Agent>[GM] börjar [STÄLLA IN] <Activity>[betalningar till återförsäljare i USA]
		inhibera_V2_Activity_stop : V2 ; -- <Activity>[Madeiraresan] [INHIBERADES]
		seponera_V2_Activity_stop : V2 ; -- <Activity>[Patientens diuretikaterapi] [SEPONERAS]
		sätta_V2_Activity_stop : V2 ; -- <Activity>[Pulmicort] [UTSATTES]

		lägga_ihop_V2_Adding_up : V2 ; -- [LÄGGER IHOP] <Numbers>[det nationella stödet och gemenskapens regionala och sociala stöd]
		räkna_ihop_V2_Adding_up : V2 ; -- [RÄKNA IHOP] <Numbers>[200 barn mellan 3 och 15 år]
		räkna_samman_V2_Adding_up : V2 ; -- [RÄKNA SAMMAN] <Result>[publikens poäng]

		anföra_V2_Adducing : V2 ; -- <Speaker>[Nämnden] [ANFÖRDE] <Specified_entity>[en mängd argument emot att ge bygglov]
		åberopa_V2_Adducing : V2 ; -- <Speaker>[åklagarna] kommer att [ÅBEROPA] <Specified_entity>[taxichaufförens uppgifter]
		andra_V2_Adducing : V2 ; -- <Specified_entity>[Några omständigheter] brukar dock [ANDRAGAS]

		ställa_om_V_Adjusting : V ; -- [STÄLLA OM] <Part>[telefonen]
		ställa_in_V2_Adjusting : V2 ; -- <Agent>[vi] kan [STÄLLA IN] <Feature>[temperatur]
		kalibrera_V2_Adjusting : V2 ; -- <Agent>[Nasa] ska nu använda bilderna för att [KALIBRERA] <Part>[kamerorna]

		anta_V2_Adopt_selection : V2 ; -- <Agent>[man] ska [ANTA] <Value>[hälsosamma yttringar]
		inta_V2_Adopt_selection : V2 ; -- <Agent>[USA] vill inte [INTA] <Value>[en attityd som riskerar att förvärra situationen]
		omfamna_V2_Adopt_selection : V2 ; -- <Agent>[göteborgarna] kommer att [OMFAMNA] <Value>[de nya stadsdelsnamnen]
		adoptera_V2_Adopt_selection : V2 ; -- <Value>[Näringslivets processer] [ADOPTERAS]

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

		belöpa_sig_V_Amounting_to : V ; -- <Attribute>[De samlade resurser som vi ger i detta sammanhang] [BELÖPER SIG] i det närmaste <Value>[till 300 milj]

		baka_V2_Apply_heat : V2 ; -- [BAKA] <Food>[potatisarna]
		koka_V2_Apply_heat : V2 ; -- [KOKA] <Food>[betorna]
		koka_upp_V2_Apply_heat : V2 ; -- [KOKA UPP] och [SJUD] <Food>[rödbetorna]
		sjuda_V2_Apply_heat : V2 ; -- [KOKA UPP] och [SJUD] <Food>[rödbetorna]
		steka_V2_Apply_heat : V2 ; -- [STEKA] <Food>[kött] <Container>[i en värmetålig stekpåse]
		woka_V2_Apply_heat : V2 ; -- [WOKA] <Food>[grönsakerna]

		ackreditera_V2_Appointing : V2 ; -- <Official>[Ambassadörer] [ACKREDITERAS] <Role>[till statschefer]

		arrangera_V2_Arranging : V2 ; -- <Agent>[Nederländaren Maarten Bon] 1933-2003 arbetade under en period med att [ARRANGERA] <Theme>[fyra pianosatser i Stravinskys berömda Våroffer]
		göra_i_ordning_V2_Arranging : V2 ; -- <Agent>[kommunen] [GÖR I ORDNING] <Theme>[sitt nyköpta område]
		lägga_upp_V2_Arranging : V2 ; -- <Agent>[Man] kan även [LÄGGA UPP] <Theme>[ett tak] <Configuration>[i form av en segelduk eller ett vackert parasoll]

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

		hjälpa_V2_Assistance : V2 ; -- <Helper>[barn] [HJÄLPER] <Benefited_party>[barn]
		stödja_V2_Assistance : V2 ; -- <Helper>[Du] ska [STÖDJA] <Benefited_party>[mig] <Focal_entity>[i allt jag gör]
		tjäna_V2_Assistance : V2 ; -- <Helper>[Han] hade gett sitt liv för att [TJÄNA] <Benefited_party>[sin husbonde]
		hjälpa_V2V_Assistance : V2V ; -- <Helper>[sanden] [HJÄLPER] <Benefited_party>[dig] <Goal>[att flyta]

		gottgöra_V2_Atonement : V2 ; -- <Agent>[Jag] vill härmed [GOTTGÖRA] <Wrong.>[denna försummelse]
		sona_V2_Atonement : V2 ; -- <Agent>[Marie] har [SONAT] <Wrong,>[sitt brott]

		bränna_fast_V2_Attaching : V2 ; -- <Agent>[man] [BRÄNNER FAST] <Item>[det]
		fästa_V2_Attaching : V2 ; -- <Agent>[man] [FÄSTER] <Item>[en knapp] <Goal>[i ett plagg]
		förtöja_V2_Attaching : V2 ; -- <Agent>[en man och kvinna] [FÖRTÖJA] <Item>[sin segelbåt]
		haka_fast_V2_Attaching : V2 ; -- <Agent>[Jag] släcker alla ljus , [HAKAR FAST] <Item>[fönstret]
		montera_V2_Attaching : V2 ; -- <Agent>[man] [MONTERAR] <Item>[bilbarnstolen]
		spika_fast_V2_Attaching : V2 ; -- <Agent>[Vi] flyttade bort boden , rev bort masoniten och [SPIKADE FAST] <Item>[hattlist] <Goal>[på ytterväggarna]
		säkra_V2_Attaching : V2 ; -- <Agent>[man] [SÄKRAR] <Item>[sin last]
		koppla_ihop_V2_Attaching : V2 ; -- <Agent>[entreprenörerna Staffan Jonasson och Magnus Westin] på att [KOPPLA IHOP] <Items>[kablar]
		slå_fast_V2_Attaching : V2 ; -- [SLÅ FAST] <Item>[ramarna] <Goal>[i den] <Connector>[med spik]
		dras_fast_V2_Attaching : V2 ; -- <Item>[bogvisiret] [DRAS FAST] <Connector>[med vantskruvar] <Goal>[i durken]
		slå_på_V2_Attaching : V2 ; -- <Item>[panel] ska [SLÅS PÅ] <Goal>[på utsidan]

		angripa_V2_Attack : V2 ; -- <Assailant>[Naturvårdsverket] vill [ANGRIPA] <Victim>[de fem stora källorna till dioxinutsläppen : sopförbränningen , bilavgaserna , järn- och stålverken , skogsindustrin och sjukhusugnarna]
		ge_sig_på_V2_Attack : V2 ; -- <Assailant>[Mannen] [GAV SIG PÅ] <Victim>[60-åringen]

		anstränga_sig_V_Attempt : V ; -- <Agent>[Hon] [ANSTRÄNGER SIG] <Goal>[för att ta seden dit hon kommer]
		bjuda_till_V_Attempt : V ; -- <Agent>[vi] vågar [BJUDA TILL]
		anstränga_sig_VV_Attempt : VV ; -- <Agent>[Dessa journalister] är professionella som [ANSTRÄNGER SIG] <Goal>[att varna allmänheten i sitt land , att kritisera korruptionen i regimen]
		försöka_VV_Attempt : VV ; -- <Agent>[Hon] kommer också att [FÖRSÖKA] <Goal>[få sin häst stambokförd]

		undvika_V2_Avoiding : V2 ; -- <Agent>[jag] [UNDVIKA] <Undesirable_situation>[dessa smärtor]
		undgå_VV_Avoiding : VV ; -- <Agent>[vi] kunnat [UNDGÅ] <Undesirable_situation>[att bli indragna i 1900-talets båda världskrig]
		undvika_VV_Avoiding : VV ; -- [UNDVIKA] <Undesirable_situation>[att bli sjuk]

		veta_V_Awareness : V ; -- <Cognizer>[vi] [VET] inte <Content>[om framtidens apparater kan avläsa det vi arkiverar i dag]
		ana_V2_Awareness : V2 ; -- [ANAR] <Cognizer>[man] <Content.>[ett engagemang som slagit över i överkänslighet]
		känna_V2_Awareness : V2 ; -- <Content>[sjukdomar som] <Cognizer>[vi] inte [KÄNNER] <Content>[orsaken till]
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

		hålla_babblan_V_Become_silent : V ; -- <Speaker>[Jag] kunde sitta stilla och [HÅLLA BABBLAN]
		hålla_flabben_V_Become_silent : V ; -- <Speaker>[du] [HÅLLA FLABBEN]
		hålla_gafflan_V_Become_silent : V ; -- <Speaker>[Jag] förväntades helt enkelt [HÅLLA GAFFLAN]
		hålla_klaffen_V_Become_silent : V ; -- <Speaker>[jag] borde kanske [HÅLLA KLAFFEN]
		tiga_V_Become_silent : V ; -- [TEG] <Speaker>[Johansson]

		göra_sig_V_Becoming : V ; -- <Entity>[Föräldern] [GÖR SIG] <Final_state>[skyldig]
		utfalla_V_Becoming : V ; -- <Entity>[allt] har [UTFALLIT] <Final_state>[väl]

		ansluta_sig_V_Becoming_a_member : V ; -- <Group>[Till deras lilla trupp] [ANSLUTER SIG] <New_member>[fler personer]
		inträda_V_Becoming_a_member : V ; -- <New_member>[Kroatien] lämnade in sin medlemsansökan till EU i februari och hoppas få [INTRÄDA] <Group>[i unionen]
		gå_in_i_V2_Becoming_a_member : V2 ; -- <New_member>[Georgien] för att [GÅ IN I] <Group>[den stora försvarsalliansen]
		gå_med_i_V2_Becoming_a_member : V2 ; -- <New_member>[Maria] hade varit <New_member>[hon] [GICK MED I] <Group>[kristdemokraterna]

		bli_varse_V_Becoming_aware : V ; -- <Cognizer>[Jag] har [BLIVIT VARSE] <Phenomenon>[om att tid verkligen kan vara en bristvara]
		märka_V2_Becoming_aware : V2 ; -- <Cognizer>[Många människor] kommer att [MÄRKA] <Phenomenon>[höjningen]
		varsna_V2_Becoming_aware : V2 ; -- <Cognizer>[man] ska [VARSNA] <Phenomenon>[faran]
		lägga_märke_till_VQ_Becoming_aware : VQ ; -- <Cognizer>[du] att [LÄGGA MÄRKE TILL] <Phenomenon>[hur all ansträngning och anspänning försvinner]
		upptäcka_VS_Becoming_aware : VS ; -- [UPPTÄCKA] , <Phenomenon>[att den man trott på inte håller måttet]

		soltorka_V_Becoming_dry : V ; -- <Entity>[de skördade lökarna] [SOLTORKA]
		torka_V_Becoming_dry : V ; -- <Entity>[Spacklet] måste [TORKA]
		torka_bort_V_Becoming_dry : V ; -- <Entity>[All fukt] [TORKAR BORT]
		torka_in_V_Becoming_dry : V ; -- <Entity>[knopparna] [TORKAR IN]
		torka_upp_V_Becoming_dry : V ; -- <Entity>[banan] [TORKADE UPP]
		torka_ut_V_Becoming_dry : V ; -- <Entity>[Floderna vi passerar] har [TORKAT UT]

		dela_sig_V_Becoming_separated : V ; -- <Whole>[kräftan] [DELAR SIG] <Parts>[i två halvor]
		smula_sig_V_Becoming_separated : V ; -- <Whole>[Min grovhackade kycklingleverpaté] [SMULAR SIG]

		dirigera_V2_Behind_the_scenes : V2 ; -- <Artist>[Lehtinen] hade förmånen att få [DIRIGERA] <Production>[Ingvar Lindholms dramatiska och magnifikt svärtade Kontakion som repeterades under sista tävlingsomgången]
		filmatisera_V2_Behind_the_scenes : V2 ; -- [FILMATISERA] <Production>[böckerna om 007]
		komponera_V2_Behind_the_scenes : V2 ; -- <Artist>[Erik Bergman] [KOMPONERADE] <Production>[operan]
		producera_V2_Behind_the_scenes : V2 ; -- <Artist>[ScanTV] ska [PRODUCERA] <Production>[färre egna program]

		hålla_ihop_V_Being_attached : V ; -- <Item>[dykparen] hela tiden [HÅLLER IHOP] <Goal>[med linan]

		föda_V2_Being_born : V2 ; -- <Child>[Jag] [FÖDDES]

		jobba_V_Being_employed : V ; -- <Employee>[Hon] har [JOBBAT] <Place_of_employment>[på arkivet]

		ligga_V_Being_located : V ; -- <Theme>[Tågstationen] [LIGGER] <Location>[under jord]
		sitta_V_Being_located : V ; -- <Location>[På balkongräcket utanför fönstret] [SITTER] <Theme>[julbelysningen]
		stå_V_Being_located : V ; -- <Location>[På bordet] [STÅR] <Theme>[en tidstypisk bag]
		vara_V_Being_located : V ; -- <Theme>[Dottern] [ÄR] <Location>[hos sin far]

		belägra_V2_Besieging : V2 ; -- <Assailant>[De som blir lottlösa] [BELÄGRAR] <Victim>[bussen]
		omringa_V2_Besieging : V2 ; -- <Assailant>[Polisen] [OMRINGAR] <Victim>[olika aktivtistcenter]
		ringa_V2_Besieging : V2 ; -- [INRINGAR] <Assailant>[den kommunistiska gerillarörelsen Vietminh] <Victim>[den franska fästningen Dien Bien Phu]

		embarkera_V2_Board_vehicle : V2 ; -- <Traveller>[Passagerarna] kan [EMBARKERA] <Vehicle>[livbåtarna]

		leda_V_Body_movement : V ; -- <Agent>[Hon] kunde inte [LEDA] <Body_part>[på foten]
		röra_V_Body_movement : V ; -- <Agent>[hon] [RÖRDE] <Body_part>[på huvudet]
		vicka_V_Body_movement : V ; -- <Agent>[Han] rörde på tårna och [VICKADE] <Body_part>[på fötterna]

		bravera_V_Bragging : V ; -- <Speaker>[hon] skulle [BRAVERA] <Topic>[med sin konst]
		göra_sig_fin_V_Bragging : V ; -- <Speaker>[blomman] slutade att [GÖRA SIG FIN]
		skryta_V_Bragging : V ; -- <Speaker>[Jag] vill inte [SKRYTA] <Topic>[om nånting]

		inhalera_V2_Breathing : V2 ; -- <Agent>[hon] ertappats med att [INHALERA] <Air>[lustgas]
		andas_in_V2_Breathing : V2 ; -- <Air>[Vissa mediciner] [INHALERAS] , d.v.s [ANDAS IN]

		bära_upp_V2_Bringing : V2 ; -- <Agent>[han] Cecilia och börjar sedan [BÄRA UPP] <Theme>[soppåsar med gamla blöjor]
		forsla_in_V2_Bringing : V2 ; -- <Agent>[De] [FORSLAR IN] <Theme>[militär utrustning]
		köra_V2_Bringing : V2 ; -- <Carrier>[Bussen] [KÖR] <Theme>[oss] <Goal>[till Katrineholm där ett nytt tåg står och väntar]

		anlägga_V2_Building : V2 ; -- <Agent>[Norge] rustar upp och [ANLÄGGER] <Created_entity>[fästningar]
		bygga_V2_Building : V2 ; -- <Agent>[Sjökaptenen] [BYGGDE] <Created_entity>[sitt hus] <Components>[av holländskt tegel]
		bygga_om_V2_Building : V2 ; -- <Agent>[Vi] [BYGGER OM] <Created_entity>[vårt kök]
		göra_V2_Building : V2 ; -- <Agent>[Möbelakrobaterna] [GÖR] <Created_entity>[möbler] <Components>[av slitna skor och gamla badkar]
		montera_V2_Building : V2 ; -- <Agent>[man] [MONTERADE] endast <Created_entity>[sex flygplan]
		sätta_ihop_V2_Building : V2 ; -- <Agent>[En smart student] kan [SÄTTA IHOP] <Created_entity>[en persondator]
		timra_V2_Building : V2 ; -- <Agent>[De] [TIMRAR] <Created_entity>[en ny trappa]
		uppföra_V2_Building : V2 ; -- <Agent>[han] [UPPFÖRA] <Created_entity>[en byggnad som kallas Beckford ' s torn]
		sätta_samman_V2_Building : V2 ; -- <Agent>[vi] däremot [SÄTTER SAMMAN] <Components>[delarna till ett hus eller en motor]

		drulla_V_Bungling : V ; -- <Agent>[han] balansen och [DRULLAR]
		ramla_runt_V_Bungling : V ; -- <Agent>[tönten som] [RAMLAR RUNT]
		schabbla_bort_V2_Bungling : V2 ; -- <Patient>[Hallströms samer] [SJABBLAS BORT]

		föra_V2_Carry_goods : V2 ; -- <Distributor>[de] [FÖR] inte <Goods.>[försvarets hudsalva]
		saluföra_V2_Carry_goods : V2 ; -- [SALUFÖRA] <Goods.>[livsmedel som är så rena och fria från tillsatser som möjligt]

		råka_illa_ut_V_Catastrophe : V ; -- <Undergoer>[Den som bygger sin verksamhet på sponsorpengar] [RÅKAR ILLA UT]
		råka_ut_V_Catastrophe : V ; -- <Undergoer>[hundarna] [RÅKA UT] <Undesirable_Event>[för en massa svansolyckor]
		drabba_V2_Catastrophe : V2 ; -- <Undesirable_Event>[Fusionen] kommer att [DRABBA] <Undergoer>[en tredjedel av de sammanlagt 18500 anställda i bankerna]

		kategorisera_V2_Categorization : V2 ; -- <Item>[Orkaners styrka] [KATEGORISERAS] <Criteria>[enligt ett system som kallas Saffir-Simpsonskalan]

		leda_V_Causation : V ; -- <Cause>[Bedrägerier] [LEDDE] <Effect>[till fängelse]
		väcka_V2_Causation : V2 ; -- <Actor>[jag] ville [VÄCKA] <Effect>[uppmärksamhet]
		åsamka_V2_Causation : V2 ; -- <Actor>[Hajar] har setts använda för att [ÅSAMKA] <Effect>[skada] <Affected>[på sina bytesdjur]
		göra_V2_Causation : V2 ; -- <Actor>[Du] [GJORDE] <Affected>[mig] <Effect>[jätteglad]
		framkalla_V2_Causation : V2 ; -- <Cause>[Färgämnet] kan [FRAMKALLA] <Effect>[svåra eksem och ge livslånga allergiproblem]
		förorsaka_V2_Causation : V2 ; -- <Cause>[Händelsen] [FÖRORSAKADE] <Effect>[totalstopp på riksväg 26]
		orsaka_V2_Causation : V2 ; -- <Cause>[Fattigdom] [ORSAKAR] <Effect>[sjuklighet]
		utlösa_V2_Causation : V2 ; -- <Cause>[Hängdrivor] kan också [UTLÖSA] <Effect>[laviner]
		få_V2V_Causation : V2V ; -- <Cause>[Bilderna på mormors morfar] [FICK] <Affected>[mig] <Effect>[att drömma om att också bli äventyrare]
		komma_V2V_Causation : V2V ; -- <Cause>[Det våldsamma septemberovädret det året] [KOM] <Affected>[floden] <Effect>[att svämma över]

		förändra_V2_Cause_change : V2 ; -- <Agent>[Många ungdomar] [FÖRÄNDRAR] också <Entity>[sitt beteende]
		göra_V2_Cause_change : V2 ; -- <Agent>[Jag] vill också [GÖRA] <Entity>[världen] <Final_category>[till en lite bättre plats]
		omdana_V2_Cause_change : V2 ; -- <Agent>[Gandhi] [OMDANAR] <Entity>[Indiens ekonomi]
		ändra_V2_Cause_change : V2 ; -- <Agent>[hon] [ÄNDRAR] <Entity>[formuleringar som hon har grubblat på , ord som skimrar i hennes minne]
		omvandla_V2_Cause_change : V2 ; -- <Entity>[de] [OMVANDLAS] <Final_category>[till ännu finare smycken]
		omändra_V2_Cause_change : V2 ; -- <Entity>[den] [OMÄNDRAS] <Final_category>[till laståsna] eller <Final_category>[till konferensutrymme]

		lösa_V2_Cause_change_of_consistency : V2 ; -- <Agent>[man] behöver göra är att [LÖSA] <Undergoer>[pigmentet]
		reda_ut_V2_Cause_change_of_consistency : V2 ; -- [REDA UT] <Undergoer>[såsen]
		lösa_upp_V2_Cause_change_of_consistency : V2 ; -- <Undergoer>[Tabletten är en brustablett som] ska [LÖSAS UPP] <Change_agent,>[i vatten]
		mjuka_upp_V2_Cause_change_of_consistency : V2 ; -- <Undergoer,>[En mör filé med tilltalande vild smak] täckt av en generös driva ljuvliga kantareller i en mustig , konjaksspetsad sås , som [MJUKATS UPP]

		frysa_V2_Cause_change_of_phase : V2 ; -- [FRYSA] <Undergoer>[surdegsbas]
		smälta_V2_Cause_change_of_phase : V2 ; -- [SMÄLTA] <Undergoer>[maten]
		snabbfrysa_V2_Cause_change_of_phase : V2 ; -- [SNABBFRYS] <Undergoer>[fisken]
		tina_V2_Cause_change_of_phase : V2 ; -- <Agent>[De] hade ställt in för att [TINA] <Undergoer>[ett fruset rör]
		tina_upp_V2_Cause_change_of_phase : V2 ; -- <Agent>[Arkeologerna] för att [TINA UPP] <Undergoer>[tjälen]
		djupfrysa_V2_Cause_change_of_phase : V2 ; -- <Undergoer>[Slaktad lax] [DJUPFRYSES]
		förgasa_V2_Cause_change_of_phase : V2 ; -- <Undergoer>[natriumet] [FÖRGASATS]
		förånga_V2_Cause_change_of_phase : V2 ; -- <Undergoer>[Metalliskt bly] [FÖRÅNGAS]

		befästa_V2_Cause_change_of_strength : V2 ; -- <Agent>[USA] [BEFÄSTER] <Patient>[sin makt över nätet]
		förstärka_V2_Cause_change_of_strength : V2 ; -- <Cause>[De fyra miljarder kommunerna får redan 1998] [FÖRSTÄRKER] <Patient>[den ordinarie arbetsmarknaden]
		försvaga_V2_Cause_change_of_strength : V2 ; -- <Cause>[Vi har en cancerkris orsakad av hiv , som] [FÖRSVAGAR] <Patient>[kroppens immunförsvar]
		aggravera_V2_Cause_change_of_strength : V2 ; -- <Patient>[symtomen] kan stå oförändrade eller till och med [AGGRAVERAS]

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
		daska_till_V2_Cause_harm : V2 ; -- <Agent>[han] [DASKADE TILL] <Victim>[henne]
		golva_V2_Cause_harm : V2 ; -- <Agent>[Han] fläskade till två brudar på truten , [GOLVADE] <Victim>[en snubbe]
		hugga_V2_Cause_harm : V2 ; -- <Agent>[Jag] fick fatt på en stor kniv och [HÖGG] <Victim>[barnet i magen]
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
		slå_V2_Cause_impact : V2 ; -- <Agent>[Emil] [SLOG] <Impactor>[näven] <Impactee>[i bordet]
		daska_till_V2_Cause_impact : V2 ; -- <Agent>[Ulf Jängnemyr som] [DASKADE TILL] <Impactee>[bollen]
		drämma_till_V2_Cause_impact : V2 ; -- <Agent>[Jag] ropade på hjälp och [DRÄMDE TILL] <Impactee>[honom] <Impactor>[med armbågen]
		slå_ihop_V2_Cause_impact : V2 ; -- <Agent>[Frieda] [SLOG IHOP] <Impactors>[händerna]
		köra_V2_Cause_impact : V2 ; -- [KÖRS] <Impactor>[nålen]

		röra_V_Cause_motion : V ; -- <Theme>[den] gick inte att [RÖRA]
		toppa_V_Cause_motion : V ; -- [TOPPAR] <Theme>[bollen]
		flytta_V2_Cause_motion : V2 ; -- [FLYTTA] <Theme>[bord]
		skjuta_ut_V2_Cause_motion : V2 ; -- <Agent>[Han] [SKÖT UT] <Theme>[sig]
		släpa_V2_Cause_motion : V2 ; -- <Agent>[Tonårspojkarna] tejpade en yngre skolkamrat över hela kroppen och [SLÄPADE] <Theme>[honom] <Area>[över golvet]
		bogsera_V2_Cause_motion : V2 ; -- <Agent>[Min pappa och jag] [BOGSERADE] <Theme>[Forden] <Source>[från verkstaden] <Goal>[till min arbetskamrat]
		fira_ner_V2_Cause_motion : V2 ; -- <Agent>[De] [FIRADE NER] <Theme>[två plankor] <Goal>[till lagom höjd]
		kasta_V2_Cause_motion : V2 ; -- <Agent>[Mannen] [KASTADE] <Theme>[trädgårdsmöbeln] <Goal>[i ryggen på kvinnan]
		skjuta_iväg_V2_Cause_motion : V2 ; -- <Agent>[De] snor deras boll och [SKJUTER IVÄG] <Theme>[den] <Goal>[åt helvete]
		toppa_V2_Cause_motion : V2 ; -- <Agent>[Pelle] [TOPPAR] <Theme>[bollen] <Goal>[i sanden]
		nicka_V2_Cause_motion : V2 ; -- [NICKA] <Path>[bort] <Theme>[bollen]
		rulla_V2_Cause_motion : V2 ; -- <Agent>[Man] [RULLADE] <Theme>[boll] <Path>[längs marken]
		skjuta_V2_Cause_motion : V2 ; -- <Agent>[Hon] vinner tekningen , [SKJUTER] <Theme>[pucken] <Path>[mellan sina gul- och blåklädda spelare]
		toppa_V3_Cause_motion : V3 ; -- <Agent>[jag] [TOPPAR] <Theme>[bollen]
		hala_V2_Cause_motion : V2 ; -- <Theme>[Flaggan] [HALAS]
		hissa_V2_Cause_motion : V2 ; -- <Theme>[Flaggan] [HISSAS]

		förena_V2_Cause_to_amalgamate : V2 ; -- <Agent>[Hon] [FÖRENAR] <Part_1>[drömmen] <Part_2,>[med verkligheten] <Part_1>[natten] <Part_2.>[med dagen]
		kombinera_V2_Cause_to_amalgamate : V2 ; -- <Agent>[Hon] jobbar extra i växeln , [KOMBINERAR] <Part_1>[arbetet] <Part_2>[med studier]
		bunta_ihop_V2_Cause_to_amalgamate : V2 ; -- <Agent>[USA] har [BUNTAT IHOP] <Parts>[Irak , Iran och Nordkorea] <Whole>[till " ondskans axelmakter "]

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
		infoga_V2_Cause_to_be_included : V2 ; -- <New_member>[Ett nytt namn] kan [INFOGAS] <Group>[i den ädla listan]
		tillfoga_V2_Cause_to_be_included : V2 ; -- [TILLFOGAS] <New_member>[ett elfte bud , som brukar kallas ' Jantelagens strafflag ']
		uppta_V2_Cause_to_be_included : V2 ; -- <New_member>[Den som] [UPPTOGS] <Group>[i klostret]

		skärpa_V2_Cause_to_be_sharp : V2 ; -- <Agent>[människorna] inte ha börjat [SKÄRPA] <Patient>[sina stenyxor]
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

		spela_V2_Cause_to_make_noise : V2 ; -- <Agent>[Mr Gillis] [SPELAR] <Sound_maker>[skivor]

		förbättra_V2_Cause_to_make_progress : V2 ; -- <Agent>[du] [FÖRBÄTTRA] <Project>[svenska servicen]
		förnya_V2_Cause_to_make_progress : V2 ; -- <Agent>[Man] höll på att [FÖRNYA] och modernisera <Project>[verksamheten]
		modernisera_V2_Cause_to_make_progress : V2 ; -- <Agent>[Man] höll på att förnya och [MODERNISERA] <Project>[verksamheten]
		utveckla_V2_Cause_to_make_progress : V2 ; -- <Agent>[Bolaget Faxell 2.0] , som har till uppgift att [UTVECKLA] <Project>[Dalsbruks centrum]
		utvecklas_V2_Cause_to_make_progress : V2 ; -- <Project>[Svenskan i Finland] ska inte bli ett eget språk utan [UTVECKLAS]

		skaka_V2_Cause_to_move_in_place : V2 ; -- <Agent>[Jag] [SKAKADE] <Theme>[flaskan]
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

		bortgå_V_Ceasing_to_be : V ; -- <Entity>[en lämnande grupp] [BORTGÅR]
		dö_bort_V_Ceasing_to_be : V ; -- <Entity>[motorljudet] [DÖR BORT]
		försvinna_V_Ceasing_to_be : V ; -- <Entity>[Tre arbetsplatser] [FÖRSVINNER]
		gå_upp_i_rök_V_Ceasing_to_be : V ; -- <Entity>[Bensinen] bara [GÅR UPP I RÖK]

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

		vila_på_hanen_V_Change_event_time : V ; -- <Agent>[Sharon] valt att [VILA PÅ HANEN] <Event>[efter attacken]
		skjuta_upp_V2_Change_event_time : V2 ; -- <Cause>[Regn] [SKÖT UPP] <Event>[första rundan]
		försena_V2_Change_event_time : V2 ; -- <Event>[humanitära insatser] avbryts eller [FÖRSENAS]

		gelea_sig_V_Change_of_consistency : V ; -- <Undergoer>[det] ändå inte [GELEAR SIG]
		skära_sig_V_Change_of_consistency : V ; -- <Undergoer>[såsen] [SKÄR SIG]
		stelna_V_Change_of_consistency : V ; -- <Undergoer>[lavan] [STELNAR]
		tjockna_V_Change_of_consistency : V ; -- <Undergoer>[krämen] [TJOCKNAR]

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

		knäppa_på_V2_Change_operational_state : V2 ; -- <Agent>[Han] [KNÄPPTE PÅ] <Device>[bandspelaren]
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
		snacka_V_Chatting : V ; -- <Interlocutors>[Vi] åt frukost och satt och [SNACKADE]

		handplocka_V2_Choosing : V2 ; -- <Cognizer>[Vi] [HANDPLOCKAR] <Chosen>[lärare]
		se_ut_V2_Choosing : V2 ; -- <Cognizer>[Vi] har [SETT UT] <Chosen>[tre pristagare]
		selektera_V2_Choosing : V2 ; -- [SELEKTERA] <Chosen>[informationsbruset]
		toppa_V2_Choosing : V2 ; -- <Cognizer>[Örkelljunga] [TOPPAR] <Chosen>[laget] <Possibilities>[med fyra amerikaner]
		välja_V2_Choosing : V2 ; -- <Cognizer>[Årsmötet] [VÄLJER] <Chosen>[Christer]
		plocka_ut_V2_Choosing : V2 ; -- <Chosen>[Tolv lyckliga] har [PLOCKATS UT]

		göra_anspråk_på_V2_Claim_ownership : V2 ; -- <Claimant>[vetenskapen] inte [GÖR ANSPRÅK PÅ] <Property>[en slutgiltig sanning]
		muta_in_V2_Claim_ownership : V2 ; -- <Claimant>[Vi] måste [MUTA IN] <Property>[vårt revir]

		skalka_V2_Closure : V2 ; -- <Agent>[jag] senare installerat mig ombord i god tid och [SKALKAT] <Container_portal>[luckorna]
		tillsluta_V2_Closure : V2 ; -- [TILLSLUTA] <Container_portal>[gränsen]
		fästa_ihop_V2_Closure : V2 ; -- [FÄST IHOP] <Containing_object>[degen]
		försegla_V2_Closure : V2 ; -- <Agent>[Guden Allah] beslutar sig för att [FÖRSEGLA] <Containing_object>[deras öron]
		korka_upp_V2_Closure : V2 ; -- <Containing_object>[flaskorna] [KORKAS UPP]

		reflektera_V_Cogitation : V ; -- <Cognizer>[han] aldrig [REFLEKTERAT] <Topic1.>[över]
		tänka_V_Cogitation : V ; -- [TÄNKTE] <Cognizer>[jag] ofta <Topic>[på dem]
		fråga_sig_VQ_Cogitation : VQ ; -- <Cognizer>[Man] kan [FRÅGA SIG] <Topic.>[hur den dagliga syrebristen påverkar barnens fysiska utveckling]
		tänka_över_VQ_Cogitation : VQ ; -- <Cognizer>[han] sitta och [TÄNKA ÖVER] <Topic>[hur han ska kunna bli en ny människa när han kommer ut]
		undra_VQ_Cogitation : VQ ; -- <Cognizer>[Hon] [UNDRADE] <Topic.>[vad hisspojken tänkte]
		tänka_VS_Cogitation : VS ; -- <Cognizer>[Svedberg] [TÄNKTE] <Topic.>[att han hade begått ett misstag]

		jobba_ihop_V_Collaboration : V ; -- <Partner_1>[Niclas] [JOBBAR IHOP] <Partner_2>[med dem]
		kooperera_V_Collaboration : V ; -- <Partner_1>[Hon] [KOOPERERADE] också <Partner_2>[med industriföretag i Venezuela , Hongkong , Tyskland och Finland ( Artek och Björneborgs Bomull )]
		samarbeta_V_Collaboration : V ; -- <Partner_1>[Hoppets Stjärna] [SAMARBETAR] också <Partner_2>[med organisationen Vacha Charitable Trust]
		samverka_V_Collaboration : V ; -- <Partner_1>[Teatern] skall [SAMVERKA] <Partner_2>[med utbildningsanstalterna] <Undertaking>[inom scenkonsternas och musikens område]
		stå_i_maskopi_V_Collaboration : V ; -- <Partner_1>[polismästaren som hade kontor mitt emot kyrkan] [STOD I MASKOPI] <Partner_2>[med Forell]
		arbeta_ihop_V_Collaboration : V ; -- <Partners>[vi] får [ARBETA IHOP]

		stöta_samman_V_Come_together : V ; -- <Party_1>[han] [STÖTTE SAMMAN] <Party_2>[med en och annan övrig udda existens]
		församlas_V2_Come_together : V2 ; -- <Individuals>[gestalterna] [FÖRSAMLAS]
		mötas_V2_Come_together : V2 ; -- <Individuals>[Östersjöländernas ministrar] ska [MÖTAS]
		trängas_V2_Come_together : V2 ; -- <Individuals>[sluminvånarna] [TRÄNGS]

		uppkomma_V_Coming_to_be : V ; -- [UPPKOMMER] <Entity>[figurornament]

		bestämma_V2_Coming_to_believe : V2 ; -- [BESTÄMMA] <Content>[nya signalkällor i de radarsystem för stridsledning och luftbevakning som Sovjetunionen byggde upp längs baltiska kusten]
		finna_VS_Coming_to_believe : VS ; -- <Cognizer>[Vi] har [FUNNIT] <Content>[att vissa mutationer och subtyper av viruset är kopplade till en något högre grad av skadeutveckling]
		tippa_VS_Coming_to_believe : VS ; -- <Cognizer>[Jag] [TIPPAR] <Content>[att det var svårare för 50-talets hemmafruar]
		lära_sig_VV_Coming_to_believe : VV ; -- <Cognizer>[jag] har [LÄRT MIG] <Content>[att inte oroa mig för saker som inte inträffat än]

		designa_V2_Coming_up_with : V2 ; -- [DESIGNAR] <Cognizer>[hon] <Idea>[sina nya kollektioner]
		dikta_ihop_V2_Coming_up_with : V2 ; -- <Cognizer>[42-åringen] [DIKTADE IHOP] <Idea>[en historia om hur främlingar hade rusat in i lägenheten och skjutit]
		kläcka_V2_Coming_up_with : V2 ; -- [KLÄCKA] <Idea>[höstens uppslag]
		upprätta_V2_Coming_up_with : V2 ; -- <Idea>[obligatoriska rivningsplaner] [UPPRÄTTAS]

		fynda_V2_Commerce_buy : V2 ; -- <Goods>[Byxorna] [FYNDADE] <Buyer>[jag]
		handla_V2_Commerce_buy : V2 ; -- <Buyer>[man] att [HANDLA] <Goods>[svenskt kött]
		köpa_V2_Commerce_buy : V2 ; -- <Buyer>[Jag] har [KÖPT] <Goods>[en resa]

		kränga_av_V_Commerce_sell : V ; -- <Goods>[Prylarna som stjäls] är att [KRÄNGA AV]
		saluföra_V2_Commerce_sell : V2 ; -- <Seller>[Företaget ekokul] [SALUFÖR] <Goods>[ekologiska leksaker som är gjord av majs]
		sälja_V2_Commerce_sell : V2 ; -- <Seller>[15-åringen] [SÅLDE] <Goods>[knark] <Buyer>[till andra ungdomar]
		avyttra_V2_Commerce_sell : V2 ; -- <Goods>[Innehavet] har [AVYTTRATS]

		svära_sig_V_Commitment : V ; -- [SVÄR SIG] <Speaker>[bolaget] <Message>[fritt från ansvar]
		svära_VS_Commitment : VS ; -- <Speaker>[Jag] [SVÄR] <Addressee>[inför Gud] <Message>[att jag inte har gjort det]
		utfästa_sig_VV_Commitment : VV ; -- <Speaker>[Börje Carlsson] ska [UTFÄSTA SIG] <Message>[att avstå från facklig verksamhet]

		föröva_V2_Committing_crime : V2 ; -- <Crime>[Mordet] [FÖRÖVADES]

		adressera_V2_Communication : V2 ; -- <Communicator>[Vi] måste [ADRESSERA] <Message>[våra krav]
		delge_V2_Communication : V2 ; -- <Communicator>[Mike] [DELGAV] <Message>[sin syn på produktionsstrategi]
		meddela_V2_Communication : V2 ; -- <Communicator>[EG-domstolen] [MEDDELADE] <Message>[sin dom i Laval-målet]
		meddela_VS_Communication : VS ; -- <Communicator>[Elisabeth] [MEDDELADE] <Message>[att lägget just nu är lugnt på lågstadiet]

		babbla_V_Communication_manner : V ; -- <Speaker>[Han] var förresten på radio häromveckan och [BABBLADE] <Topic>[om sin pensionärstillvaro]
		bryta_V_Communication_manner : V ; -- <Speaker>[Bartendern , som] [BRYTER]
		pladdra_V_Communication_manner : V ; -- <Speaker>[Hon] kunde ingen engelska men [PLADDRADE]
		sjunga_V_Communication_manner : V ; -- [SJÖNG] <Speaker>[hon]
		stamma_V_Communication_manner : V ; -- <Speaker>[Jag] [STAMMADE]
		artikulera_V2_Communication_manner : V2 ; -- <Speaker>[man som medborgare] kunna [ARTIKULERA] <Message>[kritik mot makten]
		sjunga_V2_Communication_manner : V2 ; -- <Speaker>[Bel Canto] [SJÖNG] <Message>[40-talsmusik]

		faxa_V_Communication_means : V ; -- <Communicator>[Han] [RINGDE] och [FAXADE] flera gånger om dagen <Addressee>[till kunder som han visste hade pengar]
		messa_V_Communication_means : V ; -- <Communicator>[hon] [MESSADE]
		ringa_V_Communication_means : V ; -- <Communicator>[Han] [RINGDE] och [FAXADE] flera gånger om dagen <Addressee>[till kunder som han visste hade pengar]
		faxa_V2_Communication_means : V2 ; -- [FAXA] <Message>[svaren] <Addressee>[till din läkare]

		skrika_VS_Communication_noise : VS ; -- <Speaker>[han] blev rädd , sprang ut och runt i trapphuset , bultade på alla dörrar och [SKREK] <Message>[att alla skulle gå ut]

		svara_V_Communication_response : V ; -- <Speaker>[Miljöpartiet] [SVARADE] <Trigger>[på frågor]
		replikera_VS_Communication_response : VS ; -- <Speaker>[en av entusiasterna] [REPLIKERADE] <Message>[att ' Det är inte bilen det är fel på - Det är träden .]
		svara_VS_Communication_response : VS ; -- <Speaker>[Hon] [SVARADE] <Message>[att han oftast åkte till henne på helgerna]

		förvandla_V2_Commutation : V2 ; -- <Executive_authority>[president Rutherford B. Hayes] [FÖRVANDLADE] <Original_punishment>[straffet]
		omvandla_V2_Commutation : V2 ; -- [OMVANDLADES] <Original_punishment>[straffet]

		passa_V_Compatibility : V ; -- <Item_1>[ett rödvin som] [PASSAR] <Item_2>[med älg,hjort,ren,oxe,får och grillspett]
		passa_ihop_V_Compatibility : V ; -- <Item_1>[föreställningarnas speltider] [PASSAR IHOP] <Item_2>[med skärgårdsfärjornas turlistor]
		matcha_V2_Compatibility : V2 ; -- <Item_1>[neutrala färger] [MATCHAS] <Item_2>[med starka och sprakande kulörer]

		tävla_V_Competition : V ; -- <Participants>[Deltagarna] [TÄVLADE] <Competition>[i tio grenar]
		konkurrera_V_Competition : V ; -- <Participant_1>[Sverige] har möjligheten att [KONKURRERA] <Participant_2>[med vem som helst]

		klaga_V_Complaining : V ; -- <Complainer>[folk] [KLAGA] <Complaint>[över att maten blivit dyr]
		gnöla_V_Complaining : V ; -- <Complainer>[de själva] <Topic>[ofta] [GNÖLAR] <Topic>[över sina egna tillkortakommanden]

		hålla_sig_V_Compliance : V ; -- [HÅLLA SIG] <Norm>[till de bestämmelser som finns]
		följa_V2_Compliance : V2 ; -- <Protagonist>[Varken svetsare eller arbetsledning] [FÖLJDE] <Norm>[reglerna för heta arbeten]
		överträda_V2_Compliance : V2 ; -- <Protagonist>[Den som] [ÖVERTRÄDER] <Norm>[förbudet]

		uppföra_sig_V_Conduct : V ; -- <Agent>[hon] [UPPFÖR SIG] <Manner>[taktfullt] och <Manner>[diplomatiskt]
		vara_V_Conduct : V ; -- <Agent>[Andy Warhol] [VAR] <Manner>[trevlig]

		bemöta_V2_Confronting_problem : V2 ; -- <Agent>[Ledningsgruppen] har ännu inte [BEMÖTT] <Issue>[kritiken]
		konfrontera_V2_Confronting_problem : V2 ; -- [KONFRONTERA] <Issue>[den]
		stå_inför_V2_Confronting_problem : V2 ; -- <Agent>[vi] att [STÅ INFÖR] <Issue>[några väldigt allvarliga utmaningar]
		ta_upp_V2_Confronting_problem : V2 ; -- <Agent>[jag] [TA UPP] <Issue>[problemet med Europaparlamentet]

		falla_V_Conquering : V ; -- <Theme>[staden] [FÖLL] <Conqueror>[för rebellerna]
		annektera_V2_Conquering : V2 ; -- <Conqueror>[Israel] [ANNEKTERADE] <Theme>[Golan]
		besätta_V2_Conquering : V2 ; -- [BESATTE] <Conqueror>[bataljonen] <Theme>[nya ställningar]
		erövra_V2_Conquering : V2 ; -- <Conqueror>[de ryska trupperna] [ERÖVRADE] <Theme>[byn]
		ta_i_besittning_V2_Conquering : V2 ; -- <Conqueror>[judiska kolonister] [TOG I BESITTNING] <Theme>[fyra byggnader]

		kontakta_V2_Contacting : V2 ; -- <Communicator>[Han] [KONTAKTAR] <Addressee>[polisen]

		innehålla_V2_Containing : V2 ; -- [INNEHÅLLER] <Contents>[fyra kapitel]
		rymma_V2_Containing : V2 ; -- <Container>[Reservoaren] [RYMMER] <Contents>[424 miljoner kubikmeter]

		komma_an_V_Contingency : V ; -- <Outcome>[det marknära ozonet] [KOMMER AN] <Determinant>[på utsläpp av svaveloxid ( SOx ) och lättflyktiga kolväten ( CxHx )]

		känna_sig_skyldig_V_Contrition : V ; -- <Experiencer>[min faster] [KÄNNER SIG SKYLDIG] <Action>[för att hon inte gjorde något för att rädda sin bror]

		accentuera_V2_Convey_importance : V2 ; -- <Medium>[publikationen] [ACCENTUERAR] <Message>[Östersjöns södra operationsområde]
		poängtera_V2_Convey_importance : V2 ; -- <Medium>[Shintoismen] ger trots allt inga etiska eller moraliska regler för hur man skall fungera , utan [POÄNGTERAR] <Message>[ärlighet och själens renhet samt människans kontakt med naturen]
		framhålla_V2_Convey_importance : V2 ; -- <Speaker>[Jag] [FRAMHÖLL] <Message>[betydelsen av att arbetsledare lever som de lär]
		framhålla_VS_Convey_importance : VS ; -- <Speaker>[du] att [FRAMHÅLLA] <Message>[att det barn som tog provet var ditt och Mr Johnson var inte pojkens far]
		poängtera_VS_Convey_importance : VS ; -- <Speaker>[Han] [POÄNGTERAR] <Message>[att teatern är mer än skådespelare och regissörer]
		understryka_VS_Convey_importance : VS ; -- [UNDERSTRYKER] <Speaker>[både Soikkeli och Lagerroos] <Message>[att Åbosmygaren hittills betett sig relativt ofarligt]
		understryka_V2_Convey_importance : V2 ; -- <Message>[Känslan av tidlöshet] [UNDERSTRYKS] också <Medium>[av dräkterna ( Tuomas Lampinen ) , som ibland för tankarna till Shakespeares kungadramer snarare än till Tjechovs 1904]

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
		leda_V2_Cotheme : V2 ; -- <Theme>[Han] [LEDDE] <Cotheme>[barnet] <Goal>[till kunskap]
		eskortera_V2_Cotheme : V2 ; -- <Theme>[Två bilar från gruvbolaget] [ESKORTERADE] <Cotheme>[journalisterna] <Source>[bort från området]

		korsförhöra_V2_Court_examination : V2 ; -- [KORSFÖRHÖRT] <Witness>[åklagarens vittnen]

		dreja_V2_Create_physical_artwork : V2 ; -- <Creator>[Krukmakaren] [DREJAR] <Representation>[krukor] , <Representation>[fat] och <Representation>[andra föremål] <Instrument.>[på en drejskiva]
		måla_V2_Create_physical_artwork : V2 ; -- <Creator>[Han] har börjat [MÅLA] <Representation>[Bell von Wendens självportätt]
		rita_V2_Create_physical_artwork : V2 ; -- <Creator>[Jag] [RITADE] <Representation>[bilden]
		teckna_V2_Create_physical_artwork : V2 ; -- <Creator>[jag] fortsatte att [TECKNA] <Representation>[hans porträtt]

		avbilda_V2_Create_representation : V2 ; -- <Creator>[Goya] [AVBILDAR] <Represented>[honom]
		måla_av_V2_Create_representation : V2 ; -- <Creator>[Jag] hade [MÅLAT AV] <Represented>[henne]
		porträttera_V2_Create_representation : V2 ; -- <Creator>[Gustav] [PORTRÄTTERAR] <Represented>[sig själv]

		frambringa_V2_Creating : V2 ; -- <Cause>[evolutionen] [FRAMBRINGAT] <Created_entity>[ett medfött så kallad anknytningssystem]
		ge_V2_Creating : V2 ; -- <Cause>[Träden] [GER] <Created_entity>[frukt]
		skapa_V2_Creating : V2 ; -- <Cause>[En jordbävning] [SKAPAR] <Created_entity>[flodvågor som tar över 300 000 människors liv i Sydasien]
		sätta_ihop_V2_Creating : V2 ; -- <Creator>[4 tjejer] [SÄTTER IHOP] <Created_entity>[ett lag]

		undersöka_V2_Criminal_investigation : V2 ; -- <Investigator>[Polisen som] [UNDERSÖKER] <Incident>[mordet]
		utreda_V2_Criminal_investigation : V2 ; -- <Investigator>[Polisen] [UTREDER] <Incident>[händelsen]

		hugga_V2_Cutting : V2 ; -- <Agent>[kvinnor] [HUGGER] <Item>[ved]
		klippa_ner_V2_Cutting : V2 ; -- <Agent>[jag] [KLIPPA NER] <Item>[syrenhäcken]
		sönderdela_V2_Cutting : V2 ; -- [SÖNDERDELAR] <Item>[materialet]
		toppa_V2_Cutting : V2 ; -- <Agent>[Hon] skulle bara [TOPPA] <Item>[mitt långa hår]

		vandalisera_V2_Damaging : V2 ; -- <Agent>[Två killar] [VANDALISERAR] <Patient>[en bil]

		våga_sig_på_V2_Daring : V2 ; -- <Agent>[Bush] [VÅGADE SIG PÅ] <Action>[en öppning mot Kuba]
		ta_risken_VV_Daring : VV ; -- <Agent>[Båda parter] [TAR RISKEN] <Action>[att gå i en fälla]
		våga_sig_på_VV_Daring : VV ; -- <Agent>[Upplands Väsby kommun] hade tillsammans med ABF [VÅGAT SIG PÅ] <Action>[att anordna ett utomhusarrangemang]

		avsomna_V_Death : V ; -- [AVSOMNADE] <Protagonist>[fru Emilia Petersen]
		dö_V_Death : V ; -- <Protagonist>[Urkyrkans martyrer] [DOG]
		dö_ut_V_Death : V ; -- <Protagonist>[Arten] [DOG UT]
		gå_bort_V_Death : V ; -- <Protagonist>[Hans morfar] [GICK BORT]
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

		förinta_V2_Destroying : V2 ; -- <Cause>[en kvark och en antikvark] [FÖRINTAR] <Undergoer>[varandra]
		spränga_i_luften_V2_Destroying : V2 ; -- <Destroyer>[Vi] [SPRÄNGER I LUFTEN] <Undergoer>[Berlin och Moskva]
		tillintetgöra_V2_Destroying : V2 ; -- <Destroyer>[de] kan [TILLINTETGÖRA] <Undergoer>[varandra]
		jämna_med_marken_V2_Destroying : V2 ; -- <Undergoer>[städerna Loren och Manatuto] hade [JÄMNATS MED MARKEN]

		kapa_av_V2_Detaching : V2 ; -- <Agent>[vi] [KAPAR AV] <Item>[benen] <Source>[på älgarna] <Time.>[innan vi dödar dom]
		lösgöra_V2_Detaching : V2 ; -- <Agent>[en korkliknande grej] for iväg uppför en stålbana och [LÖSGJORDE] <Item>[en anordning]
		kapa_V2_Detaching : V2 ; -- <Item>[vrakets överbyggnad] [KAPADES] <Result.>[bort]

		häkta_V2_Detaining : V2 ; -- <Authorities>[man] [HÄKTAR] <Suspect>[en tidigare ostraffad 15-åring]

		urskilja_V2_Differentiation : V2 ; -- <Cognizer>[Brå] bär sig åt för att [URSKILJA] <Phenomena>[de riktiga svenskarna]
		skilja_åt_V2_Differentiation : V2 ; -- <Phenomena>[lagen] [SKILJAS ÅT]

		beströ_V2_Dispersal : V2 ; -- [BESTRÖ] <Individuals>[de döda]
		sprida_ut_V2_Dispersal : V2 ; -- <Agent>[Arrangerande Nilsby spelmän i Pargas] har också [SPRITT UT] <Individuals>[evenemangen]

		sidsteppa_V2_Dodging : V2 ; -- <Dodger>[Staten Israel] tar sig rätten att [SIDSTEPPA] <Bad_entity>[internationell lag]

		dominera_V2_Dominate_competitor : V2 ; -- <Agent>[de] [DOMINERA] <Patient>[sin omvärld]

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

		tjäna_V_Earnings_and_losses : V ; -- <Earner>[Det finns personer som] [TJÄNAT] <Earnings>[tusentals euro]
		förlora_V2_Earnings_and_losses : V2 ; -- [FÖRLORADE] <Earnings>[stora pengar]
		göra_V2_Earnings_and_losses : V2 ; -- <Earner>[man] [GÖRA] <Earnings>[pengar]
		tjäna_V2_Earnings_and_losses : V2 ; -- <Earner>[Kajander] inte [TJÄNAR] <Earnings>[några pengar]

		avskärma_V_Eclipse : V ; -- <Eclipsed>[Allt] [AVSKÄRMAT] <Obstruction>[med en radda stora reklamskyltar]
		gömma_sig_V_Eclipse : V ; -- <Eclipsed>[solen] [GÖMMA SIG] <Obstruction>[bakom molnen]
		blockera_V2_Eclipse : V2 ; -- <Obstruction>[MetLife Building] [BLOCKERAR] <Eclipsed>[utsikten längs Park Avenue]
		skymma_V2_Eclipse : V2 ; -- <Obstruction>[du] stå i ljuset för att [SKYMMA] <Eclipsed>[dig själv]
		förmörka_V2_Eclipse : V2 ; -- <Eclipsed>[solen] [FÖRMÖRKADES]

		studera_V_Education_teaching : V ; -- <Student>[Han] har licentiatexamen från Kungliga Tekniska högskolan i polymerteknik och [STUDERAR] <Qualification>[till doktorsexamen]
		lära_upp_V2_Education_teaching : V2 ; -- <Teacher>[han] [LÄRDE UPP] <Student>[Tompa] <Role>[till telegrafoperatör]

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
		glädja_sig_V_Emotions_of_mental_activity : V ; -- [GLÄDJA SIG] <Stimulus>[åt inrättandet av detta nya europeiska solidaritetsinstrument]
		njuta_V_Emotions_of_mental_activity : V ; -- <Experiencer>[jag] [NJUTA] <Stimulus>[av livet]

		anställa_V2_Employing : V2 ; -- <Employer>[Saab] [ANSTÄLLER] <Employee>[100 arbetare]

		frosta_V_Emptying : V ; -- [AVFROSTA] <Source>[bilens rutor]
		avlusa_V2_Emptying : V2 ; -- <Agent>[man] dessutom [AVLUSA] <Source>[kläderna]
		duka_av_V2_Emptying : V2 ; -- <Agent>[Servitörerna] [DUKADE AV] <Source>[de tomma borden]
		tömma_V2_Emptying : V2 ; -- <Agent>[Jag] [TÖMMER] <Source>[hårddisken] <Theme>[på bilder]
		ösa_V2_Emptying : V2 ; -- <Agent>[Isabelle] tryckte in knappen till nödsändaren som registreras via satellit och började [ÖSA] <Source>[båten]
		frosta_V2_Emptying : V2 ; -- <Source>[bilrutorna] [AVFROSTAS]
		göra_ren_V2_Emptying : V2 ; -- <Source>[cykelbanan som] [GJORDES REN] <Theme>[från snö]
		kalhugga_V2_Emptying : V2 ; -- <Source>[Skogar] [KALHUGGS]

		formulera_sig_V_Encoding : V ; -- [FORMULERA MIG] <Manner>[försiktigt]
		uttrycka_V_Encoding : V ; -- [UTTRYCKA] <Message>[tanken] <Manner>[indirekt]
		formulera_V2_Encoding : V2 ; -- [FORMULERAS] <Message>[idén om nationen] <Manner>[i allra högsta grad]

		riskera_V2_Endangering : V2 ; -- <Agent>[Kapitalägaren] har gjort uppoffringar genom att [RISKERA] <Valued_entity>[sitt sparande för nyttiga projekt]
		vedervåga_V2_Endangering : V2 ; -- <Agent>[hon] [VEDERVÅGAR] <Valued_entity>[det liv hon bär under sitt hjärta]
		sätta_för_fara_V2_Endangering : V2 ; -- <Valued_entity>[de] kan [UTSÄTTAS FÖR FARA]

		genomdriva_V2_Enforcing : V2 ; -- <Agent>[man] [GENOMDREV] <Rule>[lagen]
		genomföra_V2_Enforcing : V2 ; -- <Agent>[Pierre Trudeau] till att [GENOMFÖRA] <Rule>[lagar]
		tvinga_fram_V2_Enforcing : V2 ; -- <Agent>[studentgrupper] [TVINGAT FRAM] <Rule>[regler som hindrar universiteten från att investera sina pensionspengar i företag som är verksamma i Sudan utan en strategi för hur man ska hantera Darfur]

		förklara_sig_V_Entering_of_plea : V ; -- <Accused>[Han] [FÖRKLARADE SIG] <Plea>[oskyldig] <Charges>[till anklagelserna]

		rymma_V_Escaping : V ; -- <Escapee>[De] [RYMMER] <Undesirable_location>[från sjukhuset]

		hålla_för_sannolikt_VS_Estimating : VS ; -- <Cognizer>[Han] [HÖLL FÖR SANNOLIKT] <Estimation>[att huvudvärken i början orsakades av läkemedlet]
		hållas_för_sannolikt_VS_Estimating : VS ; -- [HÅLLAS FÖR SANNOLIKT] <Estimation>[att patienten verkligen fick information]

		komma_undan_V_Evading : V ; -- <Evader>[Båda] lyckas [KOMMA UNDAN] <Pursuer>[från sin förföljare]
		gäcka_V2_Evading : V2 ; -- <Evader>[Själva rånarna] har dock [GÄCKAT] <Pursuer>[polisen]
		hålla_sig_undan_V2_Evading : V2 ; -- <Evader>[de] [HÖLL SIG UNDAN] <Pursuer>[förföljarna]
		komma_undan_V2_Evading : V2 ; -- <Evader>[Han] [KOM UNDAN] <Pursuer>[överfallet]
		undkomma_V2_Evading : V2 ; -- <Evader>[han] skulle [UNDKOMMA] <Pursuer>[sina förföljare]

		gå_upp_V_Evaluative_comparison : V ; -- <Profiled_item>[Inget] [GÅR UPP] <Standard_item>[mot en häst som buffar en i magen och vill bli krafsad och blåser varm luft i ens ansikte]
		mäta_sig_V_Evaluative_comparison : V ; -- <Profiled_item>[ingen av svenskarna] kan [MÄTA SIG] <Attribute>[bilmässigt] <Standard_item>[med norrmannen]

		gå_V_Event : V ; -- <Event>[Sista föreställningen] [GÅR] <Place>[på Bergakungen] <Time>[på onsdag 3 / 2 kl 10.00]
		gå_av_stapeln_V_Event : V ; -- <Event>[Den stora festkonserten] [GICK AV STAPELN] <Time>[i går]
		gå_fram_V_Event : V ; -- <Event>[en tornado] [GÅTT FRAM]
		slå_in_V_Event : V ; -- <Event>[Drömmen] [SLOG IN]
		stå_V_Event : V ; -- <Event>[De hårdaste striderna] [STOD] <Place>[vid Surabaya]
		inträffa_V2_Event : V2 ; -- <Event>[Händelsen] [INTRÄFFADE] <Time>[1941] <Place>[utanför Marstrand]
		äga_rum_V2_Event : V2 ; -- <Event>[Föreställningen] [ÄGER RUM] <Time>[16-18 mars klockan 1900] <Place>[på Teater Giljotin i Stockholm]

		bestyrka_V2_Evidence : V2 ; -- <Support>[Dessa uppgifter] [BESTYRKER] <Proposition>[de klara tendenserna till en ökning av rattfylleriet som avspeglas i antalet anmälningar]
		påvisa_V2_Evidence : V2 ; -- <Support>[studier som] [PÅVISAR] <Proposition>[ett samband mellan vistelse i simhallar som renar med klor och ökad andel luftvägsbesvär pga av kloraminer]
		styrka_V2_Evidence : V2 ; -- <Support>[Nya rön] [STYRKER] <Proposition>[SBU:s slutsatser om östrogen]
		bekräfta_VQ_Evidence : VQ ; -- <Support>[Beslutet] [BEKRÄFTAR] bara <Proposition>[hur svårt det är att hantera de här frågorna som rör EU-medborgares rätt till hjälp i vissa fall]
		visa_VQ_Evidence : VQ ; -- <Support>[Testerna] [VISAR] <Proposition>[hur mycket alkohol man dricker]
		visa_VS_Evidence : VS ; -- <Support>[Statistiken] [VISAR] <Proposition>[att priserna står still just nu]

		påminna_V2_Evoking : V2 ; -- <Stimulus>[en religiös staty] som ska [PÅMINNA] <Cognizer>[dem] <Phenomenon>[om deras döda förfäder]

		byta_V2_Exchange : V2 ; -- <Exchanger_1>[hon] varken gran eller smällkarameller och [BYTER] inte <Themes>[julklappar] <Exchanger_2>[med någon]

		exkommunicera_V2_Exclude_member : V2 ; -- <Authority>[holländska judar] [EXKOMMUNICERADE] <Member;>[Spinoza]

		spy_V2_Excreting : V2 ; -- <Excreter>[Han] [SPYDDE] <Excreta>[blod]

		genomföra_V2_Execute_plan : V2 ; -- <Agent>[regeringen] [GENOMFÖRDE] <Plan>[politiken]
		implementera_V2_Execute_plan : V2 ; -- <Agent>[moderaterna] [IMPLEMENTERAR] <Plan>[den politik de egentligen tror på]

		avrätta_V2_Execution : V2 ; -- <Executed>[fler än 750 fångar] [AVRÄTTATS]
		hänga_V2_Execution : V2 ; -- [HÄNGDES] <Executed>[en 16-årig utvecklingsstörd flicka] <Executioner>[av domaren själv]

		existera_V_Existence : V ; -- <Entity>[världen] [EXISTERAR]
		finnas_V2_Existence : V2 ; -- <Entity>[Det Moderna Museet] [FINNS]

		ana_VQ_Expectation : VQ ; -- [ANADE] <Cognizer>[han] <Phenomenon>[vad han skulle ställa till med]
		förutse_VS_Expectation : VS ; -- [FÖRUTSES] <Phenomenon>[att medlemsstaterna skall vidta alla åtgärder som står till buds för att se till att lämplig hjälp ges till offrens anhöriga , och om möjligt tillämpa rambeslutets artikel 4 om bestämmelser för offren i brottmålsprocessen]

		stå_V_Expensiveness : V ; -- <Goods>[aktien] [STÅR] <Asset>[i 472 kronor]

		bryta_V2_Experience_bodily_harm : V2 ; -- <Experiencer>[Han] [BRÖT] <Body_part>[sin arm]
		skada_V2_Experience_bodily_harm : V2 ; -- <Experiencer>[Han] har [SKADAT] <Body_part>[handen]

		avguda_V2_Experiencer_focus : V2 ; -- <Experiencer>[Bert Karlsson] är inte <Experiencer>[mannen som] [AVGUDAR] <Content>[de byråkratiska , utdragna diskussionerna]
		älska_V2_Experiencer_focus : V2 ; -- <Experiencer>[Jag] [ÄLSKAR] <Content>[komplimanger]

		förblinda_V_Experiencer_obj : V ; -- <Stimulus>[Rockdrömmar] [FÖRBLINDAR]
		lena_V_Experiencer_obj : V ; -- <Stimulus>[Avocadopurén] [LENADE]
		slå_an_V_Experiencer_obj : V ; -- <Stimulus>[idén] [SLAGIT AN] <Experiencer>[på mig]
		tillintetgöra_V_Experiencer_obj : V ; -- <Stimulus>[ett skällsord , som] effektivt används för att [TILLINTETGÖRA] <Experiencer>[civilt och fackligt engagemang]
		drabba_V2_Experiencer_obj : V2 ; -- <Stimulus>[en bok som] har [DRABBAT] <Experiencer>[mig]
		egga_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Hennes passivitet] [EGGADE UPP] <Experiencer>[honom]
		fånga_V2_Experiencer_obj : V2 ; -- [FÅNGA] <Experiencer>[en publik]
		förgöra_V2_Experiencer_obj : V2 ; -- <Stimulus>[Det förflutna] hotar att [FÖRGÖRA] <Experiencer>[honom]
		golva_V2_Experiencer_obj : V2 ; -- <Stimulus>[de] [GOLVADE] <Experiencer>[mig]
		hetsa_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Sådana händelser] [HETSAR UPP] <Experiencer>[folk]
		irritera_V2_Experiencer_obj : V2 ; -- <Stimulus>[en sådan skattehöjning] skulle [IRRITERA] <Experiencer>[människor]
		jaga_upp_V2_Experiencer_obj : V2 ; -- <Stimulus>[Vi] [JAGAR UPP] <Experiencer>[varandra]
		kittla_V2_Experiencer_obj : V2 ; -- [KITTLAR] <Stimulus>[de] <Experiencer>[publiken]
		lamslå_V2_Experiencer_obj : V2 ; -- <Stimulus>[Den ekonomiska oron] [LAMSLÅR] <Experiencer>[marknaden för Volvos försäljning av lastbilar]
		lugna_V2_Experiencer_obj : V2 ; -- <Stimulus>[Löften] ska [LUGNA] <Experiencer>[protestanterna]
		plåga_V2_Experiencer_obj : V2 ; -- <Stimulus>[Affären] [PLÅGAR] <Experiencer>[regeringen]
		rubba_V2_Experiencer_obj : V2 ; -- <Stimulus>[Sånt] [RUBBAR] inte <Experiencer>[en härdad tågpendlare]
		röra_V2_Experiencer_obj : V2 ; -- <Stimulus>[Lipims lojalitet] [RÖRDE] <Experiencer>[honom]
		skaka_V2_Experiencer_obj : V2 ; -- <Stimulus>[En falsk ryktesspridning] [SKAKADE] <Experiencer>[honom]
		slå_ner_V2_Experiencer_obj : V2 ; -- <Stimulus>[Men denna vetskap] räcker just då inte till för att [SLÅ NER] <Experiencer>[hans mod]
		stilla_V2_Experiencer_obj : V2 ; -- <Stimulus>[Pingisklubben] [STILLAR] <Experiencer>[vår nostalgiska längtan]
		reta_V2S_Experiencer_obj : V2S ; -- [RETAR] <Experiencer>[honom] <Stimulus>[att han inte lyckats lokalisera tio nålar som getts ut av några klubbar i Göteborg]
		egga_V2_Experiencer_obj : V2 ; -- <Experiencer>[Fantasin] [EGGAS] <Stimulus>[av medeltida dans , sång och musik]
		frappera_VS_Experiencer_obj : VS ; -- [FRAPPERADES] <Experiencer>[hon] av <Stimulus>[att frimärkena var mycket modernare och roligare]

		förklara_VQ_Explaining_the_facts : VQ ; -- <Fact>[Resultaten] [FÖRKLARAR] <Question>[varför så få djurarter är asymmetriska]
		reda_ut_VQ_Explaining_the_facts : VQ ; -- [REDA UT] <Question>[hur vi tänker]

		utskeppa_V2_Exporting : V2 ; -- <Exporter>[Köpehandelskompaniet] inrättades 1614 och fick privilegier , skepp och kanoner av Gustav II Adolf och skulle ensamt ha rätt att köpa och [UTSKEPPA] <Goods>[all råkoppar]
		exportera_V2_Exporting : V2 ; -- <Goods>[Lingonets läromedel] [EXPORTERAS] <Importing_area>[till tiotals länder runtom i världen]

		klä_i_ord_V2_Expressing_publicly : V2 ; -- <Communicator>[Han] har [KLÄTT I ORD] <Content>[det jag känner om dagens samhälle och vad som är fel i det]
		lufta_V2_Expressing_publicly : V2 ; -- [LUFTA] <Content>[våra tankar kring detta]
		ventilera_V2_Expressing_publicly : V2 ; -- <Communicator>[Båda parterna] måste åtminstone ha rätt att [VENTILERA] <Content>[sina främsta krav]

		utlämna_V2_Extradition : V2 ; -- [UTLÄMNA] <Suspect>[honom] <Crime_jurisdiction>[till USA]

		känna_V2_Familiarity : V2 ; -- <Cognizer>[Jag] [KÄNNER] <Entity>[Eva]
		känna_till_V2_Familiarity : V2 ; -- <Cognizer>[Amerikanska musiker] brukar inte [KÄNNA TILL] <Entity>[europeiska musiker]

		känna_sig_V_Feeling : V ; -- <Experiencer>[Han] [KÄNNER SIG] <Emotional_state>[hotad]
		uppleva_V2_Feeling : V2 ; -- [UPPLEVA] <Emotion>[den känslan]

		simulera_V2_Feigning : V2 ; -- <Agent>[man] [SIMULERA] <State_of_affairs>[stor smärta]

		fylla_V2_Filling : V2 ; -- <Agent>[Tillskärarakademin] [FYLLER] <Goal>[salarna]
		slå_in_V2_Filling : V2 ; -- <Agent>[De] skall [SLÅ IN] <Goal>[en flaska] <Theme>[i julklappspapper]
		proppa_V2_Filling : V2 ; -- [PROPPA] <Goal>[i dig] <Theme>[massor]
		stryka_V2_Filling : V2 ; -- [STRYKA] <Theme>[färgen]

		leda_V2_Finish_competition : V2 ; -- <Competitor>[Sverige] [LEDER] <Competition>[matchen]
		vinna_V2_Finish_competition : V2 ; -- <Competitor>[De] [VANN] <Competition>[bortamötet] <Opponent>[mot Polisen]

		förlora_V_Finish_game : V ; -- <Player>[svenskar] [FÖRLORAR]
		vinna_V_Finish_game : V ; -- <Player>[Syd] [VANN]

		friställa_V2_Firing : V2 ; -- <Employer>[De] [FRISTÄLLER] <Employee>[anställda]
		säga_upp_V2_Firing : V2 ; -- <Employer>[hans statligt drivna företag , som] [SADE UPP] <Employee>[honom]

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

		dra_ihop_V2_Gathering_up : V2 ; -- <Agent>[jag] ska försöka [DRA IHOP] <Aggregate>[ett gäng]
		sammankalla_V2_Gathering_up : V2 ; -- <Agent>[Gud] tröttnat på allt elände i världen och har därför [SAMMANKALLAT] <Aggregate>[ett möte]
		båda_upp_V2_Gathering_up : V2 ; -- <Agent>[Myndigheten] och [BÅDADE UPP] <Individuals>[såna gubbar som en gång hade bestrålat ungdomen med sin bildning]
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

		skaffa_fram_V2_Getting : V2 ; -- <Recipient>[vi] [SKAFFAR FRAM] <Theme>[medel]
		skaffa_sig_V2_Getting : V2 ; -- <Recipient>[Kommunerna] måste [SKAFFA SIG] <Theme>[överblick över all barn- och ungdomsverksamhet]
		säkra_V2_Getting : V2 ; -- <Recipient>[partiet] har [SÄKRAT] <Theme>[ett mandat]

		köra_ut_V2_Getting_vehicle_underway : V2 ; -- <Driver>[Vi] [KÖRDE UT] <Vehicle>[båten]

		donera_V2_Giving : V2 ; -- <Donor>[Sveriges riksbank] firade 300-årsjubileum år 1968 genom att [DONERA] <Theme>[en stor summa pengar] <Recipient>[till Nobelstiftelsen]
		ge_V2_Giving : V2 ; -- <Donor>[Hon] [GAV] <Theme>[pengar] <Recipient>[till folk som verkligen förtjänade pengarna !]
		ägna_V2_Giving : V2 ; -- <Donor>[Sonen Gustaf] kom att [ÄGNA] <Theme>[sitt liv]

		fälla_ihop_sig_V_Go_into_shape : V ; -- <Theme>[Blommorna som] vecklar ut sig i sol och [FÄLLER IHOP SIG]
		krusa_sig_V_Go_into_shape : V ; -- <Theme>[Vattnet] [KRUSAR SIG]
		kröka_sig_V_Go_into_shape : V ; -- <Theme>[Den djupa bukten som] [KRÖKER SIG]
		locka_sig_V_Go_into_shape : V ; -- <Theme>[Det svarta håret] [LOCKADE SIG]
		rulla_ihop_sig_V_Go_into_shape : V ; -- <Theme>[det kloka djuret] svarade inte , gav mig bara ett överseende ögonkast och [RULLADE IHOP SIG]
		räta_sig_V_Go_into_shape : V ; -- <Theme>[Ryggen] [RÄTADE SIG]
		vika_ihop_sig_V_Go_into_shape : V ; -- <Theme>[Han] [VIKER IHOP SIG]

		backa_V_Going_back_on_a_commitment : V ; -- <Protagonist>[Regeringen] har inte [BACKAT] <Commitment>[från löften man gett tidigare]

		greppa_V2_Grasp : V2 ; -- <Cognizer>[Ojanen och Jalonen] säger sig [GREPPA] <Phenomenon>[historien]
		uppfatta_V2_Grasp : V2 ; -- <Cognizer>[De flesta] har [UPPFATTAT] <Phenomenon>[honom som Carl I Hagens kronprins]
		förstå_VQ_Grasp : VQ ; -- <Cognizer>[De flesta föräldrar] [FÖRSTÅR] <Phenomenon>[hur situationen ser ut]

		tugga_V_Grinding : V ; -- [TUGGA] <Undergoer>[varje tugga]
		pulvrisera_V2_Grinding : V2 ; -- [PULVRISERA] <Undergoer>[stenblock]
		smula_sönder_V2_Grinding : V2 ; -- <Grinder>[Hon] [SMULAR SÖNDER] <Undergoer>[askan]

		borsta_V2_Grooming : V2 ; -- <Agent>[Liam] [BORSTAR] <Body_part>[tänderna]
		tvätta_V2_Grooming : V2 ; -- [TVÄTTADE] <Body_part>[håret]
		två_V2_Grooming : V2 ; -- <Agent>[Jag] [TVÅR] <Body_part>[mina händer]

		göra_halt_V_Halt : V ; -- <Theme>[Gaffeln med tomatbiten] [GÖR HALT]
		stanna_V_Halt : V ; -- <Theme>[Kvinnan] [STANNADE]
		stanna_till_V_Halt : V ; -- <Theme>[Ett tåg] hade [STANNAT TILL]
		stanna_upp_V_Halt : V ; -- <Theme>[den enda som] [STANNAR UPP]

		höra_V_Hear : V ; -- <Hearer>[unge Magnus] [HÖRDE] <Topic>[om svårigheterna att infånga statsrådet Andersson för intervju]
		höra_V2_Hear : V2 ; -- [HÖR] <Hearer>[poliserna] <Message>[ett klonkande ljud bakom mannen]
		höra_VS_Hear : VS ; -- <Hearer>[Jag] [HÖRDE] <Message>[att det var nåt strul med hustrun]

		dölja_V2_Hiding_objects : V2 ; -- <Agent>[Han] [DÖLJER] <Hidden_object>[sitt ansikte]
		gömma_V2_Hiding_objects : V2 ; -- <Agent>[Max] [GÖMMER] <Hidden_object>[25 000 pund från en kupp i London] <Hiding_place>[i en ananasburk]
		maskera_V2_Hiding_objects : V2 ; -- <Agent>[Angelo] [MASKERAR] inte <Hidden_object>[sina känslor]
		skymma_V2_Hiding_objects : V2 ; -- <Agent>[Han] [SKYMMER] <Hidden_object>[utsikten]

		hindra_V2_Hindering : V2 ; -- <Hindrance>[Lördagens hällregn] [HINDRADE] inte <Protagonist>[besökarna] <Action>[på helgens auktion]
		hämma_V2_Hindering : V2 ; -- <Hindrance>[det] [HÄMMAR] <Action>[utvecklingen]

		leja_V2_Hiring : V2 ; -- <Employer>[Utblottade fastighetsägare] [LEJDE] <Employee>[folk som brände ner deras hus]

		bråka_V_Hostile_encounter : V ; -- <Sides>[Flera män] [BRÅKAR]

		fiska_V_Hunting : V ; -- [FISKADE] <Hunter>[han]
		jaga_V_Hunting : V ; -- [JAGAR] <Hunter>[vithajarna]

		apa_efter_V2_Imitating : V2 ; -- <Agent>[de] [APAR EFTER] <Standard>[oss]
		efterlikna_V2_Imitating : V2 ; -- <Agent>[Vi] har försökt [EFTERLIKNA] <Standard>[originalen]

		bura_in_V2_Immobilization : V2 ; -- <Agent>[han] vill [BURA IN] <Patient>[folk]

		landa_V_Impact : V ; -- <Impactor>[En av granaterna] [LANDADE] <Impactee>[på bordet]
		plöja_in_V_Impact : V ; -- <Impactor>[det] [PLÖJDE IN] <Impactee>[i en bil]
		slå_V_Impact : V ; -- <Impactor>[vågorna] [SLOG] <Impactee>[mot hennes dörr]
		slå_ner_V_Impact : V ; -- <Impactor>[Den granaten] [SLOG NER]
		smattra_V_Impact : V ; -- <Impactor>[Åskregnen som] [SMATTRAR] <Impactee>[mot glastaket]
		snärta_V_Impact : V ; -- <Impactor>[tungan] [SNÄRTAR] <Impactee>[mot gommen]
		ta_V_Impact : V ; -- <Impactor>[bollen] [TOG]
		ramma_V2_Impact : V2 ; -- <Impactor>[Båten] [RAMMADE] <Impactee>[ett betongfundament]
		träffa_V2_Impact : V2 ; -- <Impactor>[Kulan] [TRÄFFADE] <Impactee>[eleven]

		ha_V2_Inclusion : V2 ; -- <Total>[Staden] [HAR] <Part>[12 universitet]
		omfatta_V2_Inclusion : V2 ; -- <Total>[TT:s dragningslista] [OMFATTAR] <Part>[vinster t o m 10 000 kronor]
		uppta_V2_Inclusion : V2 ; -- <Total>[Rollistan] [UPPTAR] <Part>[35 namn]

		peka_ut_V2_Indicating : V2 ; -- <Communicator>[hon] inte [PEKA UT] <Unresolved_referent>[någon favoritchoklad]

		röka_V2_Ingest_substance : V2 ; -- <Ingestor>[Han] [RÖKER] <Delivery_device>[cigaretter]
		använda_V2_Ingest_substance : V2 ; -- <Ingestor>[man] [ANVÄNDER] <Substance>[kokain]
		bruka_V2_Ingest_substance : V2 ; -- <Ingestor>[De som] [BRUKAR] <Substance>[alkohol och tobak]
		sniffa_V2_Ingest_substance : V2 ; -- <Ingestor>[Jag] [SNIFFADE] <Substance>[kokain]
		inta_V2_Ingest_substance : V2 ; -- <Substance>[Kokain] [INTAS]

		hugga_in_V_Ingestion : V ; -- <Ingestor>[Annie Wegelius] [HUGGER IN] <Ingestibles>[på en korv med bröd]
		äta_V_Ingestion : V ; -- <Ingestor>[Människor] och <Ingestor>[djur] [ÄTER]
		dricka_V_Ingestion : V ; -- <Ingestibles>[man] [DRICKER]
		dricka_V2_Ingestion : V2 ; -- <Ingestor>[Vi] [DRICKER] <Ingestibles>[mjölk]
		ha_V2_Ingestion : V2 ; -- <Ingestor>[jag] hungrig och vill [HA] <Ingestibles>[lunch]
		äta_V2_Ingestion : V2 ; -- <Ingestor>[Svenskarna] [ÄTER] <Ingestibles>[17 kilo godis]
		inta_V2_Ingestion : V2 ; -- <Ingestibles>[vitlök] , liksom allt annat , [INTAS]

		fjättra_V_Inhibit_movement : V ; -- <Theme>[De riktigt stora kryssningsfartygen med de riktigt stora plånböckerna ombord] förblir [FJÄTTRADE] <Holding_location>[vid Skandiahamnens kajer]
		hålla_fast_V2_Inhibit_movement : V2 ; -- <Agent>[Han] [HÖLL FAST] <Theme>[honom]
		kvarhålla_V2_Inhibit_movement : V2 ; -- <Agent>[En väktare] [KVARHÅLLER] <Theme>[en man beväpnad med pepparspray]
		uppehålla_V2_Inhibit_movement : V2 ; -- <Agent>[Jag] [UPPEHÖLL] <Theme>[honom]

		mönstra_V2_Inspecting : V2 ; -- <Inspector>[Man] började att [MÖNSTRA] <Ground>[hundar]
		titta_till_V2_Inspecting : V2 ; -- <Inspector>[brandkåren i Rjukan som] [TITTAR TILL] <Ground>[anläggningen]
		visitera_V2_Inspecting : V2 ; -- <Inspector>[Polis] och <Inspector>[ordningsvakter] får då [VISITERA] <Ground>[besökare]
		kroppsvisitera_V2_Inspecting : V2 ; -- <Ground>[Tjejerna] [KROPPSVISITERADES] <Inspector>[av en kvinna]
		läkarundersöka_V2_Inspecting : V2 ; -- <Ground>[Kvinnan] har [LÄKARUNDERSÖKTS]

		installera_V2_Installing : V2 ; -- <Agent>[Företaget] [INSTALLERADE] <Component>[105 piratprogram] <Fixed_location>[i 45 datorer]

		hospitalisera_V2_Institutionalization : V2 ; -- <Authority>[Psykiatrin] medicinerar och [HOSPITALISERAR] <Patient>[människor]

		gena_V_Intentional_traversing : V ; -- <Self_mover>[hon] som vanligt [GENADE] <Path>[över en hundgård]
		vada_V_Intentional_traversing : V ; -- <Self_mover>[vi] [VADAR] <Path>[ut]
		bestiga_V2_Intentional_traversing : V2 ; -- <Self_mover>[Cezar Persson] på att [BESTIGA] <Path>[en röd rutschkana]

		göra_V_Intentionally_affect : V ; -- <Agent>[Jag] fick [GÖRA] <Patient>[i detta projekt]

		bilda_V2_Intentionally_create : V2 ; -- <Creator>[Holmen] [BILDAR] <Created_entity>[bolag]
		göra_V2_Intentionally_create : V2 ; -- <Creator>[Jag] [GÖR] <Created_entity>[alla tre målen]
		kreera_V2_Intentionally_create : V2 ; -- [KREERAR] <Creator>[hon] <Created_entity>[sina praliner] och <Created_entity>[tryfflar]

		fånga_upp_V2_Intercepting : V2 ; -- <Interceptor>[Satelliter] [FÅNGAR UPP] <Theme>[samtal och e-post]
		snappa_upp_V2_Intercepting : V2 ; -- <Theme>[de] [SNAPPAS UPP] <Interceptor>[av den kejserliga censuren]

		avbryta_V2_Interrupt_process : V2 ; -- <Process>[Deras möte] [AVBRYTS] <Cause>[av Tommys entré]

		invadera_V_Invading : V ; -- <Land>[de] [INVADERADE]
		invadera_V2_Invading : V2 ; -- <Invader>[Irak] [INVADERADE] <Land>[Kuwait]

		beundra_V2_Judgment : V2 ; -- <Cognizer>[Jag] kan [BEUNDRA] <Evaluee>[dem] <Reason>[för deras mod]

		svartmåla_V2_Judgment_communication : V2 ; -- <Communicator>[massmedia] [SVARTMÅLAR] <Evaluee>[ravefesterna]

		gräla_på_V2_Judgment_direct_address : V2 ; -- <Communicator>[hon] har [GRÄLAT PÅ] <Addressee>[oss]
		komplimentera_V2_Judgment_direct_address : V2 ; -- <Communicator>[jag] [KOMPLIMENTERA] <Addressee>[föredraganden] <Reason>[till hans korta och tydliga förklaring]
		tillrättavisa_V2_Judgment_direct_address : V2 ; -- <Communicator>[ni] försöker [TILLRÄTTAVISA] <Addressee>[mig]
		tala_till_rätta_V2_Judgment_direct_address : V2 ; -- <Addressee>[de inblandade] [TALAS TILL RÄTTA] <Communicator>[av polisen]
		förebrå_V2_Judgment_direct_address : V2 ; -- <Addressee>[Detta parlament] [FÖREBRÅS] <Reason>[för att inte alltid vara så ansvarsfullt]

		försvara_V2_Justifying : V2 ; -- <Agent>[idioter] går ut med namn och [FÖRSVARAR] <Act>[sin rätt att dricka sig berusad i sällskap av sina barn]

		kidnappa_V2_Kidnapping : V2 ; -- [KIDNAPPAR] <Perpetrator>[han] <Victim>[ett barn]

		dränka_V2_Killing : V2 ; -- <Cause>[Flodvågor orsakade av skalvet] [DRÄNKTE] <Victim>[många människor]
		gasa_V2_Killing : V2 ; -- [GASA] <Victim>[sig själv]
		slå_ihjäl_V2_Killing : V2 ; -- <Killer>[En tjänare] och [SLOG IHJÄL] <Victim>[honom]

		knyta_V2_Knot_creation : V2 ; -- <Agent>[Jag] [KNYTER] <Knot>[en knut]

		lansera_V2_Launch_process : V2 ; -- <Agent>[Förbundet] [LANSERAR] <Process>[projekt Tvärnit]
		sjösätta_V2_Launch_process : V2 ; -- <Agent>[Vi] räknar med att [SJÖSÄTTA] <Process>[projektet]

		leda_V2_Leadership : V2 ; -- <Leader>[Jag] skall [LEDA] <Activity>[arbetet med en förstudie som sedan skall ge ett permanent avtal om samarbete]
		styra_V2_Leadership : V2 ; -- <Governed>[Marocko] [STYRS] <Leader>[av kung Hassan II]

		betyda_V2_Linguistic_meaning : V2 ; -- <Form>[Ordet kommunikation] kommer <Form>[communicatio] , som [BETYDER] <Meaning>[ömsesidigt utbyte] eller <Meaning>[överföring av information]

		krylla_V_Lively_place : V ; -- <Location>[London] [KRYLLAR] <Activity>[av mysiga caféer och tesalonger]

		blinka_V_Location_of_light : V ; -- <Figure>[ett DJ-bås som] [BLINKAR]
		lysa_V_Location_of_light : V ; -- <Figure>[De suddiga ' nebulosor ' som] [LYSER] <Ground>[på himlen]
		skimra_V_Location_of_light : V ; -- <Figure>[lågorna] [SKIMRAR] <Ground>[i vinterkvällen]

		bli_av_med_V2_Losing : V2 ; -- <Owner>[kommunisterna] [BLIVIT AV MED] <Possession>[makten]
		tappa_V2_Losing : V2 ; -- <Owner>[Hon] opererade hälsenan och fick följdskador och [TAPPADE] <Possession>[intresset]
		tappa_bort_V2_Losing : V2 ; -- <Owner>[jag] [TAPPADE BORT] <Possession>[all min mail]

		mala_på_V_Make_noise : V ; -- <Noisy_event>[Höstens remissdebatt 1967] [MALDE PÅ]
		säga_V2_Make_noise : V2 ; -- <Sound_source>[Tåget] [SÄGER] <Sound>[tut]

		möjliggöra_V2_Make_possible_to_do : V2 ; -- <Enablement>[Maskinen] [MÖJLIGGÖR] även <Enabled_action>[tillskärning av besvärliga kvaliteer]
		tillåta_V2_Make_possible_to_do : V2 ; -- <Enablement>[Jobbtiderna] [TILLÅTER] ju <Enabled_action>[utgång på lördag]
		möjliggöra_VS_Make_possible_to_do : VS ; -- <Enablement>[Detta kretslopp] [MÖJLIGGÖR] <Enabled_action>[att kroppens alla vävnader kan ta del av syret från inandningsluften]
		tillåta_VS_Make_possible_to_do : VS ; -- <Enablement>[Vädret] [TILLÄT] inte <Enabled_action>[att vi satt ute]

		flina_V_Making_faces : V ; -- <Agent>[Emil] och [FLINAR]
		grimasera_V_Making_faces : V ; -- <Agent>[Måns] och [GRIMASERADE]
		hånle_V_Making_faces : V ; -- <Agent>[Jag] [HÅNLOG]

		manipulera_V2_Manipulate_into_doing : V2 ; -- <Victim>[Sara Svensson] hade [MANIPULERATS] <Resulting_action>[till att vilja göra sitt bästa för auktoriteter]

		gno_V_Manipulation : V ; -- <Agent>[Jag] [GNODDE]
		nudda_V_Manipulation : V ; -- <Agent>[han] sig mot mig och [NUDDADE] <Entity>[vid mitt öra] <Bodypart_of_agent>[med läpparna]
		ta_V_Manipulation : V ; -- <Agent>[Man] [TAR] inte <Entity>[i folk man inte känner]
		gripa_V2_Manipulation : V2 ; -- <Agent>[Jag] saktade in , [GREP] <Entity>[kameran som låg bredvid mig i framsätet]
		hålla_V2_Manipulation : V2 ; -- <Agent>[Hon] [HÖLL] <Entity>[luren] <Bodypart_of_agent>[i handen]
		topsa_V2_Manipulation : V2 ; -- <Entity>[Han] [TOPSADES]

		göra_V2_Manufacturing : V2 ; -- [GÖR] <Product>[badrums-inredningar]
		ta_fram_V2_Manufacturing : V2 ; -- [TAR FRAM] <Product>[nya proteser som är individanpassade för patienterna och som gör att läkningen går snabbare]
		tillverka_V2_Manufacturing : V2 ; -- [TILLVERKA] <Product>[ett relä]

		bre_ut_sig_V_Mass_motion : V ; -- <Mass_theme>[Klätterhortensian] [BREDER UT SIG] <Area.>[över husväggen]
		sprida_ut_sig_V_Mass_motion : V ; -- <Mass_theme>[Tjänstemän från Internationella valutafonden IMF] anlände till landet och [SPRED UT SIG] <Area.>[över huvudstaden]
		välla_fram_V_Mass_motion : V ; -- <Mass_theme>[Cyklisterna] [VÄLLER FRAM]
		tränga_sig_V_Mass_motion : V ; -- <Mass_theme>[En del folk] börjar [TRÄNGA SIG] <Direction>[mot dörrarna]
		hagla_V_Mass_motion : V ; -- <Mass_theme>[bollarna] [HAGLADE] <Goal.>[in i boxen]
		välla_in_V_Mass_motion : V ; -- <Mass_theme>[de] [VÄLLER IN] <Path.>[över gränserna]

		fullgöra_V2_Meet_specifications : V2 ; -- <Agent>[folk] [FULLGÖR] <Standard>[sina skyldigheter]
		utföra_V2_Meet_specifications : V2 ; -- <Agent>[Han] väntar på det rätta tillfället att [UTFÖRA] <Standard>[sin plikt]
		hålla_V2_Meet_specifications : V2 ; -- <Entity>[Varannan bilbarnstol] [HÅLLER] <Standard>[måttet]
		tillmötesgå_V2_Meet_specifications : V2 ; -- <Entity>[LFV] vägrat [TILLMÖTESGÅ] <Standard>[taxiförarnas krav]
		uppfylla_V2_Meet_specifications : V2 ; -- <Entity>[säkerhetsnormerna] bör [UPPFYLLA] <Standard>[standarden i västländerna]

		träffa_V2_Meet_with : V2 ; -- <Party_1>[jag] [TRÄFFA] <Party_2>[Linnéa]

		mötas_V2_Meet_with_response : V2 ; -- <Trigger>[Janssons idé] [MÖTS] <Response>[med skepsis] också <Place.>[i Karleby]
		ta_V2_Meet_with_response : V2 ; -- <Trigger>[Olika förslag och idéer] [MOTTAGES] <Response>[med tacksamhet]
		uppta_V2_Meet_with_response : V2 ; -- <Trigger>[Detta] [UPPTOGS]

		memorera_V2_Memorization : V2 ; -- <Cognizer>[han] [MEMORERAT] <Pattern.>[hela anförandet]
		memorera_in_V2_Memorization : V2 ; -- <Cognizer>[jag] lyckas [MEMORERA IN] <Pattern.>[varje ord , varje tecken , varje mellanslag]

		komma_ihåg_V2_Memory : V2 ; -- <Cognizer>[folk] kan [KOMMA IHÅG] <Content>[ett namn som Schwarzenegger]
		glömma_VS_Memory : VS ; -- <Cognizer>[vi] [GLÖMMER] <Content.>[att orättvisorna faktiskt sker i den fysiska världen]

		nämna_V2_Mention : V2 ; -- <Communicator>[Ingen av dem] [NÄMNER] <Specified_content>[Brännkyrka]
		nämna_VS_Mention : VS ; -- <Communicator>[jag] [NÄMNDE] <Message>[att jag skulle få ett nytt rum]

		synda_V_Misdeed : V ; -- <Wrongdoer>[Den som sover] [SYNDAR]

		gå_V_Motion : V ; -- <Theme>[Hon] [GICK]
		orma_V_Motion : V ; -- <Theme>[Han] började [ORMA] <Direction>[fram]
		orma_sig_V_Motion : V ; -- <Theme>[Love] och börjar vrida och [ORMA SIG]
		leda_V_Motion : V ; -- <Theme>[E 4:an] [LEDDE] <Source>[från Lissabon] <Goal>[till Helsingfors]
		åka_V_Motion : V ; -- <Theme>[Fyra vänner] ska [ÅKA] <Goal>[till Reno]
		spela_V_Motion : V ; -- <Theme>[Solljuset] [SPELADE] <Path>[mellan vasstråna]

		falla_V_Motion_directional : V ; -- <Theme>[Snön] [FALLER]
		slå_över_V_Motion_directional : V ; -- <Theme>[Hon] bråkade , stegrade sig och [SLOG ÖVER]
		stiga_upp_V_Motion_directional : V ; -- <Theme>[Vattnet] [STEG UPP]
		trilla_V_Motion_directional : V ; -- <Theme>[En person] ska ha [TRILLAT] <Goal>[i vattnet]
		störta_V_Motion_directional : V ; -- <Theme>[De två klättrarna] [STÖRTADE] <Source>[från en isvägg på Kebnekaise]

		svischa_V_Motion_noise : V ; -- <Theme>[Tåg efter tåg] [SVISCHADE] <Area>[förbi]
		vina_V_Motion_noise : V ; -- <Theme>[En ungdomsbrottsling] [VEN] <Area>[förbi]

		dallra_V_Moving_in_place : V ; -- <Theme>[hängkinderna] [DALLRADE]
		kränga_V_Moving_in_place : V ; -- <Theme>[däcket] [KRÄNGER]
		slå_V_Moving_in_place : V ; -- <Theme>[Hjärtat] [SLOG]
		slå_runt_V_Moving_in_place : V ; -- <Theme>[Lastfartyget Nordersand] var nära att [SLÅ RUNT]
		sno_runt_V_Moving_in_place : V ; -- <Theme>[Hon] [SNODDE RUNT]
		svänga_V_Moving_in_place : V ; -- <Theme>[lyktan , som] [SVÄNGDE]
		vända_sig_V_Moving_in_place : V ; -- <Theme>[hon] [VÄNDE SIG]

		döpa_V2_Name_conferral : V2 ; -- <Entity>[ett grovt saftigt bröd som] <Speaker>[jag] [DÖPER]
		döpa_om_V2_Name_conferral : V2 ; -- [DÖPA OM] <Entity>[makt]
		dubba_V2_Name_conferral : V2 ; -- <Entity>[Webbens upphovsman riddare Tim Berners-Lee] [DUBBADES] <Name>[till riddare] <Speaker>[av drottning Elizabeth II]

		behöva_V2_Needing : V2 ; -- <Cognizer>[Barn] [BEHÖVER] <Requirement>[fett] <Consequences.>[annars blir de feta]
		behövas_V2_Needing : V2 ; -- <Requirement>[Det] [BEHÖVS] <Consequences.>[för annars känns det som om man är ensam]

		anmäla_V2_Notification_of_charges : V2 ; -- <Arraign_authority>[polisen] [ANMÄLDE] <Accused>[mannen] <Charges.>[för framkallande av fara för annan]
		åtala_V2_Notification_of_charges : V2 ; -- <Accused>[en man] [ÅTALATS] <Charges>[för innehav av barnporr]

		sönderfalla_V_Nuclear_process : V ; -- <Element>[en atom] [SÖNDERFALLER] <Time.>[i varje kubikmeter luft]

		visa_sig_V_Obviousness : V ; -- <Phenomenon>[Solen] [VISAR SIG]

		toppa_V_Occupy_rank : V ; -- <Item>[Volvo] [TOPPAR]

		båda_V_Omen : V ; -- <Phenomenon_1>[det] [BÅDAR] <Outcome>[gott]
		bebåda_V2_Omen : V2 ; -- <Phenomenon_1>[Den blågrå , svällande molnformation som steg upp i väster] [BEBÅDADE] <Phenomenon_2.>[sämre väder]
		förutspå_V2_Omen : V2 ; -- <Phenomenon_1>[Galluparna] [FÖRUTSPÅR] <Phenomenon_2>[valframgång] <Interested_party.>[för Sannfinländarna]

		cykla_V_Operate_vehicle : V ; -- [CYKLADE] <Driver>[en 69-årig man] <Area>[på en grusväg]
		köra_V_Operate_vehicle : V ; -- <Driver>[vi] [KÖRDE]
		paddla_V_Operate_vehicle : V ; -- <Driver>[Jag] [PADDLADE] <Path>[genom det lilla sundet mellan Hasselön och Grindholmen]

		driva_V2_Operating_a_system : V2 ; -- <Operator>[Min fru] [DRIVER] <System>[en liten enskild firma]
		förvalta_V2_Operating_a_system : V2 ; -- <Operator>[Statens fastighetsverk] [FÖRVALTAR] <System>[flera militära befästningar från olika tidsåldrar]
		handha_V2_Operating_a_system : V2 ; -- <Operator>[Omsorgsförvaltningen] [HANDHAR] <System>[de fonder som berör vård och hälsa]
		operera_V2_Operating_a_system : V2 ; -- <Operator>[Företaget] utvecklar och [OPERERAR] <System>[system för distribution och administration av digitalt innehåll via bredband]

		pröva_V2_Operational_testing : V2 ; -- <Tester>[4 500 testpiloter] att [PRÖVA] <Product>[NTT Docomos 3G-nät]
		testa_V2_Operational_testing : V2 ; -- <Tester>[han] blev testpilot och fick [TESTA] <Product.>[nya flygplan]

		anse_VS_Opinion : VS ; -- <Cognizer>[Jag] [ANSER] <Opinion>[att dessa kvinnor är ett föredöme för unga tjejer]
		tycka_VS_Opinion : VS ; -- <Cognizer>[Hon] [TYCKER] <Opinion>[att jag shoppar för mycket]

		komma_V_Origin : V ; -- <Entity>[hon] [KOMMER] <Origin>[från Island]

		sympatisera_V_Others_situation_as_stimulus : V ; -- <Experiencer>[vi] [SYMPATISERAR] <Other>[med dem]
		tycka_synd_V_Others_situation_as_stimulus : V ; -- <Experiencer>[Jag] [TYCKTE SYND] <Other>[om honom]
		känna_med_V2_Others_situation_as_stimulus : V2 ; -- <Experiencer>[man] blir glad av deras framgångar och [KÄNNER MED] <Other>[dem]

		benåda_V2_Pardon : V2 ; -- <Authority>[presidenten] ska [BENÅDA] <Offender>[en kalkon]

		gynna_V2_Partiality : V2 ; -- [GYNNA] <Side_1>[den egna produktionen]

		röra_sig_V_Participation : V ; -- <Participant_1>[Thomas] [RÖRDE SIG]

		stiga_V_Path_shape : V ; -- [STIGER] <Road>[terrängen] <Direction>[mot norr]
		svänga_V_Path_shape : V ; -- <Road>[Avfarten] [SVÄNGER] <Direction>[upp]
		gå_V_Path_shape : V ; -- <Road>[ena vägen] [GÅR] <Goal>[till Jacques lägenhet] , <Road>[den andra] { LU går } <Goal>[till kärnkraftverket där Homer arbetar]
		löpa_V_Path_shape : V ; -- [LÖPER] <Road>[en smal stig] <Source>[från beteshagen i öster]
		korsa_V2_Path_shape : V2 ; -- <Road>[Vägen] [KORSAR] <Area>[ett område av riksintresse för kulturmiljövård]

		hugga_V_Perception_body : V ; -- [HÖGG] <Body_part>[i bröstet]
		kittla_V_Perception_body : V ; -- [KITTLAR] <Body_part>[i hennes vader]
		sticka_V_Perception_body : V ; -- [STICKER] <Body_part>[i hans högra arm]
		göra_ont_V_Perception_body : V ; -- <Body_part>[Magen] [GÖR ONT]
		värka_V_Perception_body : V ; -- <Body_part>[Huvudet] [VÄRKER]

		känna_V2_Perception_experience : V2 ; -- <Perceiver_passive>[jag] också [KÄNNA] <Phenomenon>[oro]
		se_V2_Perception_experience : V2 ; -- <Perceiver_passive>[Jag] [SÅG] ingen <Phenomenon>[automat]
		bevittna_VQ_Perception_experience : VQ ; -- <Perceiver_passive>[de själva] hunnit [BEVITTNA] <Phenomenon>[hur en epok tagit slut]
		beskåda_V2_Perception_experience : V2 ; -- <Phenomenon>[Resultatet] kan [BESKÅDAS]

		uppträda_ihop_V_Performers_and_roles : V ; -- <Performer1>[Madonna] [UPPTRÄDDE IHOP] <Performer2>[med en gospelkör]
		spela_V2_Performers_and_roles : V2 ; -- <Performer>[han] [SPELADE] <Role>[Romeo] <Performance>[i Shakespears klassiska drama]
		framträda_V2_Performers_and_roles : V2 ; -- [FRAMTRÄDDE] bland andra <Performer>[Madonna , Bruce Springsteen , Mary J Blige , Shakira och Sting]

		medge_V2_Permitting : V2 ; -- <Principle>[reglerna] [MEDGER] <State_of_affairs.>[ränteanstånd]
		sanktionera_V2_Permitting : V2 ; -- <Principle>[Genevekonventionen] [SANKTIONERAR] inte <State_of_affairs>[mord pa civilister]
		tillåta_V2_Permitting : V2 ; -- <Principle>[principer] [TILLÅTER] <State_of_affairs.>[oss dock inte att gå med på ett sådant synsätt]

		flörta_V_Personal_relationship : V ; -- <Partner_1>[Han] vill inget hellre än att bli av med oskulden och [FLÖRTAR] <Partner_2>[med Nillan]
		ha_ihop_sig_V_Personal_relationship : V ; -- <Partner_1>[Hon] [HAR IHOP DET] <Partner_2>[med en av de utbildade kirurgerna på sjukhuset - Derek Shepherd ( även kallad McDreamy )]
		sammanbo_V_Personal_relationship : V ; -- <Partner_1>[hon] [SAMMANBODDE] <Partner_2>[med Alberto Moravia]
		adoptera_V2_Personal_relationship : V2 ; -- <Partner_1>[Äldre Göteborgspar] får [ADOPTERA] <Partner_2>[flicka]
		dejta_V2_Personal_relationship : V2 ; -- <Partner_1>[Carolina ( som bor och arbetar i Oslo )] [DEJTAR] <Partner_2>[en norsk halvkändis]
		kurtisera_V2_Personal_relationship : V2 ; -- <Partner_1>[Han] är känd som en stor förförare , och [KURTISERAR] <Partner_2>[alla kvinnor han ser]

		kapa_V2_Piracy : V2 ; -- <Perpetrator>[Pirater] [KAPADE] <Vehicle>[tre thailändska fiskefartyg]
		uppbringa_V2_Piracy : V2 ; -- [UPPBRINGA] <Vehicle>[fartygen]

		ge_tyngd_V_Place_weight_on : V ; -- [GE TYNGD] <Consideration>[åt vissa politiska krav]
		lägga_tyngden_V_Place_weight_on : V ; -- <Agent>[vi] försöker [LÄGGA TYNGDEN] <Consideration>[på att barnen själva skall synas i rutan]

		dra_V2_Placing : V2 ; -- <Agent>[Man] hade [DRAGIT] <Theme>[en ledning] <Goal>[mellan datorn och terminalen]
		placera_V2_Placing : V2 ; -- <Agent>[Tullkvinnan] [PLACERADE] <Theme>[väskan] <Goal>[på ett stort blankt bord .]
		slå_V2_Placing : V2 ; -- <Agent>[Cathy] [SLOG] <Theme>[armarna] <Goal>[om min hals]
		stoppa_V2_Placing : V2 ; -- <Agent>[den okände] skulle [STOPPA] <Theme>[sitt mynt] <Goal>[i hennes plånbok]
		tvinga_ned_V2_Placing : V2 ; -- <Agent>[Man] skall aldrig försöka [TVINGA NED] <Theme>[något] <Goal>[i munnen på en medvetslös person]
		adressera_V2_Placing : V2 ; -- [ADRESSERADE] <Goal>[kuvertet]
		toppa_V2_Placing : V2 ; -- [TOPPADE] <Goal>[tårtan]
		stationera_V2_Placing : V2 ; -- <Theme>[Han] [STATIONERAS] <Goal>[på finländska UD i Helsingfors]

		plantera_V2_Planting : V2 ; -- <Agent>[Possu Pompeli] sköter sin trädgård genom att vattna och [PLANTERA] <Theme>[nya blommor]
		sätta_V2_Planting : V2 ; -- <Agent>[jag] [SÄTTA] <Theme>[potatis]
		så_V2_Planting : V2 ; -- <Agent>[Jussi] [SÅR] <Theme>[frön]

		framställa_sig_V2_Posing_as : V2 ; -- <Agent>[han] [FRAMSTÄLLER SIG] <Simulated_entity>[som den perfekte SS-officeren som bara lydde order]

		ha_V2_Possession : V2 ; -- <Owner>[man] [HAR] <Possession>[en bil]
		sakna_V2_Possession : V2 ; -- <Owner>[Bolaget] [SAKNAR] <Possession>[tillgångar]

		huka_sig_V_Posture : V ; -- <Agent>[De] satt tysta som kyrkråttor i sina bås och [HUKADE SIG] <Location>[i de allra innersta hörnen]
		ligga_V_Posture : V ; -- <Agent>[Jag] [LIGGER] <Location>[i hängmattan]
		luta_V_Posture : V ; -- <Agent>[jag] [LUTAR]
		luta_sig_V_Posture : V ; -- <Agent>[Claes Malmberg] [LUTAR SIG]
		sitta_V_Posture : V ; -- <Agent>[En stork] [SITTER] <Location>[på kyrktornet]
		sätta_sig_V_Posture : V ; -- [SÄTTA SIG] <Location>[bakom ratten]
		sätta_sig_upp_V_Posture : V ; -- <Agent>[Jag] måste [SÄTTA MIG UPP]

		repa_in_V_Practice : V ; -- <Action>[över 25 melodier som] <Agent>[vi] [REPADE IN]
		repetera_V_Practice : V ; -- <Agent>[han] [REPETERAT]
		öva_V_Practice : V ; -- <Agent>[jag] förresten [ÖVA] <Action>[på arior för mezzosopran]
		repa_in_V2_Practice : V2 ; -- <Agent>[Vi] hade [REPAT IN] <Action>[l2 låtar]
		träna_V2_Practice : V2 ; -- <Agent>[jag] istället [TRÄNA] <Action>[cirkelträning]
		öva_in_V2_Practice : V2 ; -- <Action>[schlagersånger som] <Agent>[de] [ÖVAT IN] <Occasion>[för skolmusikfestivalen]

		snöa_V_Precipitation : V ; -- [SNÖADE] <Place>[i området]

		balsamera_V2_Preserving : V2 ; -- <Agent>[vi] [BALSAMERAR] <Undergoer>[kroppen]
		konservera_V2_Preserving : V2 ; -- [KONSERVERA] <Undergoer>[fisken]
		luta_V2_Preserving : V2 ; -- <Agent>[du] fick börja [LUTA] <Undergoer>[fisk]
		lägga_in_V2_Preserving : V2 ; -- <Agent>[du] [LÄGGER IN] <Undergoer>[sill] <Medium>[i klar lag]
		sylta_V2_Preserving : V2 ; -- [SYLTA] <Undergoer>[squash]
		sylta_in_V2_Preserving : V2 ; -- <Agent>[man] [SYLTADE IN] <Undergoer>[dom]

		ljuga_V_Prevarication : V ; -- <Speaker>[Hon] [LJÖG] <Topic>[om sin ålder]

		frånta_V3_Prevent_from_having : V3 ; -- <Agent>[jag] inte ville [FRÅNTA] <Protagonist>[någon]

		avvärja_V2_Preventing : V2 ; -- [AVVÄRJA] <Event>[en humanitär katastrof] <Place.>[i området]
		förhindra_V2_Preventing : V2 ; -- <Agent>[Man] vill [FÖRHINDRA] <Event>[vapensmuggling]
		stoppa_V2_Preventing : V2 ; -- <Agent>[åtalet] ska [STOPPA] <Event>[kriget]
		undanröja_V2_Preventing : V2 ; -- [UNDANRÖJA] <Event.>[hotet mot grödornas fortlevnad]

		fortgå_V_Process_continue : V ; -- <Event>[fredsprocessen] [FORTGICK]
		gå_V_Process_continue : V ; -- <Event>[Moores filmer] [GICK]
		hålla_i_sig_V_Process_continue : V ; -- <Event>[Värmen] [HÅLLER I SIG]
		hålla_på_V_Process_continue : V ; -- <Event>[Mötet] [HÖLL PÅ]
		pågå_V_Process_continue : V ; -- [PÅGICK] <Event>[flera tvister med andra britter inblandade]

		sluta_V_Process_end : V ; -- <Process>[Grillningen] [SLUTADE]
		ta_slut_V_Process_end : V ; -- <Process>[det kalla kriget] [TOG SLUT]
		upphöra_V_Process_end : V ; -- <Process>[Den svenska vapenexporten] måste [UPPHÖRA]
		utmynna_V_Process_end : V ; -- <Process>[konferensen] ska [UTMYNNA]

		bryta_ut_V_Process_start : V ; -- <Event>[En brand] [BRYTER UT]
		börja_V_Process_start : V ; -- <Event>[Diskussionen om fördelningen av pengarna] [BÖRJADE]
		starta_V_Process_start : V ; -- <Event>[Verksamheten] [STARTADE]
		sätta_fart_V_Process_start : V ; -- <Event>[kurortsverksamheten] [SATTE FART]

		avstanna_V_Process_stop : V ; -- <Process>[byggandet] har [AVSTANNAT]
		stanna_av_V_Process_stop : V ; -- <Process>[bostadsbyggandet] [STANNAR AV]

		arbeta_V2_Processing_materials : V2 ; -- [ARBETA] <Material>[degen]
		bearbeta_V2_Processing_materials : V2 ; -- [BEARBETAR] <Agent>[Kjell Karlsson] <Material>[ett granitblock]

		gå_ner_V_Proliferating_in_number : V ; -- <Set>[moderaterna] [GÅR NER] <Initial_number>[från 23,8] <Final_number>[till 21,9]
		gå_upp_V_Proliferating_in_number : V ; -- <Set>[Socialdemokraterna] [GÅR UPP] <Initial_number>[från 39,9 procent] <Final_number>[till 43,1]
		krympa_V_Proliferating_in_number : V ; -- <Set>[antalet polisinrättningar] [KRYMPER] <Initial_number>[från 24] <Final_number>[till 11]
		minska_V_Proliferating_in_number : V ; -- <Set>[vänsterpartiet] [MINSKAR] <Initial_number>[från 11,4] <Final_number>[till 10,4]
		uppgå_V_Proliferating_in_number : V ; -- <Set>[Det sammanlagda antalet besök i ateljéerna] [UPPGICK] <Final_number>[till cirka 15 000]
		öka_V_Proliferating_in_number : V ; -- <Set>[antalet öar] [ÖKAR]
		fördubbla_V2_Proliferating_in_number : V2 ; -- <Set>[Antalet kvinnor med hörselskador] har [FÖRDUBBLATS]

		skydda_V2_Protecting : V2 ; -- <Protection>[Korallreven] [SKYDDAR] <Asset>[kusterna vid stormar]
		säkerställa_V2_Protecting : V2 ; -- [SÄKERSTÄLLER] <Asset>[långvarig överlevnad]

		käfta_V_Quarreling : V ; -- <Arguer1>[Johannesson] brukar [KÄFTA] <Arguer2>[med Wennerholm]
		bråka_V_Quarreling : V ; -- [BRÅKADE] <Arguers>[två västsvenska klubbar] <Issue>[om en övergång]

		fråga_V_Questioning : V ; -- <Speaker>[De] var väldigt vetgiriga båda två och [FRÅGADE] <Topic>[om allt från löner till huspriser]
		spörja_V_Questioning : V ; -- <Speaker>[Alla] undrar och [SPÖRJER]
		fråga_V2_Questioning : V2 ; -- <Speaker>[Vi] har [FRÅGAT] <Addressee>[alla andra]
		höra_VQ_Questioning : VQ ; -- <Speaker>[jag] [HÖRA] <Message>[vad tusan jag ska göra]
		grilla_V2_Questioning : V2 ; -- <Addressee>[kändisar] låter sig [GRILLAS] <Speaker>[av komiker]

		abdikera_V_Quitting : V ; -- <Employee>[En drottning] [ABDIKERAR]
		avgå_V_Quitting : V ; -- <Employee>[Hon] [AVGÅR]
		säga_upp_sig_V_Quitting : V ; -- <Employee>[Emma] [SA UPP SIG] <Position>[från sitt jobb som florist]

		dra_sig_tillbaka_V_Quitting_a_place : V ; -- <Self_mover>[Gaddafistyrkorna] [DRAGIT SIG TILLBAKA] <Source>[från staden]
		dunsta_V_Quitting_a_place : V ; -- <Self_mover>[du] [DUNSTAR]
		fly_fältet_V_Quitting_a_place : V ; -- <Self_mover>[Huvudpersonen själv] har [FLYTT FÄLTET]
		utrymma_V2_Quitting_a_place : V2 ; -- [UTRYMMA] <Source>[lägenheten]

		ratificera_V2_Ratification : V2 ; -- <Ratifier>[26 EU-länder] har [RATIFICERAT] <Proposal>[Lissabonfördraget]

		förläsa_sig_V_Reading : V ; -- <Reader>[en amerikan som varit i Paris] och [FÖRLÄST SIG] <Text>[på Bourdieu]
		sträckläsa_V_Reading : V ; -- <Text>[en bok] att [STRÄCKLÄSA]
		läsa_V2_Reading : V2 ; -- <Reader>[du] [LÄSA] i <Text>[Sensias rapport]
		skumma_V2_Reading : V2 ; -- [SKUMMADE] bara <Text>[texten]
		skumma_igenom_V2_Reading : V2 ; -- <Reader>[åklagaren] [SKUMMADE IGENOM] <Text>[domen]
		sluka_V2_Reading : V2 ; -- <Reader>[miljoner människor] [SLUKAR] <Text>[böcker]
		ögna_igenom_V2_Reading : V2 ; -- <Reader>[jag] kunde få [ÖGNA IGENOM] <Text>[texten]

		diktera_V2_Reading_aloud : V2 ; -- <Speaker>[Pippi] [DIKTERAR] <Text>[ett brev]
		läsa_V2_Reading_aloud : V2 ; -- [LÄSTE] <Text>[evangeliet]
		läsa_upp_V2_Reading_aloud : V2 ; -- <Text>[ett brev] från som <Speaker>[jag] gärna skulle vilja [LÄSA UPP]

		argumentera_V_Reasoning : V ; -- <Arguer>[han] även [ARGUMENTERADE] <Content>[för ett starkt EU]
		demonstrera_V_Reasoning : V ; -- <Arguer>[en enda katolsk präst i Sverige som] vill [DEMONSTRERA] <Content>[mot celibatet]
		resonera_V_Reasoning : V ; -- <Arguer>[de fyra heltidspolitikerna i presidiet] [RESONERAR] <Content>[om sina roller]
		bevisa_VS_Reasoning : VS ; -- <Arguer>[Mathias] [BEVISADE] <Content>[att segern i Irland , Smurfit European Open , i slutet av augusti inte var en tillfällighet]

		acceptera_V2_Receiving : V2 ; -- <Recipient>[Kommunen] kan inte [ACCEPTERA] <Theme>[gåvan]
		få_V2_Receiving : V2 ; -- <Recipient>[Jag] [FICK] <Theme>[min väska]
		ta_emot_V2_Receiving : V2 ; -- <Recipient>[Nobelpristagarna] kommer till för att [TA EMOT] <Theme>[sina medaljer]

		anteckna_V2_Recording : V2 ; -- <Agent>[Maja Lundgren] vet mer och [ANTECKNAR] <Phenomenon>[allt hon ser och hör]
		dokumentera_V2_Recording : V2 ; -- [DOKUMENTERAR] <Phenomenon>[svensk filmhistoria]
		skildra_V2_Recording : V2 ; -- <Agent>[Jag] befann mig med fotograf för att [SKILDRA] <Phenomenon>[valstriden]

		komma_sig_V_Recovery : V ; -- <Patient>[Han] [KOM SIG]
		återhämta_sig_V_Recovery : V ; -- <Patient>[Räven] har [ÅTERHÄMTAT SIG] <Affliction>[efter skabben]
		läka_V_Recovery : V ; -- <Affliction>[Såret] [LÄKER]

		avleda_V2_Redirecting : V2 ; -- <Agent>[Jag] försöker [AVLEDA] <Theme>[Lokes uppmärksamhet]
		avvända_V2_Redirecting : V2 ; -- [AVVÄNDA] <Theme>[det onda ögat]
		dirigera_om_V2_Redirecting : V2 ; -- <Theme>[några mångmiljonbelopp] kan [DIRIGERAS OM] <Goal>[till just Stockholm]
		styra_om_V2_Redirecting : V2 ; -- <Theme>[Huvuduppdraget] [STYRDES OM] <Goal>[till ett konkret mål : att förmedla jobb]

		se_V2_Reference_text : V2 ; -- [SE] <Source_of_information>[sidan 13]
		se_även_V2_Reference_text : V2 ; -- [SE ÄVEN] <Source_of_information).>[hans Djävulssonaten]

		omstrukturera_V2_Reforming_a_system : V2 ; -- <Agent>[Catena] att [OMSTRUKTURERA] <Entity>[bilrörelsen i Europa] <Purpose",>[för att skapa en bas för långsiktig lönsamhet]
		reformera_V2_Reforming_a_system : V2 ; -- <Agent>[EU] [REFORMERA] <Entity>[sin jordbrukspolitik]

		föryngra_V2_Rejuvenation : V2 ; -- <Agent>[De] vill modernisera och [FÖRYNGRA] <Entity>[kyrkan]
		återställa_V2_Rejuvenation : V2 ; -- <Agent>[han] för att [ÅTERSTÄLLA] <Entity.>[den gamla ordningen]
		återuppliva_V2_Rejuvenation : V2 ; -- <Agent>[Irländarna] till exempel försöker [ÅTERUPPLIVA] <Entity.>[gaeliskan]
		vitalisera_V2_Rejuvenation : V2 ; -- <Entity>[Demokratin i kommunerna] behöver <LU.>[vitaliseras]

		binda_V2_Relating_concepts : V2 ; -- <Evidence>[inget enskilt bevis] [BINDER] <Concept_1>[45-åringen] <Concept_2>[till dådet]
		förbinda_V2_Relating_concepts : V2 ; -- <Evidence>[beviset , som] [FÖRBAND] <Concept_1>[vasen] <Concept_2>[med Helena Westermarcks hem]
		förena_V2_Relating_concepts : V2 ; -- <Evidence>[26-4 i målskillnad på de åtta kvalmatcherna visar att man lyckats] [FÖRENA] <Concept_1>[anfall] <Concept_2>[med ett väl fungernade försvar]
		relatera_V2_Relating_concepts : V2 ; -- [RELATERA] <Concept_1>[resultatet] <Concept_2>[med analytikers förväntningar]
		sätta_i_relation_V2_Relating_concepts : V2 ; -- <Concept_1>[alla brott] måste också [SÄTTAS I RELATION] <Concept_2>[till det uppdrag man har]

		dra_ut_på_tiden_V_Relative_time : V ; -- <Focal_occasion>[Lektionen] [DRAR UT PÅ TIDEN]
		följa_V_Relative_time : V ; -- [FÖLJDE] <Focal_occasion>[handling]

		tro_V_Religious_belief : V ; -- [TROR] <Element>[på Bibeln såsom den är tolkad av Swedenborgs andliga läror]
		tro_VS_Religious_belief : VS ; -- <Believer>[jag] [TRO] <Content>[att Jesus verkligen dött för mej]

		bli_över_V_Remainder : V ; -- <Remainder>[Alla pengar som] [BLIR ÖVER]
		kvarstå_V_Remainder : V ; -- <Remainder>[Oklarheterna kring den känsliga frågan] [KVARSTOD]
		lämna_V2_Remainder : V2 ; -- [LÄMNAT] <Remainder>[skräp]

		erinra_sig_VQ_Remembering_experience : VQ ; -- <Cognizer>[han] och [ERINRAR SIG] <Experience>[hur han blev utbuad av parlamentet för några år sedan]

		dra_sig_till_minnes_VS_Remembering_information : VS ; -- <Cognizer>[Han] [DRAR SIG TILL MINNES] <Mental_content>[att Marks kommun hjälpt honom att arbeta brottsförebyggande]
		påminna_sig_VS_Remembering_information : VS ; -- <Cognizer>[han] kan inte [PÅMINNA SIG] <Mental_content>[att de talade om lerhyddor]

		glömma_VV_Remembering_to_do : VV ; -- <Cognizer>[Man] har [GLÖMT] <Action.>[att titta på arbetsorganisationen]
		komma_ihåg_VV_Remembering_to_do : VV ; -- [KOM IHÅG] <Action>[att inte fastna i detaljer]

		göra_sig_av_V_Removing : V ; -- <Agent>[Besökarna] kunde inte [GÖRA SIG AV] <Theme>[med avfallet]
		tömma_V2_Removing : V2 ; -- <Agent>[Rånarna] [TÖMDE] <Source>[kassaskåpet]
		plocka_V2_Removing : V2 ; -- <Agent>[hon] [PLOCKAR] <Theme>[en kyckling]
		slå_bort_V2_Removing : V2 ; -- [SLÅ BORT] <Theme>[vattnet]
		vräka_V2_Removing : V2 ; -- <Agent>[Hyresvärden] vill [VRÄKA] <Theme>[nazisterna]
		plocka_ur_V2_Removing : V2 ; -- [PLOCKA UR] <Theme>[dem] <Source>[ur skalet]
		plocka_ut_V2_Removing : V2 ; -- [PLOCKA UT] <Theme>[saker] <Source>[ur bakluckan]
		kränga_av_V3_Removing : V3 ; -- [KRÄNGA AV] <Source>[sig] <Theme>[sina fuktiga badbrallor]
		abortera_V2_Removing : V2 ; -- [ABORTERAS] <Theme>[fostret]
		plocka_bort_V2_Removing : V2 ; -- <Theme>[Ordet ' resväska '] [PLOCKADES BORT] <Source>[ur debutboken]
		utvisa_V2_Removing : V2 ; -- <Theme>[En utländsk medborgare] eller <Theme>[en statslös person] [UTVISAS] <Source>[ur Sverige]
		evakuera_V2_Removing : V2 ; -- <Theme>[Boende i en tvåvånings länga på Haparandavägen] fick [EVAKUERAS]

		kvadda_V2_Render_nonfunctional : V2 ; -- [KVADDADE] <Agent>[vi] <Artifact>[bilen]
		paja_V2_Render_nonfunctional : V2 ; -- <Agent>[en tredjedel av åkarna som] [PAJAT] <Artifact>[korsbandet]
		ta_sönder_V2_Render_nonfunctional : V2 ; -- <Agent>[man] [TAR SÖNDER] <Artifact>[alla klockor]

		hyra_V2_Renting : V2 ; -- <Lessee>[31 firmor] [HYR] <Goods>[rum]
		hyra_in_V2_Renting : V2 ; -- <Lessee>[Vi] [HYR IN] <Goods>[bussar]

		arrendera_ut_V2_Renting_out : V2 ; -- <Lessor>[Kommunen] [ARRENDERAR UT] <Goods>[ett stort antal gårdar] <Lessee.>[till djurägare]
		hyra_ut_V2_Renting_out : V2 ; -- <Lessor>[Garantiföreningen] [HYR UT] <Goods>[husen] <Lessee>[till sju olika aktörer]

		avsäga_sig_V2_Renunciation : V2 ; -- <Speaker>[en av de som] [AVSADE SIG] <Content>[sin kandidatur]
		ge_upp_V2_Renunciation : V2 ; -- <Speaker>[vi] ska [GE UPP] <Content>[vår egenart]

		stå_emot_V2_Repel : V2 ; -- <Defender>[stenhusen] [STOD EMOT] <Enemy>[projektilerna]

		byta_ut_V2_Replacing : V2 ; -- <Agent>[Jag] beslöt [BYTA UT] <Old>[kameran] <New>[mot penseln] och <Old>[filmen] <New>[mot papper]
		ersätta_V2_Replacing : V2 ; -- <Agent>[Han] har [ERSATT] <Old>[en del reguljära trupper i Irak] <New>[med privatarméer , legosoldater]
		substituera_V2_Replacing : V2 ; -- <Agent>[man] har börjat [SUBSTITUERA] <New>[vete] <Old>[istället för majs som foder]

		gola_V_Reporting : V ; -- <Informer>[Hon] [GOLAR] även <Wrongdoer>[på Lisbet]
		tjalla_V_Reporting : V ; -- <Informer>[Tungt kriminella] [TJALLAR]

		stå_V_Representing : V ; -- <Entity>[1997] [STÅR] <Phenomenon>[för året då Günter och Christina flyttade till gården]

		hemställa_V_Request : V ; -- <Speaker>[Jag] [HEMSTÄLLER]
		yrka_V_Request : V ; -- <Speaker>[Åklagaren Per-Åke Kvarnström] kommer att [YRKA] <Message>[på att den misstänkte döms till livstids fängelse]
		begära_V2_Request : V2 ; -- [BEGÄRDE] <Speaker>[hon] <Message>[hyran tillbaka plus 1 500 kronor för ' sveda och värk ']
		befalla_V2V_Request : V2V ; -- <Speaker>[Hon] [BEFALLDE] <Addressee>[flickan] <Message>[att tvätta av sina händer] , <Message>[ta på sig kappan] och <Message>[komma med]
		blixtinkalla_V2_Request : V2 ; -- <Addressee>[Myhre] [BLIXTINKALLADES] <Containing_event.>[då samtliga målvakter dras med skador]
		hemkalla_V2_Request : V2 ; -- <Addressee>[Löwenhielm] [HEMKALLADES] <Message>[för att ta befälet över en husarskvadron]
		kalla_ut_V2_Request : V2 ; -- <Addressee>[Stornaways båt] [KALLADES UT] <Message.>[för att hjälpa en tankbåt som hade problem utanför Cape Wrath]

		forska_V_Research : V ; -- [FORSKAR] <Researcher>[jag] <Field>[i analytisk ontologi]
		vetenskapa_V_Research : V ; -- <Researcher>[män och idel män som] [VETENSKAPAR]

		forma_V2_Reshaping : V2 ; -- <Deformer>[Caroline] och [FORMAR] <Undergoer>[händerna]
		krossa_V2_Reshaping : V2 ; -- [KROSSAT] <Undergoer>[sin bil]
		valsa_V2_Reshaping : V2 ; -- [VALSAR] <Deformer>[du] <Undergoer>[skivor av deg]

		bo_V_Residence : V ; -- <Resident>[Elisabeth Krantz] [BOR] <Location>[i Kungsbacka]

		komma_till_rätta_V_Resolve_problem : V ; -- <Circumstances:>[Detta vill jag att Reinfeldt svarar på] Hur ska <Agent>[vi] [KOMMA TILL RÄTTA] <Problem>[med arbetslösheten]
		fixa_V_Resolve_problem : V ; -- <Problem>[det] går att [FIXA]
		behandla_V2_Resolve_problem : V2 ; -- <Agent>[Högsta domstolen] börjar [BEHANDLA] <Problem>[anklagelserna om valfusk]
		klara_upp_V2_Resolve_problem : V2 ; -- <Agent>[poliserna] på att [KLARA UPP] <Problem>[inbrott och stölder]
		tillrättalägga_V2_Resolve_problem : V2 ; -- <Agent>[vi] [TILLRÄTTALÄGGA] <Problem>[det som gått snett]

		avböja_V2_Respond_to_proposal : V2 ; -- <Speaker>[Algeriet] har [AVBÖJT] <Proposal>[hjälp]
		avslå_V2_Respond_to_proposal : V2 ; -- <Speaker>[man] [AVSLÅR] <Proposal>[verkets krav]

		reagera_V_Response : V ; -- <Agent>[Jag] har alltid [REAGERAT] <Trigger,>[mot chefer som tyckt sig veta bäst]

		anförtro_V_Reveal_secret : V ; -- <Speaker>[grevinnan] hade [ANFÖRTROTT] <Information>[om sina älskogslekar med kavaljerer som gästade slottet]
		anförtro_sig_V_Reveal_secret : V ; -- <Speaker>[du] [ANFÖRTRODDE DIG]
		yppa_V_Reveal_secret : V ; -- <Speaker>[Vuoria] ville inte [YPPA] <Information>[om uppsägningen har något att göra med Fortums framtidsplaner]
		avslöja_V2_Reveal_secret : V2 ; -- [AVSLÖJA] <Information>[hallens nästa namn]
		yppa_V2_Reveal_secret : V2 ; -- <Medium>[Dagboken] [YPPAR] <Information>[hemligheter som får överraskande följder]
		avslöja_VQ_Reveal_secret : VQ ; -- [AVSLÖJADE] <Speaker>[STV] <Information>[hur den privatiserade arbetsförmedlingen i det borgerliga Sverige har resulterat i kurser i virkning och fejkade mentorskap där de arbetslösa har lämnats vind för våg]
		ge_till_känna_VQ_Reveal_secret : VQ ; -- <Speaker>[han] har [GETT TILL KÄNNA] <Information>[hur det var när han tjänstgjorde i justitiedepartementet]
		yppa_VQ_Reveal_secret : VQ ; -- <Speaker>[Ministern] vill inte [YPPA] <Information>[vilket parti som bett om dispens]
		avslöja_VS_Reveal_secret : VS ; -- <Medium>[ett samtal till kostplanerare Maarit Ketola] [AVSLÖJAR] <Information>[att den här veckans meny inte bjuder på några konstigheter eller exotiska inslag]

		vedergälla_V_Revenge : V ; -- <Avenger>[Jag] vill [VEDERGÄLLA] <Injury>[ont] <Punishment'.>[med ont]
		hämnas_V2_Revenge : V2 ; -- <Avenger>[Denne] kunde [HÄMNAS] <Punishment>[genom att skvallra på dem]

		straffa_V2_Rewards_and_punishments : V2 ; -- <Agent>[Spararna] kan inte [STRAFFA] <Evaluee>[ett livbolag man är missnöjd med]

		ta_V2_Ride_vehicle : V2 ; -- <Theme>[jag] [TAR] <Vehicle>[bussen] <Goal>[hem]
		åka_V2_Ride_vehicle : V2 ; -- <Source>[Från Cityterminalen] kan <Theme>[du] [ÅKA] <Vehicle>[buss] <Goal>[till hela Sverige]

		komma_i_kapp_V_Rising_to_a_challenge : V ; -- <Protagonist>[jag] gärna [KOMMA I KAPP] <Activity>[med lektionerna]
		svara_V_Rising_to_a_challenge : V ; -- <Protagonist>[jag] att [SVARA] <Activity>[på en utmaning jag fått från Annicas blogg Galen i inredning]
		växa_V_Rising_to_a_challenge : V ; -- <Protagonist>[Hamas] kommer att [VÄXA] <Activity>[med uppgiften]

		smörja_V2_Rite : V2 ; -- [SMÖRJA] <Object>[den döda kroppen]
		döpa_V2_Rite : V2 ; -- <Member>[Elisabet] [DÖPTES]

		råna_V2_Robbery : V2 ; -- <Perpetrator>[Två yngre killar] [RÅNAR] <Victim>[två tjejer]

		vara_sig_V_Rotting : V ; -- <Undergoer>[såren] [VARAR SIG]
		vittra_V_Rotting : V ; -- <Undergoer>[Virket] murknar och ruttnar och [VITTRAR]

		fastslå_VS_Ruling_legally : VS ; -- <Authority>[Länsrätten] [FASTSLÅR] <Finding>[att det finns inget sagt om löpande vite]

		riskera_V2_Run_risk : V2 ; -- <Protagonist>[Våghalsiga fallskärmshoppare] har hittat att [RISKERA] <Asset>[livet]
		riskera_VV_Run_risk : VV ; -- <Protagonist>[Han] [RISKERAR] <Bad_outcome>[att dömas till många års fängelse]

		finkamma_V2_Scouring : V2 ; -- <Searcher>[Polisen] har [FINKAMMAT] <Ground>[området kring Edsviken där han bor]
		leta_igenom_V2_Scouring : V2 ; -- <Searcher>[poliserna] [LETADE IGENOM] <Ground>[hans bostad]

		leta_V_Seeking : V ; -- <Cognizer_agent>[vi] [LETADE] <Sought_entity>[efter en öppning]

		eftersträva_V2_Seeking_to_achieve : V2 ; -- <Agent>[Man] [EFTERSTRÄVAR] <Sought_entity>[ett rättvisare samhälle]

		flänga_V_Self_motion : V ; -- <Self_mover>[Han] [FLÄNGDE] <Area>[runt]
		röra_sig_V_Self_motion : V ; -- <Self_mover>[Han] får dock [RÖRA SIG]
		springa_V_Self_motion : V ; -- <Self_mover>[Två hästar] på rymmen [SPRANG] <Area>[ute på vägbanan i södra Södertälje]
		strosa_V_Self_motion : V ; -- <Self_mover>[Hemingway] [STROSADE] mycket <Area>[runt]
		stryka_V_Self_motion : V ; -- <Self_mover>[Vi] [STRYKER] <Area>[omkring]
		örla_V_Self_motion : V ; -- <Self_mover>[Servitörerna] [ÖRLAR] <Area>[omkring]
		jaga_V_Self_motion : V ; -- <Self_mover>[Han] [JAGAR]
		promenera_V_Self_motion : V ; -- <Self_mover>[Vi] [PROMENERAR] <Direction>[söderut]
		stiga_fram_V_Self_motion : V ; -- <Self_mover>[Värden] [STIGER FRAM] <Goal>[till hans bord]
		störta_V_Self_motion : V ; -- [STÖRTADE] <Self_mover>[han] <Goal>[ut på gatan]

		dirigera_om_V2_Sending : V2 ; -- <Sender>[Polis och brandkår] och [DIRIGERADE OM] <Theme>[trafiken]
		skeppa_V2_Sending : V2 ; -- <Sender>[Garcia] [SKEPPADE] <Theme>[statyerna] och <Recipient>[till USA]
		översända_V2_Sending : V2 ; -- <Sender>[Gymnasienämnden i Mölndal] tillstyrker och har [ÖVERSÄNT] <Theme>[beslutet] <Recipient>[till kommunstyrelsen]

		döma_V2_Sentencing : V2 ; -- [DÖMDES] <Convict>[familjens 18-årige son] <Sentence>[till ett och ett halvt års fängelse] <Offense>[för att han rånat ett äldre par]

		separera_V2_Separating : V2 ; -- <Agent>[En ny påfart] ska kunna [SEPARERA] <Part_1>[trafiken till Köpstaden] <Part_2>[från bostadstrafiken]
		spalta_upp_V2_Separating : V2 ; -- <Whole>[Riskfaktorn] kan i sin tur , menar Justin Jenk , [SPALTAS UPP] <Parts>[i två dimensioner]

		blossa_upp_V_Setting_fire : V ; -- <Flammables>[Restaurangen] [BLOSSAT UPP]
		anlägga_V2_Setting_fire : V2 ; -- <Kindler>[man] till och med [ANLAGT] <Flame>[eld]
		lunta_V2_Setting_fire : V2 ; -- <Kindler>[Mannen] [LUNTADE] <Flammables>[gräs]

		bege_sig_V_Setting_out : V ; -- <Self_mover>[jag] [BEGE MIG]
		bryta_upp_V_Setting_out : V ; -- <Self_mover>[jag] [BRÖT UPP]
		sätta_av_V_Setting_out : V ; -- <Self_mover>[Jag] [SÄTTER AV]

		avfyra_V2_Shoot_projectiles : V2 ; -- <Agent>[Polisen] svarade med att [AVFYRA] <Projectile>[tårgas] och <Projectile>[gummikulor]
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

		stå_V_Similarity : V ; -- <Entity_1>[Den] [STÅR] <Entity_2>[mot det gamla skåpet i grönt med röd utsmyckning]

		infalla_samtidigt_V_Simultaneity : V ; -- <Events>[alla fester] [INFÖLL SAMTIDIGT]
		inträffa_samtidigt_V_Simultaneity : V ; -- <Events>[kriserna] har [INTRÄFFAT SAMTIDIGT]

		slagga_V_Sleep : V ; -- <Sleeper>[Han] låg och [SLAGGADE]
		slumra_V_Sleep : V ; -- <Sleeper>[Lillebror Linus] [SLUMRAR]
		sova_V_Sleep : V ; -- [SOV] <Sleeper>[hon]

		smuggla_V2_Smuggling : V2 ; -- <Perpetrator>[Hon] [SMUGGLADE] <Goods>[skottet]
		smuggla_in_V2_Smuggling : V2 ; -- <Perpetrator>[hon] [SMUGGLAT IN] <Goods>[en mobiltelefon som en av fångarna skulle använda]

		blötlägga_V2_Soaking : V2 ; -- [BLÖTLÄGG] <Theme>[grillspetten]
		marinera_V2_Soaking : V2 ; -- <Agent>[man] ofta [MARINERAR] <Theme>[tunna köttskivor] <Medium>[i en söt vitlöksstark sojasås]

		uppta_V2_Soaking_up : V2 ; -- <Substance>[Smöret] [UPPTAS] <Item>[av huden]

		eka_V_Sound_movement : V ; -- <Sound>[Hymnen] [EKADE]

		föreläsa_V_Speak_on_topic : V ; -- <Speaker>[Du] [FÖRELÄSER] även <Topic>[om utbrändhet]

		artikulera_V2_Spelling_and_pronouncing : V2 ; -- <Speaker>[barn med Downs syndrom] har svårare att lära sig [ARTIKULERA] <Sign>[ord]
		säga_V2_Spelling_and_pronouncing : V2 ; -- <Speaker>[Invånarna] är oerhört snåla och kan inte [SÄGA] <Sign>[R]

		bli_V_State_continue : V ; -- <Entity>[Han] [BLEV]
		förbli_V_State_continue : V ; -- <Entity>[Funktionen hos sådana kraftiga armar med raka klor] [FÖRBLIR]
		gå_V_State_continue : V ; -- <Entity>[Var femte amerikan] [GÅR]
		hålla_V_State_continue : V ; -- <Entity>[vagnen] [HÖLL]
		stå_V_State_continue : V ; -- <Entity>[En av hans traktorer] [STOD]

		rapportera_V_Statement : V ; -- <Speaker>[Andreas] [RAPPORTERADE]
		skriva_V_Statement : V ; -- <Message>[I Sverige döms flera hundra utvecklingsstörda till fängelse varje år] , [SKRIVER] <Speaker>[Svenska Dagbladet]
		tala_V_Statement : V ; -- <Speaker>[Brittiska drottningen Elizabeth II] [TALADE] <Topic>[för världsfreden]
		stadga_V2_Statement : V2 ; -- <Medium>[Andra ändringar i lagen] [STADGAR] <Message>[fängelsestraff för sexuellt ofredande av barn , handel med mänskliga organ och miljöförstörelse]
		stadga_VS_Statement : VS ; -- <Medium>[Lagen] [STADGAR] <Message>[att en sådan stämma måste hållas]
		fastslå_VS_Statement : VS ; -- <Speaker>[Länsrätten] [FASTSLÅR] <Message>[att det finns inget sagt om löpande vite]
		säga_VS_Statement : VS ; -- <Speaker>[mannen] mager och [SADE] <Message>[att han var sjuk]
		ge_VV_Statement : VV ; -- [UPPGAV] <Speaker>[militären] <Message>[att ytterligare två soldater gripits , misstänkta för inblanding i dödsskjutningen]
		kommentera_V2_Statement : V2 ; -- [KOMMENTERAS] <Speaker>[av läraren]

		lagra_V2_Storing : V2 ; -- <Agent>[man] [LAGRA] på sig <Theme>[ljusa sommarminnen]

		ligga_V_Studying : V ; -- <Student>[en student som] [LIGGER] <Institution>[vid universitet]
		studera_V2_Studying : V2 ; -- <Student>[han] och [STUDERAR] <Subject>[litteraturvetenskap]

		förmå_V2V_Suasion : V2V ; -- <Speaker>[Hon] måste [FÖRMÅ] <Addressee>[honom] <Content>[att bli förtröstansfull]
		övertala_V2V_Suasion : V2V ; -- <Speaker>[man] nog kunna [ÖVERTALA] <Addressee>[honom] <Content>[att hjälpa till]
		övertala_V2_Suasion : V2 ; -- <Addressee>[Han] hade [ÖVERTALATS] <Content>[till räddningsaktionen]

		lämna_in_V2_Submitting_documents : V2 ; -- <Submittor>[Jag] har [LÄMNAT IN] <Documents>[en hemtenta om Gustav Vasas brev]
		skicka_in_V2_Submitting_documents : V2 ; -- <Submittor>[Sveriges kommuner och landsting] har [SKICKAT IN] <Documents>[en skrivelse] <Authority>[till socialdepartementet]
		sända_in_V2_Submitting_documents : V2 ; -- <Submittor>[Vi] har [SÄNT IN] <Documents>[våra brev] <Authority>[till arrangörerna]

		bita_i_gräset_V_Success_or_failure : V ; -- <Agent>[Han] fick [BITA I GRÄSET]
		göra_bort_sig_V_Success_or_failure : V ; -- <Agent>[Jag] kommer att [GÖRA BORT MIG]
		ta_V_Success_or_failure : V ; -- <Agent>[Holm] [TOG] <Goal>[2,20]
		klara_VV_Success_or_failure : VV ; -- <Agent>[Jag] hade [KLARAT] <Goal>[att hjälpa den tjejen]
		klara_av_VV_Success_or_failure : VV ; -- <Agent>[Vissa cd-spelare] [KLARAR AV] <Goal>[att spela upp skivor av andra typer än cd , som exempelvis dvd eller cd-rom]
		misslyckas_V2_Success_or_failure : V2 ; -- [MISSLYCKADES] <Agent>[ett antal partier] <Goal>[med att klara spärren på fem procent]

		göra_susen_V_Successful_action : V ; -- <Instrument>[En nypa socker] [GÖR SUSEN]
		gå_bra_V_Successful_action : V ; -- <Means>[Allt] [GÅR BRA]
		slå_bakut_V_Successful_action : V ; -- <Means>[Det specifika för filmen] [SLÅR BAKUT]
		slå_fel_V_Successful_action : V ; -- <Means>[Skördar som] [SLOG FEL]

		förankra_V2_Successfully_communicate_message : V2 ; -- <Communicator>[De] har rest runt i delstaterna för att [FÖRANKRA] <Message>[förslagen]
		förmedla_V2_Successfully_communicate_message : V2 ; -- <Communicator>[De] visste betyget och hade svårt att [FÖRMEDLA] <Message>[kunskapen om hur de kom fram till det]

		förslå_V_Sufficiency : V ; -- <Item>[Ändringar i organisationen] [FÖRSLÅR]
		räcka_V_Sufficiency : V ; -- <Item>[Pengarna] [RÄCKTE] förstås inte <Enabled_situation>[till allt]
		räcka_till_V_Sufficiency : V ; -- <Item>[vaccinet] inte [RÄCKER TILL]

		ekipera_V2_Supply : V2 ; -- <Supplier>[Jag] hade tagit bussen de två milen till Borlänge och [EKIPERAT] <Recipient>[mig]
		pimpa_V2_Supply : V2 ; -- <Supplier>[smålänningen] [PIMPA] sin <Recipient>[Honda CRX v-tec]
		tanka_V2_Supply : V2 ; -- <Supplier>[pastorn tillsammans med sin älskarinna] och [TANKADE] <Recipient>[bilen]
		förse_V2_Supply : V2 ; -- [FÖRSÅGS] <Recipient>[kyrkorummet]

		stödja_V2_Supporting : V2 ; -- <Supporter>[Min roll] är att [STÖDJA] <Supported>[Fredrik]
		stötta_V2_Supporting : V2 ; -- <Supporter>[de] bära och [STÖTTA] <Supported>[den sjuke]

		överlämna_sig_V_Surrendering : V ; -- <Fugitive>[De flesta av de upproriska soldaterna] [ÖVERLÄMNADE SIG] <Authorities>[till de pakistanska myndigheterna]

		lämna_ifrån_sig_V2_Surrendering_possession : V2 ; -- <Surrenderer>[Chauffören] [LÄMNADE IFRÅN SIG] <Theme>[pengarna]
		överlämna_V2_Surrendering_possession : V2 ; -- <Surrenderer>[Regeringssoldater] [ÖVERLÄMNADE] <Theme>[vapen]

		avlösa_V2_Take_place_of : V2 ; -- <New>[Vice statsminister Mona Sahlin] [AVLÖSTE] <Old>[Jonsson] <Role>[i talarstolen]
		efterträda_V2_Take_place_of : V2 ; -- <New>[Han] [EFTERTRÄDDE] <Old>[Tony Blair]
		ersätta_V2_Take_place_of : V2 ; -- <New>[Avtalet] ska [ERSÄTTA] <Old>[Kyotoprotokollet]

		beslagta_V2_Taking : V2 ; -- <Agent>[Den grekiska regimen] svarade med att [BESLAGTA] <Theme>[motståndsmännens egendomar]
		ta_V2_Taking : V2 ; -- <Agent>[S] [TAR] <Theme>[röster] <Source>[från v]

		berätta_V_Telling : V ; -- <Speaker>[David Eberhard , läkare i psykiatri ,] [BERÄTTAR] <Topic>[om sin syn på det svenska paniksyndromet]
		komma_V_Telling : V ; -- <Speaker>[Han] har enbart att [KOMMA]
		dra_V2_Telling : V2 ; -- <Speaker>[Killen] [DRAR] <Message.>[ett skämt]
		berätta_VS_Telling : VS ; -- <Speaker>[Chauffören] har [BERÄTTAT] <Message>[att det plötsligt bara small till]

		sova_över_V_Temporary_stay : V ; -- <Guest>[Issa] [SOV ÖVER] <Host>[hos mig]
		bo_V_Temporary_stay : V ; -- <Guest>[Jag] [BOR] <Location>[på hotell Örnsköld bakom Dramaten i en liten hytt utan fönster]

		komma_till_tals_V_Text_creation : V ; -- <Author>[Så kallat enklare folk] får sällan [KOMMA TILL TALS]
		skriva_V2_Text_creation : V2 ; -- <Author>[författaren] [SKRIVIT] <Text>[dikten]
		säga_V2_Text_creation : V2 ; -- <Author>[Prästen] [SÄGER] <Text>[några ord av förmaning , råd och uppmuntran]

		snatta_V_Theft : V ; -- <Perpetrator>[Två 13-åriga flickor] ertappas när de [SNATTAT] <Source>[på NK]
		förskingra_V2_Theft : V2 ; -- <Perpetrator>[En polisman med fackligt uppdrag] misstänks ha [FÖRSKINGRAT] <Goods>[en stor summa pengar] <Victim>[från sin fackförening i Västerbotten]
		nalla_V2_Theft : V2 ; -- [NALLADE] <Perpetrator>[han] <Goods>[en godislåda]

		blomstra_V_Thriving : V ; -- [BLOMSTRAR] <Entity>[Sveriges turistnäring]
		rasa_V_Thriving : V ; -- <Entity>[Priserna på bredband] [RASAR]
		frodas_V2_Thriving : V2 ; -- <Entity>[Bluffakturorna] [FRODAS]

		blockera_V2_Thwarting : V2 ; -- <Preventing_cause>[En medlemsstat hotar med att] [BLOCKERA] <Action>[utvecklingen i riktning mot en europeisk arresteringsorder]
		lamslå_V2_Thwarting : V2 ; -- <Preventing_cause>[Nervositeten] hotade att [LAMSLÅ] <Protagonist>[världen]

		behandla_V2_Topic : V2 ; -- <Text>[sångtexterna] [BEHANDLAR] <Topic>[de stora frågorna i livet]
		röra_V2_Topic : V2 ; -- <Text>[mitt brev] [RÖRDE] <Topic>[frågor som i hög grad var aktuella under den senaste delsessionen]

		pendla_V_Travel : V ; -- <Traveler>[Jag] [PENDLADE]

		kretsa_V_Traversing : V ; -- <Path>[Runt omkring oss] [KRETSAR] <Theme>[stewarden Salvatore]
		sicksacka_V_Traversing : V ; -- [SICKSACKADE] <Theme>[brevbäraren] <Path>[i motlutet]
		tvära_V_Traversing : V ; -- <Theme>[Vi] [TVÄRAR] <Path>[in] <Source>[från stigen]

		pröva_V2_Trying_out : V2 ; -- [PRÖVAR] <Evaluator>[skivbranschen] <Entity>[en mjukare taktik]
		pröva_på_V2_Trying_out : V2 ; -- <Evaluator>[Besökarna] ska få [PRÖVA PÅ] <Entity>[olika aktiviteter]
		testköra_V2_Trying_out : V2 ; -- <Evaluator>[Vi] ska [TESTKÖRA] <Entity>[verken]

		säga_VS_Unattributed_information : VS ; -- [SÄGS] <Reported_fact>[att han föredrog ett glas vin med vänner som S A Hedlund och Viktor Rydberg]

		slå_om_V_Undergo_change : V ; -- <Entity>[signalen] [SLÅR OM]
		svänga_V_Undergo_change : V ; -- <Entity>[Matchen] [SVÄNGDE]

		undergå_V2_Undergoing : V2 ; -- [UNDERGICK] <Entity>[han] <Event>[stärkande fysisk träning med en professionell muskelknutte]
		underkasta_sig_V2_Undergoing : V2 ; -- <Entity>[han] grips och får [UNDERKASTA SIG] <Event>[provtagning]

		dra_av_sig_V2_Undressing : V2 ; -- <Wearer>[Hon] [DRAR AV SIG] <Clothing>[mössan]
		klä_V2_Undressing : V2 ; -- <Wearer>[Man] [AVKLÄDDE] <Clothing>[allt]

		avfyra_V2_Use_firearm : V2 ; -- <Agent>[terroristerna] [AVFYRAT] <Firearm>[sina maskingevär]

		begagna_V2_Using : V2 ; -- <Instrument>[Dräkter] , <Instrument>[kulisser] och <Instrument>[rekvisita] [BEGAGNAR] <Agent>[man]
		ta_till_V2_Using : V2 ; -- <Agent>[Forskare i USA] vill [TA TILL] <Instrument>[drastiska medicinska åtgärder] <Purpose>[för att få bukt med fetmaepidemin]
		ta_tillvara_V2_Using : V2 ; -- [TA TILLVARA] <Instrument>[kompetensen]
		tillämpa_V2_Using : V2 ; -- <Agent>[Swebus] [TILLÄMPAR] <Instrument>[en strikt företagspolicy] <Purpose>[för att behålla en drogfri arbetsmiljö]
		tas_i_anspråk_V2_Using : V2 ; -- <Instrument>[Säve flygplats] [TAS I ANSPRÅK]

		finna_V2_Verdict : V2 ; -- <Judge>[Tingsrätten] [FINNER] <Defendant>[honom] <Finding>[skyldig på samtliga åtalspunkter]

		slå_vad_VS_Wagering : VS ; -- <Gambler>[Jag] kan [SLÅ VAD] <Outcome>[om att Häckens 16-årige Dulee Johnsson har bättre teknik än alla damer i hela Sverige]

		vänta_V_Waiting : V ; -- <Protagonist>[man] få [VÄNTA] <Salient_entity>[på sin första uppkörning]

		vakna_V_Waking_up : V ; -- <Sleeper>[Jag] [VAKNADE] <Sleep_state>[ur drömmen]
		vakna_upp_V_Waking_up : V ; -- <Sleeper>[Ett splittrat USA] [VAKNADE UPP]

		tveka_V_Waver_between_options : V ; -- <Cognizer>[Jag] bara [TVEKAR] <Issue>[mellan vilken metod jag ska välja]
		vackla_V_Waver_between_options : V ; -- <Cognizer>[oppositionen] [VACKLAR]
		hatta_V_Waver_between_options : V ; -- <Cognizer>[Jag] har [HATTAT] <Options>[mellan 100 och 200 meter]
		vela_V_Waver_between_options : V ; -- <Cognizer>[Jag] stod först och [VELADE] , <Options>[mellan vitt och svart]

		bära_V2_Wearing : V2 ; -- [BÄR] <Wearer>[de] dessutom <Clothing>[kilten]

		erövra_V2_Win_prize : V2 ; -- <Competitor>[hon] koras både till Årets idrottskvinna och [ERÖVRA] <Prize>[radions Jerringpris]
		ta_hem_V2_Win_prize : V2 ; -- [TA HEM] <Prize>[bucklan]

		dra_sig_tillbaka_V_Withdraw_from_participation : V ; -- <Participant>[en överförmyndare] [DRAR SIG TILLBAKA]

}
