concrete TargetsEng of TargetsEngAbs = CatEng ** open ParadigmsEng, IrregEng, StructuralEng in {

	flags coding = utf8 ;

	lin

		abandon_V2_Abandonment = mkV2 (mkV "abandon" "abandons" "abandoned" "abandoned" "abandoning") ;
		forget_V2_Abandonment = mkV2 (irregDuplV "forget" "forgot" "forgotten") ;

		crawl_V_Abounding_with = mkV "crawl" "crawls" "crawled" "crawled" "crawling" ;
		swarm_V_Abounding_with = mkV "swarm" "swarms" "swarmed" "swarmed" "swarming" ;
		teem_V_Abounding_with = mkV "teem" "teems" "teemed" "teemed" "teeming" ;
		throng_V_Abounding_with = mkV "throng" "throngs" "thronged" "thronged" "thronging" ;

		boil_V_Absorb_heat = mkV "boil" "boils" "boiled" "boiled" "boiling" ;
		scorch_V_Absorb_heat = mkV "scorch" "scorches" "scorched" "scorched" "scorching" ;
		simmer_V_Absorb_heat = mkV "simmer" "simmers" "simmered" "simmered" "simmering" ;
		sizzle_V_Absorb_heat = mkV "sizzle" "sizzles" "sizzled" "sizzled" "sizzling" ;

		abuse_V2_Abusing = mkV2 (mkV "abuse" "abuses" "abused" "abused" "abusing") ;
		batter_V2_Abusing = mkV2 (mkV "batter" "batters" "battered" "battered" "battering") ;
		maltreat_V2_Abusing = mkV2 (mkV "maltreat" "maltreats" "maltreated" "maltreated" "maltreating") ;

		accomplish_V2_Accomplishment = mkV2 (mkV "accomplish" "accomplishes" "accomplished" "accomplished" "accomplishing") ;
		achieve_V2_Accomplishment = mkV2 (mkV "achieve" "achieves" "achieved" "achieved" "achieving") ;

		coin_V2_Achieving_first = mkV2 (mkV "coin" "coins" "coined" "coined" "coining") ;
		discover_V2_Achieving_first = mkV2 (mkV "discover" "discovers" "discovered" "discovered" "discovering") ;
		invent_V2_Achieving_first = mkV2 (mkV "invent" "invents" "invented" "invented" "inventing") ;
		originate_V2_Achieving_first = mkV2 (mkV "originate" "originates" "originated" "originated" "originating") ;
		pioneer_V2_Achieving_first = mkV2 (mkV "pioneer" "pioneers" "pioneered" "pioneered" "pioneering") ;
		invent_VS_Achieving_first = mkVS (mkV "invent" "invents" "invented" "invented" "inventing") ;

		complete_V2_Activity_finish = mkV2 (mkV "complete" "completes" "completed" "completed" "completing") ;
		conclude_V2_Activity_finish = mkV2 (mkV "conclude" "concludes" "concluded" "concluded" "concluding") ;
		finish_V2_Activity_finish = mkV2 (mkV "finish" "finishes" "finished" "finished" "finishing") ;

		continue_VV_Activity_ongoing = mkVV (mkV "continue" "continues" "continued" "continued" "continuing") ;
		keep_VV_Activity_ongoing = mkVV (irregV "keep" "kept" "kept") ;

		freeze_V2_Activity_pause = mkV2 (irregV "freeze" "froze" "frozen") ;
		suspend_V2_Activity_pause = mkV2 (mkV "suspend" "suspends" "suspended" "suspended" "suspending") ;

		prepare_V_Activity_prepare = mkV "prepare" "prepares" "prepared" "prepared" "preparing" ;
		ready_V_Activity_prepare = mkV "ready" ;

		renew_V2_Activity_resume = mkV2 (mkV "renew" "renews" "renewed" "renewed" "renewing") ;
		restart_V2_Activity_resume = mkV2 (mkV "restart" "restarts" "restarted" "restarted" "restarting") ;
		resume_V2_Activity_resume = mkV2 (mkV "resume" "resumes" "resumed" "resumed" "resuming") ;

		enter_V_Activity_start = mkV "enter" "enters" "entered" "entered" "entering" ;
		launch_V_Activity_start = mkV "launch" "launches" "launched" "launched" "launching" ;
		swing_V_Activity_start = irregV "swing" "swung" "swung" ;
		begin_V2_Activity_start = mkV2 (irregV "begin" "began" "begun") ;
		commence_V2_Activity_start = mkV2 (mkV "commence" "commences" "commenced" "commenced" "commencing") ;
		enter_V2_Activity_start = mkV2 (mkV "enter" "enters" "entered" "entered" "entering") ;
		initiate_V2_Activity_start = mkV2 (mkV "initiate" "initiates" "initiated" "initiated" "initiating") ;
		start_V2_Activity_start = mkV2 (mkV "start" "starts" "started" "started" "starting") ;
		begin_VV_Activity_start = mkVV (irregV "begin" "began" "begun") ;
		commence_VV_Activity_start = mkVV (mkV "commence" "commences" "commenced" "commenced" "commencing") ;
		start_VV_Activity_start = mkVV (mkV "start" "starts" "started" "started" "starting") ;

		abandon_V2_Activity_stop = mkV2 (mkV "abandon" "abandons" "abandoned" "abandoned" "abandoning") ;
		cease_V2_Activity_stop = mkV2 (mkV "cease" "ceases" "ceased" "ceased" "ceasing") ;
		discontinue_V2_Activity_stop = mkV2 (mkV "discontinue" "discontinues" "discontinued" "discontinued" "discontinuing") ;
		halt_V2_Activity_stop = mkV2 (mkV "halt" "halts" "halted" "halted" "halting") ;
		stop_V2_Activity_stop = mkV2 (mkV "stop" "stops" "stopped" "stopped" "stopping") ;
		terminate_V2_Activity_stop = mkV2 (mkV "terminate" "terminates" "terminated" "terminated" "terminating") ;

		tally_V2_Adding_up = mkV2 (mkV "tally" "tallies" "tallied" "tallied" "tallying") ;
		total_V2_Adding_up = mkV2 (us_britishV "total") ;

		adduce_V2_Adducing = mkV2 (mkV "adduce" "adduces" "adduced" "adduced" "adducing") ;
		cite_V2_Adducing = mkV2 (mkV "cite" "cites" "cited" "cited" "citing") ;

		tweak_V_Adjusting = mkV "tweak" "tweaks" "tweaked" "tweaked" "tweaking" ;
		adjust_V2_Adjusting = mkV2 (mkV "adjust" "adjusts" "adjusted" "adjusted" "adjusting") ;
		tweak_V2_Adjusting = mkV2 (mkV "tweak" "tweaks" "tweaked" "tweaked" "tweaking") ;
		calibrate_V2_Adjusting = mkV2 (mkV "calibrate" "calibrates" "calibrated" "calibrated" "calibrating") ;

		adopt_V2_Adopt_selection = mkV2 (mkV "adopt" "adopts" "adopted" "adopted" "adopting") ;
		assume_V2_Adopt_selection = mkV2 (mkV "assume" "assumes" "assumed" "assumed" "assuming") ;
		embrace_V2_Adopt_selection = mkV2 (mkV "embrace" "embraces" "embraced" "embraced" "embracing") ;

		age_V_Aging = mkV "age" "ages" "aged" "aged" "aging" ;
		mature_V_Aging = mkV "mature" "matures" "matured" "matured" "maturing" ;
		mature_V2_Aging = mkV2 (mkV "mature" "matures" "matured" "matured" "maturing") ;

		agree_VV_Agree_or_refuse_to_act = mkVV (mkV "agree") ;
		decline_VV_Agree_or_refuse_to_act = mkVV (mkV "decline" "declines" "declined" "declined" "declining") ;
		refuse_VV_Agree_or_refuse_to_act = mkVV (mkV "refuse" "refuses" "refused" "refused" "refusing") ;

		cultivate_V2_Agriculture = mkV2 (mkV "cultivate" "cultivates" "cultivated" "cultivated" "cultivating") ;
		farm_V2_Agriculture = mkV2 (mkV "farm" "farms" "farmed" "farmed" "farming") ;

		aim_V2_Aiming = mkV2 (mkV "aim" "aims" "aimed" "aimed" "aiming") ;

		accumulate_V2_Amassing = mkV2 (mkV "accumulate" "accumulates" "accumulated" "accumulated" "accumulating") ;
		amass_V2_Amassing = mkV2 (mkV "amass" "amasses" "amassed" "amassed" "amassing") ;
		stockpile_V2_Amassing = mkV2 (mkV "stockpile") ;

		amount_V_Amounting_to = mkV "amount" "amounts" "amounted" "amounted" "amounting" ;
		number_V_Amounting_to = mkV "number" "numbers" "numbered" "numbered" "numbering" ;
		total_V_Amounting_to = us_britishV "total" ;

		bake_V2_Apply_heat = mkV2 (mkV "bake" "bakes" "baked" "baked" "baking") ;
		blanch_V2_Apply_heat = mkV2 (mkV "blanch" "blanches" "blanched" "blanched" "blanching") ;
		boil_V2_Apply_heat = mkV2 (mkV "boil" "boils" "boiled" "boiled" "boiling") ;
		braise_V2_Apply_heat = mkV2 (mkV "braise" "braises" "braised" "braised" "braising") ;
		cook_V2_Apply_heat = mkV2 (mkV "cook" "cooks" "cooked" "cooked" "cooking") ;
		fry_V2_Apply_heat = mkV2 (mkV "fry" "fries" "fried" "fried" "frying") ;
		grill_V2_Apply_heat = mkV2 (mkV "grill" "grills" "grilled" "grilled" "grilling") ;
		parboil_V2_Apply_heat = mkV2 (mkV "parboil" "parboils" "parboiled" "parboiled" "parboiling") ;
		poach_V2_Apply_heat = mkV2 (mkV "poach" "poaches" "poached" "poached" "poaching") ;
		roast_V2_Apply_heat = mkV2 (mkV "roast" "roasts" "roasted" "roasted" "roasting") ;
		scald_V2_Apply_heat = mkV2 (mkV "scald" "scalds" "scalded" "scalded" "scalding") ;
		simmer_V2_Apply_heat = mkV2 (mkV "simmer" "simmers" "simmered" "simmered" "simmering") ;
		steam_V2_Apply_heat = mkV2 (mkV "steam" "steams" "steamed" "steamed" "steaming") ;
		steep_V2_Apply_heat = mkV2 (mkV "steep" "steeps" "steeped" "steeped" "steeping") ;
		stew_V2_Apply_heat = mkV2 (mkV "stew" "stews" "stewed" "stewed" "stewing") ;
		toast_V2_Apply_heat = mkV2 (mkV "toast" "toasts" "toasted" "toasted" "toasting") ;
		brown_V2_Apply_heat = mkV2 (mkV "brown" "browns" "browned" "browned" "browning") ;
		char_V2_Apply_heat = mkV2 (mkV "char" "chars" "charred" "charred" "charring") ;
		barbecue_V2_Apply_heat = mkV2 (mkV "barbecue" "barbecues" "barbecued" "barbecued" "barbecuing") ;

		appoint_V2_Appointing = mkV2 (mkV "appoint" "appoints" "appointed" "appointed" "appointing") ;
		name_V2_Appointing = mkV2 (mkV "name" "names" "named" "named" "naming") ;

		arrange_V2_Arranging = mkV2 (mkV "arrange" "arranges" "arranged" "arranged" "arranging") ;
		array_V2_Arranging = mkV2 (mkV "array" "arrays" "arrayed" "arrayed" "arraying") ;
		deploy_V2_Arranging = mkV2 (mkV "deploy" "deploys" "deployed" "deployed" "deploying") ;

		approach_V_Arriving = mkV "approach" "approaches" "approached" "approached" "approaching" ;
		arrive_V_Arriving = mkV "arrive" "arrives" "arrived" "arrived" "arriving" ;
		come_V_Arriving = irregV "come" "came" "come" ;
		descend_V_Arriving = mkV "descend" "descends" "descended" "descended" "descending" ;
		enter_V_Arriving = mkV "enter" "enters" "entered" "entered" "entering" ;
		get_V_Arriving = irregDuplV "get" "got" "gotten" ;
		reach_V_Arriving = mkV "reach" "reaches" "reached" "reached" "reaching" ;
		return_V_Arriving = mkV "return" "returns" "returned" "returned" "returning" ;
		visit_V_Arriving = mkV "visit" "visits" "visited" "visited" "visiting" ;

		meet_V_Assemble = irregV "meet" "met" "met" ;

		appraise_V2_Assessing = mkV2 (mkV "appraise" "appraises" "appraised" "appraised" "appraising") ;
		assess_V2_Assessing = mkV2 (mkV "assess" "assesses" "assessed" "assessed" "assessing") ;
		evaluate_V2_Assessing = mkV2 (mkV "evaluate" "evaluates" "evaluated" "evaluated" "evaluating") ;
		grade_V2_Assessing = mkV2 (mkV "grade" "grades" "graded" "graded" "grading") ;
		judge_V2_Assessing = mkV2 (mkV "judge" "judges" "judged" "judged" "judging") ;
		rank_V2_Assessing = mkV2 (mkV "rank" "ranks" "ranked" "ranked" "ranking") ;
		rate_V2_Assessing = mkV2 (mkV "rate" "rates" "rated" "rated" "rating") ;
		reappraise_V2_Assessing = mkV2 (mkV "reappraise") ;
		value_V2_Assessing = mkV2 (mkV "value" "values" "valued" "valued" "valuing") ;
		weigh_V2_Assessing = mkV2 (mkV "weigh" "weighs" "weighed" "weighed" "weighing") ;

		abet_V2_Assistance = mkV2 (mkV "abet" "abets" "abetted" "abetted" "abetting") ;
		aid_V2_Assistance = mkV2 (mkV "aid" "aids" "aided" "aided" "aiding") ;
		assist_V2_Assistance = mkV2 (mkV "assist" "assists" "assisted" "assisted" "assisting") ;
		help_V2_Assistance = mkV2 (mkV "help" "helps" "helped" "helped" "helping") ;
		aid_V2V_Assistance = mkV2V (mkV "aid" "aids" "aided" "aided" "aiding") noPrep to_Prep ;
		assist_V2V_Assistance = mkV2V (mkV "assist" "assists" "assisted" "assisted" "assisting") noPrep to_Prep ;
		help_V2V_Assistance = mkV2V (mkV "help" "helps" "helped" "helped" "helping") noPrep to_Prep ;

		expiate_V2_Atonement = mkV2 (mkV "expiate" "expiates" "expiated" "expiated" "expiating") ;

		affix_V2_Attaching = mkV2 (mkV "affix" "affixes" "affixed" "affixed" "affixing") ;
		anchor_V2_Attaching = mkV2 (mkV "anchor" "anchors" "anchored" "anchored" "anchoring") ;
		append_V2_Attaching = mkV2 (mkV "append" "appends" "appended" "appended" "appending") ;
		attach_V2_Attaching = mkV2 (mkV "attach" "attaches" "attached" "attached" "attaching") ;
		bind_V2_Attaching = mkV2 (irregV "bind" "bound" "bound") ;
		cement_V2_Attaching = mkV2 (mkV "cement" "cements" "cemented" "cemented" "cementing") ;
		chain_V2_Attaching = mkV2 (mkV "chain" "chains" "chained" "chained" "chaining") ;
		cinch_V2_Attaching = mkV2 (mkV "cinch") ;
		connect_V2_Attaching = mkV2 (mkV "connect" "connects" "connected" "connected" "connecting") ;
		detach_V2_Attaching = mkV2 (mkV "detach" "detaches" "detached" "detached" "detaching") ;
		fasten_V2_Attaching = mkV2 (mkV "fasten" "fastens" "fastened" "fastened" "fastening") ;
		fix_V2_Attaching = mkV2 (mkV "fix" "fixes" "fixed" "fixed" "fixing") ;
		fuse_V2_Attaching = mkV2 (mkV "fuse" "fuses" "fused" "fused" "fusing") ;
		glue_V2_Attaching = mkV2 (mkV "glue" "IRREG" "IRREG" "IRREG" "IRREG") ;
		handcuff_V2_Attaching = mkV2 (mkV "handcuff" "handcuffs" "handcuffed" "handcuffed" "handcuffing") ;
		hitch_V2_Attaching = mkV2 (mkV "hitch" "hitches" "hitched" "hitched" "hitching") ;
		hook_V2_Attaching = mkV2 (mkV "hook" "hooks" "hooked" "hooked" "hooking") ;
		join_V2_Attaching = mkV2 (mkV "join" "joins" "joined" "joined" "joining") ;
		lash_V2_Attaching = mkV2 (mkV "lash" "lashes" "lashed" "lashed" "lashing") ;
		link_V2_Attaching = mkV2 (mkV "link" "links" "linked" "linked" "linking") ;
		manacle_V2_Attaching = mkV2 (mkV "manacle" "manacles" "manacled" "manacled" "manacling") ;
		moor_V2_Attaching = mkV2 (mkV "moor" "moors" "moored" "moored" "mooring") ;
		mount_V2_Attaching = mkV2 (mkV "mount" "mounts" "mounted" "mounted" "mounting") ;
		nail_V2_Attaching = mkV2 (mkV "nail" "nails" "nailed" "nailed" "nailing") ;
		paste_V2_Attaching = mkV2 (mkV "paste" "pastes" "pasted" "pasted" "pasting") ;
		pin_V2_Attaching = mkV2 (mkV "pin" "pins" "pinned" "pinned" "pinning") ;
		plaster_V2_Attaching = mkV2 (mkV "plaster" "plasters" "plastered" "plastered" "plastering") ;
		secure_V2_Attaching = mkV2 (mkV "secure" "secures" "secured" "secured" "securing") ;
		sew_V2_Attaching = mkV2 (irregV "sew" "sewed" (variants {"sewed" ; "sewn"})) ;
		shackle_V2_Attaching = mkV2 (mkV "shackle" "shackles" "shackled" "shackled" "shackling") ;
		solder_V2_Attaching = mkV2 (mkV "solder" "solders" "soldered" "soldered" "soldering") ;
		staple_V2_Attaching = mkV2 (mkV "staple" "staples" "stapled" "stapled" "stapling") ;
		stick_V2_Attaching = mkV2 (irregV "stick" "stuck" "stuck") ;
		strap_V2_Attaching = mkV2 (mkV "strap" "straps" "strapped" "strapped" "strapping") ;
		tack_V2_Attaching = mkV2 (mkV "tack" "tacks" "tacked" "tacked" "tacking") ;
		tape_V2_Attaching = mkV2 (mkV "tape" "tapes" "taped" "taped" "taping") ;
		tether_V2_Attaching = mkV2 (mkV "tether" "tethers" "tethered" "tethered" "tethering") ;
		tie_V2_Attaching = mkV2 (regV "tie") ;
		untie_V2_Attaching = mkV2 (mkV "untie" "IRREG" "IRREG" "IRREG" "IRREG") ;
		weld_V2_Attaching = mkV2 (mkV "weld" "welds" "welded" "welded" "welding") ;
		yoke_V2_Attaching = mkV2 (mkV "yoke" "yokes" "yoked" "yoked" "yoking") ;
		bond_V2_Attaching = mkV2 (mkV "bond" "bonds" "bonded" "bonded" "bonding") ;
		truss_V2_Attaching = mkV2 (mkV "truss" "trusses" "trussed" "trussed" "trussing") ;
		gum_V2_Attaching = mkV2 (mkV "gum" "gums" "gummed" "gummed" "gumming") ;
		rivet_V2_Attaching = mkV2 (mkV "rivet" "rivets" "riveted" "riveted" "riveting") ;

		ambush_V2_Attack = mkV2 (mkV "ambush" "ambushes" "ambushed" "ambushed" "ambushing") ;
		assail_V2_Attack = mkV2 (mkV "assail" "assails" "assailed" "assailed" "assailing") ;
		assault_V2_Attack = mkV2 (mkV "assault" "assaults" "assaulted" "assaulted" "assaulting") ;
		attack_V2_Attack = mkV2 (mkV "attack" "attacks" "attacked" "attacked" "attacking") ;
		bomb_V2_Attack = mkV2 (mkV "bomb" "bombs" "bombed" "bombed" "bombing") ;
		raid_V2_Attack = mkV2 (mkV "raid" "raids" "raided" "raided" "raiding") ;
		storm_V2_Attack = mkV2 (mkV "storm" "storms" "stormed" "stormed" "storming") ;
		strike_V2_Attack = mkV2 (irregV "strike" "struck" "struck") ;

		attempt_V_Attempt = mkV "attempt" "attempts" "attempted" "attempted" "attempting" ;
		try_V_Attempt = mkV "try" "tries" "tried" "tried" "trying" ;
		attempt_VV_Attempt = mkVV (mkV "attempt" "attempts" "attempted" "attempted" "attempting") ;
		try_VV_Attempt = mkVV (mkV "try" "tries" "tried" "tried" "trying") ;
		undertake_VV_Attempt = mkVV (mkV "under" IrregEng.take_V) ;

		avoid_V2_Avoiding = mkV2 (mkV "avoid" "avoids" "avoided" "avoided" "avoiding") ;
		dodge_V2_Avoiding = mkV2 (mkV "dodge" "dodges" "dodged" "dodged" "dodging") ;
		duck_V2_Avoiding = mkV2 (mkV "duck" "ducks" "ducked" "ducked" "ducking") ;
		escape_V2_Avoiding = mkV2 (mkV "escape" "escapes" "escaped" "escaped" "escaping") ;
		eschew_V2_Avoiding = mkV2 (mkV "eschew" "eschews" "eschewed" "eschewed" "eschewing") ;
		evade_V2_Avoiding = mkV2 (mkV "evade" "evades" "evaded" "evaded" "evading") ;
		forgo_V2_Avoiding = mkV2 (mkV "for" IrregEng.go_V) ;
		shirk_V2_Avoiding = mkV2 (mkV "shirk" "shirks" "shirked" "shirked" "shirking") ;
		shun_V2_Avoiding = mkV2 (mkV "shun" "shuns" "shunned" "shunned" "shunning") ;
		sidestep_V2_Avoiding = mkV2 (mkV "sidestep" "sidesteps" "sidestepped" "sidestepped" "sidestepping") ;
		skirt_V2_Avoiding = mkV2 (mkV "skirt" "skirts" "skirted" "skirted" "skirting") ;
		avoid_VV_Avoiding = mkVV (mkV "avoid" "avoids" "avoided" "avoided" "avoiding") ;
		dodge_VV_Avoiding = mkVV (mkV "dodge" "dodges" "dodged" "dodged" "dodging") ;
		duck_VV_Avoiding = mkVV (mkV "duck" "ducks" "ducked" "ducked" "ducking") ;
		evade_VV_Avoiding = mkVV (mkV "evade" "evades" "evaded" "evaded" "evading") ;
		shun_VV_Avoiding = mkVV (mkV "shun" "shuns" "shunned" "shunned" "shunning") ;
		sidestep_VV_Avoiding = mkVV (mkV "sidestep" "sidesteps" "sidestepped" "sidestepped" "sidestepping") ;

		believe_V_Awareness = mkV "believe" "believes" "believed" "believed" "believing" ;
		comprehend_V_Awareness = mkV "comprehend" "comprehends" "comprehended" "comprehended" "comprehending" ;
		conceive_V_Awareness = mkV "conceive" "conceives" "conceived" "conceived" "conceiving" ;
		know_V_Awareness = irregV "know" "knew" "known" ;
		presume_V_Awareness = mkV "presume" "presumes" "presumed" "presumed" "presuming" ;
		suspect_V_Awareness = mkV "suspect" "suspects" "suspected" "suspected" "suspecting" ;
		think_V_Awareness = irregV "think" "thought" "thought" ;
		understand_V_Awareness = irregV "understand" "understood" "understood" ;
		believe_V2_Awareness = mkV2 (mkV "believe" "believes" "believed" "believed" "believing") ;
		comprehend_V2_Awareness = mkV2 (mkV "comprehend" "comprehends" "comprehended" "comprehended" "comprehending") ;
		conceive_V2_Awareness = mkV2 (mkV "conceive" "conceives" "conceived" "conceived" "conceiving") ;
		imagine_V2_Awareness = mkV2 (mkV "imagine" "imagines" "imagined" "imagined" "imagining") ;
		know_V2_Awareness = mkV2 (irregV "know" "knew" "known") ;
		presume_V2_Awareness = mkV2 (mkV "presume" "presumes" "presumed" "presumed" "presuming") ;
		suspect_V2_Awareness = mkV2 (mkV "suspect" "suspects" "suspected" "suspected" "suspecting") ;
		think_V2_Awareness = mkV2 (irregV "think" "thought" "thought") ;
		understand_V2_Awareness = mkV2 (irregV "understand" "understood" "understood") ;
		believe_VS_Awareness = mkVS (mkV "believe" "believes" "believed" "believed" "believing") ;
		comprehend_VS_Awareness = mkVS (mkV "comprehend" "comprehends" "comprehended" "comprehended" "comprehending") ;
		conceive_VS_Awareness = mkVS (mkV "conceive" "conceives" "conceived" "conceived" "conceiving") ;
		imagine_VS_Awareness = mkVS (mkV "imagine" "imagines" "imagined" "imagined" "imagining") ;
		know_VS_Awareness = mkVS (irregV "know" "knew" "known") ;
		presume_VS_Awareness = mkVS (mkV "presume" "presumes" "presumed" "presumed" "presuming") ;
		reckon_VS_Awareness = mkVS (mkV "reckon" "reckons" "reckoned" "reckoned" "reckoning") ;
		suspect_VS_Awareness = mkVS (mkV "suspect" "suspects" "suspected" "suspected" "suspecting") ;
		think_VS_Awareness = mkVS (irregV "think" "thought" "thought") ;
		understand_VS_Awareness = mkVS (irregV "understand" "understood" "understood") ;
		imagine_VV_Awareness = mkVV (mkV "imagine" "imagines" "imagined" "imagined" "imagining") ;
		reckon_VV_Awareness = mkVV (mkV "reckon" "reckons" "reckoned" "reckoned" "reckoning") ;

		agree_V_Be_in_agreement_on_assessment = mkV "agree" ;
		concur_V_Be_in_agreement_on_assessment = mkV "concur" "concurs" "concurred" "concurred" "concurring" ;

		beat_V2_Beat_opponent = mkV2 (irregV "beat" "beat" "beaten") ;
		defeat_V2_Beat_opponent = mkV2 (mkV "defeat" "defeats" "defeated" "defeated" "defeating") ;
		demolish_V2_Beat_opponent = mkV2 (mkV "demolish" "demolishes" "demolished" "demolished" "demolishing") ;
		rout_V2_Beat_opponent = mkV2 (mkV "rout" "routs" "routed" "routed" "routing") ;
		trounce_V2_Beat_opponent = mkV2 (mkV "trounce" "trounces" "trounced" "trounced" "trouncing") ;

		hush_V_Become_silent = mkV "hush" "hushes" "hushed" "hushed" "hushing" ;
		hush_up_V_Become_silent = partV (mkV "hush" "hushes" "hushed" "hushed" "hushing") "up" ;
		quiet_down_V_Become_silent = partV (mkV "quiet" "quiets" "quieted" "quieted" "quieting") "down" ;
		quieten_V_Become_silent = mkV "quieten" "quietens" "quietened" "quietened" "quietening" ;
		shush_V_Become_silent = mkV "shush" "shushes" "shushed" "shushed" "shushing" ;
		shut_up_V_Become_silent = partV (irregDuplV "shut" "shut" "shut") "up" ;

		become_V_Becoming = irregV "become" "became" "become" ;
		end_up_V_Becoming = partV (mkV "end" "ends" "ended" "ended" "ending") "up" ;
		get_V_Becoming = irregDuplV "get" "got" "gotten" ;
		go_V_Becoming = mk5V "go" "goes" "went" "gone" "going" ;
		grow_V_Becoming = irregV "grow" "grew" "grown" ;
		turn_V_Becoming = regV "turn" ;

		enlist_V_Becoming_a_member = mkV "enlist" "enlists" "enlisted" "enlisted" "enlisting" ;
		enroll_V_Becoming_a_member = mkV "enroll" "enrolls" "enrolled" "enrolled" "enrolling" ;
		join_V_Becoming_a_member = mkV "join" "joins" "joined" "joined" "joining" ;
		join_V2_Becoming_a_member = mkV2 (mkV "join" "joins" "joined" "joined" "joining") ;

		discern_V_Becoming_aware = mkV "discern" "discerns" "discerned" "discerned" "discerning" ;
		find_out_V_Becoming_aware = partV (irregV "find" "found" "found") "out" ;
		learn_V_Becoming_aware = irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"}) ;
		recognize_V_Becoming_aware = mkV "recognize" "recognizes" "recognized" "recognized" "recognizing" ;
		spot_V_Becoming_aware = mkV "spot" "spots" "spotted" "spotted" "spotting" ;
		tell_V_Becoming_aware = irregV "tell" "told" "told" ;
		descry_V2_Becoming_aware = mkV2 (mkV "descry" "descries" "descried" "descried" "descrying") ;
		detect_V2_Becoming_aware = mkV2 (mkV "detect" "detects" "detected" "detected" "detecting") ;
		discern_V2_Becoming_aware = mkV2 (mkV "discern" "discerns" "discerned" "discerned" "discerning") ;
		discover_V2_Becoming_aware = mkV2 (mkV "discover" "discovers" "discovered" "discovered" "discovering") ;
		encounter_V2_Becoming_aware = mkV2 (mkV "encounter" "encounters" "encountered" "encountered" "encountering") ;
		espy_V2_Becoming_aware = mkV2 (mkV "espy" "espies" "espied" "espied" "espying") ;
		find_V2_Becoming_aware = mkV2 (irregV "find" "found" "found") ;
		find_out_V2_Becoming_aware = mkV2 (partV (irregV "find" "found" "found") "out") ;
		learn_V2_Becoming_aware = mkV2 (irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"})) ;
		locate_V2_Becoming_aware = mkV2 (mkV "locate" "locates" "located" "located" "locating") ;
		note_V2_Becoming_aware = mkV2 (mkV "note" "notes" "noted" "noted" "noting") ;
		notice_V2_Becoming_aware = mkV2 (mkV "notice" "notices" "noticed" "noticed" "noticing") ;
		perceive_V2_Becoming_aware = mkV2 (mkV "perceive" "perceives" "perceived" "perceived" "perceiving") ;
		recognize_V2_Becoming_aware = mkV2 (mkV "recognize" "recognizes" "recognized" "recognized" "recognizing") ;
		register_V2_Becoming_aware = mkV2 (mkV "register" "registers" "registered" "registered" "registering") ;
		spot_V2_Becoming_aware = mkV2 (mkV "spot" "spots" "spotted" "spotted" "spotting") ;
		discern_VQ_Becoming_aware = mkVQ (mkV "discern" "discerns" "discerned" "discerned" "discerning") ;
		find_out_VQ_Becoming_aware = mkVQ (partV (irregV "find" "found" "found") "out") ;
		locate_VQ_Becoming_aware = mkVQ (mkV "locate" "locates" "located" "located" "locating") ;
		note_VQ_Becoming_aware = mkVQ (mkV "note" "notes" "noted" "noted" "noting") ;
		notice_VQ_Becoming_aware = mkVQ (mkV "notice" "notices" "noticed" "noticed" "noticing") ;
		perceive_VQ_Becoming_aware = mkVQ (mkV "perceive" "perceives" "perceived" "perceived" "perceiving") ;
		recognize_VQ_Becoming_aware = mkVQ (mkV "recognize" "recognizes" "recognized" "recognized" "recognizing") ;
		register_VQ_Becoming_aware = mkVQ (mkV "register" "registers" "registered" "registered" "registering") ;
		spot_VQ_Becoming_aware = mkVQ (mkV "spot" "spots" "spotted" "spotted" "spotting") ;
		tell_VQ_Becoming_aware = mkVQ (irregV "tell" "told" "told") ;
		discern_VS_Becoming_aware = mkVS (mkV "discern" "discerns" "discerned" "discerned" "discerning") ;
		discover_VS_Becoming_aware = mkVS (mkV "discover" "discovers" "discovered" "discovered" "discovering") ;
		find_out_VS_Becoming_aware = mkVS (partV (irregV "find" "found" "found") "out") ;
		learn_VS_Becoming_aware = mkVS (irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"})) ;
		note_VS_Becoming_aware = mkVS (mkV "note" "notes" "noted" "noted" "noting") ;
		notice_VS_Becoming_aware = mkVS (mkV "notice" "notices" "noticed" "noticed" "noticing") ;
		perceive_VS_Becoming_aware = mkVS (mkV "perceive" "perceives" "perceived" "perceived" "perceiving") ;
		recognize_VS_Becoming_aware = mkVS (mkV "recognize" "recognizes" "recognized" "recognized" "recognizing") ;
		register_VS_Becoming_aware = mkVS (mkV "register" "registers" "registered" "registered" "registering") ;
		spot_VS_Becoming_aware = mkVS (mkV "spot" "spots" "spotted" "spotted" "spotting") ;
		tell_VS_Becoming_aware = mkVS (irregV "tell" "told" "told") ;

		dehydrate_V_Becoming_dry = mkV "dehydrate" "dehydrates" "dehydrated" "dehydrated" "dehydrating" ;
		dry_V_Becoming_dry = mkV "dry" "dries" "dried" "dried" "drying" ;

		separate_V_Becoming_separated = mkV "separate" "separates" "separated" "separated" "separating" ;

		direct_V2_Behind_the_scenes = mkV2 (mkV "direct" "directs" "directed" "directed" "directing") ;
		film_V2_Behind_the_scenes = mkV2 (mkV "film" "films" "filmed" "filmed" "filming") ;
		produce_V2_Behind_the_scenes = mkV2 (mkV "produce" "produces" "produced" "produced" "producing") ;

		stick_V_Being_attached = irregV "stick" "stuck" "stuck" ;

		-- No target for Being_born

		work_V_Being_employed = mkV "work" "works" "worked" "worked" "working" ;

		sit_V_Being_located = irregDuplV "sit" "sat" "sat" ;

		besiege_V2_Besieging = mkV2 (mkV "besiege" "besieges" "besieged" "besieged" "besieging") ;

		board_V2_Board_vehicle = mkV2 (mkV "board" "boards" "boarded" "boarded" "boarding") ;

		bend_V_Body_movement = irregV "bend" "bent" "bent" ;
		blink_V_Body_movement = mkV "blink" "blinks" "blinked" "blinked" "blinking" ;
		bob_V_Body_movement = mkV "bob" "bobs" "bobbed" "bobbed" "bobbing" ;
		clap_V_Body_movement = mkV "clap" "claps" "clapped" "clapped" "clapping" ;
		crane_V_Body_movement = mkV "crane" "cranes" "craned" "craned" "craning" ;
		curtsy_V_Body_movement = mkV "curtsy" "curtsies" "curtsied" "curtsied" "curtsying" ;
		duck_V_Body_movement = mkV "duck" "ducks" "ducked" "ducked" "ducking" ;
		fidget_V_Body_movement = mkV "fidget" "fidgets" "fidgeted" "fidgeted" "fidgeting" ;
		flap_V_Body_movement = mkV "flap" "flaps" "flapped" "flapped" "flapping" ;
		gnash_V_Body_movement = mkV "gnash" "gnashes" "gnashed" "gnashed" "gnashing" ;
		jerk_V_Body_movement = mkV "jerk" "jerks" "jerked" "jerked" "jerking" ;
		kneel_V_Body_movement = irregV "kneel" "knelt" "knelt" ;
		nod_V_Body_movement = mkV "nod" "nods" "nodded" "nodded" "nodding" ;
		pout_V_Body_movement = mkV "pout" "pouts" "pouted" "pouted" "pouting" ;
		roll_V_Body_movement = mkV "roll" "rolls" "rolled" "rolled" "rolling" ;
		shake_V_Body_movement = irregV "shake" "shook" "shaken" ;
		shiver_V_Body_movement = mkV "shiver" "shivers" "shivered" "shivered" "shivering" ;
		shrug_V_Body_movement = mkV "shrug" "shrugs" "shrugged" "shrugged" "shrugging" ;
		shudder_V_Body_movement = mkV "shudder" "shudders" "shuddered" "shuddered" "shuddering" ;
		shuffle_V_Body_movement = mkV "shuffle" "shuffles" "shuffled" "shuffled" "shuffling" ;
		stamp_V_Body_movement = mkV "stamp" "stamps" "stamped" "stamped" "stamping" ;
		stretch_V_Body_movement = mkV "stretch" "stretches" "stretched" "stretched" "stretching" ;
		swing_V_Body_movement = irregV "swing" "swung" "swung" ;
		toss_V_Body_movement = mkV "toss" "tosses" "tossed" "tossed" "tossing" ;
		twitch_V_Body_movement = mkV "twitch" "twitches" "twitched" "twitched" "twitching" ;
		wave_V_Body_movement = mkV "wave" "waves" "waved" "waved" "waving" ;
		wiggle_V_Body_movement = mkV "wiggle" "wiggles" "wiggled" "wiggled" "wiggling" ;
		wink_V_Body_movement = mkV "wink" "winks" "winked" "winked" "winking" ;
		wriggle_V_Body_movement = mkV "wriggle" "wriggles" "wriggled" "wriggled" "wriggling" ;
		writhe_V_Body_movement = mkV "writhe" "writhes" "writhed" "writhed" "writhing" ;
		yawn_V_Body_movement = mkV "yawn" "yawns" "yawned" "yawned" "yawning" ;

		boast_V_Bragging = mkV "boast" "boasts" "boasted" "boasted" "boasting" ;
		brag_V_Bragging = mkV "brag" "brags" "bragged" "bragged" "bragging" ;

		breathe_V2_Breathing = mkV2 (regV "breathe") ;
		exhale_V2_Breathing = mkV2 (mkV "exhale" "exhales" "exhaled" "exhaled" "exhaling") ;
		inhale_V2_Breathing = mkV2 (mkV "inhale" "inhales" "inhaled" "inhaled" "inhaling") ;
		puff_V2_Breathing = mkV2 (mkV "puff" "puffs" "puffed" "puffed" "puffing") ;
		respire_V2_Breathing = mkV2 (mkV "respire" "respires" "respired" "respired" "respiring") ;

		bring_V2_Bringing = mkV2 (irregV "bring" "brought" "brought") ;
		carry_V2_Bringing = mkV2 (mkV "carry" "carries" "carried" "carried" "carrying") ;
		cart_V2_Bringing = mkV2 (mkV "cart" "carts" "carted" "carted" "carting") ;
		convey_V2_Bringing = mkV2 (mkV "convey" "conveys" "conveyed" "conveyed" "conveying") ;
		drive_V2_Bringing = mkV2 (irregV "drive" "drove" "driven") ;
		ferry_V2_Bringing = mkV2 (mkV "ferry" "ferries" "ferried" "ferried" "ferrying") ;
		fetch_V2_Bringing = mkV2 (mkV "fetch" "fetches" "fetched" "fetched" "fetching") ;
		fly_V2_Bringing = mkV2 (irregV "fly" "flew" "flown") ;
		haul_V2_Bringing = mkV2 (mkV "haul" "hauls" "hauled" "hauled" "hauling") ;
		hump_V2_Bringing = mkV2 (mkV "hump" "humps" "humped" "humped" "humping") ;
		jet_V2_Bringing = mkV2 (mkV "jet" "jets" "jetted" "jetted" "jetting") ;
		lug_V2_Bringing = mkV2 (mkV "lug" "lugs" "lugged" "lugged" "lugging") ;
		paddle_V2_Bringing = mkV2 (mkV "paddle" "paddles" "paddled" "paddled" "paddling") ;
		take_V2_Bringing = mkV2 (irregV "take" "took" "taken") ;
		tote_V2_Bringing = mkV2 (mkV "tote" "totes" "toted" "toted" "toting") ;
		transport_V2_Bringing = mkV2 (mkV "transport" "transports" "transported" "transported" "transporting") ;
		trundle_V2_Bringing = mkV2 (mkV "trundle" "trundles" "trundled" "trundled" "trundling") ;
		wheel_V2_Bringing = mkV2 (mkV "wheel" "wheels" "wheeled" "wheeled" "wheeling") ;

		assemble_V2_Building = mkV2 (mkV "assemble" "assembles" "assembled" "assembled" "assembling") ;
		build_V2_Building = mkV2 (irregV "build" "built" "built") ;
		construct_V2_Building = mkV2 (mkV "construct" "constructs" "constructed" "constructed" "constructing") ;
		erect_V2_Building = mkV2 (mkV "erect" "erects" "erected" "erected" "erecting") ;
		fashion_V2_Building = mkV2 (mkV "fashion" "fashions" "fashioned" "fashioned" "fashioning") ;
		glue_V2_Building = mkV2 (mkV "glue" "IRREG" "IRREG" "IRREG" "IRREG") ;
		make_V2_Building = mkV2 (irregV "make" "made" "made") ;
		piece_together_V2_Building = mkV2 (partV (mkV "piece" "pieces" "pieced" "pieced" "piecing") "together") ;

		fuck_up_V_Bungling = partV (mkV "fuck" "fucks" "fucked" "fucked" "fucking") "up" ;
		fumble_V_Bungling = mkV "fumble" "fumbles" "fumbled" "fumbled" "fumbling" ;
		screw_up_V_Bungling = partV (mkV "screw" "screws" "screwed" "screwed" "screwing") "up" ;
		ruin_V2_Bungling = mkV2 (mkV "ruin" "ruins" "ruined" "ruined" "ruining") ;
		screw_up_V2_Bungling = mkV2 (partV (mkV "screw" "screws" "screwed" "screwed" "screwing") "up") ;

		carry_V2_Carry_goods = mkV2 (mkV "carry" "carries" "carried" "carried" "carrying") ;
		stock_V2_Carry_goods = mkV2 (mkV "stock" "stocks" "stocked" "stocked" "stocking") ;

		suffer_V_Catastrophe = mkV "suffer" "suffers" "suffered" "suffered" "suffering" ;
		befall_V2_Catastrophe = mkV2 (mkV "be" IrregEng.fall_V) ;
		betide_V2_Catastrophe = mkV2 (mkV "betide" "betides" "betided" "betided" "betiding") ;

		categorize_V2_Categorization = mkV2 (mkV "categorize" "categorizes" "categorized" "categorized" "categorizing") ;
		classify_V2_Categorization = mkV2 (mkV "classify" "classifies" "classified" "classified" "classifying") ;
		interpret_V2_Categorization = mkV2 (mkV "interpret" "interprets" "interpreted" "interpreted" "interpreting") ;
		pigeonhole_V2_Categorization = mkV2 (mkV "pigeonhole" "pigeonholes" "pigeonholed" "pigeonholed" "pigeonholing") ;
		typecast_V2_Categorization = mkV2 (mkV "type" IrregEng.cast_V) ;

		lead_V_Causation = irregV "lead" "led" "led" ;
		bring_about_V2_Causation = mkV2 (partV (irregV "bring" "brought" "brought") "about") ;
		cause_V2_Causation = mkV2 (mkV "cause" "causes" "caused" "caused" "causing") ;
		induce_V2_Causation = mkV2 (mkV "induce" "induces" "induced" "induced" "inducing") ;
		wreak_V2_Causation = mkV2 (mkV "wreak" "wreaks" "wreaked" "wreaked" "wreaking") ;
		make_V2_Causation = mkV2 (irregV "make" "made" "made") ;
		render_V2_Causation = mkV2 (mkV "render" "renders" "rendered" "rendered" "rendering") ;
		bring_V2_Causation = mkV2 (irregV "bring" "brought" "brought") ;
		precipitate_V2_Causation = mkV2 (mkV "precipitate" "precipitates" "precipitated" "precipitated" "precipitating") ;
		bring_V2V_Causation = mkV2V (irregV "bring" "brought" "brought") noPrep to_Prep ;
		make_V2V_Causation = mkV2V (irregV "make" "made" "made") noPrep to_Prep ;
		render_V2V_Causation = mkV2V (mkV "render" "renders" "rendered" "rendered" "rendering") noPrep to_Prep ;

		alter_V2_Cause_change = mkV2 (mkV "alter" "alters" "altered" "altered" "altering") ;
		change_V2_Cause_change = mkV2 (mkV "change" "changes" "changed" "changed" "changing") ;
		convert_V2_Cause_change = mkV2 (mkV "convert" "converts" "converted" "converted" "converting") ;
		modify_V2_Cause_change = mkV2 (mkV "modify" "modifies" "modified" "modified" "modifying") ;
		transform_V2_Cause_change = mkV2 (mkV "transform" "transforms" "transformed" "transformed" "transforming") ;
		turn_V2_Cause_change = mkV2 (regV "turn") ;
		vary_V2_Cause_change = mkV2 (mkV "vary" "varies" "varied" "varied" "varying") ;

		harden_V2_Cause_change_of_consistency = mkV2 (mkV "harden" "hardens" "hardened" "hardened" "hardening") ;
		soften_V2_Cause_change_of_consistency = mkV2 (mkV "soften" "softens" "softened" "softened" "softening") ;
		thicken_V2_Cause_change_of_consistency = mkV2 (mkV "thicken" "thickens" "thickened" "thickened" "thickening") ;
		thin_V2_Cause_change_of_consistency = mkV2 (mkV "thin" "thins" "thinned" "thinned" "thinning") ;

		defrost_V2_Cause_change_of_phase = mkV2 (mkV "defrost" "defrosts" "defrosted" "defrosted" "defrosting") ;
		freeze_V2_Cause_change_of_phase = mkV2 (irregV "freeze" "froze" "frozen") ;
		liquefy_V2_Cause_change_of_phase = mkV2 (mkV "liquefy" "liquefies" "liquefied" "liquefied" "liquefying") ;
		melt_V2_Cause_change_of_phase = mkV2 (mkV "melt" "melts" "melted" "melted" "melting") ;
		thaw_V2_Cause_change_of_phase = mkV2 (mkV "thaw" "thaws" "thawed" "thawed" "thawing") ;
		evaporate_V2_Cause_change_of_phase = mkV2 (mkV "evaporate" "evaporates" "evaporated" "evaporated" "evaporating") ;

		fortify_V2_Cause_change_of_strength = mkV2 (mkV "fortify" "fortifies" "fortified" "fortified" "fortifying") ;
		reinforce_V2_Cause_change_of_strength = mkV2 (mkV "reinforce" "reinforces" "reinforced" "reinforced" "reinforcing") ;
		strengthen_V2_Cause_change_of_strength = mkV2 (mkV "strengthen" "strengthens" "strengthened" "strengthened" "strengthening") ;
		weaken_V2_Cause_change_of_strength = mkV2 (mkV "weaken" "weakens" "weakened" "weakened" "weakening") ;

		affront_V2_Cause_emotion = mkV2 (mkV "affront" "affronts" "affronted" "affronted" "affronting") ;
		insult_V2_Cause_emotion = mkV2 (mkV "insult" "insults" "insulted" "insulted" "insulting") ;
		offend_V2_Cause_emotion = mkV2 (mkV "offend" "offends" "offended" "offended" "offending") ;

		pump_V2_Cause_fluidic_motion = mkV2 (mkV "pump" "pumps" "pumped" "pumped" "pumping") ;
		spatter_V2_Cause_fluidic_motion = mkV2 (mkV "spatter" "spatters" "spattered" "spattered" "spattering") ;
		splash_V2_Cause_fluidic_motion = mkV2 (mkV "splash" "splashes" "splashed" "splashed" "splashing") ;
		spray_V2_Cause_fluidic_motion = mkV2 (mkV "spray" "sprays" "sprayed" "sprayed" "spraying") ;
		squirt_V2_Cause_fluidic_motion = mkV2 (mkV "squirt" "squirts" "squirted" "squirted" "squirting") ;

		beat_V_Cause_harm = irregV "beat" "beat" "beaten" ;
		claw_V_Cause_harm = mkV "claw" "claws" "clawed" "clawed" "clawing" ;
		cut_V_Cause_harm = irregDuplV "cut" "cut" "cut" ;
		hit_V_Cause_harm = irregDuplV "hit" "hit" "hit" ;
		jab_V_Cause_harm = mkV "jab" "jabs" "jabbed" "jabbed" "jabbing" ;
		lash_V_Cause_harm = mkV "lash" "lashes" "lashed" "lashed" "lashing" ;
		maim_V_Cause_harm = mkV "maim" "maims" "maimed" "maimed" "maiming" ;
		punch_V_Cause_harm = mkV "punch" "punches" "punched" "punched" "punching" ;
		slap_V_Cause_harm = mkV "slap" "slaps" "slapped" "slapped" "slapping" ;
		smack_V_Cause_harm = mkV "smack" "smacks" "smacked" "smacked" "smacking" ;
		stab_V_Cause_harm = mkV "stab" "stabs" "stabbed" "stabbed" "stabbing" ;
		strike_V_Cause_harm = irregV "strike" "struck" "struck" ;
		bash_V2_Cause_harm = mkV2 (mkV "bash" "bashes" "bashed" "bashed" "bashing") ;
		batter_V2_Cause_harm = mkV2 (mkV "batter" "batters" "battered" "battered" "battering") ;
		beat_V2_Cause_harm = mkV2 (irregV "beat" "beat" "beaten") ;
		belt_V2_Cause_harm = mkV2 (mkV "belt" "belts" "belted" "belted" "belting") ;
		bludgeon_V2_Cause_harm = mkV2 (mkV "bludgeon" "bludgeons" "bludgeoned" "bludgeoned" "bludgeoning") ;
		boil_V2_Cause_harm = mkV2 (mkV "boil" "boils" "boiled" "boiled" "boiling") ;
		bruise_V2_Cause_harm = mkV2 (mkV "bruise" "bruises" "bruised" "bruised" "bruising") ;
		burn_V2_Cause_harm = mkV2 (irregV "burn" (variants {"burned" ; "burnt"}) (variants {"burned" ; "burnt"})) ;
		butt_V2_Cause_harm = mkV2 (mkV "butt" "butts" "butted" "butted" "butting") ;
		cane_V2_Cause_harm = mkV2 (mkV "cane" "canes" "caned" "caned" "caning") ;
		chop_V2_Cause_harm = mkV2 (mkV "chop" "chops" "chopped" "chopped" "chopping") ;
		claw_V2_Cause_harm = mkV2 (mkV "claw" "claws" "clawed" "clawed" "clawing") ;
		clout_V2_Cause_harm = mkV2 (mkV "clout" "clouts" "clouted" "clouted" "clouting") ;
		club_V2_Cause_harm = mkV2 (mkV "club" "clubs" "clubbed" "clubbed" "clubbing") ;
		crack_V2_Cause_harm = mkV2 (mkV "crack" "cracks" "cracked" "cracked" "cracking") ;
		crush_V2_Cause_harm = mkV2 (mkV "crush" "crushes" "crushed" "crushed" "crushing") ;
		cudgel_V2_Cause_harm = mkV2 (mkV "cudgel" "cudgels" "cudgeled" "cudgeled" "cudgeling") ;
		cuff_V2_Cause_harm = mkV2 (mkV "cuff" "cuffs" "cuffed" "cuffed" "cuffing") ;
		cut_V2_Cause_harm = mkV2 (irregDuplV "cut" "cut" "cut") ;
		elbow_V2_Cause_harm = mkV2 (mkV "elbow" "elbows" "elbowed" "elbowed" "elbowing") ;
		electrocute_V2_Cause_harm = mkV2 (mkV "electrocute" "electrocutes" "electrocuted" "electrocuted" "electrocuting") ;
		flagellate_V2_Cause_harm = mkV2 (mkV "flagellate" "flagellates" "flagellated" "flagellated" "flagellating") ;
		flog_V2_Cause_harm = mkV2 (mkV "flog" "flogs" "flogged" "flogged" "flogging") ;
		hammer_V2_Cause_harm = mkV2 (mkV "hammer" "hammers" "hammered" "hammered" "hammering") ;
		hit_V2_Cause_harm = mkV2 (irregDuplV "hit" "hit" "hit") ;
		horsewhip_V2_Cause_harm = mkV2 (mkV "horsewhip" "horsewhips" "horsewhipped" "horsewhipped" "horsewhipping") ;
		hurt_V2_Cause_harm = mkV2 (irregV "hurt" "hurt" "hurt") ;
		impale_V2_Cause_harm = mkV2 (mkV "impale" "impales" "impaled" "impaled" "impaling") ;
		injure_V2_Cause_harm = mkV2 (mkV "injure" "injures" "injured" "injured" "injuring") ;
		jab_V2_Cause_harm = mkV2 (mkV "jab" "jabs" "jabbed" "jabbed" "jabbing") ;
		kick_V2_Cause_harm = mkV2 (mkV "kick" "kicks" "kicked" "kicked" "kicking") ;
		knife_V2_Cause_harm = mkV2 (mkV "knife" "knifes" "knifed" "knifed" "knifing") ;
		knock_V2_Cause_harm = mkV2 (mkV "knock" "knocks" "knocked" "knocked" "knocking") ;
		lash_V2_Cause_harm = mkV2 (mkV "lash" "lashes" "lashed" "lashed" "lashing") ;
		maim_V2_Cause_harm = mkV2 (mkV "maim" "maims" "maimed" "maimed" "maiming") ;
		maul_V2_Cause_harm = mkV2 (mkV "maul" "mauls" "mauled" "mauled" "mauling") ;
		pelt_V2_Cause_harm = mkV2 (mkV "pelt" "pelts" "pelted" "pelted" "pelting") ;
		poison_V2_Cause_harm = mkV2 (mkV "poison" "poisons" "poisoned" "poisoned" "poisoning") ;
		pummel_V2_Cause_harm = mkV2 (mkV "pummel" "pummels" "pummelled" "pummelled" "pummelling") ;
		punch_V2_Cause_harm = mkV2 (mkV "punch" "punches" "punched" "punched" "punching") ;
		slap_V2_Cause_harm = mkV2 (mkV "slap" "slaps" "slapped" "slapped" "slapping") ;
		slice_V2_Cause_harm = mkV2 (mkV "slice" "slices" "sliced" "sliced" "slicing") ;
		smack_V2_Cause_harm = mkV2 (mkV "smack" "smacks" "smacked" "smacked" "smacking") ;
		smash_V2_Cause_harm = mkV2 (mkV "smash" "smashes" "smashed" "smashed" "smashing") ;
		spear_V2_Cause_harm = mkV2 (mkV "spear" "spears" "speared" "speared" "spearing") ;
		squash_V2_Cause_harm = mkV2 (mkV "squash" "squashes" "squashed" "squashed" "squashing") ;
		stab_V2_Cause_harm = mkV2 (mkV "stab" "stabs" "stabbed" "stabbed" "stabbing") ;
		stone_V2_Cause_harm = mkV2 (mkV "stone" "stones" "stoned" "stoned" "stoning") ;
		strike_V2_Cause_harm = mkV2 (irregV "strike" "struck" "struck") ;
		torture_V2_Cause_harm = mkV2 (mkV "torture" "tortures" "tortured" "tortured" "torturing") ;
		whip_V2_Cause_harm = mkV2 (mkV "whip" "whips" "whipped" "whipped" "whipping") ;

		bang_V_Cause_impact = mkV "bang" "bangs" "banged" "banged" "banging" ;
		jab_V_Cause_impact = mkV "jab" "jabs" "jabbed" "jabbed" "jabbing" ;
		rap_V_Cause_impact = mkV "rap" "raps" "rapped" "rapped" "rapping" ;
		thump_V_Cause_impact = mkV "thump" "thumps" "thumped" "thumped" "thumping" ;
		bang_V2_Cause_impact = mkV2 (mkV "bang" "bangs" "banged" "banged" "banging") ;
		clang_V2_Cause_impact = mkV2 (mkV "clang" "clangs" "clanged" "clanged" "clanging") ;
		clatter_V2_Cause_impact = mkV2 (mkV "clatter" "clatters" "clattered" "clattered" "clattering") ;
		click_V2_Cause_impact = mkV2 (mkV "click" "clicks" "clicked" "clicked" "clicking") ;
		clink_V2_Cause_impact = mkV2 (mkV "clink" "clinks" "clinked" "clinked" "clinking") ;
		hit_V2_Cause_impact = mkV2 (irregDuplV "hit" "hit" "hit") ;
		jab_V2_Cause_impact = mkV2 (mkV "jab" "jabs" "jabbed" "jabbed" "jabbing") ;
		ram_V2_Cause_impact = mkV2 (mkV "ram" "rams" "rammed" "rammed" "ramming") ;
		rap_V2_Cause_impact = mkV2 (mkV "rap" "raps" "rapped" "rapped" "rapping") ;
		rattle_V2_Cause_impact = mkV2 (mkV "rattle" "rattles" "rattled" "rattled" "rattling") ;
		run_V2_Cause_impact = mkV2 (irregDuplV "run" "ran" "run") ;
		slam_V2_Cause_impact = mkV2 (mkV "slam" "slams" "slammed" "slammed" "slamming") ;
		slap_V2_Cause_impact = mkV2 (mkV "slap" "slaps" "slapped" "slapped" "slapping") ;
		smack_V2_Cause_impact = mkV2 (mkV "smack" "smacks" "smacked" "smacked" "smacking") ;
		strike_V2_Cause_impact = mkV2 (irregV "strike" "struck" "struck") ;
		thump_V2_Cause_impact = mkV2 (mkV "thump" "thumps" "thumped" "thumped" "thumping") ;
		clash_V2_Cause_impact = mkV2 (mkV "clash" "clashes" "clashed" "clashed" "clashing") ;
		rustle_V2_Cause_impact = mkV2 (mkV "rustle" "rustles" "rustled" "rustled" "rustling") ;

		fling_V_Cause_motion = irregV "fling" "flung" "flung" ;
		hurl_V_Cause_motion = mkV "hurl" "hurls" "hurled" "hurled" "hurling" ;
		press_V_Cause_motion = mkV "press" "presses" "pressed" "pressed" "pressing" ;
		push_V_Cause_motion = regV "push" ;
		thrust_V_Cause_motion = irregV "thrust" "thrust" "thrust" ;
		toss_V_Cause_motion = mkV "toss" "tosses" "tossed" "tossed" "tossing" ;
		chuck_V2_Cause_motion = mkV2 (mkV "chuck" "chucks" "chucked" "chucked" "chucking") ;
		fling_V2_Cause_motion = mkV2 (irregV "fling" "flung" "flung") ;
		hurl_V2_Cause_motion = mkV2 (mkV "hurl" "hurls" "hurled" "hurled" "hurling") ;
		press_V2_Cause_motion = mkV2 (mkV "press" "presses" "pressed" "pressed" "pressing") ;
		propel_V2_Cause_motion = mkV2 (mkV "propel" "propels" "propelled" "propelled" "propelling") ;
		push_V2_Cause_motion = mkV2 (regV "push") ;
		throw_V2_Cause_motion = mkV2 (irregV "throw" "threw" "thrown") ;
		tug_V2_Cause_motion = mkV2 (mkV "tug" "tugs" "tugged" "tugged" "tugging") ;
		catapult_V2_Cause_motion = mkV2 (mkV "catapult" "catapults" "catapulted" "catapulted" "catapulting") ;
		drag_V2_Cause_motion = mkV2 (mkV "drag" "drags" "dragged" "dragged" "dragging") ;
		launch_V2_Cause_motion = mkV2 (mkV "launch" "launches" "launched" "launched" "launching") ;
		nudge_V2_Cause_motion = mkV2 (mkV "nudge" "nudges" "nudged" "nudged" "nudging") ;
		pitch_V2_Cause_motion = mkV2 (mkV "pitch" "pitches" "pitched" "pitched" "pitching") ;
		shove_V2_Cause_motion = mkV2 (mkV "shove" "shoves" "shoved" "shoved" "shoving") ;
		thrust_V2_Cause_motion = mkV2 (irregV "thrust" "thrust" "thrust") ;
		toss_V2_Cause_motion = mkV2 (mkV "toss" "tosses" "tossed" "tossed" "tossing") ;
		yank_V2_Cause_motion = mkV2 (mkV "yank" "yanks" "yanked" "yanked" "yanking") ;
		hurl_V3_Cause_motion = mkV3 (mkV "hurl" "hurls" "hurled" "hurled" "hurling") ;
		press_V3_Cause_motion = mkV3 (mkV "press" "presses" "pressed" "pressed" "pressing") ;
		thrust_V3_Cause_motion = mkV3 (irregV "thrust" "thrust" "thrust") ;
		tug_V3_Cause_motion = mkV3 (mkV "tug" "tugs" "tugged" "tugged" "tugging") ;

		amalgamate_V2_Cause_to_amalgamate = mkV2 (mkV "amalgamate" "amalgamates" "amalgamated" "amalgamated" "amalgamating") ;
		blend_V2_Cause_to_amalgamate = mkV2 (mkV "blend" "blends" "blended" "blended" "blending") ;
		combine_V2_Cause_to_amalgamate = mkV2 (mkV "combine" "combines" "combined" "combined" "combining") ;
		fuse_V2_Cause_to_amalgamate = mkV2 (mkV "fuse" "fuses" "fused" "fused" "fusing") ;
		join_V2_Cause_to_amalgamate = mkV2 (mkV "join" "joins" "joined" "joined" "joining") ;
		meld_V2_Cause_to_amalgamate = mkV2 (mkV "meld") ;
		merge_V2_Cause_to_amalgamate = mkV2 (mkV "merge" "merges" "merged" "merged" "merging") ;
		unify_V2_Cause_to_amalgamate = mkV2 (mkV "unify" "unifies" "unified" "unified" "unifying") ;
		unite_V2_Cause_to_amalgamate = mkV2 (mkV "unite" "unites" "united" "united" "uniting") ;

		dehydrate_V2_Cause_to_be_dry = mkV2 (mkV "dehydrate" "dehydrates" "dehydrated" "dehydrated" "dehydrating") ;
		desiccate_V2_Cause_to_be_dry = mkV2 (mkV "desiccate" "desiccates" "desiccated" "desiccated" "desiccating") ;
		dry_V2_Cause_to_be_dry = mkV2 (mkV "dry" "dries" "dried" "dried" "drying") ;
		dry_off_V2_Cause_to_be_dry = mkV2 (partV (mkV "dry" "dries" "dried" "dried" "drying") "off") ;
		dry_out_V2_Cause_to_be_dry = mkV2 (partV (mkV "dry" "dries" "dried" "dried" "drying") "out") ;
		dry_up_V2_Cause_to_be_dry = mkV2 (partV (mkV "dry" "dries" "dried" "dried" "drying") "up") ;

		add_V2_Cause_to_be_included = mkV2 (regV "add") ;

		sharpen_V2_Cause_to_be_sharp = mkV2 (mkV "sharpen" "sharpens" "sharpened" "sharpened" "sharpening") ;

		dampen_V2_Cause_to_be_wet = mkV2 (mkV "dampen" "dampens" "dampened" "dampened" "dampening") ;
		douse_V2_Cause_to_be_wet = mkV2 (mkV "douse" "douses" "doused" "doused" "dousing") ;
		drench_V2_Cause_to_be_wet = mkV2 (mkV "drench" "drenches" "drenched" "drenched" "drenching") ;
		moisten_V2_Cause_to_be_wet = mkV2 (mkV "moisten" "moistens" "moistened" "moistened" "moistening") ;
		saturate_V2_Cause_to_be_wet = mkV2 (mkV "saturate" "saturates" "saturated" "saturated" "saturating") ;
		soak_V2_Cause_to_be_wet = mkV2 (mkV "soak" "soaks" "soaked" "soaked" "soaking") ;
		souse_V2_Cause_to_be_wet = mkV2 (mkV "souse" "souses" "soused" "soused" "sousing") ;
		wet_V2_Cause_to_be_wet = mkV2 (mkV "wet" "wets" "wetted" "wetted" "wetting") ;

		keep_VV_Cause_to_continue = mkVV (irregV "keep" "kept" "kept") ;

		end_V2_Cause_to_end = mkV2 (mkV "end" "ends" "ended" "ended" "ending") ;
		lift_V2_Cause_to_end = mkV2 (mkV "lift" "lifts" "lifted" "lifted" "lifting") ;

		terrorize_V2_Cause_to_experience = mkV2 (mkV "terrorize" "terrorizes" "terrorized" "terrorized" "terrorizing") ;
		torment_V2_Cause_to_experience = mkV2 (mkV "torment" "torments" "tormented" "tormented" "tormenting") ;

		break_V2_Cause_to_fragment = mkV2 (irregV "break" "broke" "broken") ;
		cleave_V2_Cause_to_fragment = mkV2 (mkV "cleave" "cleaves" "cleaved" "cleaved" "cleaving") ;
		fracture_V2_Cause_to_fragment = mkV2 (mkV "fracture" "fractures" "fractured" "fractured" "fracturing") ;
		fragment_V2_Cause_to_fragment = mkV2 (mkV "fragment" "fragments" "fragmented" "fragmented" "fragmenting") ;
		rend_V2_Cause_to_fragment = mkV2 (mkV "rend") ;
		rip_V2_Cause_to_fragment = mkV2 (mkV "rip" "rips" "ripped" "ripped" "ripping") ;
		rip_up_V2_Cause_to_fragment = mkV2 (partV (mkV "rip" "rips" "ripped" "ripped" "ripping") "up") ;
		shatter_V2_Cause_to_fragment = mkV2 (mkV "shatter" "shatters" "shattered" "shattered" "shattering") ;
		shred_V2_Cause_to_fragment = mkV2 (mkV "shred" "shreds" "shredded" "shredded" "shredding") ;
		smash_V2_Cause_to_fragment = mkV2 (mkV "smash" "smashes" "smashed" "smashed" "smashing") ;
		snap_V2_Cause_to_fragment = mkV2 (mkV "snap" "snaps" "snapped" "snapped" "snapping") ;
		splinter_V2_Cause_to_fragment = mkV2 (mkV "splinter" "splinters" "splintered" "splintered" "splintering") ;
		tear_V2_Cause_to_fragment = mkV2 (irregV "tear" "tore" "torn") ;
		tear_up_V2_Cause_to_fragment = mkV2 (partV (irregV "tear" "tore" "torn") "up") ;

		blast_V2_Cause_to_make_noise = mkV2 (mkV "blast" "blasts" "blasted" "blasted" "blasting") ;
		creak_V2_Cause_to_make_noise = mkV2 (mkV "creak" "creaks" "creaked" "creaked" "creaking") ;
		peep_V2_Cause_to_make_noise = mkV2 (mkV "peep" "peeps" "peeped" "peeped" "peeping") ;
		tinkle_V2_Cause_to_make_noise = mkV2 (mkV "tinkle" "tinkles" "tinkled" "tinkled" "tinkling") ;
		toot_V2_Cause_to_make_noise = mkV2 (mkV "toot" "toots" "tooted" "tooted" "tooting") ;

		develop_V2_Cause_to_make_progress = mkV2 (mkV "develop" "develops" "developed" "developed" "developing") ;
		mature_V2_Cause_to_make_progress = mkV2 (mkV "mature" "matures" "matured" "matured" "maturing") ;
		perfect_V2_Cause_to_make_progress = mkV2 (mkV "perfect" "perfects" "perfected" "perfected" "perfecting") ;

		rotate_V2_Cause_to_move_in_place = mkV2 (mkV "rotate" "rotates" "rotated" "rotated" "rotating") ;
		seesaw_V2_Cause_to_move_in_place = mkV2 (mkV "seesaw" "seesaws" "seesawed" "seesawed" "seesawing") ;
		shake_V2_Cause_to_move_in_place = mkV2 (irregV "shake" "shook" "shaken") ;
		turn_V2_Cause_to_move_in_place = mkV2 (regV "turn") ;
		twirl_V2_Cause_to_move_in_place = mkV2 (mkV "twirl" "twirls" "twirled" "twirled" "twirling") ;
		vibrate_V2_Cause_to_move_in_place = mkV2 (mkV "vibrate" "vibrates" "vibrated" "vibrated" "vibrating") ;

		show_V2_Cause_to_perceive = mkV2 (irregV "show" "showed" (variants {"showed" ; "shown"})) ;

		reinstate_V2_Cause_to_resume = mkV2 (mkV "reinstate" "reinstates" "reinstated" "reinstated" "reinstating") ;

		create_V2_Cause_to_start = mkV2 (mkV "create" "creates" "created" "created" "creating") ;
		elicit_V2_Cause_to_start = mkV2 (mkV "elicit" "elicits" "elicited" "elicited" "eliciting") ;
		engender_V2_Cause_to_start = mkV2 (mkV "engender" "engenders" "engendered" "engendered" "engendering") ;
		generate_V2_Cause_to_start = mkV2 (mkV "generate" "generates" "generated" "generated" "generating") ;
		spark_V2_Cause_to_start = mkV2 (mkV "spark" "sparks" "sparked" "sparked" "sparking") ;

		awaken_V2_Cause_to_wake = mkV2 (mkV "awaken" "awakens" "awakened" "awakened" "awakening") ;
		rouse_V2_Cause_to_wake = mkV2 (mkV "rouse" "rouses" "roused" "roused" "rousing") ;
		wake_V2_Cause_to_wake = mkV2 (irregV "wake" "woke" "woken") ;
		wake_up_V2_Cause_to_wake = mkV2 (partV (irregV "wake" "woke" "woken") "up") ;

		disappear_V_Ceasing_to_be = mkV "disappear" "disappears" "disappeared" "disappeared" "disappearing" ;

		doubt_V_Certainty = mkV "doubt" "doubts" "doubted" "doubted" "doubting" ;
		doubt_VS_Certainty = mkVS (mkV "doubt" "doubts" "doubted" "doubted" "doubting") ;
		know_VS_Certainty = mkVS (irregV "know" "knew" "known") ;

		bear_V_Change_direction = irregV "bear" "bore" "born" ;
		swing_V_Change_direction = irregV "swing" "swung" "swung" ;
		veer_V_Change_direction = mkV "veer" "veers" "veered" "veered" "veering" ;

		prolong_V2_Change_event_duration = mkV2 (mkV "prolong" "prolongs" "prolonged" "prolonged" "prolonging") ;

		delay_V_Change_event_time = mkV "delay" "delays" "delayed" "delayed" "delaying" ;
		delay_V2_Change_event_time = mkV2 (mkV "delay" "delays" "delayed" "delayed" "delaying") ;
		postpone_V2_Change_event_time = mkV2 (mkV "postpone" "postpones" "postponed" "postponed" "postponing") ;
		defer_V2_Change_event_time = mkV2 (mkV "defer" "defers" "deferred" "deferred" "deferring") ;

		clot_V_Change_of_consistency = mkV "clot" "clots" "clotted" "clotted" "clotting" ;
		coagulate_V_Change_of_consistency = mkV "coagulate" "coagulates" "coagulated" "coagulated" "coagulating" ;
		congeal_V_Change_of_consistency = mkV "congeal" "congeals" "congealed" "congealed" "congealing" ;
		curdle_V_Change_of_consistency = mkV "curdle" "curdles" "curdled" "curdled" "curdling" ;
		harden_V_Change_of_consistency = mkV "harden" "hardens" "hardened" "hardened" "hardening" ;
		jell_V_Change_of_consistency = mkV "jell" "jells" "jelled" "jelled" "jelling" ;
		soften_V_Change_of_consistency = mkV "soften" "softens" "softened" "softened" "softening" ;
		thicken_V_Change_of_consistency = mkV "thicken" "thickens" "thickened" "thickened" "thickening" ;

		condense_V_Change_of_phase = mkV "condense" "condenses" "condensed" "condensed" "condensing" ;
		defrost_V_Change_of_phase = mkV "defrost" "defrosts" "defrosted" "defrosted" "defrosting" ;
		evaporate_V_Change_of_phase = mkV "evaporate" "evaporates" "evaporated" "evaporated" "evaporating" ;
		freeze_V_Change_of_phase = irregV "freeze" "froze" "frozen" ;
		liquefy_V_Change_of_phase = mkV "liquefy" "liquefies" "liquefied" "liquefied" "liquefying" ;
		melt_V_Change_of_phase = mkV "melt" "melts" "melted" "melted" "melting" ;
		solidify_V_Change_of_phase = mkV "solidify" "solidifies" "solidified" "solidified" "solidifying" ;
		thaw_V_Change_of_phase = mkV "thaw" "thaws" "thawed" "thawed" "thawing" ;
		vaporize_V_Change_of_phase = mkV "vaporize" "vaporizes" "vaporized" "vaporized" "vaporizing" ;

		activate_V2_Change_operational_state = mkV2 (mkV "activate" "activates" "activated" "activated" "activating") ;
		deactivate_V2_Change_operational_state = mkV2 (mkV "deactivate") ;

		advance_V_Change_position_on_a_scale = mkV "advance" "advances" "advanced" "advanced" "advancing" ;
		climb_V_Change_position_on_a_scale = mkV "climb" "climbs" "climbed" "climbed" "climbing" ;
		decline_V_Change_position_on_a_scale = mkV "decline" "declines" "declined" "declined" "declining" ;
		decrease_V_Change_position_on_a_scale = mkV "decrease" "decreases" "decreased" "decreased" "decreasing" ;
		diminish_V_Change_position_on_a_scale = mkV "diminish" "diminishes" "diminished" "diminished" "diminishing" ;
		dip_V_Change_position_on_a_scale = mkV "dip" "dips" "dipped" "dipped" "dipping" ;
		double_V_Change_position_on_a_scale = mkV "double" "doubles" "doubled" "doubled" "doubling" ;
		drop_V_Change_position_on_a_scale = mkV "drop" "drops" "dropped" "dropped" "dropping" ;
		dwindle_V_Change_position_on_a_scale = mkV "dwindle" "dwindles" "dwindled" "dwindled" "dwindling" ;
		edge_V_Change_position_on_a_scale = mkV "edge" "edges" "edged" "edged" "edging" ;
		explode_V_Change_position_on_a_scale = mkV "explode" "explodes" "exploded" "exploded" "exploding" ;
		fall_V_Change_position_on_a_scale = irregV "fall" "fell" "fallen" ;
		fluctuate_V_Change_position_on_a_scale = mkV "fluctuate" "fluctuates" "fluctuated" "fluctuated" "fluctuating" ;
		grow_V_Change_position_on_a_scale = irregV "grow" "grew" "grown" ;
		increase_V_Change_position_on_a_scale = mkV "increase" "increases" "increased" "increased" "increasing" ;
		jump_V_Change_position_on_a_scale = regV "jump" ;
		mushroom_V_Change_position_on_a_scale = mkV "mushroom" "mushrooms" "mushroomed" "mushroomed" "mushrooming" ;
		plummet_V_Change_position_on_a_scale = mkV "plummet" "plummets" "plummeted" "plummeted" "plummeting" ;
		reach_V_Change_position_on_a_scale = mkV "reach" "reaches" "reached" "reached" "reaching" ;
		rise_V_Change_position_on_a_scale = irregV "rise" "rose" "risen" ;
		rocket_V_Change_position_on_a_scale = mkV "rocket" "rockets" "rocketed" "rocketed" "rocketing" ;
		skyrocket_V_Change_position_on_a_scale = mkV "skyrocket" "skyrockets" "skyrocketed" "skyrocketed" "skyrocketing" ;
		slide_V_Change_position_on_a_scale = irregV "slide" "slid" "slid" ;
		soar_V_Change_position_on_a_scale = mkV "soar" "soars" "soared" "soared" "soaring" ;
		swing_V_Change_position_on_a_scale = irregV "swing" "swung" "swung" ;
		triple_V_Change_position_on_a_scale = mkV "triple" "triples" "tripled" "tripled" "tripling" ;
		tumble_V_Change_position_on_a_scale = mkV "tumble" "tumbles" "tumbled" "tumbled" "tumbling" ;
		gain_V_Change_position_on_a_scale = mkV "gain" "gains" "gained" "gained" "gaining" ;

		bend_V_Change_posture = irregV "bend" "bent" "bent" ;
		crouch_V_Change_posture = mkV "crouch" "crouches" "crouched" "crouched" "crouching" ;
		crouch_down_V_Change_posture = partV (mkV "crouch" "crouches" "crouched" "crouched" "crouching") "down" ;
		drop_V_Change_posture = mkV "drop" "drops" "dropped" "dropped" "dropping" ;
		huddle_V_Change_posture = mkV "huddle" "huddles" "huddled" "huddled" "huddling" ;
		hunch_V_Change_posture = mkV "hunch" "hunches" "hunched" "hunched" "hunching" ;
		hunch_up_V_Change_posture = partV (mkV "hunch" "hunches" "hunched" "hunched" "hunching") "up" ;
		kneel_V_Change_posture = irregV "kneel" "knelt" "knelt" ;
		kneel_down_V_Change_posture = partV (irregV "kneel" "knelt" "knelt") "down" ;
		kneel_up_V_Change_posture = partV (irregV "kneel" "knelt" "knelt") "up" ;
		lean_V_Change_posture = mkV "lean" "leans" "leaned" "leaned" "leaning" ;
		lie_V_Change_posture = irregV "lie" "lay" "lain" ;
		lie_down_V_Change_posture = partV (irregV "lie" "lay" "lain") "down" ;
		rise_V_Change_posture = irregV "rise" "rose" "risen" ;
		sit_V_Change_posture = irregDuplV "sit" "sat" "sat" ;
		sit_down_V_Change_posture = partV (irregDuplV "sit" "sat" "sat") "down" ;
		sit_up_V_Change_posture = partV (irregDuplV "sit" "sat" "sat") "up" ;
		slouch_V_Change_posture = mkV "slouch" "slouches" "slouched" "slouched" "slouching" ;
		sprawl_V_Change_posture = mkV "sprawl" "sprawls" "sprawled" "sprawled" "sprawling" ;
		sprawl_out_V_Change_posture = partV (mkV "sprawl" "sprawls" "sprawled" "sprawled" "sprawling") "out" ;
		squat_V_Change_posture = mkV "squat" "squats" "squatted" "squatted" "squatting" ;
		squat_down_V_Change_posture = partV (mkV "squat" "squats" "squatted" "squatted" "squatting") "down" ;
		stand_V_Change_posture = irregV "stand" "stood" "stood" ;
		stand_up_V_Change_posture = partV (irregV "stand" "stood" "stood") "up" ;
		stoop_V_Change_posture = mkV "stoop" "stoops" "stooped" "stooped" "stooping" ;

		transfer_V_Change_tool = mkV "transfer" "transfers" "transferred" "transferred" "transferring" ;

		chat_V_Chatting = mkV "chat" "chats" "chatted" "chatted" "chatting" ;
		converse_V_Chatting = mkV "converse" "converses" "conversed" "conversed" "conversing" ;
		gossip_V_Chatting = mkV "gossip" "gossips" "gossiped" "gossiped" "gossiping" ;
		joke_V_Chatting = mkV "joke" "jokes" "joked" "joked" "joking" ;
		speak_V_Chatting = irregV "speak" "spoke" "spoken" ;
		talk_V_Chatting = regV "talk" ;

		choose_V2_Choosing = mkV2 (irregV "choose" "chose" "chosen") ;
		pick_V2_Choosing = mkV2 (mkV "pick" "picks" "picked" "picked" "picking") ;

		claim_V2_Claim_ownership = mkV2 (mkV "claim" "claims" "claimed" "claimed" "claiming") ;

		fasten_V2_Closure = mkV2 (mkV "fasten" "fastens" "fastened" "fastened" "fastening") ;
		unzip_V2_Closure = mkV2 (mkV "unzip" "unzips" "unzipped" "unzipped" "unzipping") ;
		zip_V2_Closure = mkV2 (mkV "zip" "zips" "zipped" "zipped" "zipping") ;
		buckle_V2_Closure = mkV2 (mkV "buckle" "buckles" "buckled" "buckled" "buckling") ;
		button_V2_Closure = mkV2 (mkV "button" "buttons" "buttoned" "buttoned" "buttoning") ;
		cap_V2_Closure = mkV2 (mkV "cap" "caps" "capped" "capped" "capping") ;
		lace_V2_Closure = mkV2 (mkV "lace" "laces" "laced" "laced" "lacing") ;
		seal_V2_Closure = mkV2 (mkV "seal" "seals" "sealed" "sealed" "sealing") ;
		tie_V2_Closure = mkV2 (regV "tie") ;
		unbuckle_V2_Closure = mkV2 (mkV "unbuckle" "unbuckles" "unbuckled" "unbuckled" "unbuckling") ;
		uncork_V2_Closure = mkV2 (mkV "uncork" "uncorks" "uncorked" "uncorked" "uncorking") ;
		unfasten_V2_Closure = mkV2 (mkV "unfasten" "unfastens" "unfastened" "unfastened" "unfastening") ;
		unscrew_V2_Closure = mkV2 (mkV "unscrew" "unscrews" "unscrewed" "unscrewed" "unscrewing") ;

		brood_V_Cogitation = mkV "brood" "broods" "brooded" "brooded" "brooding" ;
		consider_V_Cogitation = mkV "consider" "considers" "considered" "considered" "considering" ;
		contemplate_V_Cogitation = mkV "contemplate" "contemplates" "contemplated" "contemplated" "contemplating" ;
		deliberate_V_Cogitation = mkV "deliberate" "deliberates" "deliberated" "deliberated" "deliberating" ;
		dwell_V_Cogitation = mkV "dwell" "dwells" "dwelt" "dwelt" "dwelling" ;
		meditate_V_Cogitation = mkV "meditate" "meditates" "meditated" "meditated" "meditating" ;
		muse_V_Cogitation = mkV "muse" "muses" "mused" "mused" "musing" ;
		ponder_V_Cogitation = mkV "ponder" "ponders" "pondered" "pondered" "pondering" ;
		reflect_V_Cogitation = mkV "reflect" "reflects" "reflected" "reflected" "reflecting" ;
		ruminate_V_Cogitation = mkV "ruminate" "ruminates" "ruminated" "ruminated" "ruminating" ;
		consider_VQ_Cogitation = mkVQ (mkV "consider" "considers" "considered" "considered" "considering") ;
		contemplate_VQ_Cogitation = mkVQ (mkV "contemplate" "contemplates" "contemplated" "contemplated" "contemplating") ;
		meditate_VQ_Cogitation = mkVQ (mkV "meditate" "meditates" "meditated" "meditated" "meditating") ;
		mull_over_VQ_Cogitation = mkVQ (partV (mkV "mull" "mulls" "mulled" "mulled" "mulling") "over") ;
		ponder_VQ_Cogitation = mkVQ (mkV "ponder" "ponders" "pondered" "pondered" "pondering") ;
		reflect_VQ_Cogitation = mkVQ (mkV "reflect" "reflects" "reflected" "reflected" "reflecting") ;
		contemplate_VS_Cogitation = mkVS (mkV "contemplate" "contemplates" "contemplated" "contemplated" "contemplating") ;
		deliberate_VS_Cogitation = mkVS (mkV "deliberate" "deliberates" "deliberated" "deliberated" "deliberating") ;
		mull_over_VS_Cogitation = mkVS (partV (mkV "mull" "mulls" "mulled" "mulled" "mulling") "over") ;
		muse_VS_Cogitation = mkVS (mkV "muse" "muses" "mused" "mused" "musing") ;
		reflect_VS_Cogitation = mkVS (mkV "reflect" "reflects" "reflected" "reflected" "reflecting") ;

		collaborate_V_Collaboration = mkV "collaborate" "collaborates" "collaborated" "collaborated" "collaborating" ;
		conspire_V_Collaboration = mkV "conspire" "conspires" "conspired" "conspired" "conspiring" ;
		partner_V_Collaboration = mkV "partner" "partners" "partnered" "partnered" "partnering" ;
		team_up_V_Collaboration = partV (mkV "team" "teams" "teamed" "teamed" "teaming") "up" ;

		come_together_V_Come_together = partV (irregV "come" "came" "come") "together" ;
		meet_V_Come_together = irregV "meet" "met" "met" ;
		meet_V2_Come_together = mkV2 (irregV "meet" "met" "met") ;

		appear_V_Coming_to_be = mkV "appear" "appears" "appeared" "appeared" "appearing" ;
		arise_V_Coming_to_be = mkV "a" IrregEng.rise_V ;
		coalesce_V_Coming_to_be = mkV "coalesce" "coalesces" "coalesced" "coalesced" "coalescing" ;
		develop_V_Coming_to_be = mkV "develop" "develops" "developed" "developed" "developing" ;
		form_V_Coming_to_be = mkV "form" "forms" "formed" "formed" "forming" ;
		materialize_V_Coming_to_be = mkV "materialize" "materializes" "materialized" "materialized" "materializing" ;

		ascertain_V2_Coming_to_believe = mkV2 (mkV "ascertain" "ascertains" "ascertained" "ascertained" "ascertaining") ;
		conclude_V2_Coming_to_believe = mkV2 (mkV "conclude" "concludes" "concluded" "concluded" "concluding") ;
		deduce_V2_Coming_to_believe = mkV2 (mkV "deduce" "deduces" "deduced" "deduced" "deducing") ;
		find_V2_Coming_to_believe = mkV2 (irregV "find" "found" "found") ;
		guess_V2_Coming_to_believe = mkV2 (mkV "guess" "guesses" "guessed" "guessed" "guessing") ;
		infer_V2_Coming_to_believe = mkV2 (mkV "infer" "infers" "inferred" "inferred" "inferring") ;
		learn_V2_Coming_to_believe = mkV2 (irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"})) ;
		realize_V2_Coming_to_believe = mkV2 (mkV "realize" "realizes" "realized" "realized" "realizing") ;
		surmise_V2_Coming_to_believe = mkV2 (mkV "surmise" "surmises" "surmised" "surmised" "surmising") ;
		ascertain_VS_Coming_to_believe = mkVS (mkV "ascertain" "ascertains" "ascertained" "ascertained" "ascertaining") ;
		conclude_VS_Coming_to_believe = mkVS (mkV "conclude" "concludes" "concluded" "concluded" "concluding") ;
		deduce_VS_Coming_to_believe = mkVS (mkV "deduce" "deduces" "deduced" "deduced" "deducing") ;
		find_VS_Coming_to_believe = mkVS (irregV "find" "found" "found") ;
		guess_VS_Coming_to_believe = mkVS (mkV "guess" "guesses" "guessed" "guessed" "guessing") ;
		infer_VS_Coming_to_believe = mkVS (mkV "infer" "infers" "inferred" "inferred" "inferring") ;
		learn_VS_Coming_to_believe = mkVS (irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"})) ;
		realize_VS_Coming_to_believe = mkVS (mkV "realize" "realizes" "realized" "realized" "realizing") ;
		surmise_VS_Coming_to_believe = mkVS (mkV "surmise" "surmises" "surmised" "surmised" "surmising") ;
		learn_VV_Coming_to_believe = mkVV (irregV "learn" (variants {"learned" ; "learnt"}) (variants {"learned" ; "learnt"})) ;

		coin_V2_Coming_up_with = mkV2 (mkV "coin" "coins" "coined" "coined" "coining") ;
		conceive_V2_Coming_up_with = mkV2 (mkV "conceive" "conceives" "conceived" "conceived" "conceiving") ;
		concoct_V2_Coming_up_with = mkV2 (mkV "concoct" "concocts" "concocted" "concocted" "concocting") ;
		contrive_V2_Coming_up_with = mkV2 (mkV "contrive" "contrives" "contrived" "contrived" "contriving") ;
		cook_up_V2_Coming_up_with = mkV2 (partV (mkV "cook" "cooks" "cooked" "cooked" "cooking") "up") ;
		design_V2_Coming_up_with = mkV2 (mkV "design" "designs" "designed" "designed" "designing") ;
		devise_V2_Coming_up_with = mkV2 (mkV "devise" "devises" "devised" "devised" "devising") ;
		formulate_V2_Coming_up_with = mkV2 (mkV "formulate" "formulates" "formulated" "formulated" "formulating") ;
		hatch_V2_Coming_up_with = mkV2 (mkV "hatch" "hatches" "hatched" "hatched" "hatching") ;
		improvise_V2_Coming_up_with = mkV2 (mkV "improvise" "improvises" "improvised" "improvised" "improvising") ;
		invent_V2_Coming_up_with = mkV2 (mkV "invent" "invents" "invented" "invented" "inventing") ;

		buy_V2_Commerce_buy = mkV2 (irregV "buy" "bought" "bought") ;
		purchase_V2_Commerce_buy = mkV2 (mkV "purchase" "purchases" "purchased" "purchased" "purchasing") ;

		retail_V_Commerce_sell = mkV "retail" "retails" "retailed" "retailed" "retailing" ;
		sell_V_Commerce_sell = irregV "sell" "sold" "sold" ;
		retail_V2_Commerce_sell = mkV2 (mkV "retail" "retails" "retailed" "retailed" "retailing") ;
		sell_V2_Commerce_sell = mkV2 (irregV "sell" "sold" "sold") ;
		vend_V2_Commerce_sell = mkV2 (mkV "vend" "vends" "vended" "vended" "vending") ;

		consent_V_Commitment = mkV "consent" "consents" "consented" "consented" "consenting" ;
		promise_V_Commitment = mkV "promise" "promises" "promised" "promised" "promising" ;
		volunteer_V_Commitment = mkV "volunteer" "volunteers" "volunteered" "volunteered" "volunteering" ;
		covenant_VS_Commitment = mkVS (mkV "covenant" "covenants" "covenanted" "covenanted" "covenanting") ;
		pledge_VS_Commitment = mkVS (mkV "pledge" "pledges" "pledged" "pledged" "pledging") ;
		promise_VS_Commitment = mkVS (mkV "promise" "promises" "promised" "promised" "promising") ;
		swear_VS_Commitment = mkVS (irregV "swear" "swore" "sworn") ;
		threaten_VS_Commitment = mkVS (mkV "threaten" "threatens" "threatened" "threatened" "threatening") ;
		undertake_VS_Commitment = mkVS (mkV "under" IrregEng.take_V) ;
		vow_VS_Commitment = mkVS (mkV "vow" "vows" "vowed" "vowed" "vowing") ;
		consent_VV_Commitment = mkVV (mkV "consent" "consents" "consented" "consented" "consenting") ;
		covenant_VV_Commitment = mkVV (mkV "covenant" "covenants" "covenanted" "covenanted" "covenanting") ;
		pledge_VV_Commitment = mkVV (mkV "pledge" "pledges" "pledged" "pledged" "pledging") ;
		promise_VV_Commitment = mkVV (mkV "promise" "promises" "promised" "promised" "promising") ;
		swear_VV_Commitment = mkVV (irregV "swear" "swore" "sworn") ;
		threaten_VV_Commitment = mkVV (mkV "threaten" "threatens" "threatened" "threatened" "threatening") ;
		undertake_VV_Commitment = mkVV (mkV "under" IrregEng.take_V) ;
		volunteer_VV_Commitment = mkVV (mkV "volunteer" "volunteers" "volunteered" "volunteered" "volunteering") ;
		vow_VV_Commitment = mkVV (mkV "vow" "vows" "vowed" "vowed" "vowing") ;

		commit_V2_Committing_crime = mkV2 (mkV "commit" "commits" "committed" "committed" "committing") ;
		perpetrate_V2_Committing_crime = mkV2 (mkV "perpetrate" "perpetrates" "perpetrated" "perpetrated" "perpetrating") ;

		communicate_V2_Communication = mkV2 (mkV "communicate" "communicates" "communicated" "communicated" "communicating") ;
		say_VS_Communication = mkVS (irregV "say" "said" "said") ;

		babble_V_Communication_manner = mkV "babble" "babbles" "babbled" "babbled" "babbling" ;
		bluster_V_Communication_manner = mkV "bluster" "blusters" "blustered" "blustered" "blustering" ;
		chant_V_Communication_manner = mkV "chant" "chants" "chanted" "chanted" "chanting" ;
		chatter_V_Communication_manner = mkV "chatter" "chatters" "chattered" "chattered" "chattering" ;
		drawl_V_Communication_manner = mkV "drawl" "drawls" "drawled" "drawled" "drawling" ;
		gabble_V_Communication_manner = mkV "gabble" "gabbles" "gabbled" "gabbled" "gabbling" ;
		gibber_V_Communication_manner = mkV "gibber" "gibbers" "gibbered" "gibbered" "gibbering" ;
		jabber_V_Communication_manner = mkV "jabber" "jabbers" "jabbered" "jabbered" "jabbering" ;
		lisp_V_Communication_manner = mkV "lisp" "lisps" "lisped" "lisped" "lisping" ;
		mouth_V_Communication_manner = mkV "mouth" "mouths" "mouthed" "mouthed" "mouthing" ;
		mumble_V_Communication_manner = mkV "mumble" "mumbles" "mumbled" "mumbled" "mumbling" ;
		mutter_V_Communication_manner = mkV "mutter" "mutters" "muttered" "muttered" "muttering" ;
		natter_V_Communication_manner = mkV "natter" "natters" "nattered" "nattered" "nattering" ;
		prattle_V_Communication_manner = mkV "prattle" "prattles" "prattled" "prattled" "prattling" ;
		rant_V_Communication_manner = mkV "rant" "rants" "ranted" "ranted" "ranting" ;
		rave_V_Communication_manner = mkV "rave" "raves" "raved" "raved" "raving" ;
		shout_V_Communication_manner = mkV "shout" "shouts" "shouted" "shouted" "shouting" ;
		simper_V_Communication_manner = mkV "simper" "simpers" "simpered" "simpered" "simpering" ;
		sing_V_Communication_manner = irregV "sing" "sang" "sung" ;
		slur_V_Communication_manner = mkV "slur" "slurs" "slurred" "slurred" "slurring" ;
		stammer_V_Communication_manner = mkV "stammer" "stammers" "stammered" "stammered" "stammering" ;
		stutter_V_Communication_manner = mkV "stutter" "stutters" "stuttered" "stuttered" "stuttering" ;
		whisper_V_Communication_manner = mkV "whisper" "whispers" "whispered" "whispered" "whispering" ;
		babble_V2_Communication_manner = mkV2 (mkV "babble" "babbles" "babbled" "babbled" "babbling") ;
		chant_V2_Communication_manner = mkV2 (mkV "chant" "chants" "chanted" "chanted" "chanting") ;
		chatter_V2_Communication_manner = mkV2 (mkV "chatter" "chatters" "chattered" "chattered" "chattering") ;
		drawl_V2_Communication_manner = mkV2 (mkV "drawl" "drawls" "drawled" "drawled" "drawling") ;
		gabble_V2_Communication_manner = mkV2 (mkV "gabble" "gabbles" "gabbled" "gabbled" "gabbling") ;
		gibber_V2_Communication_manner = mkV2 (mkV "gibber" "gibbers" "gibbered" "gibbered" "gibbering") ;
		lisp_V2_Communication_manner = mkV2 (mkV "lisp" "lisps" "lisped" "lisped" "lisping") ;
		mouth_V2_Communication_manner = mkV2 (mkV "mouth" "mouths" "mouthed" "mouthed" "mouthing") ;
		mumble_V2_Communication_manner = mkV2 (mkV "mumble" "mumbles" "mumbled" "mumbled" "mumbling") ;
		mutter_V2_Communication_manner = mkV2 (mkV "mutter" "mutters" "muttered" "muttered" "muttering") ;
		prattle_V2_Communication_manner = mkV2 (mkV "prattle" "prattles" "prattled" "prattled" "prattling") ;
		rant_V2_Communication_manner = mkV2 (mkV "rant" "rants" "ranted" "ranted" "ranting") ;
		shout_V2_Communication_manner = mkV2 (mkV "shout" "shouts" "shouted" "shouted" "shouting") ;
		simper_V2_Communication_manner = mkV2 (mkV "simper" "simpers" "simpered" "simpered" "simpering") ;
		sing_V2_Communication_manner = mkV2 (irregV "sing" "sang" "sung") ;
		slur_V2_Communication_manner = mkV2 (mkV "slur" "slurs" "slurred" "slurred" "slurring") ;
		stammer_V2_Communication_manner = mkV2 (mkV "stammer" "stammers" "stammered" "stammered" "stammering") ;
		stutter_V2_Communication_manner = mkV2 (mkV "stutter" "stutters" "stuttered" "stuttered" "stuttering") ;
		whisper_V2_Communication_manner = mkV2 (mkV "whisper" "whispers" "whispered" "whispered" "whispering") ;

		semaphore_V_Communication_means = mkV "semaphore" "semaphores" "semaphored" "semaphored" "semaphoring" ;
		telegraph_V_Communication_means = mkV "telegraph" "telegraphs" "telegraphed" "telegraphed" "telegraphing" ;
		cable_V2_Communication_means = mkV2 (mkV "cable" "cables" "cabled" "cabled" "cabling") ;
		radio_V2_Communication_means = mkV2 (mkV "radio") ;
		semaphore_V2_Communication_means = mkV2 (mkV "semaphore" "semaphores" "semaphored" "semaphored" "semaphoring") ;
		telegraph_V2_Communication_means = mkV2 (mkV "telegraph" "telegraphs" "telegraphed" "telegraphed" "telegraphing") ;
		wire_V2_Communication_means = mkV2 (mkV "wire" "wires" "wired" "wired" "wiring") ;

		bleat_VS_Communication_noise = mkVS (mkV "bleat" "bleats" "bleated" "bleated" "bleating") ;
		chuckle_VS_Communication_noise = mkVS (mkV "chuckle" "chuckles" "chuckled" "chuckled" "chuckling") ;
		cluck_VS_Communication_noise = mkVS (mkV "cluck" "clucks" "clucked" "clucked" "clucking") ;
		cry_VS_Communication_noise = mkVS (mkV "cry" "cries" "cried" "cried" "crying") ;
		hiss_VS_Communication_noise = mkVS (mkV "hiss" "hisses" "hissed" "hissed" "hissing") ;
		moan_VS_Communication_noise = mkVS (mkV "moan" "moans" "moaned" "moaned" "moaning") ;
		murmur_VS_Communication_noise = mkVS (mkV "murmur" "murmurs" "murmured" "murmured" "murmuring") ;
		rap_VS_Communication_noise = mkVS (mkV "rap" "raps" "rapped" "rapped" "rapping") ;
		roar_VS_Communication_noise = mkVS (mkV "roar" "roars" "roared" "roared" "roaring") ;
		scream_VS_Communication_noise = mkVS (mkV "scream" "screams" "screamed" "screamed" "screaming") ;
		screech_VS_Communication_noise = mkVS (mkV "screech" "screeches" "screeched" "screeched" "screeching") ;
		shriek_VS_Communication_noise = mkVS (mkV "shriek" "shrieks" "shrieked" "shrieked" "shrieking") ;
		squeal_VS_Communication_noise = mkVS (mkV "squeal" "squeals" "squealed" "squealed" "squealing") ;
		wail_VS_Communication_noise = mkVS (mkV "wail" "wails" "wailed" "wailed" "wailing") ;
		whimper_VS_Communication_noise = mkVS (mkV "whimper" "whimpers" "whimpered" "whimpered" "whimpering") ;
		whine_VS_Communication_noise = mkVS (mkV "whine" "whines" "whined" "whined" "whining") ;
		yell_VS_Communication_noise = mkVS (mkV "yell" "yells" "yelled" "yelled" "yelling") ;

		answer_V_Communication_response = mkV "answer" "answered" ;
		counter_V_Communication_response = mkV "counter" "counters" "countered" "countered" "countering" ;
		reply_V_Communication_response = mkV "reply" "replies" "replied" "replied" "replying" ;
		respond_V_Communication_response = mkV "respond" "responds" "responded" "responded" "responding" ;
		retort_V_Communication_response = mkV "retort" "retorts" "retorted" "retorted" "retorting" ;
		answer_VS_Communication_response = mkVS (mkV "answer" "answered") ;
		counter_VS_Communication_response = mkVS (mkV "counter" "counters" "countered" "countered" "countering") ;
		rejoin_VS_Communication_response = mkVS (mkV "rejoin" "rejoins" "rejoined" "rejoined" "rejoining") ;
		reply_VS_Communication_response = mkVS (mkV "reply" "replies" "replied" "replied" "replying") ;
		respond_VS_Communication_response = mkVS (mkV "respond" "responds" "responded" "responded" "responding") ;
		retort_VS_Communication_response = mkVS (mkV "retort" "retorts" "retorted" "retorted" "retorting") ;

		commute_V2_Commutation = mkV2 (mkV "commute" "commutes" "commuted" "commuted" "commuting") ;

		accord_V_Compatibility = mkV "accord" "accords" "accorded" "accorded" "according" ;
		agree_V_Compatibility = mkV "agree" ;
		clash_V_Compatibility = mkV "clash" "clashes" "clashed" "clashed" "clashing" ;
		cohere_V_Compatibility = mkV "cohere" "coheres" "cohered" "cohered" "cohering" ;
		dovetail_V_Compatibility = mkV "dovetail" "dovetails" "dovetailed" "dovetailed" "dovetailing" ;
		harmonize_V_Compatibility = mkV "harmonize" "harmonizes" "harmonized" "harmonized" "harmonizing" ;
		rhyme_V_Compatibility = mkV "rhyme" "rhymes" "rhymed" "rhymed" "rhyming" ;
		square_V_Compatibility = mkV "square" "squares" "squared" "squared" "squaring" ;
		clash_V2_Compatibility = mkV2 (mkV "clash" "clashes" "clashed" "clashed" "clashing") ;

		play_V_Competition = regV "play" ;

		bitch_V_Complaining = mkV "bitch" "bitches" "bitched" "bitched" "bitching" ;
		complain_V_Complaining = mkV "complain" "complains" "complained" "complained" "complaining" ;
		gripe_V_Complaining = mkV "gripe" ;
		grouse_V_Complaining = mkV "grouse" "grouses" "groused" "groused" "grousing" ;
		grumble_V_Complaining = mkV "grumble" "grumbles" "grumbled" "grumbled" "grumbling" ;
		lament_V_Complaining = mkV "lament" "laments" "lamented" "lamented" "lamenting" ;

		adhere_V_Compliance = mkV "adhere" "adheres" "adhered" "adhered" "adhering" ;
		comply_V_Compliance = mkV "comply" "complies" "complied" "complied" "complying" ;
		conform_V_Compliance = mkV "conform" "conforms" "conformed" "conformed" "conforming" ;
		breach_V2_Compliance = mkV2 (mkV "breach" "breaches" "breached" "breached" "breaching") ;
		break_V2_Compliance = mkV2 (irregV "break" "broke" "broken") ;
		contravene_V2_Compliance = mkV2 (mkV "contravene" "contravenes" "contravened" "contravened" "contravening") ;
		flout_V2_Compliance = mkV2 (mkV "flout" "flouts" "flouted" "flouted" "flouting") ;
		follow_V2_Compliance = mkV2 (mkV "follow" "follows" "followed" "followed" "following") ;
		obey_V2_Compliance = mkV2 (mkV "obey" "obeys" "obeyed" "obeyed" "obeying") ;
		observe_V2_Compliance = mkV2 (mkV "observe" "observes" "observed" "observed" "observing") ;
		violate_V2_Compliance = mkV2 (mkV "violate" "violates" "violated" "violated" "violating") ;

		act_V_Conduct = mkV "act" "acts" "acted" "acted" "acting" ;
		act_up_V_Conduct = partV (mkV "act" "acts" "acted" "acted" "acting") "up" ;
		behave_V_Conduct = mkV "behave" "behaves" "behaved" "behaved" "behaving" ;
		misbehave_V_Conduct = mkV "misbehave" "misbehaves" "misbehaved" "misbehaved" "misbehaving" ;

		confront_V2_Confronting_problem = mkV2 (mkV "confront" "confronts" "confronted" "confronted" "confronting") ;

		fall_V_Conquering = irregV "fall" "fell" "fallen" ;
		capture_V2_Conquering = mkV2 (mkV "capture" "captures" "captured" "captured" "capturing") ;
		conquer_V2_Conquering = mkV2 (mkV "conquer" "conquers" "conquered" "conquered" "conquering") ;

		cable_V2_Contacting = mkV2 (mkV "cable" "cables" "cabled" "cabled" "cabling") ;
		call_V2_Contacting = mkV2 (mkV "call" "calls" "called" "called" "calling") ;
		call_up_V2_Contacting = mkV2 (partV (mkV "call" "calls" "called" "called" "calling") "up") ;
		contact_V2_Contacting = mkV2 (mkV "contact" "contacts" "contacted" "contacted" "contacting") ;
		page_V2_Contacting = mkV2 (mkV "page" "pages" "paged" "paged" "paging") ;
		phone_V2_Contacting = mkV2 (mkV "phone" "phones" "phoned" "phoned" "phoning") ;
		radio_V2_Contacting = mkV2 (mkV "radio") ;
		reach_V2_Contacting = mkV2 (mkV "reach" "reaches" "reached" "reached" "reaching") ;
		ring_V2_Contacting = mkV2 (irregV "ring" "rang" "rung") ;
		telegraph_V2_Contacting = mkV2 (mkV "telegraph" "telegraphs" "telegraphed" "telegraphed" "telegraphing") ;
		telephone_V2_Contacting = mkV2 (mkV "telephone" "telephones" "telephoned" "telephoned" "telephoning") ;

		hold_V2_Containing = mkV2 (irregV "hold" "held" "held") ;
		house_V2_Containing = mkV2 (mkV "house" "houses" "housed" "housed" "housing") ;

		depend_V_Contingency = mkV "depend" "depends" "depended" "depended" "depending" ;
		hang_V_Contingency = irregV "hang" "hung" "hung" ;
		hinge_V_Contingency = mkV "hinge" "hinges" "hinged" "hinged" "hinging" ;
		turn_V_Contingency = regV "turn" ;

		repent_V_Contrition = mkV "repent" "repents" "repented" "repented" "repenting" ;

		emphasize_V2_Convey_importance = mkV2 (mkV "emphasize" "emphasizes" "emphasized" "emphasized" "emphasizing") ;
		stress_V2_Convey_importance = mkV2 (mkV "stress" "stresses" "stressed" "stressed" "stressing") ;
		underline_V2_Convey_importance = mkV2 (mkV "underline" "underlines" "underlined" "underlined" "underlining") ;
		underscore_V2_Convey_importance = mkV2 (mkV "underscore" "underscores" "underscored" "underscored" "underscoring") ;
		emphasize_VS_Convey_importance = mkVS (mkV "emphasize" "emphasizes" "emphasized" "emphasized" "emphasizing") ;
		stress_VS_Convey_importance = mkVS (mkV "stress" "stresses" "stressed" "stressed" "stressing") ;

		bake_V2_Cooking_creation = mkV2 (mkV "bake" "bakes" "baked" "baked" "baking") ;
		concoct_V2_Cooking_creation = mkV2 (mkV "concoct" "concocts" "concocted" "concocted" "concocting") ;
		cook_V2_Cooking_creation = mkV2 (mkV "cook" "cooks" "cooked" "cooked" "cooking") ;
		cook_up_V2_Cooking_creation = mkV2 (partV (mkV "cook" "cooks" "cooked" "cooked" "cooking") "up") ;
		make_V2_Cooking_creation = mkV2 (irregV "make" "made" "made") ;
		prepare_V2_Cooking_creation = mkV2 (mkV "prepare" "prepares" "prepared" "prepared" "preparing") ;
		whip_up_V2_Cooking_creation = mkV2 (partV (mkV "whip" "whips" "whipped" "whipped" "whipping") "up") ;

		corrode_V_Corroding = mkV "corrode" "corrodes" "corroded" "corroded" "corroding" ;
		rust_V_Corroding = mkV "rust" "rusts" "rusted" "rusted" "rusting" ;

		accompany_V2_Cotheme = mkV2 (mkV "accompany" "accompanies" "accompanied" "accompanied" "accompanying") ;
		chase_V2_Cotheme = mkV2 (mkV "chase" "chases" "chased" "chased" "chasing") ;
		conduct_V2_Cotheme = mkV2 (mkV "conduct" "conducts" "conducted" "conducted" "conducting") ;
		escort_V2_Cotheme = mkV2 (mkV "escort" "escorts" "escorted" "escorted" "escorting") ;
		follow_V2_Cotheme = mkV2 (mkV "follow" "follows" "followed" "followed" "following") ;
		guide_V2_Cotheme = mkV2 (mkV "guide" "guides" "guided" "guided" "guiding") ;
		hound_V2_Cotheme = mkV2 (mkV "hound" "hounds" "hounded" "hounded" "hounding") ;
		lead_V2_Cotheme = mkV2 (irregV "lead" "led" "led") ;
		pursue_V2_Cotheme = mkV2 (mkV "pursue" "pursues" "pursued" "pursued" "pursuing") ;
		shadow_V2_Cotheme = mkV2 (mkV "shadow" "shadows" "shadowed" "shadowed" "shadowing") ;
		stalk_V2_Cotheme = mkV2 (mkV "stalk" "stalks" "stalked" "stalked" "stalking") ;
		tail_V2_Cotheme = mkV2 (mkV "tail" "tails" "tailed" "tailed" "tailing") ;
		track_V2_Cotheme = mkV2 (mkV "track" "tracks" "tracked" "tracked" "tracking") ;
		trail_V2_Cotheme = mkV2 (mkV "trail" "trails" "trailed" "trailed" "trailing") ;
		shepherd_V2_Cotheme = mkV2 (mkV "shepherd" "shepherds" "shepherded" "shepherded" "shepherding") ;
		show_V2_Cotheme = mkV2 (irregV "show" "showed" (variants {"showed" ; "shown"})) ;
		usher_V2_Cotheme = mkV2 (mkV "usher" "ushers" "ushered" "ushered" "ushering") ;

		crossexamine_V2_Court_examination = mkV2 (mkV "cross-examine" "cross-examines" "cross-examined" "cross-examined" "cross-examining") ;
		examine_V2_Court_examination = mkV2 (mkV "examine" "examines" "examined" "examined" "examining") ;

		draw_V2_Create_physical_artwork = mkV2 (irregV "draw" "drew" "drawn") ;
		paint_V2_Create_physical_artwork = mkV2 (regV "paint") ;

		paint_V2_Create_representation = mkV2 (regV "paint") ;
		photograph_V2_Create_representation = mkV2 (mkV "photograph" "photographs" "photographed" "photographed" "photographing") ;

		create_V2_Creating = mkV2 (mkV "create" "creates" "created" "created" "creating") ;
		generate_V2_Creating = mkV2 (mkV "generate" "generates" "generated" "generated" "generating") ;
		yield_V2_Creating = mkV2 (mkV "yield" "yields" "yielded" "yielded" "yielding") ;

		investigate_V2_Criminal_investigation = mkV2 (mkV "investigate" "investigates" "investigated" "investigated" "investigating") ;
		probe_V2_Criminal_investigation = mkV2 (mkV "probe" "probes" "probed" "probed" "probing") ;

		chop_V2_Cutting = mkV2 (mkV "chop" "chops" "chopped" "chopped" "chopping") ;
		cube_V2_Cutting = mkV2 (mkV "cube" "cubes" "cubed" "cubed" "cubing") ;
		dice_V2_Cutting = mkV2 (mkV "dice" "dices" "diced" "diced" "dicing") ;
		fillet_V2_Cutting = mkV2 (mkV "fillet" "fillets" "filleted" "filleted" "filleting") ;
		mince_V2_Cutting = mkV2 (mkV "mince" "minces" "minced" "minced" "mincing") ;
		pare_V2_Cutting = mkV2 (mkV "pare" "pares" "pared" "pared" "paring") ;
		slice_V2_Cutting = mkV2 (mkV "slice" "slices" "sliced" "sliced" "slicing") ;

		damage_V2_Damaging = mkV2 (mkV "damage" "damages" "damaged" "damaged" "damaging") ;
		dent_V2_Damaging = mkV2 (mkV "dent" "dents" "dented" "dented" "denting") ;
		rip_V2_Damaging = mkV2 (mkV "rip" "rips" "ripped" "ripped" "ripping") ;
		tear_V2_Damaging = mkV2 (irregV "tear" "tore" "torn") ;

		chance_V2_Daring = mkV2 (mkV "chance" "chances" "chanced" "chanced" "chancing") ;
		dare_V2_Daring = mkV2 (mkV "dare" "dares" "dared" "dared" "daring") ;
		hazard_V2_Daring = mkV2 (mkV "hazard" "hazards" "hazarded" "hazarded" "hazarding") ;
		risk_V2_Daring = mkV2 (mkV "risk" "risks" "risked" "risked" "risking") ;
		venture_V2_Daring = mkV2 (mkV "venture" "ventures" "ventured" "ventured" "venturing") ;
		dare_VV_Daring = mkVV (mkV "dare" "dares" "dared" "dared" "daring") ;
		risk_VV_Daring = mkVV (mkV "risk" "risks" "risked" "risked" "risking") ;
		venture_VV_Daring = mkVV (mkV "venture" "ventures" "ventured" "ventured" "venturing") ;

		croak_V_Death = mkV "croak" "croaks" "croaked" "croaked" "croaking" ;
		die_V_Death = regV "die" ;
		drown_V_Death = mkV "drown" "drowns" "drowned" "drowned" "drowning" ;
		expire_V_Death = mkV "expire" "expires" "expired" "expired" "expiring" ;
		pass_away_V_Death = partV (mkV "pass" "passes" "passed" "passed" "passing") "away" ;
		perish_V_Death = mkV "perish" "perishes" "perished" "perished" "perishing" ;
		starve_V_Death = mkV "starve" "starves" "starved" "starved" "starving" ;

		decide_VV_Deciding = mkVV (mkV "decide" "decides" "decided" "decided" "deciding") ;

		range_V_Delimitation_of_diversity = mkV "range" "ranges" "ranged" "ranged" "ranging" ;

		deliver_V2_Delivery = mkV2 (mkV "deliver" "delivers" "delivered" "delivered" "delivering") ;

		forbid_V2V_Deny_permission = mkV2V (irregDuplV "forbid" "forbade" "forbidden") noPrep to_Prep ;

		depart_V2_Departing = mkV2 (mkV "depart" "departs" "departed" "departed" "departing") ;
		escape_V2_Departing = mkV2 (mkV "escape" "escapes" "escaped" "escaped" "escaping") ;
		exit_V2_Departing = mkV2 (mkV "exit" "exits" "exited" "exited" "exiting") ;
		leave_V2_Departing = mkV2 (irregV "leave" "left" "left") ;

		justify_V2_Deserving = mkV2 (mkV "justify" "justifies" "justified" "justified" "justifying") ;
		warrant_V2_Deserving = mkV2 (mkV "warrant" "warrants" "warranted" "warranted" "warranting") ;

		aspire_V_Desiring = mkV "aspire" "aspires" "aspired" "aspired" "aspiring" ;
		covet_V_Desiring = mkV "covet" "covets" "coveted" "coveted" "coveting" ;
		hanker_V_Desiring = mkV "hanker" "hankers" "hankered" "hankered" "hankering" ;
		hunger_V_Desiring = mkV "hunger" "hungers" "hungered" "hungered" "hungering" ;
		long_V_Desiring = mkV "long" "longs" "longed" "longed" "longing" ;
		lust_V_Desiring = mkV "lust" "lusts" "lusted" "lusted" "lusting" ;
		pine_V_Desiring = mkV "pine" "pines" "pined" "pined" "pining" ;
		thirst_V_Desiring = mkV "thirst" "thirsts" "thirsted" "thirsted" "thirsting" ;
		want_V_Desiring = regV "want" ;
		yearn_V_Desiring = mkV "yearn" "yearns" "yearned" "yearned" "yearning" ;
		covet_V2_Desiring = mkV2 (mkV "covet" "covets" "coveted" "coveted" "coveting") ;
		crave_V2_Desiring = mkV2 (mkV "crave" "craves" "craved" "craved" "craving") ;
		desire_V2_Desiring = mkV2 (mkV "desire" "desires" "desired" "desired" "desiring") ;
		fancy_V2_Desiring = mkV2 (mkV "fancy" "fancies" "fancied" "fancied" "fancying") ;
		feel_like_V2_Desiring = mkV2 (partV (irregV "feel" "felt" "felt") "like") ;
		want_V2_Desiring = mkV2 (regV "want") ;
		yearn_V2_Desiring = mkV2 (mkV "yearn" "yearns" "yearned" "yearned" "yearning") ;
		aspire_VV_Desiring = mkVV (mkV "aspire" "aspires" "aspired" "aspired" "aspiring") ;
		crave_VV_Desiring = mkVV (mkV "crave" "craves" "craved" "craved" "craving") ;
		desire_VV_Desiring = mkVV (mkV "desire" "desires" "desired" "desired" "desiring") ;
		fancy_VV_Desiring = mkVV (mkV "fancy" "fancies" "fancied" "fancied" "fancying") ;
		feel_like_VV_Desiring = mkVV (partV (irregV "feel" "felt" "felt") "like") ;
		hanker_VV_Desiring = mkVV (mkV "hanker" "hankers" "hankered" "hankered" "hankering") ;
		long_VV_Desiring = mkVV (mkV "long" "longs" "longed" "longed" "longing") ;
		lust_VV_Desiring = mkVV (mkV "lust" "lusts" "lusted" "lusted" "lusting") ;
		pine_VV_Desiring = mkVV (mkV "pine" "pines" "pined" "pined" "pining") ;
		thirst_VV_Desiring = mkVV (mkV "thirst" "thirsts" "thirsted" "thirsted" "thirsting") ;
		want_VV_Desiring = mkVV (regV "want") ;
		yearn_VV_Desiring = mkVV (mkV "yearn" "yearns" "yearned" "yearned" "yearning") ;

		blow_up_V2_Destroying = mkV2 (partV (irregV "blow" "blew" "blown") "up") ;
		demolish_V2_Destroying = mkV2 (mkV "demolish" "demolishes" "demolished" "demolished" "demolishing") ;
		destroy_V2_Destroying = mkV2 (mkV "destroy" "destroys" "destroyed" "destroyed" "destroying") ;
		devastate_V2_Destroying = mkV2 (mkV "devastate" "devastates" "devastated" "devastated" "devastating") ;
		raze_V2_Destroying = mkV2 (mkV "raze" "razes" "razed" "razed" "razing") ;
		vaporize_V2_Destroying = mkV2 (mkV "vaporize" "vaporizes" "vaporized" "vaporized" "vaporizing") ;
		annihilate_V2_Destroying = mkV2 (mkV "annihilate" "annihilates" "annihilated" "annihilated" "annihilating") ;
		obliterate_V2_Destroying = mkV2 (mkV "obliterate" "obliterates" "obliterated" "obliterated" "obliterating") ;

		detach_V2_Detaching = mkV2 (mkV "detach" "detaches" "detached" "detached" "detaching") ;
		untie_V2_Detaching = mkV2 (mkV "untie" "IRREG" "IRREG" "IRREG" "IRREG") ;

		detain_V2_Detaining = mkV2 (mkV "detain" "detains" "detained" "detained" "detaining") ;
		hold_V2_Detaining = mkV2 (irregV "hold" "held" "held") ;
		intern_V2_Detaining = mkV2 (mkV "intern" "interns" "interned" "interned" "interning") ;

		differentiate_V2_Differentiation = mkV2 (mkV "differentiate" "differentiates" "differentiated" "differentiated" "differentiating") ;
		discriminate_V2_Differentiation = mkV2 (mkV "discriminate" "discriminates" "discriminated" "discriminated" "discriminating") ;
		distinguish_V2_Differentiation = mkV2 (mkV "distinguish" "distinguishes" "distinguished" "distinguished" "distinguishing") ;
		sort_V2_Differentiation = mkV2 (mkV "sort" "sorts" "sorted" "sorted" "sorting") ;
		know_V2_Differentiation = mkV2 (irregV "know" "knew" "known") ;
		separate_V2_Differentiation = mkV2 (mkV "separate" "separates" "separated" "separated" "separating") ;

		scatter_V2_Dispersal = mkV2 (mkV "scatter" "scatters" "scattered" "scattered" "scattering") ;
		spread_V2_Dispersal = mkV2 (irregV "spread" "spread" "spread") ;
		sprinkle_V2_Dispersal = mkV2 (mkV "sprinkle" "sprinkles" "sprinkled" "sprinkled" "sprinkling") ;
		strew_V2_Dispersal = mkV2 (mkV "strew" "strews" "strewed" "strewed" "strewing") ;

		dodge_V2_Dodging = mkV2 (mkV "dodge" "dodges" "dodged" "dodged" "dodging") ;
		sidestep_V2_Dodging = mkV2 (mkV "sidestep" "sidesteps" "sidestepped" "sidestepped" "sidestepping") ;

		dominate_V2_Dominate_competitor = mkV2 (mkV "dominate" "dominates" "dominated" "dominated" "dominating") ;

		dominate_V2_Dominate_situation = mkV2 (mkV "dominate" "dominates" "dominated" "dominated" "dominating") ;

		dress_V_Dressing = mkV "dress" "dresses" "dressed" "dressed" "dressing" ;
		dress_up_V_Dressing = partV (mkV "dress" "dresses" "dressed" "dressed" "dressing") "up" ;
		don_V2_Dressing = mkV2 (mkV "don" "dons" "donned" "donned" "donning") ;
		dress_V2_Dressing = mkV2 (mkV "dress" "dresses" "dressed" "dressed" "dressing") ;
		get_on_V2_Dressing = mkV2 (partV (irregDuplV "get" "got" "gotten") "on") ;
		pull_on_V2_Dressing = mkV2 (partV (regV "pull") "on") ;
		put_on_V2_Dressing = mkV2 (partV (irregDuplV "put" "put" "put") "on") ;
		slip_on_V2_Dressing = mkV2 (partV (mkV "slip" "slips" "slipped" "slipped" "slipping") "on") ;
		throw_on_V2_Dressing = mkV2 (partV (irregV "throw" "threw" "thrown") "on") ;

		drop_in_V_Drop_in_on = partV (mkV "drop" "drops" "dropped" "dropped" "dropping") "in" ;

		dip_V2_Dunking = mkV2 (mkV "dip" "dips" "dipped" "dipped" "dipping") ;

		lose_V_Earnings_and_losses = irregV "lose" "lost" "lost" ;
		lose_V2_Earnings_and_losses = mkV2 (irregV "lose" "lost" "lost") ;

		blot_out_V_Eclipse = partV (mkV "blot" "blots" "blotted" "blotted" "blotting") "out" ;
		obscure_V_Eclipse = mkV "obscure" "obscures" "obscured" "obscured" "obscuring" ;
		screen_V_Eclipse = mkV "screen" "screens" "screened" "screened" "screening" ;
		shroud_V_Eclipse = mkV "shroud" "shrouds" "shrouded" "shrouded" "shrouding" ;
		block_V2_Eclipse = mkV2 (mkV "block" "blocks" "blocked" "blocked" "blocking") ;
		blot_out_V2_Eclipse = mkV2 (partV (mkV "blot" "blots" "blotted" "blotted" "blotting") "out") ;
		cloak_V2_Eclipse = mkV2 (mkV "cloak" "cloaks" "cloaked" "cloaked" "cloaking") ;
		conceal_V2_Eclipse = mkV2 (mkV "conceal" "conceals" "concealed" "concealed" "concealing") ;
		cover_V2_Eclipse = mkV2 (mkV "cover" "covers" "covered" "covered" "covering") ;
		eclipse_V2_Eclipse = mkV2 (mkV "eclipse" "eclipses" "eclipsed" "eclipsed" "eclipsing") ;
		enshroud_V2_Eclipse = mkV2 (mkV "enshroud" "enshrouds" "enshrouded" "enshrouded" "enshrouding") ;
		hide_V2_Eclipse = mkV2 (irregV "hide" "hid" "hidden") ;
		mask_V2_Eclipse = mkV2 (mkV "mask" "masks" "masked" "masked" "masking") ;
		obscure_V2_Eclipse = mkV2 (mkV "obscure" "obscures" "obscured" "obscured" "obscuring") ;
		obstruct_V2_Eclipse = mkV2 (mkV "obstruct" "obstructs" "obstructed" "obstructed" "obstructing") ;
		screen_V2_Eclipse = mkV2 (mkV "screen" "screens" "screened" "screened" "screening") ;
		shroud_V2_Eclipse = mkV2 (mkV "shroud" "shrouds" "shrouded" "shrouded" "shrouding") ;
		veil_V2_Eclipse = mkV2 (mkV "veil" "veils" "veiled" "veiled" "veiling") ;

		study_V_Education_teaching = mkV "study" "studies" "studied" "studied" "studying" ;
		coach_V2_Education_teaching = mkV2 (mkV "coach" "coaches" "coached" "coached" "coaching") ;
		instruct_V2_Education_teaching = mkV2 (mkV "instruct" "instructs" "instructed" "instructed" "instructing") ;
		school_V2_Education_teaching = mkV2 (mkV "school" "schools" "schooled" "schooled" "schooling") ;
		train_V2_Education_teaching = mkV2 (mkV "train" "trains" "trained" "trained" "training") ;
		tutor_V2_Education_teaching = mkV2 (mkV "tutor" "tutors" "tutored" "tutored" "tutoring") ;

		elude_V2_Elusive_goal = mkV2 (mkV "elude" "eludes" "eluded" "eluded" "eluding") ;
		evade_V2_Elusive_goal = mkV2 (mkV "evade" "evades" "evaded" "evaded" "evading") ;

		emanate_V_Emanating = mkV "emanate" "emanates" "emanated" "emanated" "emanating" ;
		exude_V_Emanating = mkV "exude" "exudes" "exuded" "exuded" "exuding" ;
		issue_V_Emanating = mkV "issue" "issues" "issued" "issued" "issuing" ;
		radiate_V_Emanating = mkV "radiate" "radiates" "radiated" "radiated" "radiating" ;

		discharge_V2_Emitting = mkV2 (mkV "discharge" "discharges" "discharged" "discharged" "discharging") ;
		emit_V2_Emitting = mkV2 (mkV "emit" "emits" "emitted" "emitted" "emitting") ;
		excrete_V2_Emitting = mkV2 (mkV "excrete" "excretes" "excreted" "excreted" "excreting") ;
		exhale_V2_Emitting = mkV2 (mkV "exhale" "exhales" "exhaled" "exhaled" "exhaling") ;
		exude_V2_Emitting = mkV2 (mkV "exude" "exudes" "exuded" "exuded" "exuding") ;
		radiate_V2_Emitting = mkV2 (mkV "radiate" "radiates" "radiated" "radiated" "radiating") ;
		secrete_V2_Emitting = mkV2 (mkV "secrete" "secretes" "secreted" "secreted" "secreting") ;
		void_V2_Emitting = mkV2 (mkV "void" "voids" "voided" "voided" "voiding") ;

		agonize_V_Emotion_active = mkV "agonize" ;
		fret_V_Emotion_active = mkV "fret" "frets" "fretted" "fretted" "fretting" ;
		fuss_V_Emotion_active = mkV "fuss" "fusses" "fussed" "fussed" "fussing" ;
		worry_V_Emotion_active = mkV "worry" "worries" "worried" "worried" "worrying" ;

		boil_V_Emotion_heat = mkV "boil" "boils" "boiled" "boiled" "boiling" ;
		burn_V_Emotion_heat = irregV "burn" (variants {"burned" ; "burnt"}) (variants {"burned" ; "burnt"}) ;
		chafe_V_Emotion_heat = mkV "chafe" "chafes" "chafed" "chafed" "chafing" ;
		fume_V_Emotion_heat = mkV "fume" "fumes" "fumed" "fumed" "fuming" ;
		seethe_V_Emotion_heat = mkV "seethe" "seethes" "seethed" "seethed" "seething" ;
		simmer_V_Emotion_heat = mkV "simmer" "simmers" "simmered" "simmered" "simmering" ;
		stew_V_Emotion_heat = mkV "stew" "stews" "stewed" "stewed" "stewing" ;

		delight_V_Emotions_of_mental_activity = mkV "delight" "delights" "delighted" "delighted" "delighting" ;

		employ_V2_Employing = mkV2 (mkV "employ" "employs" "employed" "employed" "employing") ;

		clear_V_Emptying = mkV "clear" "clears" "cleared" "cleared" "clearing" ;
		deforest_V_Emptying = mkV "deforest" "deforests" "deforested" "deforested" "deforesting" ;
		delouse_V_Emptying = mkV "delouse" "delouses" "deloused" "deloused" "delousing" ;
		denude_V_Emptying = mkV "denude" "denudes" "denuded" "denuded" "denuding" ;
		divest_V_Emptying = mkV "divest" "divests" "divested" "divested" "divesting" ;
		drain_V_Emptying = mkV "drain" "drains" "drained" "drained" "draining" ;
		eviscerate_V_Emptying = mkV "eviscerate" "eviscerates" "eviscerated" "eviscerated" "eviscerating" ;
		gut_V_Emptying = mkV "gut" "guts" "gutted" "gutted" "gutting" ;
		skin_V_Emptying = mkV "skin" "skins" "skinned" "skinned" "skinning" ;
		strip_V_Emptying = mkV "strip" "strips" "stripped" "stripped" "stripping" ;
		bone_V2_Emptying = mkV2 (mkV "bone" "bones" "boned" "boned" "boning") ;
		clear_V2_Emptying = mkV2 (mkV "clear" "clears" "cleared" "cleared" "clearing") ;
		core_V2_Emptying = mkV2 (mkV "core" "cores" "cored" "cored" "coring") ;
		debug_V2_Emptying = mkV2 (mkV "debug" "debugs" "debugged" "debugged" "debugging") ;
		defrost_V2_Emptying = mkV2 (mkV "defrost" "defrosts" "defrosted" "defrosted" "defrosting") ;
		delouse_V2_Emptying = mkV2 (mkV "delouse" "delouses" "deloused" "deloused" "delousing") ;
		denude_V2_Emptying = mkV2 (mkV "denude" "denudes" "denuded" "denuded" "denuding") ;
		disarm_V2_Emptying = mkV2 (mkV "disarm" "disarms" "disarmed" "disarmed" "disarming") ;
		disembowel_V2_Emptying = mkV2 (mkV "disembowel" "disembowels" "disembowelled" "disembowelled" "disembowelling") ;
		divest_V2_Emptying = mkV2 (mkV "divest" "divests" "divested" "divested" "divesting") ;
		drain_V2_Emptying = mkV2 (mkV "drain" "drains" "drained" "drained" "draining") ;
		empty_V2_Emptying = mkV2 (mkV "empty" "empties" "emptied" "emptied" "emptying") ;
		evacuate_V2_Emptying = mkV2 (mkV "evacuate" "evacuates" "evacuated" "evacuated" "evacuating") ;
		eviscerate_V2_Emptying = mkV2 (mkV "eviscerate" "eviscerates" "eviscerated" "eviscerated" "eviscerating") ;
		gut_V2_Emptying = mkV2 (mkV "gut" "guts" "gutted" "gutted" "gutting") ;
		peel_V2_Emptying = mkV2 (mkV "peel" "peels" "peeled" "peeled" "peeling") ;
		purge_V2_Emptying = mkV2 (mkV "purge" "purges" "purged" "purged" "purging") ;
		rid_V2_Emptying = mkV2 (irregDuplV "rid" "rid" "rid") ;
		scalp_V2_Emptying = mkV2 (mkV "scalp" "scalps" "scalped" "scalped" "scalping") ;
		skin_V2_Emptying = mkV2 (mkV "skin" "skins" "skinned" "skinned" "skinning") ;
		strip_V2_Emptying = mkV2 (mkV "strip" "strips" "stripped" "stripped" "stripping") ;
		unload_V2_Emptying = mkV2 (mkV "unload" "unloads" "unloaded" "unloaded" "unloading") ;
		void_V2_Emptying = mkV2 (mkV "void" "voids" "voided" "voided" "voiding") ;
		deforest_V2_Emptying = mkV2 (mkV "deforest" "deforests" "deforested" "deforested" "deforesting") ;

		couch_V_Encoding = mkV "couch" "couches" "couched" "couched" "couching" ;
		phrase_V_Encoding = mkV "phrase" "phrases" "phrased" "phrased" "phrasing" ;
		word_V_Encoding = mkV "word" "words" "worded" "worded" "wording" ;
		couch_V2_Encoding = mkV2 (mkV "couch" "couches" "couched" "couched" "couching") ;
		express_V2_Encoding = mkV2 (mkV "express" "expresses" "expressed" "expressed" "expressing") ;
		frame_V2_Encoding = mkV2 (mkV "frame" "frames" "framed" "framed" "framing") ;
		phrase_V2_Encoding = mkV2 (mkV "phrase" "phrases" "phrased" "phrased" "phrasing") ;
		word_V2_Encoding = mkV2 (mkV "word" "words" "worded" "worded" "wording") ;

		endanger_V2_Endangering = mkV2 (mkV "endanger" "endangers" "endangered" "endangered" "endangering") ;
		imperil_V2_Endangering = mkV2 (mkV "imperil" "imperils" "imperilled" "imperilled" "imperilling") ;

		enforce_V2_Enforcing = mkV2 (mkV "enforce" "enforces" "enforced" "enforced" "enforcing") ;

		plead_V_Entering_of_plea = irregV "plead" "pled" "pled" ;

		escape_V_Escaping = mkV "escape" "escapes" "escaped" "escaped" "escaping" ;
		evacuate_V_Escaping = mkV "evacuate" "evacuates" "evacuated" "evacuated" "evacuating" ;
		scarper_V_Escaping = mkV "scarper" "scarpers" "scarpered" "scarpered" "scarpering" ;

		estimate_VS_Estimating = mkVS (mkV "estimate" "estimates" "estimated" "estimated" "estimating") ;
		guess_VS_Estimating = mkVS (mkV "guess" "guesses" "guessed" "guessed" "guessing") ;

		flee_V_Evading = irregV "flee" "fled" "fled" ;
		get_away_V_Evading = partV (irregDuplV "get" "got" "gotten") "away" ;
		elude_V2_Evading = mkV2 (mkV "elude" "eludes" "eluded" "eluded" "eluding") ;
		evade_V2_Evading = mkV2 (mkV "evade" "evades" "evaded" "evaded" "evading") ;
		flee_V2_Evading = mkV2 (irregV "flee" "fled" "fled") ;

		compare_V_Evaluative_comparison = mkV "compare" "compares" "compared" "compared" "comparing" ;

		happen_V_Event = mkV "happen" "happens" "happened" "happened" "happening" ;
		occur_V_Event = mkV "occur" "occurs" "occurred" "occurred" "occurring" ;
		transpire_V_Event = mkV "transpire" "transpires" "transpired" "transpired" "transpiring" ;
		happen_V2_Event = mkV2 (mkV "happen" "happens" "happened" "happened" "happening") ;
		occur_V2_Event = mkV2 (mkV "occur" "occurs" "occurred" "occurred" "occurring") ;

		argue_V2_Evidence = mkV2 (mkV "argue" "argues" "argued" "argued" "arguing") ;
		attest_V2_Evidence = mkV2 (mkV "attest" "attests" "attested" "attested" "attesting") ;
		contradict_V2_Evidence = mkV2 (mkV "contradict" "contradicts" "contradicted" "contradicted" "contradicting") ;
		corroborate_V2_Evidence = mkV2 (mkV "corroborate" "corroborates" "corroborated" "corroborated" "corroborating") ;
		demonstrate_V2_Evidence = mkV2 (mkV "demonstrate" "demonstrates" "demonstrated" "demonstrated" "demonstrating") ;
		disprove_V2_Evidence = mkV2 (mkV "disprove" "disproves" "disproved" "disproved" "disproving") ;
		evince_V2_Evidence = mkV2 (mkV "evince" "evinces" "evinced" "evinced" "evincing") ;
		indicate_V2_Evidence = mkV2 (mkV "indicate" "indicates" "indicated" "indicated" "indicating") ;
		prove_V2_Evidence = mkV2 (irregV "prove" "proved" (variants {"proved" ; "proven"})) ;
		reveal_V2_Evidence = mkV2 (mkV "reveal" "reveals" "revealed" "revealed" "revealing") ;
		show_V2_Evidence = mkV2 (irregV "show" "showed" (variants {"showed" ; "shown"})) ;
		substantiate_V2_Evidence = mkV2 (mkV "substantiate" "substantiates" "substantiated" "substantiated" "substantiating") ;
		support_V2_Evidence = mkV2 (mkV "support" "supports" "supported" "supported" "supporting") ;
		tell_V2_Evidence = mkV2 (irregV "tell" "told" "told") ;
		verify_V2_Evidence = mkV2 (mkV "verify" "verifies" "verified" "verified" "verifying") ;
		contradict_VQ_Evidence = mkVQ (mkV "contradict" "contradicts" "contradicted" "contradicted" "contradicting") ;
		indicate_VQ_Evidence = mkVQ (mkV "indicate" "indicates" "indicated" "indicated" "indicating") ;
		prove_VQ_Evidence = mkVQ (irregV "prove" "proved" (variants {"proved" ; "proven"})) ;
		reveal_VQ_Evidence = mkVQ (mkV "reveal" "reveals" "revealed" "revealed" "revealing") ;
		show_VQ_Evidence = mkVQ (irregV "show" "showed" (variants {"showed" ; "shown"})) ;
		attest_VS_Evidence = mkVS (mkV "attest" "attests" "attested" "attested" "attesting") ;
		confirm_VS_Evidence = mkVS (mkV "confirm" "confirms" "confirmed" "confirmed" "confirming") ;
		demonstrate_VS_Evidence = mkVS (mkV "demonstrate" "demonstrates" "demonstrated" "demonstrated" "demonstrating") ;
		disprove_VS_Evidence = mkVS (mkV "disprove" "disproves" "disproved" "disproved" "disproving") ;
		indicate_VS_Evidence = mkVS (mkV "indicate" "indicates" "indicated" "indicated" "indicating") ;
		prove_VS_Evidence = mkVS (irregV "prove" "proved" (variants {"proved" ; "proven"})) ;
		reveal_VS_Evidence = mkVS (mkV "reveal" "reveals" "revealed" "revealed" "revealing") ;
		show_VS_Evidence = mkVS (irregV "show" "showed" (variants {"showed" ; "shown"})) ;
		testify_VS_Evidence = mkVS (mkV "testify" "testifies" "testified" "testified" "testifying") ;
		verify_VS_Evidence = mkVS (mkV "verify" "verifies" "verified" "verified" "verifying") ;

		remind_V2_Evoking = mkV2 (mkV "remind" "reminds" "reminded" "reminded" "reminding") ;

		exchange_V2_Exchange = mkV2 (mkV "exchange" "exchanges" "exchanged" "exchanged" "exchanging") ;
		swap_V2_Exchange = mkV2 (mkV "swap" "swaps" "swapped" "swapped" "swapping") ;
		trade_V2_Exchange = mkV2 (mkV "trade" "trades" "traded" "traded" "trading") ;

		excommunicate_V2_Exclude_member = mkV2 (mkV "excommunicate" "excommunicates" "excommunicated" "excommunicated" "excommunicating") ;
		expel_V2_Exclude_member = mkV2 (mkV "expel" "expels" "expelled" "expelled" "expelling") ;

		belch_V2_Excreting = mkV2 (mkV "belch" "belches" "belched" "belched" "belching") ;
		evacuate_V2_Excreting = mkV2 (mkV "evacuate" "evacuates" "evacuated" "evacuated" "evacuating") ;
		piss_V2_Excreting = mkV2 (mkV "piss" "pisses" "pissed" "pissed" "pissing") ;
		regurgitate_V2_Excreting = mkV2 (mkV "regurgitate" "regurgitates" "regurgitated" "regurgitated" "regurgitating") ;
		sweat_V2_Excreting = mkV2 (mkV "sweat" "sweats" "sweated" "sweated" "sweating") ;

		implement_V2_Execute_plan = mkV2 (mkV "implement" "implements" "implemented" "implemented" "implementing") ;

		execute_V2_Execution = mkV2 (mkV "execute" "executes" "executed" "executed" "executing") ;
		hang_V2_Execution = mkV2 (irregV "hang" "hung" "hung") ;

		exist_V_Existence = mkV "exist" "exists" "existed" "existed" "existing" ;
		exist_V2_Existence = mkV2 (mkV "exist" "exists" "existed" "existed" "existing") ;

		anticipate_VQ_Expectation = mkVQ (mkV "anticipate" "anticipates" "anticipated" "anticipated" "anticipating") ;
		foresee_VQ_Expectation = mkVQ (mkV "fore" IrregEng.see_V) ;
		predict_VQ_Expectation = mkVQ (mkV "predict" "predicts" "predicted" "predicted" "predicting") ;
		anticipate_VS_Expectation = mkVS (mkV "anticipate" "anticipates" "anticipated" "anticipated" "anticipating") ;
		await_VS_Expectation = mkVS (mkV "await" "awaits" "awaited" "awaited" "awaiting") ;
		expect_VS_Expectation = mkVS (mkV "expect") ;

		cost_V_Expensiveness = irregV "cost" "cost" "cost" ;

		break_V2_Experience_bodily_harm = mkV2 (irregV "break" "broke" "broken") ;
		burn_V2_Experience_bodily_harm = mkV2 (irregV "burn" (variants {"burned" ; "burnt"}) (variants {"burned" ; "burnt"})) ;
		cut_V2_Experience_bodily_harm = mkV2 (irregDuplV "cut" "cut" "cut") ;
		graze_V2_Experience_bodily_harm = mkV2 (mkV "graze" "grazes" "grazed" "grazed" "grazing") ;
		hit_V2_Experience_bodily_harm = mkV2 (irregDuplV "hit" "hit" "hit") ;
		hurt_V2_Experience_bodily_harm = mkV2 (irregV "hurt" "hurt" "hurt") ;
		injure_V2_Experience_bodily_harm = mkV2 (mkV "injure" "injures" "injured" "injured" "injuring") ;
		pull_V2_Experience_bodily_harm = mkV2 (regV "pull") ;
		sprain_V2_Experience_bodily_harm = mkV2 (mkV "sprain" "sprains" "sprained" "sprained" "spraining") ;
		strain_V2_Experience_bodily_harm = mkV2 (mkV "strain" "strains" "strained" "strained" "straining") ;
		stub_V2_Experience_bodily_harm = mkV2 (mkV "stub" "stubs" "stubbed" "stubbed" "stubbing") ;
		tear_V2_Experience_bodily_harm = mkV2 (irregV "tear" "tore" "torn") ;
		twist_V2_Experience_bodily_harm = mkV2 (mkV "twist" "twists" "twisted" "twisted" "twisting") ;

		abhor_V2_Experiencer_focus = mkV2 (mkV "abhor" "abhors" "abhorred" "abhorred" "abhorring") ;
		abominate_V2_Experiencer_focus = mkV2 (mkV "abominate" "abominates" "abominated" "abominated" "abominating") ;
		adore_V2_Experiencer_focus = mkV2 (mkV "adore" "adores" "adored" "adored" "adoring") ;
		despise_V2_Experiencer_focus = mkV2 (mkV "despise" "despises" "despised" "despised" "despising") ;
		detest_V2_Experiencer_focus = mkV2 (mkV "detest" "detests" "detested" "detested" "detesting") ;
		dislike_V2_Experiencer_focus = mkV2 (mkV "dislike" "dislikes" "disliked" "disliked" "disliking") ;
		dread_V2_Experiencer_focus = mkV2 (mkV "dread" "dreads" "dreaded" "dreaded" "dreading") ;
		envy_V2_Experiencer_focus = mkV2 (mkV "envy" "envies" "envied" "envied" "envying") ;
		fear_V2_Experiencer_focus = mkV2 (regV "fear") ;
		grieve_V2_Experiencer_focus = mkV2 (mkV "grieve" "grieves" "grieved" "grieved" "grieving") ;
		hate_V2_Experiencer_focus = mkV2 (regV "hate") ;
		like_V2_Experiencer_focus = mkV2 (regV "like") ;
		loathe_V2_Experiencer_focus = mkV2 (mkV "loathe" "loathes" "loathed" "loathed" "loathing") ;
		love_V2_Experiencer_focus = mkV2 (regV "love") ;
		mourn_V2_Experiencer_focus = mkV2 (mkV "mourn" "mourns" "mourned" "mourned" "mourning") ;
		pity_V2_Experiencer_focus = mkV2 (mkV "pity" "pities" "pitied" "pitied" "pitying") ;
		regret_V2_Experiencer_focus = mkV2 (mkV "regret" "regrets" "regretted" "regretted" "regretting") ;
		resent_V2_Experiencer_focus = mkV2 (mkV "resent" "resents" "resented" "resented" "resenting") ;
		rue_V2_Experiencer_focus = mkV2 (mkV "rue" "rues" "rued" "rued" "ruing") ;

		amaze_V_Experiencer_obj = mkV "amaze" "amazes" "amazed" "amazed" "amazing" ;
		antagonize_V_Experiencer_obj = mkV "antagonize" "antagonizes" "antagonized" "antagonized" "antagonizing" ;
		astound_V_Experiencer_obj = mkV "astound" "astounds" "astounded" "astounded" "astounding" ;
		captivate_V_Experiencer_obj = mkV "captivate" "captivates" "captivated" "captivated" "captivating" ;
		charm_V_Experiencer_obj = mkV "charm" "charms" "charmed" "charmed" "charming" ;
		cheer_V_Experiencer_obj = mkV "cheer" "cheers" "cheered" "cheered" "cheering" ;
		confuse_V_Experiencer_obj = mkV "confuse" "confuses" "confused" "confused" "confusing" ;
		delight_V_Experiencer_obj = mkV "delight" "delights" "delighted" "delighted" "delighting" ;
		disappoint_V_Experiencer_obj = mkV "disappoint" "disappoints" "disappointed" "disappointed" "disappointing" ;
		displease_V_Experiencer_obj = mkV "displease" "displeases" "displeased" "displeased" "displeasing" ;
		enchant_V_Experiencer_obj = mkV "enchant" "enchants" "enchanted" "enchanted" "enchanting" ;
		enthrall_V_Experiencer_obj = mkV "enthrall" "enthralls" "enthralled" "enthralled" "enthralling" ;
		excite_V_Experiencer_obj = mkV "excite" "excites" "excited" "excited" "exciting" ;
		fascinate_V_Experiencer_obj = mkV "fascinate" "fascinates" "fascinated" "fascinated" "fascinating" ;
		frustrate_V_Experiencer_obj = mkV "frustrate" "frustrates" "frustrated" "frustrated" "frustrating" ;
		gall_V_Experiencer_obj = mkV "gall" "galls" "galled" "galled" "galling" ;
		gladden_V_Experiencer_obj = mkV "gladden" "gladdens" "gladdened" "gladdened" "gladdening" ;
		impress_V_Experiencer_obj = mkV "impress" "impresses" "impressed" "impressed" "impressing" ;
		infuriate_V_Experiencer_obj = mkV "infuriate" "infuriates" "infuriated" "infuriated" "infuriating" ;
		irk_V_Experiencer_obj = mkV "irk" "irks" "irked" "irked" "irking" ;
		irritate_V_Experiencer_obj = mkV "irritate" "irritates" "irritated" "irritated" "irritating" ;
		mystify_V_Experiencer_obj = mkV "mystify" "mystifies" "mystified" "mystified" "mystifying" ;
		offend_V_Experiencer_obj = mkV "offend" "offends" "offended" "offended" "offending" ;
		rankle_V_Experiencer_obj = mkV "rankle" "rankles" "rankled" "rankled" "rankling" ;
		shock_V_Experiencer_obj = mkV "shock" "shocks" "shocked" "shocked" "shocking" ;
		soothe_V_Experiencer_obj = mkV "soothe" "soothes" "soothed" "soothed" "soothing" ;
		stimulate_V_Experiencer_obj = mkV "stimulate" "stimulates" "stimulated" "stimulated" "stimulating" ;
		sting_V_Experiencer_obj = irregV "sting" "stung" "stung" ;
		stupefy_V_Experiencer_obj = mkV "stupefy" "stupefies" "stupefied" "stupefied" "stupefying" ;
		surprise_V_Experiencer_obj = mkV "surprise" "surprises" "surprised" "surprised" "surprising" ;
		terrify_V_Experiencer_obj = mkV "terrify" "terrifies" "terrified" "terrified" "terrifying" ;
		tickle_V_Experiencer_obj = mkV "tickle" "tickles" "tickled" "tickled" "tickling" ;
		abash_V2_Experiencer_obj = mkV2 (mkV "abash" "abashes" "abashed" "abashed" "abashing") ;
		aggravate_V2_Experiencer_obj = mkV2 (mkV "aggravate" "aggravates" "aggravated" "aggravated" "aggravating") ;
		aggrieve_V2_Experiencer_obj = mkV2 (mkV "aggrieve" "aggrieves" "aggrieved" "aggrieved" "aggrieving") ;
		alarm_V2_Experiencer_obj = mkV2 (mkV "alarm" "alarms" "alarmed" "alarmed" "alarming") ;
		amaze_V2_Experiencer_obj = mkV2 (mkV "amaze" "amazes" "amazed" "amazed" "amazing") ;
		anger_V2_Experiencer_obj = mkV2 (mkV "anger" "angers" "angered" "angered" "angering") ;
		annoy_V2_Experiencer_obj = mkV2 (mkV "annoy" "annoys" "annoyed" "annoyed" "annoying") ;
		antagonize_V2_Experiencer_obj = mkV2 (mkV "antagonize" "antagonizes" "antagonized" "antagonized" "antagonizing") ;
		astonish_V2_Experiencer_obj = mkV2 (mkV "astonish" "astonishes" "astonished" "astonished" "astonishing") ;
		astound_V2_Experiencer_obj = mkV2 (mkV "astound" "astounds" "astounded" "astounded" "astounding") ;
		baffle_V2_Experiencer_obj = mkV2 (mkV "baffle" "baffles" "baffled" "baffled" "baffling") ;
		beguile_V2_Experiencer_obj = mkV2 (mkV "beguile" "beguiles" "beguiled" "beguiled" "beguiling") ;
		bewilder_V2_Experiencer_obj = mkV2 (mkV "bewilder" "bewilders" "bewildered" "bewildered" "bewildering") ;
		bewitch_V2_Experiencer_obj = mkV2 (mkV "bewitch" "bewitches" "bewitched" "bewitched" "bewitching") ;
		bore_V2_Experiencer_obj = mkV2 (mkV "bore" "bores" "bored" "bored" "boring") ;
		calm_V2_Experiencer_obj = mkV2 (mkV "calm" "calms" "calmed" "calmed" "calming") ;
		captivate_V2_Experiencer_obj = mkV2 (mkV "captivate" "captivates" "captivated" "captivated" "captivating") ;
		charm_V2_Experiencer_obj = mkV2 (mkV "charm" "charms" "charmed" "charmed" "charming") ;
		cheer_V2_Experiencer_obj = mkV2 (mkV "cheer" "cheers" "cheered" "cheered" "cheering") ;
		comfort_V2_Experiencer_obj = mkV2 (mkV "comfort" "comforts" "comforted" "comforted" "comforting") ;
		conciliate_V2_Experiencer_obj = mkV2 (mkV "conciliate" "conciliates" "conciliated" "conciliated" "conciliating") ;
		confuse_V2_Experiencer_obj = mkV2 (mkV "confuse" "confuses" "confused" "confused" "confusing") ;
		console_V2_Experiencer_obj = mkV2 (mkV "console" "consoles" "consoled" "consoled" "consoling") ;
		crush_V2_Experiencer_obj = mkV2 (mkV "crush" "crushes" "crushed" "crushed" "crushing") ;
		dazzle_V2_Experiencer_obj = mkV2 (mkV "dazzle" "dazzles" "dazzled" "dazzled" "dazzling") ;
		delight_V2_Experiencer_obj = mkV2 (mkV "delight" "delights" "delighted" "delighted" "delighting") ;
		depress_V2_Experiencer_obj = mkV2 (mkV "depress" "depresses" "depressed" "depressed" "depressing") ;
		destroy_V2_Experiencer_obj = mkV2 (mkV "destroy" "destroys" "destroyed" "destroyed" "destroying") ;
		devastate_V2_Experiencer_obj = mkV2 (mkV "devastate" "devastates" "devastated" "devastated" "devastating") ;
		disappoint_V2_Experiencer_obj = mkV2 (mkV "disappoint" "disappoints" "disappointed" "disappointed" "disappointing") ;
		discomfit_V2_Experiencer_obj = mkV2 (mkV "discomfit" "discomfits" "discomfited" "discomfited" "discomfiting") ;
		disconcert_V2_Experiencer_obj = mkV2 (mkV "disconcert" "disconcerts" "disconcerted" "disconcerted" "disconcerting") ;
		dishearten_V2_Experiencer_obj = mkV2 (mkV "dishearten" "disheartens" "disheartened" "disheartened" "disheartening") ;
		displease_V2_Experiencer_obj = mkV2 (mkV "displease" "displeases" "displeased" "displeased" "displeasing") ;
		distress_V2_Experiencer_obj = mkV2 (mkV "distress" "distresses" "distressed" "distressed" "distressing") ;
		disturb_V2_Experiencer_obj = mkV2 (mkV "disturb" "disturbs" "disturbed" "disturbed" "disturbing") ;
		embarrass_V2_Experiencer_obj = mkV2 (mkV "embarrass" "embarrasses" "embarrassed" "embarrassed" "embarrassing") ;
		embitter_V2_Experiencer_obj = mkV2 (mkV "embitter" "embitters" "embittered" "embittered" "embittering") ;
		enchant_V2_Experiencer_obj = mkV2 (mkV "enchant" "enchants" "enchanted" "enchanted" "enchanting") ;
		enrage_V2_Experiencer_obj = mkV2 (mkV "enrage" "enrages" "enraged" "enraged" "enraging") ;
		entertain_V2_Experiencer_obj = mkV2 (mkV "entertain" "entertains" "entertained" "entertained" "entertaining") ;
		enthrall_V2_Experiencer_obj = mkV2 (mkV "enthrall" "enthralls" "enthralled" "enthralled" "enthralling") ;
		exasperate_V2_Experiencer_obj = mkV2 (mkV "exasperate" "exasperates" "exasperated" "exasperated" "exasperating") ;
		excite_V2_Experiencer_obj = mkV2 (mkV "excite" "excites" "excited" "excited" "exciting") ;
		exhilarate_V2_Experiencer_obj = mkV2 (mkV "exhilarate" "exhilarates" "exhilarated" "exhilarated" "exhilarating") ;
		fascinate_V2_Experiencer_obj = mkV2 (mkV "fascinate" "fascinates" "fascinated" "fascinated" "fascinating") ;
		flabbergast_V2_Experiencer_obj = mkV2 (mkV "flabbergast" "flabbergasts" "flabbergasted" "flabbergasted" "flabbergasting") ;
		floor_V2_Experiencer_obj = mkV2 (mkV "floor" "floors" "floored" "floored" "flooring") ;
		fluster_V2_Experiencer_obj = mkV2 (mkV "fluster" "flusters" "flustered" "flustered" "flustering") ;
		frighten_V2_Experiencer_obj = mkV2 (mkV "frighten" "frightens" "frightened" "frightened" "frightening") ;
		frustrate_V2_Experiencer_obj = mkV2 (mkV "frustrate" "frustrates" "frustrated" "frustrated" "frustrating") ;
		gall_V2_Experiencer_obj = mkV2 (mkV "gall" "galls" "galled" "galled" "galling") ;
		gladden_V2_Experiencer_obj = mkV2 (mkV "gladden" "gladdens" "gladdened" "gladdened" "gladdening") ;
		gratify_V2_Experiencer_obj = mkV2 (mkV "gratify" "gratifies" "gratified" "gratified" "gratifying") ;
		hearten_V2_Experiencer_obj = mkV2 (mkV "hearten" "heartens" "heartened" "heartened" "heartening") ;
		humiliate_V2_Experiencer_obj = mkV2 (mkV "humiliate" "humiliates" "humiliated" "humiliated" "humiliating") ;
		impress_V2_Experiencer_obj = mkV2 (mkV "impress" "impresses" "impressed" "impressed" "impressing") ;
		incense_V2_Experiencer_obj = mkV2 (mkV "incense" "incenses" "incensed" "incensed" "incensing") ;
		infuriate_V2_Experiencer_obj = mkV2 (mkV "infuriate" "infuriates" "infuriated" "infuriated" "infuriating") ;
		interest_V2_Experiencer_obj = mkV2 (mkV "interest" "interests" "interested" "interested" "interesting") ;
		intimidate_V2_Experiencer_obj = mkV2 (mkV "intimidate" "intimidates" "intimidated" "intimidated" "intimidating") ;
		intrigue_V2_Experiencer_obj = mkV2 (mkV "intrigue" "intrigues" "intrigued" "intrigued" "intriguing") ;
		irk_V2_Experiencer_obj = mkV2 (mkV "irk" "irks" "irked" "irked" "irking") ;
		irritate_V2_Experiencer_obj = mkV2 (mkV "irritate" "irritates" "irritated" "irritated" "irritating") ;
		madden_V2_Experiencer_obj = mkV2 (mkV "madden" "maddens" "maddened" "maddened" "maddening") ;
		mollify_V2_Experiencer_obj = mkV2 (mkV "mollify" "mollifies" "mollified" "mollified" "mollifying") ;
		mortify_V2_Experiencer_obj = mkV2 (mkV "mortify" "mortifies" "mortified" "mortified" "mortifying") ;
		mystify_V2_Experiencer_obj = mkV2 (mkV "mystify" "mystifies" "mystified" "mystified" "mystifying") ;
		nettle_V2_Experiencer_obj = mkV2 (mkV "nettle" "nettles" "nettled" "nettled" "nettling") ;
		offend_V2_Experiencer_obj = mkV2 (mkV "offend" "offends" "offended" "offended" "offending") ;
		pacify_V2_Experiencer_obj = mkV2 (mkV "pacify" "pacifies" "pacified" "pacified" "pacifying") ;
		perplex_V2_Experiencer_obj = mkV2 (mkV "perplex" "perplexes" "perplexed" "perplexed" "perplexing") ;
		perturb_V2_Experiencer_obj = mkV2 (mkV "perturb" "perturbs" "perturbed" "perturbed" "perturbing") ;
		petrify_V2_Experiencer_obj = mkV2 (mkV "petrify" "petrifies" "petrified" "petrified" "petrifying") ;
		placate_V2_Experiencer_obj = mkV2 (mkV "placate" "placates" "placated" "placated" "placating") ;
		puzzle_V2_Experiencer_obj = mkV2 (mkV "puzzle" "puzzles" "puzzled" "puzzled" "puzzling") ;
		rankle_V2_Experiencer_obj = mkV2 (mkV "rankle" "rankles" "rankled" "rankled" "rankling") ;
		rattle_V2_Experiencer_obj = mkV2 (mkV "rattle" "rattles" "rattled" "rattled" "rattling") ;
		reassure_V2_Experiencer_obj = mkV2 (mkV "reassure" "reassures" "reassured" "reassured" "reassuring") ;
		repel_V2_Experiencer_obj = mkV2 (mkV "repel" "repels" "repelled" "repelled" "repelling") ;
		rile_V2_Experiencer_obj = mkV2 (mkV "rile" "riles" "riled" "riled" "riling") ;
		sadden_V2_Experiencer_obj = mkV2 (mkV "sadden" "saddens" "saddened" "saddened" "saddening") ;
		satisfy_V2_Experiencer_obj = mkV2 (mkV "satisfy" "satisfies" "satisfied" "satisfied" "satisfying") ;
		scare_V2_Experiencer_obj = mkV2 (mkV "scare" "scares" "scared" "scared" "scaring") ;
		shake_V2_Experiencer_obj = mkV2 (irregV "shake" "shook" "shaken") ;
		shame_V2_Experiencer_obj = mkV2 (mkV "shame" "shames" "shamed" "shamed" "shaming") ;
		shock_V2_Experiencer_obj = mkV2 (mkV "shock" "shocks" "shocked" "shocked" "shocking") ;
		sicken_V2_Experiencer_obj = mkV2 (mkV "sicken" "sickens" "sickened" "sickened" "sickening") ;
		sober_V2_Experiencer_obj = mkV2 (mkV "sober" "sobers" "sobered" "sobered" "sobering") ;
		solace_V2_Experiencer_obj = mkV2 (mkV "solace" "solaces" "solaced" "solaced" "solacing") ;
		soothe_V2_Experiencer_obj = mkV2 (mkV "soothe" "soothes" "soothed" "soothed" "soothing") ;
		spook_V2_Experiencer_obj = mkV2 (mkV "spook") ;
		startle_V2_Experiencer_obj = mkV2 (mkV "startle" "startles" "startled" "startled" "startling") ;
		stimulate_V2_Experiencer_obj = mkV2 (mkV "stimulate" "stimulates" "stimulated" "stimulated" "stimulating") ;
		sting_V2_Experiencer_obj = mkV2 (irregV "sting" "stung" "stung") ;
		stir_V2_Experiencer_obj = mkV2 (mkV "stir" "stirs" "stirred" "stirred" "stirring") ;
		stun_V2_Experiencer_obj = mkV2 (mkV "stun" "stuns" "stunned" "stunned" "stunning") ;
		stupefy_V2_Experiencer_obj = mkV2 (mkV "stupefy" "stupefies" "stupefied" "stupefied" "stupefying") ;
		surprise_V2_Experiencer_obj = mkV2 (mkV "surprise" "surprises" "surprised" "surprised" "surprising") ;
		terrify_V2_Experiencer_obj = mkV2 (mkV "terrify" "terrifies" "terrified" "terrified" "terrifying") ;
		thrill_V2_Experiencer_obj = mkV2 (mkV "thrill" "thrills" "thrilled" "thrilled" "thrilling") ;
		tickle_V2_Experiencer_obj = mkV2 (mkV "tickle" "tickles" "tickled" "tickled" "tickling") ;
		torment_V2_Experiencer_obj = mkV2 (mkV "torment" "torments" "tormented" "tormented" "tormenting") ;
		trouble_V2_Experiencer_obj = mkV2 (mkV "trouble" "troubles" "troubled" "troubled" "troubling") ;
		unnerve_V2_Experiencer_obj = mkV2 (mkV "unnerve" "unnerves" "unnerved" "unnerved" "unnerving") ;
		unsettle_V2_Experiencer_obj = mkV2 (mkV "unsettle" "unsettles" "unsettled" "unsettled" "unsettling") ;
		upset_V2_Experiencer_obj = mkV2 (irregDuplV "upset" "upset" "upset") ;
		vex_V2_Experiencer_obj = mkV2 (mkV "vex" "vexes" "vexed" "vexed" "vexing") ;
		alarm_V2S_Experiencer_obj = mkV2S (mkV "alarm" "alarms" "alarmed" "alarmed" "alarming") noPrep ;
		amaze_V2S_Experiencer_obj = mkV2S (mkV "amaze" "amazes" "amazed" "amazed" "amazing") noPrep ;
		anger_V2S_Experiencer_obj = mkV2S (mkV "anger" "angers" "angered" "angered" "angering") noPrep ;
		annoy_V2S_Experiencer_obj = mkV2S (mkV "annoy" "annoys" "annoyed" "annoyed" "annoying") noPrep ;
		astonish_V2S_Experiencer_obj = mkV2S (mkV "astonish" "astonishes" "astonished" "astonished" "astonishing") noPrep ;
		astound_V2S_Experiencer_obj = mkV2S (mkV "astound" "astounds" "astounded" "astounded" "astounding") noPrep ;
		confuse_V2S_Experiencer_obj = mkV2S (mkV "confuse" "confuses" "confused" "confused" "confusing") noPrep ;
		depress_V2S_Experiencer_obj = mkV2S (mkV "depress" "depresses" "depressed" "depressed" "depressing") noPrep ;
		disappoint_V2S_Experiencer_obj = mkV2S (mkV "disappoint" "disappoints" "disappointed" "disappointed" "disappointing") noPrep ;
		disconcert_V2S_Experiencer_obj = mkV2S (mkV "disconcert" "disconcerts" "disconcerted" "disconcerted" "disconcerting") noPrep ;
		distress_V2S_Experiencer_obj = mkV2S (mkV "distress" "distresses" "distressed" "distressed" "distressing") noPrep ;
		disturb_V2S_Experiencer_obj = mkV2S (mkV "disturb" "disturbs" "disturbed" "disturbed" "disturbing") noPrep ;
		enrage_V2S_Experiencer_obj = mkV2S (mkV "enrage" "enrages" "enraged" "enraged" "enraging") noPrep ;
		frighten_V2S_Experiencer_obj = mkV2S (mkV "frighten" "frightens" "frightened" "frightened" "frightening") noPrep ;
		frustrate_V2S_Experiencer_obj = mkV2S (mkV "frustrate" "frustrates" "frustrated" "frustrated" "frustrating") noPrep ;
		gall_V2S_Experiencer_obj = mkV2S (mkV "gall" "galls" "galled" "galled" "galling") noPrep ;
		hearten_V2S_Experiencer_obj = mkV2S (mkV "hearten" "heartens" "heartened" "heartened" "heartening") noPrep ;
		infuriate_V2S_Experiencer_obj = mkV2S (mkV "infuriate" "infuriates" "infuriated" "infuriated" "infuriating") noPrep ;
		irk_V2S_Experiencer_obj = mkV2S (mkV "irk" "irks" "irked" "irked" "irking") noPrep ;
		irritate_V2S_Experiencer_obj = mkV2S (mkV "irritate" "irritates" "irritated" "irritated" "irritating") noPrep ;
		perplex_V2S_Experiencer_obj = mkV2S (mkV "perplex" "perplexes" "perplexed" "perplexed" "perplexing") noPrep ;
		perturb_V2S_Experiencer_obj = mkV2S (mkV "perturb" "perturbs" "perturbed" "perturbed" "perturbing") noPrep ;
		puzzle_V2S_Experiencer_obj = mkV2S (mkV "puzzle" "puzzles" "puzzled" "puzzled" "puzzling") noPrep ;
		rile_V2S_Experiencer_obj = mkV2S (mkV "rile" "riles" "riled" "riled" "riling") noPrep ;
		sadden_V2S_Experiencer_obj = mkV2S (mkV "sadden" "saddens" "saddened" "saddened" "saddening") noPrep ;
		shock_V2S_Experiencer_obj = mkV2S (mkV "shock" "shocks" "shocked" "shocked" "shocking") noPrep ;
		startle_V2S_Experiencer_obj = mkV2S (mkV "startle" "startles" "startled" "startled" "startling") noPrep ;
		surprise_V2S_Experiencer_obj = mkV2S (mkV "surprise" "surprises" "surprised" "surprised" "surprising") noPrep ;
		thrill_V2S_Experiencer_obj = mkV2S (mkV "thrill" "thrills" "thrilled" "thrilled" "thrilling") noPrep ;
		unsettle_V2S_Experiencer_obj = mkV2S (mkV "unsettle" "unsettles" "unsettled" "unsettled" "unsettling") noPrep ;
		upset_V2S_Experiencer_obj = mkV2S (irregDuplV "upset" "upset" "upset") noPrep ;
		discourage_V2_Experiencer_obj = mkV2 (mkV "discourage" "discourages" "discouraged" "discouraged" "discouraging") ;
		flummox_V2_Experiencer_obj = mkV2 (mkV "flummox" "flummoxes" "flummoxed" "flummoxed" "flummoxing") ;
		intrigue_VS_Experiencer_obj = mkVS (mkV "intrigue" "intrigues" "intrigued" "intrigued" "intriguing") ;
		offend_VS_Experiencer_obj = mkVS (mkV "offend" "offends" "offended" "offended" "offending") ;
		tickle_VS_Experiencer_obj = mkVS (mkV "tickle" "tickles" "tickled" "tickled" "tickling") ;

		explain_VQ_Explaining_the_facts = mkVQ (mkV "explain" "explains" "explained" "explained" "explaining") ;

		export_V2_Exporting = mkV2 (mkV "export" "exports" "exported" "exported" "exporting") ;

		air_V2_Expressing_publicly = mkV2 (mkV "air" "airs" "aired" "aired" "airing") ;
		articulate_V2_Expressing_publicly = mkV2 (mkV "articulate" "articulates" "articulated" "articulated" "articulating") ;
		express_V2_Expressing_publicly = mkV2 (mkV "express" "expresses" "expressed" "expressed" "expressing") ;
		vent_V2_Expressing_publicly = mkV2 (mkV "vent" "vents" "vented" "vented" "venting") ;
		voice_V2_Expressing_publicly = mkV2 (mkV "voice" "voices" "voiced" "voiced" "voicing") ;

		extradite_V2_Extradition = mkV2 (mkV "extradite" "extradites" "extradited" "extradited" "extraditing") ;

		know_V2_Familiarity = mkV2 (irregV "know" "knew" "known") ;

		feel_V_Feeling = irregV "feel" "felt" "felt" ;
		experience_V2_Feeling = mkV2 (mkV "experience" "experiences" "experienced" "experienced" "experiencing") ;
		feel_V2_Feeling = mkV2 (irregV "feel" "felt" "felt") ;

		affect_V2_Feigning = mkV2 (mkV "affect" "affects" "affected" "affected" "affecting") ;
		counterfeit_V2_Feigning = mkV2 (mkV "counterfeit" "counterfeits" "counterfeited" "counterfeited" "counterfeiting") ;
		fake_V2_Feigning = mkV2 (mkV "fake" "fakes" "faked" "faked" "faking") ;
		pretend_V2_Feigning = mkV2 (mkV "pretend" "pretends" "pretended" "pretended" "pretending") ;
		simulate_V2_Feigning = mkV2 (mkV "simulate" "simulates" "simulated" "simulated" "simulating") ;

		adorn_V2_Filling = mkV2 (mkV "adorn" "adorns" "adorned" "adorned" "adorning") ;
		anoint_V2_Filling = mkV2 (mkV "anoint" "anoints" "anointed" "anointed" "anointing") ;
		brush_V2_Filling = mkV2 (mkV "brush" "brushes" "brushed" "brushed" "brushing") ;
		butter_V2_Filling = mkV2 (mkV "butter" "butters" "buttered" "buttered" "buttering") ;
		coat_V2_Filling = mkV2 (mkV "coat" "coats" "coated" "coated" "coating") ;
		cover_V2_Filling = mkV2 (mkV "cover" "covers" "covered" "covered" "covering") ;
		cram_V2_Filling = mkV2 (mkV "cram" "crams" "crammed" "crammed" "cramming") ;
		crowd_V2_Filling = mkV2 (mkV "crowd" "crowds" "crowded" "crowded" "crowding") ;
		dab_V2_Filling = mkV2 (mkV "dab" "dabs" "dabbed" "dabbed" "dabbing") ;
		daub_V2_Filling = mkV2 (mkV "daub" "daubs" "daubed" "daubed" "daubing") ;
		douse_V2_Filling = mkV2 (mkV "douse" "douses" "doused" "doused" "dousing") ;
		drape_V2_Filling = mkV2 (mkV "drape" "drapes" "draped" "draped" "draping") ;
		dust_V2_Filling = mkV2 (mkV "dust" "dusts" "dusted" "dusted" "dusting") ;
		embellish_V2_Filling = mkV2 (mkV "embellish" "embellishes" "embellished" "embellished" "embellishing") ;
		fill_V2_Filling = mkV2 (mkV "fill" "fills" "filled" "filled" "filling") ;
		flood_V2_Filling = mkV2 (mkV "flood" "floods" "flooded" "flooded" "flooding") ;
		gild_V2_Filling = mkV2 (mkV "gild" "gilds" "gilded" "gilded" "gilding") ;
		glaze_V2_Filling = mkV2 (mkV "glaze" "glazes" "glazed" "glazed" "glazing") ;
		hang_V2_Filling = mkV2 (irregV "hang" "hung" "hung") ;
		heap_V2_Filling = mkV2 (mkV "heap" "heaps" "heaped" "heaped" "heaping") ;
		inject_V2_Filling = mkV2 (mkV "inject" "injects" "injected" "injected" "injecting") ;
		load_V2_Filling = mkV2 (mkV "load" "loads" "loaded" "loaded" "loading") ;
		pack_V2_Filling = mkV2 (mkV "pack" "packs" "packed" "packed" "packing") ;
		paint_V2_Filling = mkV2 (regV "paint") ;
		pave_V2_Filling = mkV2 (mkV "pave" "paves" "paved" "paved" "paving") ;
		pile_V2_Filling = mkV2 (mkV "pile" "piles" "piled" "piled" "piling") ;
		plaster_V2_Filling = mkV2 (mkV "plaster" "plasters" "plastered" "plastered" "plastering") ;
		pump_V2_Filling = mkV2 (mkV "pump" "pumps" "pumped" "pumped" "pumping") ;
		scatter_V2_Filling = mkV2 (mkV "scatter" "scatters" "scattered" "scattered" "scattering") ;
		seed_V2_Filling = mkV2 (mkV "seed" "seeds" "seeded" "seeded" "seeding") ;
		shower_V2_Filling = mkV2 (mkV "shower" "showers" "showered" "showered" "showering") ;
		smear_V2_Filling = mkV2 (mkV "smear" "smears" "smeared" "smeared" "smearing") ;
		sow_V2_Filling = mkV2 (irregV "sow" "sowed" (variants {"sowed" ; "sown"})) ;
		spatter_V2_Filling = mkV2 (mkV "spatter" "spatters" "spattered" "spattered" "spattering") ;
		splash_V2_Filling = mkV2 (mkV "splash" "splashes" "splashed" "splashed" "splashing") ;
		spray_V2_Filling = mkV2 (mkV "spray" "sprays" "sprayed" "sprayed" "spraying") ;
		spread_V2_Filling = mkV2 (irregV "spread" "spread" "spread") ;
		sprinkle_V2_Filling = mkV2 (mkV "sprinkle" "sprinkles" "sprinkled" "sprinkled" "sprinkling") ;
		squirt_V2_Filling = mkV2 (mkV "squirt" "squirts" "squirted" "squirted" "squirting") ;
		strew_V2_Filling = mkV2 (mkV "strew" "strews" "strewed" "strewed" "strewing") ;
		stuff_V2_Filling = mkV2 (mkV "stuff" "stuffs" "stuffed" "stuffed" "stuffing") ;
		surface_V2_Filling = mkV2 (mkV "surface" "surfaces" "surfaced" "surfaced" "surfacing") ;
		tile_V2_Filling = mkV2 (mkV "tile" "tiles" "tiled" "tiled" "tiling") ;
		varnish_V2_Filling = mkV2 (mkV "varnish" "varnishes" "varnished" "varnished" "varnishing") ;
		wrap_V2_Filling = mkV2 (mkV "wrap" "wraps" "wrapped" "wrapped" "wrapping") ;

		lose_V2_Finish_competition = mkV2 (irregV "lose" "lost" "lost") ;
		tie_V2_Finish_competition = mkV2 (regV "tie") ;
		win_V2_Finish_competition = mkV2 (irregDuplV "win" "won" "won") ;

		lose_V_Finish_game = irregV "lose" "lost" "lost" ;
		win_V_Finish_game = irregDuplV "win" "won" "won" ;

		fire_V2_Firing = mkV2 (mkV "fire" "fires" "fired" "fired" "firing") ;
		terminate_V2_Firing = mkV2 (mkV "terminate" "terminates" "terminated" "terminated" "terminating") ;

		bolt_V_Fleeing = mkV "bolt" "bolts" "bolted" "bolted" "bolting" ;
		flee_V_Fleeing = irregV "flee" "fled" "fled" ;

		bubble_V_Fluidic_motion = mkV "bubble" "bubbles" "bubbled" "bubbled" "bubbling" ;
		cascade_V_Fluidic_motion = mkV "cascade" "cascades" "cascaded" "cascaded" "cascading" ;
		course_V_Fluidic_motion = mkV "course" "courses" "coursed" "coursed" "coursing" ;
		dribble_V_Fluidic_motion = mkV "dribble" "dribbles" "dribbled" "dribbled" "dribbling" ;
		drip_V_Fluidic_motion = mkV "drip" "drips" "dripped" "dripped" "dripping" ;
		flow_V_Fluidic_motion = regV "flow" ;
		jet_V_Fluidic_motion = mkV "jet" "jets" "jetted" "jetted" "jetting" ;
		leak_V_Fluidic_motion = mkV "leak" "leaks" "leaked" "leaked" "leaking" ;
		run_V_Fluidic_motion = irregDuplV "run" "ran" "run" ;
		spill_V_Fluidic_motion = irregV "spill" (variants {"spilled" ; "spilt"}) (variants {"spilled" ; "spilt"}) ;
		spurt_V_Fluidic_motion = mkV "spurt" "spurts" "spurted" "spurted" "spurting" ;
		stream_V_Fluidic_motion = mkV "stream" "streams" "streamed" "streamed" "streaming" ;
		trickle_V_Fluidic_motion = mkV "trickle" "trickles" "trickled" "trickled" "trickling" ;
		gush_V_Fluidic_motion = mkV "gush" "gushes" "gushed" "gushed" "gushing" ;
		hiss_V_Fluidic_motion = mkV "hiss" "hisses" "hissed" "hissed" "hissing" ;
		ooze_V_Fluidic_motion = mkV "ooze" "oozes" "oozed" "oozed" "oozing" ;
		percolate_V_Fluidic_motion = mkV "percolate" "percolates" "percolated" "percolated" "percolating" ;
		purl_V_Fluidic_motion = mkV "purl" "purls" "purled" "purled" "purling" ;
		rush_V_Fluidic_motion = mkV "rush" "rushes" "rushed" "rushed" "rushing" ;
		seep_V_Fluidic_motion = mkV "seep" "seeps" "seeped" "seeped" "seeping" ;
		soak_V_Fluidic_motion = mkV "soak" "soaks" "soaked" "soaked" "soaking" ;
		spew_V_Fluidic_motion = mkV "spew" "spews" "spewed" "spewed" "spewing" ;
		splash_V_Fluidic_motion = mkV "splash" "splashes" "splashed" "splashed" "splashing" ;
		spout_V_Fluidic_motion = mkV "spout" "spouts" "spouted" "spouted" "spouting" ;
		squirt_V_Fluidic_motion = mkV "squirt" "squirts" "squirted" "squirted" "squirting" ;

		counterfeit_V2_Forging = mkV2 (mkV "counterfeit" "counterfeits" "counterfeited" "counterfeited" "counterfeiting") ;
		fake_V2_Forging = mkV2 (mkV "fake" "fakes" "faked" "faked" "faking") ;
		falsify_V2_Forging = mkV2 (mkV "falsify" "falsifies" "falsified" "falsified" "falsifying") ;
		forge_V2_Forging = mkV2 (mkV "forge" "forges" "forged" "forged" "forging") ;

		abstain_V_Forgoing = mkV "abstain" "abstains" "abstained" "abstained" "abstaining" ;
		forbear_V_Forgoing = mkV "for" IrregEng.bear_V ;
		refrain_V_Forgoing = mkV "refrain" "refrains" "refrained" "refrained" "refraining" ;
		forbear_VV_Forgoing = mkVV (mkV "for" IrregEng.bear_V) ;

		divorce_V_Forming_relationships = mkV "divorce" "divorces" "divorced" "divorced" "divorcing" ;
		leave_V_Forming_relationships = irregV "leave" "left" "left" ;
		marry_V_Forming_relationships = mkV "marry" "marries" "married" "married" "marrying" ;
		separate_V_Forming_relationships = mkV "separate" "separates" "separated" "separated" "separating" ;
		wed_V_Forming_relationships = irregDuplV "wed" "wed" "wed" ;
		befriend_V2_Forming_relationships = mkV2 (mkV "befriend" "befriends" "befriended" "befriended" "befriending") ;
		divorce_V2_Forming_relationships = mkV2 (mkV "divorce" "divorces" "divorced" "divorced" "divorcing") ;
		leave_V2_Forming_relationships = mkV2 (irregV "leave" "left" "left") ;
		marry_V2_Forming_relationships = mkV2 (mkV "marry" "marries" "married" "married" "marrying") ;
		wed_V2_Forming_relationships = mkV2 (irregDuplV "wed" "wed" "wed") ;

		grate_V_Friction = mkV "grate" "grates" "grated" "grated" "grating" ;
		rasp_V_Friction = mkV "rasp" "rasps" "rasped" "rasped" "rasping" ;
		scrape_V_Friction = mkV "scrape" "scrapes" "scraped" "scraped" "scraping" ;
		screech_V_Friction = mkV "screech" "screeches" "screeched" "screeched" "screeching" ;
		scrunch_V_Friction = mkV "scrunch" "scrunches" "scrunched" "scrunched" "scrunching" ;
		squeal_V_Friction = mkV "squeal" "squeals" "squealed" "squealed" "squealing" ;

		assemble_V2_Gathering_up = mkV2 (mkV "assemble" "assembles" "assembled" "assembled" "assembling") ;
		bring_together_V2_Gathering_up = mkV2 (partV (irregV "bring" "brought" "brought") "together") ;
		herd_V2_Gathering_up = mkV2 (mkV "herd" "herds" "herded" "herded" "herding") ;

		beckon_V_Gesture = mkV "beckon" "beckons" "beckoned" "beckoned" "beckoning" ;
		gesticulate_V_Gesture = mkV "gesticulate" "gesticulates" "gesticulated" "gesticulated" "gesticulating" ;
		gesture_V_Gesture = mkV "gesture" "gestures" "gestured" "gestured" "gesturing" ;
		motion_V2_Gesture = mkV2 (mkV "motion" "motions" "motioned" "motioned" "motioning") ;
		nod_V2_Gesture = mkV2 (mkV "nod" "nods" "nodded" "nodded" "nodding") ;
		signal_V2_Gesture = mkV2 (mkV "signal" "signals" "signalled" "signalled" "signalling") ;
		wave_V2_Gesture = mkV2 (mkV "wave" "waves" "waved" "waved" "waving") ;
		gesture_VS_Gesture = mkVS (mkV "gesture" "gestures" "gestured" "gestured" "gesturing") ;
		motion_VS_Gesture = mkVS (mkV "motion" "motions" "motioned" "motioned" "motioning") ;
		nod_VS_Gesture = mkVS (mkV "nod" "nods" "nodded" "nodded" "nodding") ;
		signal_VS_Gesture = mkVS (mkV "signal" "signals" "signalled" "signalled" "signalling") ;
		wave_VS_Gesture = mkVS (mkV "wave" "waves" "waved" "waved" "waving") ;
		gesture_VV_Gesture = mkVV (mkV "gesture" "gestures" "gestured" "gestured" "gesturing") ;
		motion_VV_Gesture = mkVV (mkV "motion" "motions" "motioned" "motioned" "motioning") ;

		acquire_V2_Getting = mkV2 (mkV "acquire" "acquires" "acquired" "acquired" "acquiring") ;
		gain_V2_Getting = mkV2 (mkV "gain" "gains" "gained" "gained" "gaining") ;
		get_V2_Getting = mkV2 (irregDuplV "get" "got" "gotten") ;
		obtain_V2_Getting = mkV2 (mkV "obtain" "obtains" "obtained" "obtained" "obtaining") ;
		win_V2_Getting = mkV2 (irregDuplV "win" "won" "won") ;

		launch_V2_Getting_vehicle_underway = mkV2 (mkV "launch" "launches" "launched" "launched" "launching") ;

		bequeath_V2_Giving = mkV2 (mkV "bequeath" "bequeaths" "bequeathed" "bequeathed" "bequeathing") ;
		contribute_V2_Giving = mkV2 (mkV "contribute" "contributes" "contributed" "contributed" "contributing") ;
		donate_V2_Giving = mkV2 (mkV "donate" "donates" "donated" "donated" "donating") ;
		endow_V2_Giving = mkV2 (mkV "endow" "endows" "endowed" "endowed" "endowing") ;
		foist_V2_Giving = mkV2 (mkV "foist" "foists" "foisted" "foisted" "foisting") ;
		gift_V2_Giving = mkV2 (mkV "gift" "gifts" "gifted" "gifted" "gifting") ;
		give_V2_Giving = mkV2 (irregV "give" "gave" "given") ;
		hand_V2_Giving = mkV2 (mkV "hand" "hands" "handed" "handed" "handing") ;
		hand_in_V2_Giving = mkV2 (partV (mkV "hand" "hands" "handed" "handed" "handing") "in") ;
		hand_out_V2_Giving = mkV2 (partV (mkV "hand" "hands" "handed" "handed" "handing") "out") ;
		hand_over_V2_Giving = mkV2 (partV (mkV "hand" "hands" "handed" "handed" "handing") "over") ;
		pass_out_V2_Giving = mkV2 (partV (mkV "pass" "passes" "passed" "passed" "passing") "out") ;

		curl_V_Go_into_shape = mkV "curl" "curls" "curled" "curled" "curling" ;

		back_out_V_Going_back_on_a_commitment = partV (mkV "back" "backs" "backed" "backed" "backing") "out" ;
		renege_V_Going_back_on_a_commitment = mkV "renege" "reneges" "reneged" "reneged" "reneging" ;

		comprehend_V2_Grasp = mkV2 (mkV "comprehend" "comprehends" "comprehended" "comprehended" "comprehending") ;
		fathom_V2_Grasp = mkV2 (mkV "fathom" "fathoms" "fathomed" "fathomed" "fathoming") ;
		grasp_V2_Grasp = mkV2 (mkV "grasp" "grasps" "grasped" "grasped" "grasping") ;
		see_V2_Grasp = mkV2 (irregV "see" "saw" "seen") ;
		understand_V2_Grasp = mkV2 (irregV "understand" "understood" "understood") ;
		fathom_VQ_Grasp = mkVQ (mkV "fathom" "fathoms" "fathomed" "fathomed" "fathoming") ;
		grasp_VQ_Grasp = mkVQ (mkV "grasp" "grasps" "grasped" "grasped" "grasping") ;
		see_VQ_Grasp = mkVQ (irregV "see" "saw" "seen") ;
		understand_VQ_Grasp = mkVQ (irregV "understand" "understood" "understood") ;

		crush_V_Grinding = mkV "crush" "crushes" "crushed" "crushed" "crushing" ;
		flake_V_Grinding = mkV "flake" "flakes" "flaked" "flaked" "flaking" ;
		grind_V_Grinding = irregV "grind" "ground" "ground" ;
		mill_V_Grinding = mkV "mill" "mills" "milled" "milled" "milling" ;
		pulverize_V_Grinding = mkV "pulverize" "pulverizes" "pulverized" "pulverized" "pulverizing" ;
		chew_V2_Grinding = mkV2 (mkV "chew" "chews" "chewed" "chewed" "chewing") ;
		crumble_V2_Grinding = mkV2 (mkV "crumble" "crumbles" "crumbled" "crumbled" "crumbling") ;
		crunch_V2_Grinding = mkV2 (mkV "crunch" "crunches" "crunched" "crunched" "crunching") ;
		crush_V2_Grinding = mkV2 (mkV "crush" "crushes" "crushed" "crushed" "crushing") ;
		flake_V2_Grinding = mkV2 (mkV "flake" "flakes" "flaked" "flaked" "flaking") ;
		grate_V2_Grinding = mkV2 (mkV "grate" "grates" "grated" "grated" "grating") ;
		grind_V2_Grinding = mkV2 (irregV "grind" "ground" "ground") ;
		masticate_V2_Grinding = mkV2 (mkV "masticate" "masticates" "masticated" "masticated" "masticating") ;
		mill_V2_Grinding = mkV2 (mkV "mill" "mills" "milled" "milled" "milling") ;
		pulverize_V2_Grinding = mkV2 (mkV "pulverize" "pulverizes" "pulverized" "pulverized" "pulverizing") ;
		shred_V2_Grinding = mkV2 (mkV "shred" "shreds" "shredded" "shredded" "shredding") ;

		bathe_V2_Grooming = mkV2 (mkV "bathe" "bathes" "bathed" "bathed" "bathing") ;
		brush_V2_Grooming = mkV2 (mkV "brush" "brushes" "brushed" "brushed" "brushing") ;
		cleanse_V2_Grooming = mkV2 (mkV "cleanse" "cleanses" "cleansed" "cleansed" "cleansing") ;
		comb_V2_Grooming = mkV2 (mkV "comb" "combs" "combed" "combed" "combing") ;
		groom_V2_Grooming = mkV2 (mkV "groom" "grooms" "groomed" "groomed" "grooming") ;
		lave_V2_Grooming = mkV2 (mkV "lave" "laves" "laved" "laved" "laving") ;
		manicure_V2_Grooming = mkV2 (mkV "manicure" "manicures" "manicured" "manicured" "manicuring") ;
		plait_V2_Grooming = mkV2 (mkV "plait" "plaits" "plaited" "plaited" "plaiting") ;
		pluck_V2_Grooming = mkV2 (mkV "pluck" "plucks" "plucked" "plucked" "plucking") ;
		shampoo_V2_Grooming = mkV2 (mkV "shampoo" "shampoos" "shampooed" "shampooed" "shampooing") ;
		shave_V2_Grooming = mkV2 (irregV "shave" "shaved" (variants {"shaved" ; "shaven"})) ;
		soap_V2_Grooming = mkV2 (mkV "soap" "soaps" "soaped" "soaped" "soaping") ;
		wash_V2_Grooming = mkV2 (regV "wash") ;
		wax_V2_Grooming = mkV2 (mkV "wax" "waxes" "waxed" "waxed" "waxing") ;

		halt_V_Halt = mkV "halt" "halts" "halted" "halted" "halting" ;
		stop_V_Halt = mkV "stop" "stops" "stopped" "stopped" "stopping" ;

		hear_V_Hear = irregV "hear" "heard" "heard" ;
		read_V_Hear = irregV "read" "read" "read" ;
		hear_V2_Hear = mkV2 (irregV "hear" "heard" "heard") ;
		read_V2_Hear = mkV2 (irregV "read" "read" "read") ;
		hear_VS_Hear = mkVS (irregV "hear" "heard" "heard") ;
		read_VS_Hear = mkVS (irregV "read" "read" "read") ;

		camouflage_V2_Hiding_objects = mkV2 (mkV "camouflage" "camouflages" "camouflaged" "camouflaged" "camouflaging") ;
		conceal_V2_Hiding_objects = mkV2 (mkV "conceal" "conceals" "concealed" "concealed" "concealing") ;
		hide_V2_Hiding_objects = mkV2 (irregV "hide" "hid" "hidden") ;

		constrain_V2_Hindering = mkV2 (mkV "constrain" "constrains" "constrained" "constrained" "constraining") ;
		hamper_V2_Hindering = mkV2 (mkV "hamper" "hampers" "hampered" "hampered" "hampering") ;
		hinder_V2_Hindering = mkV2 (mkV "hinder" "hinders" "hindered" "hindered" "hindering") ;
		inhibit_V2_Hindering = mkV2 (mkV "inhibit" "inhibits" "inhibited" "inhibited" "inhibiting") ;
		obstruct_V2_Hindering = mkV2 (mkV "obstruct" "obstructs" "obstructed" "obstructed" "obstructing") ;
		impede_V2_Hindering = mkV2 (mkV "impede" "impedes" "impeded" "impeded" "impeding") ;

		commission_V2_Hiring = mkV2 (mkV "commission" "commissions" "commissioned" "commissioned" "commissioning") ;
		hire_V2_Hiring = mkV2 (mkV "hire" "hires" "hired" "hired" "hiring") ;
		retain_V2_Hiring = mkV2 (mkV "retain" "retains" "retained" "retained" "retaining") ;
		sign_V2_Hiring = mkV2 (mkV "sign" "signs" "signed" "signed" "signing") ;

		battle_V_Hostile_encounter = mkV "battle" "battles" "battled" "battled" "battling" ;
		brawl_V_Hostile_encounter = mkV "brawl" "brawls" "brawled" "brawled" "brawling" ;
		clash_V_Hostile_encounter = mkV "clash" "clashes" "clashed" "clashed" "clashing" ;
		duel_V_Hostile_encounter = mkV "duel" "duels" "duelled" "duelled" "duelling" ;
		fight_V_Hostile_encounter = irregV "fight" "fought" "fought" ;
		scuffle_V_Hostile_encounter = mkV "scuffle" "scuffles" "scuffled" "scuffled" "scuffling" ;
		skirmish_V_Hostile_encounter = mkV "skirmish" "skirmishes" "skirmished" "skirmished" "skirmishing" ;
		struggle_V_Hostile_encounter = mkV "struggle" "struggles" "struggled" "struggled" "struggling" ;
		war_V_Hostile_encounter = mkV "war" "wars" "warred" "warred" "warring" ;

		hunt_V_Hunting = regV "hunt" ;

		imitate_V2_Imitating = mkV2 (mkV "imitate" "imitates" "imitated" "imitated" "imitating") ;
		mimic_V2_Imitating = mkV2 (mkV "mimic" "IRREG" "IRREG" "IRREG" "IRREG") ;

		handcuff_V2_Immobilization = mkV2 (mkV "handcuff" "handcuffs" "handcuffed" "handcuffed" "handcuffing") ;
		shackle_V2_Immobilization = mkV2 (mkV "shackle" "shackles" "shackled" "shackled" "shackling") ;

		bang_V_Impact = mkV "bang" "bangs" "banged" "banged" "banging" ;
		bump_V_Impact = mkV "bump" "bumps" "bumped" "bumped" "bumping" ;
		chatter_V_Impact = mkV "chatter" "chatters" "chattered" "chattered" "chattering" ;
		clang_V_Impact = mkV "clang" "clangs" "clanged" "clanged" "clanging" ;
		clash_V_Impact = mkV "clash" "clashes" "clashed" "clashed" "clashing" ;
		clatter_V_Impact = mkV "clatter" "clatters" "clattered" "clattered" "clattering" ;
		click_V_Impact = mkV "click" "clicks" "clicked" "clicked" "clicking" ;
		clink_V_Impact = mkV "clink" "clinks" "clinked" "clinked" "clinking" ;
		clunk_V_Impact = mkV "clunk" "clunks" "clunked" "clunked" "clunking" ;
		collide_V_Impact = mkV "collide" "collides" "collided" "collided" "colliding" ;
		crash_V_Impact = mkV "crash" "crashes" "crashed" "crashed" "crashing" ;
		crunch_V_Impact = mkV "crunch" "crunches" "crunched" "crunched" "crunching" ;
		graze_V_Impact = mkV "graze" "grazes" "grazed" "grazed" "grazing" ;
		hiss_V_Impact = mkV "hiss" "hisses" "hissed" "hissed" "hissing" ;
		hit_V_Impact = irregDuplV "hit" "hit" "hit" ;
		impact_V_Impact = mkV "impact" "impacts" "impacted" "impacted" "impacting" ;
		patter_V_Impact = mkV "patter" "patters" "pattered" "pattered" "pattering" ;
		plash_V_Impact = mkV "plash" "plashes" "plashed" "plashed" "plashing" ;
		plop_V_Impact = mkV "plop" "plops" "plopped" "plopped" "plopping" ;
		plough_V_Impact = mkV "plough" "ploughs" "ploughed" "ploughed" "ploughing" ;
		rap_V_Impact = mkV "rap" "raps" "rapped" "rapped" "rapping" ;
		rattle_V_Impact = mkV "rattle" "rattles" "rattled" "rattled" "rattling" ;
		slam_V_Impact = mkV "slam" "slams" "slammed" "slammed" "slamming" ;
		slap_V_Impact = mkV "slap" "slaps" "slapped" "slapped" "slapping" ;
		smack_V_Impact = mkV "smack" "smacks" "smacked" "smacked" "smacking" ;
		smash_V_Impact = mkV "smash" "smashes" "smashed" "smashed" "smashing" ;
		thud_V_Impact = mkV "thud" "thuds" "thudded" "thudded" "thudding" ;
		thump_V_Impact = mkV "thump" "thumps" "thumped" "thumped" "thumping" ;
		tinkle_V_Impact = mkV "tinkle" "tinkles" "tinkled" "tinkled" "tinkling" ;
		bump_V2_Impact = mkV2 (mkV "bump" "bumps" "bumped" "bumped" "bumping") ;
		crunch_V2_Impact = mkV2 (mkV "crunch" "crunches" "crunched" "crunched" "crunching") ;
		graze_V2_Impact = mkV2 (mkV "graze" "grazes" "grazed" "grazed" "grazing") ;
		hit_V2_Impact = mkV2 (irregDuplV "hit" "hit" "hit") ;
		impact_V2_Impact = mkV2 (mkV "impact" "impacts" "impacted" "impacted" "impacting") ;
		rap_V2_Impact = mkV2 (mkV "rap" "raps" "rapped" "rapped" "rapping") ;
		slap_V2_Impact = mkV2 (mkV "slap" "slaps" "slapped" "slapped" "slapping") ;
		smack_V2_Impact = mkV2 (mkV "smack" "smacks" "smacked" "smacked" "smacking") ;
		strike_V2_Impact = mkV2 (irregV "strike" "struck" "struck") ;
		thud_V2_Impact = mkV2 (mkV "thud" "thuds" "thudded" "thudded" "thudding") ;
		thump_V2_Impact = mkV2 (mkV "thump" "thumps" "thumped" "thumped" "thumping") ;

		contain_V2_Inclusion = mkV2 (mkV "contain" "contains" "contained" "contained" "containing") ;
		exclude_V2_Inclusion = mkV2 (mkV "exclude" "excludes" "excluded" "excluded" "excluding") ;
		include_V2_Inclusion = mkV2 (mkV "include" "includes" "included" "included" "including") ;
		incorporate_V2_Inclusion = mkV2 (mkV "incorporate" "incorporates" "incorporated" "incorporated" "incorporating") ;

		name_V2_Indicating = mkV2 (mkV "name" "names" "named" "named" "naming") ;

		puff_V2_Ingest_substance = mkV2 (mkV "puff" "puffs" "puffed" "puffed" "puffing") ;
		smoke_V2_Ingest_substance = mkV2 (mkV "smoke" "smokes" "smoked" "smoked" "smoking") ;
		do_V2_Ingest_substance = mkV2 (mk5V "do" "does" "did" "done" "doing") ;
		inject_V2_Ingest_substance = mkV2 (mkV "inject" "injects" "injected" "injected" "injecting") ;
		pop_V2_Ingest_substance = mkV2 (mkV "pop" "pops" "popped" "popped" "popping") ;
		shoot_V2_Ingest_substance = mkV2 (irregV "shoot" "shot" "shot") ;
		sniff_V2_Ingest_substance = mkV2 (mkV "sniff" "sniffs" "sniffed" "sniffed" "sniffing") ;
		snort_V2_Ingest_substance = mkV2 (mkV "snort" "snorts" "snorted" "snorted" "snorting") ;
		take_V2_Ingest_substance = mkV2 (irregV "take" "took" "taken") ;
		use_V2_Ingest_substance = mkV2 (mkV "use" "uses" "used" "used" "using") ;

		breakfast_V_Ingestion = mkV "breakfast" "breakfasts" "breakfasted" "breakfasted" "breakfasting" ;
		dine_V_Ingestion = mkV "dine" "dines" "dined" "dined" "dining" ;
		drink_V_Ingestion = irregV "drink" "drank" "drunk" ;
		eat_V_Ingestion = irregV "eat" "ate" "eaten" ;
		feast_V_Ingestion = mkV "feast" "feasts" "feasted" "feasted" "feasting" ;
		feed_V_Ingestion = irregV "feed" "fed" "fed" ;
		gobble_V_Ingestion = mkV "gobble" "gobbles" "gobbled" "gobbled" "gobbling" ;
		gulp_V_Ingestion = mkV "gulp" "gulps" "gulped" "gulped" "gulping" ;
		guzzle_V_Ingestion = mkV "guzzle" "guzzles" "guzzled" "guzzled" "guzzling" ;
		imbibe_V_Ingestion = mkV "imbibe" "imbibes" "imbibed" "imbibed" "imbibing" ;
		lap_V_Ingestion = mkV "lap" "laps" "lapped" "lapped" "lapping" ;
		lunch_V_Ingestion = mkV "lunch" "lunches" "lunched" "lunched" "lunching" ;
		munch_V_Ingestion = mkV "munch" "munches" "munched" "munched" "munching" ;
		nibble_V_Ingestion = mkV "nibble" "nibbles" "nibbled" "nibbled" "nibbling" ;
		nurse_V_Ingestion = mkV "nurse" "nurses" "nursed" "nursed" "nursing" ;
		sip_V_Ingestion = mkV "sip" "sips" "sipped" "sipped" "sipping" ;
		sup_V_Ingestion = mkV "sup" "sups" "supped" "supped" "supping" ;
		swig_V_Ingestion = mkV "swig" "swigs" "swigged" "swigged" "swigging" ;
		consume_V_Ingestion = mkV "consume" "consumes" "consumed" "consumed" "consuming" ;
		devour_V_Ingestion = mkV "devour" "devours" "devoured" "devoured" "devouring" ;
		consume_V2_Ingestion = mkV2 (mkV "consume" "consumes" "consumed" "consumed" "consuming") ;
		devour_V2_Ingestion = mkV2 (mkV "devour" "devours" "devoured" "devoured" "devouring") ;
		down_V2_Ingestion = mkV2 (mkV "down" "downs" "downed" "downed" "downing") ;
		drink_V2_Ingestion = mkV2 (irregV "drink" "drank" "drunk") ;
		eat_V2_Ingestion = mkV2 (irregV "eat" "ate" "eaten") ;
		gobble_V2_Ingestion = mkV2 (mkV "gobble" "gobbles" "gobbled" "gobbled" "gobbling") ;
		gulp_V2_Ingestion = mkV2 (mkV "gulp" "gulps" "gulped" "gulped" "gulping") ;
		guzzle_V2_Ingestion = mkV2 (mkV "guzzle" "guzzles" "guzzled" "guzzled" "guzzling") ;
		have_V2_Ingestion = mkV2 (mk5V "have" "has" "had" "had" "having") ;
		imbibe_V2_Ingestion = mkV2 (mkV "imbibe" "imbibes" "imbibed" "imbibed" "imbibing") ;
		ingest_V2_Ingestion = mkV2 (mkV "ingest" "ingests" "ingested" "ingested" "ingesting") ;
		lap_V2_Ingestion = mkV2 (mkV "lap" "laps" "lapped" "lapped" "lapping") ;
		munch_V2_Ingestion = mkV2 (mkV "munch" "munches" "munched" "munched" "munching") ;
		nibble_V2_Ingestion = mkV2 (mkV "nibble" "nibbles" "nibbled" "nibbled" "nibbling") ;
		nosh_V2_Ingestion = mkV2 (mkV "nosh" "noshes" "noshed" "noshed" "noshing") ;
		nurse_V2_Ingestion = mkV2 (mkV "nurse" "nurses" "nursed" "nursed" "nursing") ;
		quaff_V2_Ingestion = mkV2 (mkV "quaff" "quaffs" "quaffed" "quaffed" "quaffing") ;
		sip_V2_Ingestion = mkV2 (mkV "sip" "sips" "sipped" "sipped" "sipping") ;
		swig_V2_Ingestion = mkV2 (mkV "swig" "swigs" "swigged" "swigged" "swigging") ;
		swill_V2_Ingestion = mkV2 (mkV "swill" "swills" "swilled" "swilled" "swilling") ;

		confine_V_Inhibit_movement = mkV "confine" "confines" "confined" "confined" "confining" ;
		imprison_V_Inhibit_movement = mkV "imprison" "imprisons" "imprisoned" "imprisoned" "imprisoning" ;
		lock_V_Inhibit_movement = mkV "lock" "locks" "locked" "locked" "locking" ;
		tie_V_Inhibit_movement = regV "tie" ;
		confine_V2_Inhibit_movement = mkV2 (mkV "confine" "confines" "confined" "confined" "confining") ;
		imprison_V2_Inhibit_movement = mkV2 (mkV "imprison" "imprisons" "imprisoned" "imprisoned" "imprisoning") ;
		lock_V2_Inhibit_movement = mkV2 (mkV "lock" "locks" "locked" "locked" "locking") ;
		tie_V2_Inhibit_movement = mkV2 (regV "tie") ;

		doublecheck_V2_Inspecting = mkV2 (mkV "double-check" "double-checks" "double-checked" "double-checked" "double-checking") ;
		examine_V2_Inspecting = mkV2 (mkV "examine" "examines" "examined" "examined" "examining") ;
		frisk_V2_Inspecting = mkV2 (mkV "frisk" "frisks" "frisked" "frisked" "frisking") ;
		inspect_V2_Inspecting = mkV2 (mkV "inspect" "inspects" "inspected" "inspected" "inspecting") ;
		reconnoitre_V2_Inspecting = mkV2 (mkV "reconnoitre" "reconnoitres" "reconnoitred" "reconnoitred" "reconnoitring") ;

		install_V2_Installing = mkV2 (mkV "install" "installs" "installed" "installed" "installing") ;

		commit_V2_Institutionalization = mkV2 (mkV "commit" "commits" "committed" "committed" "committing") ;
		institutionalize_V2_Institutionalization = mkV2 (mkV "institutionalize" "institutionalizes" "institutionalized" "institutionalized" "institutionalizing") ;
		hospitalize_V2_Institutionalization = mkV2 (mkV "hospitalize" "hospitalizes" "hospitalized" "hospitalized" "hospitalizing") ;

		cut_V_Intentional_traversing = irregDuplV "cut" "cut" "cut" ;
		ford_V2_Intentional_traversing = mkV2 (mkV "ford" "fords" "forded" "forded" "fording") ;

		-- No target for Intentionally_affect

		establish_V2_Intentionally_create = mkV2 (mkV "establish" "establishes" "established" "established" "establishing") ;
		set_up_V2_Intentionally_create = mkV2 (partV (irregDuplV "set" "set" "set") "up") ;

		intercept_V2_Intercepting = mkV2 (mkV "intercept" "intercepts" "intercepted" "intercepted" "intercepting") ;

		interrupt_V2_Interrupt_process = mkV2 (mkV "interrupt" "interrupts" "interrupted" "interrupted" "interrupting") ;

		invade_V_Invading = mkV "invade" "invades" "invaded" "invaded" "invading" ;
		invade_V2_Invading = mkV2 (mkV "invade" "invades" "invaded" "invaded" "invading") ;
		overrun_V2_Invading = mkV2 (mkV "over" IrregEng.run_V) ;

		admire_V2_Judgment = mkV2 (mkV "admire" "admires" "admired" "admired" "admiring") ;
		applaud_V2_Judgment = mkV2 (mkV "applaud" "applauds" "applauded" "applauded" "applauding") ;
		appreciate_V2_Judgment = mkV2 (mkV "appreciate" "appreciates" "appreciated" "appreciated" "appreciating") ;
		blame_V2_Judgment = mkV2 (mkV "blame" "blames" "blamed" "blamed" "blaming") ;
		boo_V2_Judgment = mkV2 (mkV "boo" "boos" "booed" "booed" "booing") ;
		deify_V2_Judgment = mkV2 (mkV "deify" "deifies" "deified" "deified" "deifying") ;
		deplore_V2_Judgment = mkV2 (mkV "deplore" "deplores" "deplored" "deplored" "deploring") ;
		disdain_V2_Judgment = mkV2 (mkV "disdain" "disdains" "disdained" "disdained" "disdaining") ;
		esteem_V2_Judgment = mkV2 (mkV "esteem" "esteems" "esteemed" "esteemed" "esteeming") ;
		exalt_V2_Judgment = mkV2 (mkV "exalt" "exalts" "exalted" "exalted" "exalting") ;
		fault_V2_Judgment = mkV2 (mkV "fault" "faults" "faulted" "faulted" "faulting") ;
		mock_V2_Judgment = mkV2 (mkV "mock" "mocks" "mocked" "mocked" "mocking") ;
		prize_V2_Judgment = mkV2 (mkV "prize" "prizes" "prized" "prized" "prizing") ;
		revere_V2_Judgment = mkV2 (mkV "revere" "reveres" "revered" "revered" "revering") ;
		scorn_V2_Judgment = mkV2 (mkV "scorn" "scorns" "scorned" "scorned" "scorning") ;
		stigmatize_V2_Judgment = mkV2 (mkV "stigmatize" "stigmatizes" "stigmatized" "stigmatized" "stigmatizing") ;
		value_V2_Judgment = mkV2 (mkV "value" "values" "valued" "valued" "valuing") ;

		acclaim_V2_Judgment_communication = mkV2 (mkV "acclaim" "acclaims" "acclaimed" "acclaimed" "acclaiming") ;
		accuse_V2_Judgment_communication = mkV2 (mkV "accuse" "accuses" "accused" "accused" "accusing") ;
		belittle_V2_Judgment_communication = mkV2 (mkV "belittle" "belittles" "belittled" "belittled" "belittling") ;
		blast_V2_Judgment_communication = mkV2 (mkV "blast" "blasts" "blasted" "blasted" "blasting") ;
		castigate_V2_Judgment_communication = mkV2 (mkV "castigate" "castigates" "castigated" "castigated" "castigating") ;
		censure_V2_Judgment_communication = mkV2 (mkV "censure" "censures" "censured" "censured" "censuring") ;
		charge_V2_Judgment_communication = mkV2 (mkV "charge" "charges" "charged" "charged" "charging") ;
		cite_V2_Judgment_communication = mkV2 (mkV "cite" "cites" "cited" "cited" "citing") ;
		commend_V2_Judgment_communication = mkV2 (mkV "commend" "commends" "commended" "commended" "commending") ;
		condemn_V2_Judgment_communication = mkV2 (mkV "condemn" "condemns" "condemned" "condemned" "condemning") ;
		criticize_V2_Judgment_communication = mkV2 (mkV "criticize" "criticizes" "criticized" "criticized" "criticizing") ;
		damn_V2_Judgment_communication = mkV2 (mkV "damn" "damns" "damned" "damned" "damning") ;
		decry_V2_Judgment_communication = mkV2 (mkV "decry" "decries" "decried" "decried" "decrying") ;
		denigrate_V2_Judgment_communication = mkV2 (mkV "denigrate" "denigrates" "denigrated" "denigrated" "denigrating") ;
		denounce_V2_Judgment_communication = mkV2 (mkV "denounce" "denounces" "denounced" "denounced" "denouncing") ;
		deprecate_V2_Judgment_communication = mkV2 (mkV "deprecate" "deprecates" "deprecated" "deprecated" "deprecating") ;
		deride_V2_Judgment_communication = mkV2 (mkV "deride" "derides" "derided" "derided" "deriding") ;
		disparage_V2_Judgment_communication = mkV2 (mkV "disparage" "disparages" "disparaged" "disparaged" "disparaging") ;
		excoriate_V2_Judgment_communication = mkV2 (mkV "excoriate" "excoriates" "excoriated" "excoriated" "excoriating") ;
		execrate_V2_Judgment_communication = mkV2 (mkV "execrate" "execrates" "execrated" "execrated" "execrating") ;
		extol_V2_Judgment_communication = mkV2 (mkV "extol" "extols" "extolled" "extolled" "extolling") ;
		laud_V2_Judgment_communication = mkV2 (mkV "laud" "lauds" "lauded" "lauded" "lauding") ;
		praise_V2_Judgment_communication = mkV2 (mkV "praise" "praises" "praised" "praised" "praising") ;
		ridicule_V2_Judgment_communication = mkV2 (mkV "ridicule" "ridicules" "ridiculed" "ridiculed" "ridiculing") ;
		slam_V2_Judgment_communication = mkV2 (mkV "slam" "slams" "slammed" "slammed" "slamming") ;

		admonish_V2_Judgment_direct_address = mkV2 (mkV "admonish" "admonishes" "admonished" "admonished" "admonishing") ;
		berate_V2_Judgment_direct_address = mkV2 (mkV "berate" "berates" "berated" "berated" "berating") ;
		chastise_V2_Judgment_direct_address = mkV2 (mkV "chastise" "chastises" "chastised" "chastised" "chastising") ;
		chide_V2_Judgment_direct_address = mkV2 (mkV "chide" "chides" "chided" "chided" "chiding") ;
		compliment_V2_Judgment_direct_address = mkV2 (mkV "compliment" "compliments" "complimented" "complimented" "complimenting") ;
		harangue_V2_Judgment_direct_address = mkV2 (mkV "harangue" "harangues" "harangued" "harangued" "haranguing") ;
		jeer_V2_Judgment_direct_address = mkV2 (mkV "jeer" "jeers" "jeered" "jeered" "jeering") ;
		rebuke_V2_Judgment_direct_address = mkV2 (mkV "rebuke" "rebukes" "rebuked" "rebuked" "rebuking") ;
		reprimand_V2_Judgment_direct_address = mkV2 (mkV "reprimand" "reprimands" "reprimanded" "reprimanded" "reprimanding") ;
		reproach_V2_Judgment_direct_address = mkV2 (mkV "reproach" "reproaches" "reproached" "reproached" "reproaching") ;
		reprove_V2_Judgment_direct_address = mkV2 (mkV "reprove" "reproves" "reproved" "reproved" "reproving") ;
		scold_V2_Judgment_direct_address = mkV2 (mkV "scold" "scolds" "scolded" "scolded" "scolding") ;
		tell_off_V2_Judgment_direct_address = mkV2 (partV (irregV "tell" "told" "told") "off") ;
		thank_V2_Judgment_direct_address = mkV2 (mkV "thank" "thanks" "thanked" "thanked" "thanking") ;
		upbraid_V2_Judgment_direct_address = mkV2 (mkV "upbraid" "upbraids" "upbraided" "upbraided" "upbraiding") ;

		justify_V2_Justifying = mkV2 (mkV "justify" "justifies" "justified" "justified" "justifying") ;
		rationalize_V2_Justifying = mkV2 (mkV "rationalize" "rationalizes" "rationalized" "rationalized" "rationalizing") ;

		abduct_V2_Kidnapping = mkV2 (mkV "abduct" "abducts" "abducted" "abducted" "abducting") ;
		kidnap_V2_Kidnapping = mkV2 (mkV "kidnap" "kidnaps" "kidnapped" "kidnapped" "kidnapping") ;
		nab_V2_Kidnapping = mkV2 (mkV "nab" "nabs" "nabbed" "nabbed" "nabbing") ;
		shanghai_V2_Kidnapping = mkV2 (mkV "shanghai" "shanghais" "shanghaied" "shanghaied" "shanghaiing") ;
		snatch_V2_Kidnapping = mkV2 (mkV "snatch" "snatches" "snatched" "snatched" "snatching") ;

		annihilate_V2_Killing = mkV2 (mkV "annihilate" "annihilates" "annihilated" "annihilated" "annihilating") ;
		asphyxiate_V2_Killing = mkV2 (mkV "asphyxiate" "asphyxiates" "asphyxiated" "asphyxiated" "asphyxiating") ;
		assassinate_V2_Killing = mkV2 (mkV "assassinate" "assassinates" "assassinated" "assassinated" "assassinating") ;
		behead_V2_Killing = mkV2 (mkV "behead" "beheads" "beheaded" "beheaded" "beheading") ;
		decapitate_V2_Killing = mkV2 (mkV "decapitate" "decapitates" "decapitated" "decapitated" "decapitating") ;
		dispatch_V2_Killing = mkV2 (mkV "dispatch" "dispatches" "dispatched" "dispatched" "dispatching") ;
		drown_V2_Killing = mkV2 (mkV "drown" "drowns" "drowned" "drowned" "drowning") ;
		exterminate_V2_Killing = mkV2 (mkV "exterminate" "exterminates" "exterminated" "exterminated" "exterminating") ;
		kill_V2_Killing = mkV2 (regV "kill") ;
		liquidate_V2_Killing = mkV2 (mkV "liquidate" "liquidates" "liquidated" "liquidated" "liquidating") ;
		massacre_V2_Killing = mkV2 (mkV "massacre" "massacres" "massacred" "massacred" "massacring") ;
		silence_V2_Killing = mkV2 (mkV "silence" "silences" "silenced" "silenced" "silencing") ;
		slaughter_V2_Killing = mkV2 (mkV "slaughter" "slaughters" "slaughtered" "slaughtered" "slaughtering") ;
		slay_V2_Killing = mkV2 (irregV "slay" "slew" "slain") ;
		starve_V2_Killing = mkV2 (mkV "starve" "starves" "starved" "starved" "starving") ;
		butcher_V2_Killing = mkV2 (mkV "butcher" "butchers" "butchered" "butchered" "butchering") ;
		crucify_V2_Killing = mkV2 (mkV "crucify" "crucifies" "crucified" "crucified" "crucifying") ;
		garrotte_V2_Killing = mkV2 (mkV "garrotte" "garrottes" "garrotted" "garrotted" "garrotting") ;
		lynch_V2_Killing = mkV2 (mkV "lynch" "lynches" "lynched" "lynched" "lynching") ;
		murder_V2_Killing = mkV2 (mkV "murder" "murders" "murdered" "murdered" "murdering") ;
		smother_V2_Killing = mkV2 (mkV "smother" "smothers" "smothered" "smothered" "smothering") ;

		tie_V2_Knot_creation = mkV2 (regV "tie") ;

		launch_V2_Launch_process = mkV2 (mkV "launch" "launches" "launched" "launched" "launching") ;

		head_V2_Leadership = mkV2 (mkV "head" "heads" "headed" "headed" "heading") ;
		lead_V2_Leadership = mkV2 (irregV "lead" "led" "led") ;
		preside_V2_Leadership = mkV2 (mkV "preside" "presides" "presided" "presided" "presiding") ;
		run_V2_Leadership = mkV2 (irregDuplV "run" "ran" "run") ;
		spearhead_V2_Leadership = mkV2 (mkV "spearhead") ;
		command_V2_Leadership = mkV2 (mkV "command" "commands" "commanded" "commanded" "commanding") ;
		govern_V2_Leadership = mkV2 (mkV "govern" "governs" "governed" "governed" "governing") ;
		rule_V2_Leadership = mkV2 (mkV "rule" "rules" "ruled" "ruled" "ruling") ;

		denote_V2_Linguistic_meaning = mkV2 (mkV "denote" "denotes" "denoted" "denoted" "denoting") ;

		buzz_V_Lively_place = mkV "buzz" "buzzes" "buzzed" "buzzed" "buzzing" ;

		coruscate_V_Location_of_light = mkV "coruscate" "coruscates" "coruscated" "coruscated" "coruscating" ;
		flame_V_Location_of_light = mkV "flame" "flames" "flamed" "flamed" "flaming" ;
		flare_V_Location_of_light = mkV "flare" "flares" "flared" "flared" "flaring" ;
		flash_V_Location_of_light = mkV "flash" "flashes" "flashed" "flashed" "flashing" ;
		flicker_V_Location_of_light = mkV "flicker" "flickers" "flickered" "flickered" "flickering" ;
		gleam_V_Location_of_light = mkV "gleam" "gleams" "gleamed" "gleamed" "gleaming" ;
		glimmer_V_Location_of_light = mkV "glimmer" "glimmers" "glimmered" "glimmered" "glimmering" ;
		glint_V_Location_of_light = mkV "glint" "glints" "glinted" "glinted" "glinting" ;
		glisten_V_Location_of_light = mkV "glisten" "glistens" "glistened" "glistened" "glistening" ;
		glister_V_Location_of_light = mkV "glister" "glisters" "glistered" "glistered" "glistering" ;
		glitter_V_Location_of_light = mkV "glitter" "glitters" "glittered" "glittered" "glittering" ;
		glow_V_Location_of_light = mkV "glow" "glows" "glowed" "glowed" "glowing" ;
		scintillate_V_Location_of_light = mkV "scintillate" "scintillates" "scintillated" "scintillated" "scintillating" ;
		shimmer_V_Location_of_light = mkV "shimmer" "shimmers" "shimmered" "shimmered" "shimmering" ;
		shine_V_Location_of_light = irregV "shine" "shone" "shone" ;
		sparkle_V_Location_of_light = mkV "sparkle" "sparkles" "sparkled" "sparkled" "sparkling" ;
		twinkle_V_Location_of_light = mkV "twinkle" "twinkles" "twinkled" "twinkled" "twinkling" ;

		lose_V2_Losing = mkV2 (irregV "lose" "lost" "lost") ;

		clatter_V_Make_noise = mkV "clatter" "clatters" "clattered" "clattered" "clattering" ;
		drone_V_Make_noise = mkV "drone" "drones" "droned" "droned" "droning" ;
		blast_V2_Make_noise = mkV2 (mkV "blast" "blasts" "blasted" "blasted" "blasting") ;
		bray_V2_Make_noise = mkV2 (mkV "bray" "brays" "brayed" "brayed" "braying") ;
		croon_V2_Make_noise = mkV2 (mkV "croon" "croons" "crooned" "crooned" "crooning") ;
		hum_V2_Make_noise = mkV2 (mkV "hum" "hums" "hummed" "hummed" "humming") ;
		screech_V2_Make_noise = mkV2 (mkV "screech" "screeches" "screeched" "screeched" "screeching") ;
		tinkle_V2_Make_noise = mkV2 (mkV "tinkle" "tinkles" "tinkled" "tinkled" "tinkling") ;

		permit_V2_Make_possible_to_do = mkV2 (mkV "permit" "permits" "permitted" "permitted" "permitting") ;
		let_VS_Make_possible_to_do = mkVS (irregDuplV "let" "let" "let") ;

		frown_V_Making_faces = mkV "frown" "frowns" "frowned" "frowned" "frowning" ;
		grimace_V_Making_faces = mkV "grimace" "grimaces" "grimaced" "grimaced" "grimacing" ;
		grin_V_Making_faces = mkV "grin" "grins" "grinned" "grinned" "grinning" ;
		pout_V_Making_faces = mkV "pout" "pouts" "pouted" "pouted" "pouting" ;
		scowl_V_Making_faces = mkV "scowl" "scowls" "scowled" "scowled" "scowling" ;
		smile_V_Making_faces = mkV "smile" "smiles" "smiled" "smiled" "smiling" ;
		smirk_V_Making_faces = mkV "smirk" "smirks" "smirked" "smirked" "smirking" ;

		blackmail_V2_Manipulate_into_doing = mkV2 (mkV "blackmail" "blackmails" "blackmailed" "blackmailed" "blackmailing") ;
		bully_V2_Manipulate_into_doing = mkV2 (mkV "bully" "bullies" "bullied" "bullied" "bullying") ;
		cajole_V2_Manipulate_into_doing = mkV2 (mkV "cajole" "cajoles" "cajoled" "cajoled" "cajoling") ;
		con_V2_Manipulate_into_doing = mkV2 (mkV "con" "cons" "conned" "conned" "conning") ;
		deceive_V2_Manipulate_into_doing = mkV2 (mkV "deceive" "deceives" "deceived" "deceived" "deceiving") ;
		harass_V2_Manipulate_into_doing = mkV2 (mkV "harass" "harasses" "harassed" "harassed" "harassing") ;

		claw_V_Manipulation = mkV "claw" "claws" "clawed" "clawed" "clawing" ;
		clutch_V_Manipulation = mkV "clutch" "clutches" "clutched" "clutched" "clutching" ;
		fumble_V_Manipulation = mkV "fumble" "fumbles" "fumbled" "fumbled" "fumbling" ;
		grab_V_Manipulation = mkV "grab" "grabs" "grabbed" "grabbed" "grabbing" ;
		grope_V_Manipulation = mkV "grope" "gropes" "groped" "groped" "groping" ;
		massage_V_Manipulation = mkV "massage" "massages" "massaged" "massaged" "massaging" ;
		nip_V_Manipulation = mkV "nip" "nips" "nipped" "nipped" "nipping" ;
		nudge_V_Manipulation = mkV "nudge" "nudges" "nudged" "nudged" "nudging" ;
		paw_V_Manipulation = mkV "paw" "paws" "pawed" "pawed" "pawing" ;
		pull_V_Manipulation = regV "pull" ;
		push_V_Manipulation = regV "push" ;
		squeeze_V_Manipulation = regV "squeeze" ;
		tug_V_Manipulation = mkV "tug" "tugs" "tugged" "tugged" "tugging" ;
		yank_V_Manipulation = mkV "yank" "yanks" "yanked" "yanked" "yanking" ;
		caress_V2_Manipulation = mkV2 (mkV "caress" "caresses" "caressed" "caressed" "caressing") ;
		claw_V2_Manipulation = mkV2 (mkV "claw" "claws" "clawed" "clawed" "clawing") ;
		clutch_V2_Manipulation = mkV2 (mkV "clutch" "clutches" "clutched" "clutched" "clutching") ;
		finger_V2_Manipulation = mkV2 (mkV "finger" "fingers" "fingered" "fingered" "fingering") ;
		fumble_V2_Manipulation = mkV2 (mkV "fumble" "fumbles" "fumbled" "fumbled" "fumbling") ;
		grab_V2_Manipulation = mkV2 (mkV "grab" "grabs" "grabbed" "grabbed" "grabbing") ;
		grasp_V2_Manipulation = mkV2 (mkV "grasp" "grasps" "grasped" "grasped" "grasping") ;
		grip_V2_Manipulation = mkV2 (mkV "grip" "grips" "gripped" "gripped" "gripping") ;
		kiss_V2_Manipulation = mkV2 (mkV "kiss" "kisses" "kissed" "kissed" "kissing") ;
		knead_V2_Manipulation = mkV2 (mkV "knead" "kneads" "kneaded" "kneaded" "kneading") ;
		lick_V2_Manipulation = mkV2 (mkV "lick" "licks" "licked" "licked" "licking") ;
		massage_V2_Manipulation = mkV2 (mkV "massage" "massages" "massaged" "massaged" "massaging") ;
		nip_V2_Manipulation = mkV2 (mkV "nip" "nips" "nipped" "nipped" "nipping") ;
		nudge_V2_Manipulation = mkV2 (mkV "nudge" "nudges" "nudged" "nudged" "nudging") ;
		paw_V2_Manipulation = mkV2 (mkV "paw" "paws" "pawed" "pawed" "pawing") ;
		pinch_V2_Manipulation = mkV2 (mkV "pinch" "pinches" "pinched" "pinched" "pinching") ;
		pull_V2_Manipulation = mkV2 (regV "pull") ;
		push_V2_Manipulation = mkV2 (regV "push") ;
		rub_V2_Manipulation = mkV2 (mkV "rub" "rubs" "rubbed" "rubbed" "rubbing") ;
		seize_V2_Manipulation = mkV2 (mkV "seize" "seizes" "seized" "seized" "seizing") ;
		squeeze_V2_Manipulation = mkV2 (regV "squeeze") ;
		tickle_V2_Manipulation = mkV2 (mkV "tickle" "tickles" "tickled" "tickled" "tickling") ;
		tug_V2_Manipulation = mkV2 (mkV "tug" "tugs" "tugged" "tugged" "tugging") ;
		tweak_V2_Manipulation = mkV2 (mkV "tweak" "tweaks" "tweaked" "tweaked" "tweaking") ;
		wring_V2_Manipulation = mkV2 (irregV "wring" "wrung" "wrung") ;
		yank_V2_Manipulation = mkV2 (mkV "yank" "yanks" "yanked" "yanked" "yanking") ;

		fabricate_V2_Manufacturing = mkV2 (mkV "fabricate" "fabricates" "fabricated" "fabricated" "fabricating") ;
		make_V2_Manufacturing = mkV2 (irregV "make" "made" "made") ;
		manufacture_V2_Manufacturing = mkV2 (mkV "manufacture" "manufactures" "manufactured" "manufactured" "manufacturing") ;
		produce_V2_Manufacturing = mkV2 (mkV "produce" "produces" "produced" "produced" "producing") ;

		crowd_V_Mass_motion = mkV "crowd" "crowds" "crowded" "crowded" "crowding" ;
		shower_V_Mass_motion = mkV "shower" "showers" "showered" "showered" "showering" ;
		swarm_V_Mass_motion = mkV "swarm" "swarms" "swarmed" "swarmed" "swarming" ;
		flock_V_Mass_motion = mkV "flock" "flocks" "flocked" "flocked" "flocking" ;
		rain_V_Mass_motion = regV "rain" ;
		flood_V_Mass_motion = mkV "flood" "floods" "flooded" "flooded" "flooding" ;
		pelt_V_Mass_motion = mkV "pelt" "pelts" "pelted" "pelted" "pelting" ;
		pour_V_Mass_motion = mkV "pour" "pours" "poured" "poured" "pouring" ;
		roll_V_Mass_motion = mkV "roll" "rolls" "rolled" "rolled" "rolling" ;
		stream_V_Mass_motion = mkV "stream" "streams" "streamed" "streamed" "streaming" ;
		throng_V_Mass_motion = mkV "throng" "throngs" "thronged" "thronged" "thronging" ;
		troop_V_Mass_motion = mkV "troop" "troops" "trooped" "trooped" "trooping" ;
		hail_V_Mass_motion = mkV "hail" "hails" "hailed" "hailed" "hailing" ;
		parade_V_Mass_motion = mkV "parade" "parades" "paraded" "paraded" "parading" ;
		teem_V_Mass_motion = mkV "teem" "teems" "teemed" "teemed" "teeming" ;

		meet_V2_Meet_specifications = mkV2 (irregV "meet" "met" "met") ;

		meet_with_V2_Meet_with = mkV2 (partV (irregV "meet" "met" "met") "with") ;

		meet_V2_Meet_with_response = mkV2 (irregV "meet" "met" "met") ;

		-- No target for Memorization

		recall_V2_Memory = mkV2 (mkV "recall" "recalls" "recalled" "recalled" "recalling") ;
		recollect_V2_Memory = mkV2 (mkV "recollect" "recollects" "recollected" "recollected" "recollecting") ;
		remember_V2_Memory = mkV2 (mkV "remember" "remembers" "remembered" "remembered" "remembering") ;
		retain_V2_Memory = mkV2 (mkV "retain" "retains" "retained" "retained" "retaining") ;
		remember_VS_Memory = mkVS (mkV "remember" "remembers" "remembered" "remembered" "remembering") ;

		mention_V2_Mention = mkV2 (mkV "mention" "mentions" "mentioned" "mentioned" "mentioning") ;
		mention_VS_Mention = mkVS (mkV "mention" "mentions" "mentioned" "mentioned" "mentioning") ;

		sin_V_Misdeed = mkV "sin" "sins" "sinned" "sinned" "sinning" ;

		blow_V_Motion = irregV "blow" "blew" "blown" ;
		coast_V_Motion = mkV "coast" "coasts" "coasted" "coasted" "coasting" ;
		drift_V_Motion = mkV "drift" "drifts" "drifted" "drifted" "drifting" ;
		float_V_Motion = regV "float" ;
		glide_V_Motion = mkV "glide" "glides" "glided" "glided" "gliding" ;
		go_V_Motion = mk5V "go" "goes" "went" "gone" "going" ;
		meander_V_Motion = mkV "meander" "meanders" "meandered" "meandered" "meandering" ;
		move_V_Motion = mkV "move" "moves" "moved" "moved" "moving" ;
		slide_V_Motion = irregV "slide" "slid" "slid" ;
		snake_V_Motion = mkV "snake" "snakes" "snaked" "snaked" "snaking" ;
		soar_V_Motion = mkV "soar" "soars" "soared" "soared" "soaring" ;
		swerve_V_Motion = mkV "swerve" "swerves" "swerved" "swerved" "swerving" ;
		swing_V_Motion = irregV "swing" "swung" "swung" ;
		travel_V_Motion = mkV "travel" "travels" "traveled" "traveled" "traveling" ;
		weave_V_Motion = irregV "weave" (variants {"weaved" ; "wove"}) (variants {"weaved" ; "woven"}) ;
		wind_V_Motion = irregV "wind" "wound" "wound" ;
		zigzag_V_Motion = mkV "zigzag" "zigzags" "zigzagged" "zigzagged" "zigzagging" ;
		fly_V_Motion = irregV "fly" "flew" "flown" ;
		roll_V_Motion = mkV "roll" "rolls" "rolled" "rolled" "rolling" ;
		undulate_V_Motion = mkV "undulate" "undulates" "undulated" "undulated" "undulating" ;

		angle_V_Motion_directional = mkV "angle" "angles" "angled" "angled" "angling" ;
		descend_V_Motion_directional = mkV "descend" "descends" "descended" "descended" "descending" ;
		dip_V_Motion_directional = mkV "dip" "dips" "dipped" "dipped" "dipping" ;
		drop_V_Motion_directional = mkV "drop" "drops" "dropped" "dropped" "dropping" ;
		fall_V_Motion_directional = irregV "fall" "fell" "fallen" ;
		plummet_V_Motion_directional = mkV "plummet" "plummets" "plummeted" "plummeted" "plummeting" ;
		plunge_V_Motion_directional = mkV "plunge" "plunges" "plunged" "plunged" "plunging" ;
		rise_V_Motion_directional = irregV "rise" "rose" "risen" ;
		slant_V_Motion_directional = mkV "slant" "slants" "slanted" "slanted" "slanting" ;
		topple_V_Motion_directional = mkV "topple" "topples" "toppled" "toppled" "toppling" ;

		bang_V_Motion_noise = mkV "bang" "bangs" "banged" "banged" "banging" ;
		buzz_V_Motion_noise = mkV "buzz" "buzzes" "buzzed" "buzzed" "buzzing" ;
		chug_V_Motion_noise = mkV "chug" "chugs" "chugged" "chugged" "chugging" ;
		clack_V_Motion_noise = mkV "clack" "clacks" "clacked" "clacked" "clacking" ;
		clang_V_Motion_noise = mkV "clang" "clangs" "clanged" "clanged" "clanging" ;
		clank_V_Motion_noise = mkV "clank" "clanks" "clanked" "clanked" "clanking" ;
		clatter_V_Motion_noise = mkV "clatter" "clatters" "clattered" "clattered" "clattering" ;
		click_V_Motion_noise = mkV "click" "clicks" "clicked" "clicked" "clicking" ;
		clump_V_Motion_noise = mkV "clump" "clumps" "clumped" "clumped" "clumping" ;
		clunk_V_Motion_noise = mkV "clunk" "clunks" "clunked" "clunked" "clunking" ;
		crackle_V_Motion_noise = mkV "crackle" "crackles" "crackled" "crackled" "crackling" ;
		crash_V_Motion_noise = mkV "crash" "crashes" "crashed" "crashed" "crashing" ;
		creak_V_Motion_noise = mkV "creak" "creaks" "creaked" "creaked" "creaking" ;
		gurgle_V_Motion_noise = mkV "gurgle" "gurgles" "gurgled" "gurgled" "gurgling" ;
		hiss_V_Motion_noise = mkV "hiss" "hisses" "hissed" "hissed" "hissing" ;
		howl_V_Motion_noise = mkV "howl" "howls" "howled" "howled" "howling" ;
		patter_V_Motion_noise = mkV "patter" "patters" "pattered" "pattered" "pattering" ;
		putter_V_Motion_noise = mkV "putter" "putters" "puttered" "puttered" "puttering" ;
		rumble_V_Motion_noise = mkV "rumble" "rumbles" "rumbled" "rumbled" "rumbling" ;
		rustle_V_Motion_noise = mkV "rustle" "rustles" "rustled" "rustled" "rustling" ;
		screech_V_Motion_noise = mkV "screech" "screeches" "screeched" "screeched" "screeching" ;
		squelch_V_Motion_noise = mkV "squelch" "squelches" "squelched" "squelched" "squelching" ;
		swish_V_Motion_noise = mkV "swish" "swishes" "swished" "swished" "swishing" ;
		wheeze_V_Motion_noise = mkV "wheeze" "wheezes" "wheezed" "wheezed" "wheezing" ;
		whir_V_Motion_noise = mkV "whir" "whirs" "whirred" "whirred" "whirring" ;

		judder_V_Moving_in_place = mkV "judder" "judders" "juddered" "juddered" "juddering" ;
		quiver_V_Moving_in_place = mkV "quiver" "quivers" "quivered" "quivered" "quivering" ;
		rotate_V_Moving_in_place = mkV "rotate" "rotates" "rotated" "rotated" "rotating" ;
		shake_V_Moving_in_place = irregV "shake" "shook" "shaken" ;
		swing_V_Moving_in_place = irregV "swing" "swung" "swung" ;
		twirl_V_Moving_in_place = mkV "twirl" "twirls" "twirled" "twirled" "twirling" ;
		vibrate_V_Moving_in_place = mkV "vibrate" "vibrates" "vibrated" "vibrated" "vibrating" ;

		name_V2_Name_conferral = mkV2 (mkV "name" "names" "named" "named" "naming") ;
		baptize_V2_Name_conferral = mkV2 (mkV "baptize" "baptizes" "baptized" "baptized" "baptizing") ;
		christen_V2_Name_conferral = mkV2 (mkV "christen" "christens" "christened" "christened" "christening") ;

		need_V2_Needing = mkV2 (mkV "need" "needs" "needed" "needed" "needing") ;
		require_V2_Needing = mkV2 (mkV "require") ;

		charge_V2_Notification_of_charges = mkV2 (mkV "charge" "charges" "charged" "charged" "charging") ;
		indict_V2_Notification_of_charges = mkV2 (mkV "indict" "indicts" "indicted" "indicted" "indicting") ;
		accuse_V2_Notification_of_charges = mkV2 (mkV "accuse" "accuses" "accused" "accused" "accusing") ;

		decay_V_Nuclear_process = mkV "decay" "decays" "decayed" "decayed" "decaying" ;

		show_V_Obviousness = irregV "show" "showed" (variants {"showed" ; "shown"}) ;

		rank_V_Occupy_rank = mkV "rank" "ranks" "ranked" "ranked" "ranking" ;
		stand_V_Occupy_rank = irregV "stand" "stood" "stood" ;

		augur_V_Omen = mkV "augur" "augurs" "augured" "augured" "auguring" ;
		bode_V_Omen = mkV "bode" "bodes" "boded" "boded" "boding" ;
		augur_V2_Omen = mkV2 (mkV "augur" "augurs" "augured" "augured" "auguring") ;
		betoken_V2_Omen = mkV2 (mkV "betoken" "betokens" "betokened" "betokened" "betokening") ;
		foreshadow_V2_Omen = mkV2 (mkV "foreshadow" "foreshadows" "foreshadowed" "foreshadowed" "foreshadowing") ;
		foretell_V2_Omen = mkV2 (mkV "fore" IrregEng.tell_V) ;
		herald_V2_Omen = mkV2 (mkV "herald" "heralds" "heralded" "heralded" "heralding") ;
		portend_V2_Omen = mkV2 (mkV "portend" "portends" "portended" "portended" "portending") ;
		prefigure_V2_Omen = mkV2 (mkV "prefigure" "prefigures" "prefigured" "prefigured" "prefiguring") ;
		presage_V2_Omen = mkV2 (mkV "presage" "presages" "presaged" "presaged" "presaging") ;
		promise_V2_Omen = mkV2 (mkV "promise" "promises" "promised" "promised" "promising") ;

		bicycle_V_Operate_vehicle = mkV "bicycle" "bicycles" "bicycled" "bicycled" "bicycling" ;
		bike_V_Operate_vehicle = mkV "bike" "bikes" "biked" "biked" "biking" ;
		boat_V_Operate_vehicle = mkV "boat" "boats" "boated" "boated" "boating" ;
		canoe_V_Operate_vehicle = mkV "canoe" "canoes" "canoed" "canoed" "canoeing" ;
		cycle_V_Operate_vehicle = mkV "cycle" "cycles" "cycled" "cycled" "cycling" ;
		drive_V_Operate_vehicle = irregV "drive" "drove" "driven" ;
		fly_V_Operate_vehicle = irregV "fly" "flew" "flown" ;
		motor_V_Operate_vehicle = mkV "motor" "motors" "motored" "motored" "motoring" ;
		paddle_V_Operate_vehicle = mkV "paddle" "paddles" "paddled" "paddled" "paddling" ;
		pedal_V_Operate_vehicle = mkV "pedal" "pedals" "pedalled" "pedalled" "pedalling" ;
		punt_V_Operate_vehicle = mkV "punt" "punts" "punted" "punted" "punting" ;
		raft_V_Operate_vehicle = mkV "raft" "rafts" "rafted" "rafted" "rafting" ;
		row_V_Operate_vehicle = mkV "row" "rows" "rowed" "rowed" "rowing" ;
		skate_V_Operate_vehicle = mkV "skate" "skates" "skated" "skated" "skating" ;
		sledge_V_Operate_vehicle = mkV "sledge" "sledges" "sledged" "sledged" "sledging" ;
		tack_V_Operate_vehicle = mkV "tack" "tacks" "tacked" "tacked" "tacking" ;
		taxi_V_Operate_vehicle = mkV "taxi" "taxis" "taxied" "taxied" "taxiing" ;
		toboggan_V_Operate_vehicle = mkV "toboggan" "toboggans" "tobogganed" "tobogganed" "tobogganing" ;
		parachute_V_Operate_vehicle = mkV "parachute" "parachutes" "parachuted" "parachuted" "parachuting" ;

		manage_V2_Operating_a_system = mkV2 (mkV "manage" "manages" "managed" "managed" "managing") ;
		operate_V2_Operating_a_system = mkV2 (mkV "operate" "operates" "operated" "operated" "operating") ;

		test_V2_Operational_testing = mkV2 (mkV "test" "tests" "tested" "tested" "testing") ;

		expect_VS_Opinion = mkVS (mkV "expect") ;
		feel_VS_Opinion = mkVS (irregV "feel" "felt" "felt") ;
		figure_VS_Opinion = mkVS (mkV "figure" "figures" "figured" "figured" "figuring") ;
		suppose_VS_Opinion = mkVS (mkV "suppose" "supposes" "supposed" "supposed" "supposing") ;

		originate_V_Origin = mkV "originate" "originates" "originated" "originated" "originating" ;

		empathize_V_Others_situation_as_stimulus = mkV "empathize" ;
		sympathize_V_Others_situation_as_stimulus = mkV "sympathize" "sympathizes" "sympathized" "sympathized" "sympathizing" ;
		pity_V2_Others_situation_as_stimulus = mkV2 (mkV "pity" "pities" "pitied" "pitied" "pitying") ;

		pardon_V2_Pardon = mkV2 (mkV "pardon" "pardons" "pardoned" "pardoned" "pardoning") ;

		prefer_V2_Partiality = mkV2 (mkV "prefer" "prefers" "preferred" "preferred" "preferring") ;
		prejudge_V2_Partiality = mkV2 (mkV "prejudge" "prejudges" "prejudged" "prejudged" "prejudging") ;

		participate_V_Participation = mkV "participate" "participates" "participated" "participated" "participating" ;

		crisscross_V_Path_shape = mkV "crisscross" "crisscrosses" "crisscrossed" "crisscrossed" "crisscrossing" ;
		cross_V_Path_shape = mkV "cross" "crosses" "crossed" "crossed" "crossing" ;
		descend_V_Path_shape = mkV "descend" "descends" "descended" "descended" "descending" ;
		dip_V_Path_shape = mkV "dip" "dips" "dipped" "dipped" "dipping" ;
		drop_V_Path_shape = mkV "drop" "drops" "dropped" "dropped" "dropping" ;
		reach_V_Path_shape = mkV "reach" "reaches" "reached" "reached" "reaching" ;
		rise_V_Path_shape = irregV "rise" "rose" "risen" ;
		slant_V_Path_shape = mkV "slant" "slants" "slanted" "slanted" "slanting" ;
		swerve_V_Path_shape = mkV "swerve" "swerves" "swerved" "swerved" "swerving" ;
		swing_V_Path_shape = irregV "swing" "swung" "swung" ;
		undulate_V_Path_shape = mkV "undulate" "undulates" "undulated" "undulated" "undulating" ;
		weave_V_Path_shape = irregV "weave" (variants {"weaved" ; "wove"}) (variants {"weaved" ; "woven"}) ;
		wind_V_Path_shape = irregV "wind" "wound" "wound" ;
		zigzag_V_Path_shape = mkV "zigzag" "zigzags" "zigzagged" "zigzagged" "zigzagging" ;
		angle_V_Path_shape = mkV "angle" "angles" "angled" "angled" "angling" ;
		ascend_V_Path_shape = mkV "ascend" "ascends" "ascended" "ascended" "ascending" ;
		bend_V_Path_shape = irregV "bend" "bent" "bent" ;
		emerge_V_Path_shape = mkV "emerge" "emerges" "emerged" "emerged" "emerging" ;
		meander_V_Path_shape = mkV "meander" "meanders" "meandered" "meandered" "meandering" ;
		skirt_V_Path_shape = mkV "skirt" "skirts" "skirted" "skirted" "skirting" ;
		snake_V_Path_shape = mkV "snake" "snakes" "snaked" "snaked" "snaking" ;
		crisscross_V2_Path_shape = mkV2 (mkV "crisscross" "crisscrosses" "crisscrossed" "crisscrossed" "crisscrossing") ;

		ache_V_Perception_body = mkV "ache" "aches" "ached" "ached" "aching" ;
		ail_V_Perception_body = mkV "ail" "ails" "ailed" "ailed" "ailing" ;
		hurt_V_Perception_body = irregV "hurt" "hurt" "hurt" ;
		itch_V_Perception_body = mkV "itch" "itches" "itched" "itched" "itching" ;
		prickle_V_Perception_body = mkV "prickle" "prickles" "prickled" "prickled" "prickling" ;
		smart_V_Perception_body = mkV "smart" "smarts" "smarted" "smarted" "smarting" ;
		sting_V_Perception_body = irregV "sting" "stung" "stung" ;
		tingle_V_Perception_body = mkV "tingle" "tingles" "tingled" "tingled" "tingling" ;
		burn_V_Perception_body = irregV "burn" (variants {"burned" ; "burnt"}) (variants {"burned" ; "burnt"}) ;
		tickle_V_Perception_body = mkV "tickle" "tickles" "tickled" "tickled" "tickling" ;

		detect_V2_Perception_experience = mkV2 (mkV "detect" "detects" "detected" "detected" "detecting") ;
		feel_V2_Perception_experience = mkV2 (irregV "feel" "felt" "felt") ;
		hear_V2_Perception_experience = mkV2 (irregV "hear" "heard" "heard") ;
		overhear_V2_Perception_experience = mkV2 (mkV "over" IrregEng.hear_V) ;
		perceive_V2_Perception_experience = mkV2 (mkV "perceive" "perceives" "perceived" "perceived" "perceiving") ;
		see_V2_Perception_experience = mkV2 (irregV "see" "saw" "seen") ;
		sense_V2_Perception_experience = mkV2 (mkV "sense" "senses" "sensed" "sensed" "sensing") ;
		smell_V2_Perception_experience = mkV2 (regV "smell") ;
		taste_V2_Perception_experience = mkV2 (mkV "taste" "tastes" "tasted" "tasted" "tasting") ;
		detect_VQ_Perception_experience = mkVQ (mkV "detect" "detects" "detected" "detected" "detecting") ;
		hear_VQ_Perception_experience = mkVQ (irregV "hear" "heard" "heard") ;
		overhear_VQ_Perception_experience = mkVQ (mkV "over" IrregEng.hear_V) ;
		perceive_VQ_Perception_experience = mkVQ (mkV "perceive" "perceives" "perceived" "perceived" "perceiving") ;
		sense_VQ_Perception_experience = mkVQ (mkV "sense" "senses" "sensed" "sensed" "sensing") ;

		costar_V_Performers_and_roles = mkV "co-star" "co-stars" "co-starred" "co-starred" "co-starring" ;
		star_V_Performers_and_roles = mkV "star" "stars" "starred" "starred" "starring" ;
		act_V2_Performers_and_roles = mkV2 (mkV "act" "acts" "acted" "acted" "acting") ;
		play_V2_Performers_and_roles = mkV2 (regV "play") ;
		star_V2_Performers_and_roles = mkV2 (mkV "star" "stars" "starred" "starred" "starring") ;

		permit_V2_Permitting = mkV2 (mkV "permit" "permits" "permitted" "permitted" "permitting") ;

		cohabit_V_Personal_relationship = mkV "cohabit" "cohabits" "cohabited" "cohabited" "cohabiting" ;
		court_V2_Personal_relationship = mkV2 (mkV "court" "courts" "courted" "courted" "courting") ;
		date_V2_Personal_relationship = mkV2 (mkV "date" "dates" "dated" "dated" "dating") ;

		hijack_V2_Piracy = mkV2 (mkV "hijack" "hijacks" "hijacked" "hijacked" "hijacking") ;

		-- No target for Place_weight_on

		bag_V2_Placing = mkV2 (mkV "bag" "bags" "bagged" "bagged" "bagging") ;
		bestow_V2_Placing = mkV2 (mkV "bestow" "bestows" "bestowed" "bestowed" "bestowing") ;
		billet_V2_Placing = mkV2 (mkV "billet" "billets" "billeted" "billeted" "billeting") ;
		bottle_V2_Placing = mkV2 (mkV "bottle" "bottles" "bottled" "bottled" "bottling") ;
		box_V2_Placing = mkV2 (mkV "box" "boxes" "boxed" "boxed" "boxing") ;
		brush_V2_Placing = mkV2 (mkV "brush" "brushes" "brushed" "brushed" "brushing") ;
		cage_V2_Placing = mkV2 (mkV "cage" "cages" "caged" "caged" "caging") ;
		cram_V2_Placing = mkV2 (mkV "cram" "crams" "crammed" "crammed" "cramming") ;
		crate_V2_Placing = mkV2 (mkV "crate" "crates" "crated" "crated" "crating") ;
		dab_V2_Placing = mkV2 (mkV "dab" "dabs" "dabbed" "dabbed" "dabbing") ;
		daub_V2_Placing = mkV2 (mkV "daub" "daubs" "daubed" "daubed" "daubing") ;
		deposit_V2_Placing = mkV2 (mkV "deposit" "deposits" "deposited" "deposited" "depositing") ;
		drape_V2_Placing = mkV2 (mkV "drape" "drapes" "draped" "draped" "draping") ;
		drizzle_V2_Placing = mkV2 (mkV "drizzle" "drizzles" "drizzled" "drizzled" "drizzling") ;
		dust_V2_Placing = mkV2 (mkV "dust" "dusts" "dusted" "dusted" "dusting") ;
		embed_V2_Placing = mkV2 (mkV "embed" "embeds" "embedded" "embedded" "embedding") ;
		file_V2_Placing = mkV2 (mkV "file" "files" "filed" "filed" "filing") ;
		garage_V2_Placing = mkV2 (mkV "garage" "garages" "garaged" "garaged" "garaging") ;
		hang_V2_Placing = mkV2 (irregV "hang" "hung" "hung") ;
		heap_V2_Placing = mkV2 (mkV "heap" "heaps" "heaped" "heaped" "heaping") ;
		immerse_V2_Placing = mkV2 (mkV "immerse" "immerses" "immersed" "immersed" "immersing") ;
		implant_V2_Placing = mkV2 (mkV "implant" "implants" "implanted" "implanted" "implanting") ;
		inject_V2_Placing = mkV2 (mkV "inject" "injects" "injected" "injected" "injecting") ;
		insert_V2_Placing = mkV2 (mkV "insert" "inserts" "inserted" "inserted" "inserting") ;
		jam_V2_Placing = mkV2 (mkV "jam" "jams" "jammed" "jammed" "jamming") ;
		lay_V2_Placing = mkV2 (irregV "lay" "laid" "laid") ;
		lean_V2_Placing = mkV2 (mkV "lean" "leans" "leaned" "leaned" "leaning") ;
		load_V2_Placing = mkV2 (mkV "load" "loads" "loaded" "loaded" "loading") ;
		lodge_V2_Placing = mkV2 (mkV "lodge" "lodges" "lodged" "lodged" "lodging") ;
		pack_V2_Placing = mkV2 (mkV "pack" "packs" "packed" "packed" "packing") ;
		package_V2_Placing = mkV2 (mkV "package" "packages" "packaged" "packaged" "packaging") ;
		park_V2_Placing = mkV2 (mkV "park" "parks" "parked" "parked" "parking") ;
		perch_V2_Placing = mkV2 (mkV "perch" "perches" "perched" "perched" "perching") ;
		pile_V2_Placing = mkV2 (mkV "pile" "piles" "piled" "piled" "piling") ;
		place_V2_Placing = mkV2 (mkV "place" "places" "placed" "placed" "placing") ;
		plant_V2_Placing = mkV2 (mkV "plant" "plants" "planted" "planted" "planting") ;
		plunge_V2_Placing = mkV2 (mkV "plunge" "plunges" "plunged" "plunged" "plunging") ;
		pocket_V2_Placing = mkV2 (mkV "pocket" "pockets" "pocketed" "pocketed" "pocketing") ;
		position_V2_Placing = mkV2 (mkV "position" "positions" "positioned" "positioned" "positioning") ;
		pot_V2_Placing = mkV2 (mkV "pot" "pots" "potted" "potted" "potting") ;
		put_V2_Placing = mkV2 (irregDuplV "put" "put" "put") ;
		rest_V2_Placing = mkV2 (mkV "rest" "rests" "rested" "rested" "resting") ;
		rub_V2_Placing = mkV2 (mkV "rub" "rubs" "rubbed" "rubbed" "rubbing") ;
		set_V2_Placing = mkV2 (irregDuplV "set" "set" "set") ;
		sheathe_V2_Placing = mkV2 (mkV "sheathe" "sheathes" "sheathed" "sheathed" "sheathing") ;
		shelve_V2_Placing = mkV2 (mkV "shelve" "shelves" "shelved" "shelved" "shelving") ;
		shoulder_V2_Placing = mkV2 (mkV "shoulder" "shoulders" "shouldered" "shouldered" "shouldering") ;
		shower_V2_Placing = mkV2 (mkV "shower" "showers" "showered" "showered" "showering") ;
		sit_V2_Placing = mkV2 (irregDuplV "sit" "sat" "sat") ;
		situate_V2_Placing = mkV2 (mkV "situate") ;
		smear_V2_Placing = mkV2 (mkV "smear" "smears" "smeared" "smeared" "smearing") ;
		stable_V2_Placing = mkV2 (mkV "stable" "stables" "stabled" "stabled" "stabling") ;
		stand_V2_Placing = mkV2 (irregV "stand" "stood" "stood") ;
		stash_V2_Placing = mkV2 (mkV "stash" "stashes" "stashed" "stashed" "stashing") ;
		stick_V2_Placing = mkV2 (irregV "stick" "stuck" "stuck") ;
		stow_V2_Placing = mkV2 (mkV "stow" "stows" "stowed" "stowed" "stowing") ;
		stuff_V2_Placing = mkV2 (mkV "stuff" "stuffs" "stuffed" "stuffed" "stuffing") ;
		tuck_V2_Placing = mkV2 (mkV "tuck" "tucks" "tucked" "tucked" "tucking") ;
		wrap_V2_Placing = mkV2 (mkV "wrap" "wraps" "wrapped" "wrapped" "wrapping") ;

		plant_V2_Planting = mkV2 (mkV "plant" "plants" "planted" "planted" "planting") ;
		sow_V2_Planting = mkV2 (irregV "sow" "sowed" (variants {"sowed" ; "sown"})) ;

		impersonate_V2_Posing_as = mkV2 (mkV "impersonate" "impersonates" "impersonated" "impersonated" "impersonating") ;

		have_V2_Possession = mkV2 (mk5V "have" "has" "had" "had" "having") ;
		own_V2_Possession = mkV2 (mkV "own" "owns" "owned" "owned" "owning") ;
		possess_V2_Possession = mkV2 (mkV "possess" "possesses" "possessed" "possessed" "possessing") ;

		bend_V_Posture = irregV "bend" "bent" "bent" ;
		crouch_V_Posture = mkV "crouch" "crouches" "crouched" "crouched" "crouching" ;
		huddle_V_Posture = mkV "huddle" "huddles" "huddled" "huddled" "huddling" ;
		hunch_V_Posture = mkV "hunch" "hunches" "hunched" "hunched" "hunching" ;
		kneel_V_Posture = irregV "kneel" "knelt" "knelt" ;
		lean_V_Posture = mkV "lean" "leans" "leaned" "leaned" "leaning" ;
		lie_V_Posture = irregV "lie" "lay" "lain" ;
		sit_V_Posture = irregDuplV "sit" "sat" "sat" ;
		slouch_V_Posture = mkV "slouch" "slouches" "slouched" "slouched" "slouching" ;
		sprawl_V_Posture = mkV "sprawl" "sprawls" "sprawled" "sprawled" "sprawling" ;
		squat_V_Posture = mkV "squat" "squats" "squatted" "squatted" "squatting" ;
		stand_V_Posture = irregV "stand" "stood" "stood" ;
		stoop_V_Posture = mkV "stoop" "stoops" "stooped" "stooped" "stooping" ;

		practice_V_Practice = mkV "practice" ;
		rehearse_V_Practice = mkV "rehearse" "rehearses" "rehearsed" "rehearsed" "rehearsing" ;
		run_V_Practice = irregDuplV "run" "ran" "run" ;
		practice_V2_Practice = mkV2 (mkV "practice") ;
		rehearse_V2_Practice = mkV2 (mkV "rehearse" "rehearses" "rehearsed" "rehearsed" "rehearsing") ;
		run_V2_Practice = mkV2 (irregDuplV "run" "ran" "run") ;

		rain_V_Precipitation = regV "rain" ;
		snow_V_Precipitation = mkV "snow" "snows" "snowed" "snowed" "snowing" ;
		drizzle_V_Precipitation = mkV "drizzle" "drizzles" "drizzled" "drizzled" "drizzling" ;

		can_V2_Preserving = mkV2 (mkV "can" "cans" "canned" "canned" "canning") ;
		cure_V2_Preserving = mkV2 (mkV "cure" "cures" "cured" "cured" "curing") ;
		embalm_V2_Preserving = mkV2 (mkV "embalm" "embalms" "embalmed" "embalmed" "embalming") ;
		mummify_V2_Preserving = mkV2 (mkV "mummify" "mummifies" "mummified" "mummified" "mummifying") ;
		pickle_V2_Preserving = mkV2 (mkV "pickle" "pickles" "pickled" "pickled" "pickling") ;
		preserve_V2_Preserving = mkV2 (mkV "preserve" "preserves" "preserved" "preserved" "preserving") ;
		salt_V2_Preserving = mkV2 (mkV "salt" "salts" "salted" "salted" "salting") ;

		bullshit_V_Prevarication = mkV "bullshit" "bullshits" "bullshitted" "bullshitted" "bullshitting" ;
		fib_V_Prevarication = mkV "fib" "fibs" "fibbed" "fibbed" "fibbing" ;
		kid_V_Prevarication = mkV "kid" "kids" "kidded" "kidded" "kidding" ;
		lie_V_Prevarication = irregV "lie" "lay" "lain" ;
		prevaricate_V_Prevarication = mkV "prevaricate" "prevaricates" "prevaricated" "prevaricated" "prevaricating" ;

		deny_V3_Prevent_from_having = mkV3 (mkV "deny" "denies" "denied" "denied" "denying") ;

		avert_V2_Preventing = mkV2 (mkV "avert" "averts" "averted" "averted" "averting") ;
		prevent_V2_Preventing = mkV2 (mkV "prevent") ;
		stop_V2_Preventing = mkV2 (mkV "stop" "stops" "stopped" "stopped" "stopping") ;

		persist_V_Process_continue = mkV "persist" "persists" "persisted" "persisted" "persisting" ;

		conclude_V_Process_end = mkV "conclude" "concludes" "concluded" "concluded" "concluding" ;
		end_V_Process_end = mkV "end" "ends" "ended" "ended" "ending" ;

		begin_V_Process_start = irregV "begin" "began" "begun" ;
		commence_V_Process_start = mkV "commence" "commences" "commenced" "commenced" "commencing" ;

		cease_V_Process_stop = mkV "cease" "ceases" "ceased" "ceased" "ceasing" ;

		dye_V2_Processing_materials = mkV2 (mkV "dye" "dyes" "dyed" "dyed" "dying") ;
		stain_V2_Processing_materials = mkV2 (mkV "stain" "stains" "stained" "stained" "staining") ;

		dwindle_V_Proliferating_in_number = mkV "dwindle" "dwindles" "dwindled" "dwindled" "dwindling" ;
		multiply_V_Proliferating_in_number = mkV "multiply" "multiplies" "multiplied" "multiplied" "multiplying" ;
		proliferate_V_Proliferating_in_number = mkV "proliferate" "proliferates" "proliferated" "proliferated" "proliferating" ;
		multiply_V2_Proliferating_in_number = mkV2 (mkV "multiply" "multiplies" "multiplied" "multiplied" "multiplying") ;

		guard_V2_Protecting = mkV2 (mkV "guard" "guards" "guarded" "guarded" "guarding") ;
		protect_V2_Protecting = mkV2 (mkV "protect" "protects" "protected" "protected" "protecting") ;
		shield_V2_Protecting = mkV2 (mkV "shield" "shields" "shielded" "shielded" "shielding") ;

		argue_V_Quarreling = mkV "argue" "argues" "argued" "argued" "arguing" ;
		bicker_V_Quarreling = mkV "bicker" "bickers" "bickered" "bickered" "bickering" ;
		fight_V_Quarreling = irregV "fight" "fought" "fought" ;
		quarrel_V_Quarreling = mkV "quarrel" "quarrels" "quarrelled" "quarrelled" "quarrelling" ;
		quibble_V_Quarreling = mkV "quibble" "quibbles" "quibbled" "quibbled" "quibbling" ;
		row_V_Quarreling = mkV "row" "rows" "rowed" "rowed" "rowing" ;
		wrangle_V_Quarreling = mkV "wrangle" "wrangles" "wrangled" "wrangled" "wrangling" ;
		squabble_V_Quarreling = mkV "squabble" "squabbles" "squabbled" "squabbled" "squabbling" ;

		ask_V_Questioning = regV "ask" ;
		inquire_V_Questioning = mkV "inquire" "inquires" "inquired" "inquired" "inquiring" ;
		ask_V2_Questioning = mkV2 (regV "ask") ;
		grill_V2_Questioning = mkV2 (mkV "grill" "grills" "grilled" "grilled" "grilling") ;
		interrogate_V2_Questioning = mkV2 (mkV "interrogate" "interrogates" "interrogated" "interrogated" "interrogating") ;
		question_V2_Questioning = mkV2 (mkV "question" "questions" "questioned" "questioned" "questioning") ;
		quiz_V2_Questioning = mkV2 (mkV "quiz" "quizzes" "quizzed" "quizzed" "quizzing") ;
		ask_VQ_Questioning = mkVQ (regV "ask") ;
		inquire_VQ_Questioning = mkVQ (mkV "inquire" "inquires" "inquired" "inquired" "inquiring") ;

		quit_V_Quitting = irregDuplV "quit" "quit" "quit" ;
		resign_V_Quitting = mkV "resign" "resigns" "resigned" "resigned" "resigning" ;
		retire_V_Quitting = mkV "retire" "retires" "retired" "retired" "retiring" ;

		bolt_V_Quitting_a_place = mkV "bolt" "bolts" "bolted" "bolted" "bolting" ;
		defect_V_Quitting_a_place = mkV "defect" "defects" "defected" "defected" "defecting" ;
		desert_V_Quitting_a_place = mkV "desert" "deserts" "deserted" "deserted" "deserting" ;
		emigrate_V_Quitting_a_place = mkV "emigrate" "emigrates" "emigrated" "emigrated" "emigrating" ;
		quit_V_Quitting_a_place = irregDuplV "quit" "quit" "quit" ;
		retreat_V_Quitting_a_place = mkV "retreat" "retreats" "retreated" "retreated" "retreating" ;
		sally_V_Quitting_a_place = mkV "sally" "sallies" "sallied" "sallied" "sallying" ;
		skedaddle_V_Quitting_a_place = mkV "skedaddle" "skedaddles" "skedaddled" "skedaddled" "skedaddling" ;
		split_V_Quitting_a_place = irregDuplV "split" "split" "split" ;
		vacate_V_Quitting_a_place = mkV "vacate" "vacates" "vacated" "vacated" "vacating" ;
		vamoose_V_Quitting_a_place = mkV "vamoose" "vamooses" "vamoosed" "vamoosed" "vamoosing" ;
		desert_V2_Quitting_a_place = mkV2 (mkV "desert" "deserts" "deserted" "deserted" "deserting") ;
		quit_V2_Quitting_a_place = mkV2 (irregDuplV "quit" "quit" "quit") ;
		vacate_V2_Quitting_a_place = mkV2 (mkV "vacate" "vacates" "vacated" "vacated" "vacating") ;

		ratify_V2_Ratification = mkV2 (mkV "ratify" "ratifies" "ratified" "ratified" "ratifying") ;

		pore_V_Reading = mkV "pore" "pores" "pored" "pored" "poring" ;
		read_V_Reading = irregV "read" "read" "read" ;
		scan_V_Reading = mkV "scan" "scans" "scanned" "scanned" "scanning" ;
		skim_V_Reading = mkV "skim" "skims" "skimmed" "skimmed" "skimming" ;
		devour_V2_Reading = mkV2 (mkV "devour" "devours" "devoured" "devoured" "devouring") ;
		peruse_V2_Reading = mkV2 (mkV "peruse" "peruses" "perused" "perused" "perusing") ;
		pore_V2_Reading = mkV2 (mkV "pore" "pores" "pored" "pored" "poring") ;
		read_V2_Reading = mkV2 (irregV "read" "read" "read") ;
		scan_V2_Reading = mkV2 (mkV "scan" "scans" "scanned" "scanned" "scanning") ;
		skim_V2_Reading = mkV2 (mkV "skim" "skims" "skimmed" "skimmed" "skimming") ;

		read_V2_Reading_aloud = mkV2 (irregV "read" "read" "read") ;
		read_out_V2_Reading_aloud = mkV2 (partV (irregV "read" "read" "read") "out") ;

		argue_V_Reasoning = mkV "argue" "argues" "argued" "argued" "arguing" ;
		argue_VS_Reasoning = mkVS (mkV "argue" "argues" "argued" "argued" "arguing") ;
		demonstrate_VS_Reasoning = mkVS (mkV "demonstrate" "demonstrates" "demonstrated" "demonstrated" "demonstrating") ;
		disprove_VS_Reasoning = mkVS (mkV "disprove" "disproves" "disproved" "disproved" "disproving") ;
		prove_VS_Reasoning = mkVS (irregV "prove" "proved" (variants {"proved" ; "proven"})) ;
		reason_VS_Reasoning = mkVS (mkV "reason" "reasons" "reasoned" "reasoned" "reasoning") ;
		show_VS_Reasoning = mkVS (irregV "show" "showed" (variants {"showed" ; "shown"})) ;

		receive_V2_Receiving = mkV2 (mkV "receive" "receives" "received" "received" "receiving") ;

		document_V2_Recording = mkV2 (mkV "document" "documents" "documented" "documented" "documenting") ;
		record_V2_Recording = mkV2 (mkV "record" "records" "recorded" "recorded" "recording") ;
		register_V2_Recording = mkV2 (mkV "register" "registers" "registered" "registered" "registering") ;

		convalesce_V_Recovery = mkV "convalesce" "convalesces" "convalesced" "convalesced" "convalescing" ;
		heal_V_Recovery = mkV "heal" "heals" "healed" "healed" "healing" ;
		recover_V_Recovery = mkV "recover" "recovers" "recovered" "recovered" "recovering" ;
		recuperate_V_Recovery = mkV "recuperate" "recuperates" "recuperated" "recuperated" "recuperating" ;

		-- No target for Redirecting

		see_V2_Reference_text = mkV2 (irregV "see" "saw" "seen") ;

		overhaul_V2_Reforming_a_system = mkV2 (mkV "overhaul" "overhauls" "overhauled" "overhauled" "overhauling") ;
		restructure_V2_Reforming_a_system = mkV2 (mkV "restructure" "restructures" "restructured" "restructured" "restructuring") ;

		reinvigorate_V2_Rejuvenation = mkV2 (mkV "reinvigorate") ;
		rejuvenate_V2_Rejuvenation = mkV2 (mkV "rejuvenate" "rejuvenates" "rejuvenated" "rejuvenated" "rejuvenating") ;
		restore_V2_Rejuvenation = mkV2 (mkV "restore" "restores" "restored" "restored" "restoring") ;
		resuscitate_V2_Rejuvenation = mkV2 (mkV "resuscitate" "resuscitates" "resuscitated" "resuscitated" "resuscitating") ;
		revitalize_V2_Rejuvenation = mkV2 (mkV "revitalize" "revitalizes" "revitalized" "revitalized" "revitalizing") ;

		connect_V2_Relating_concepts = mkV2 (mkV "connect" "connects" "connected" "connected" "connecting") ;
		link_V2_Relating_concepts = mkV2 (mkV "link" "links" "linked" "linked" "linking") ;

		follow_V_Relative_time = mkV "follow" "follows" "followed" "followed" "following" ;

		believe_V_Religious_belief = mkV "believe" "believes" "believed" "believed" "believing" ;
		believe_VS_Religious_belief = mkVS (mkV "believe" "believes" "believed" "believed" "believing") ;

		remain_V_Remainder = mkV "remain" "remains" "remained" "remained" "remaining" ;
		remain_V2_Remainder = mkV2 (mkV "remain" "remains" "remained" "remained" "remaining") ;

		forget_VQ_Remembering_experience = mkVQ (irregDuplV "forget" "forgot" "forgotten") ;

		forget_VS_Remembering_information = mkVS (irregDuplV "forget" "forgot" "forgotten") ;

		forget_VV_Remembering_to_do = mkVV (irregDuplV "forget" "forgot" "forgotten") ;

		clear_V_Removing = mkV "clear" "clears" "cleared" "cleared" "clearing" ;
		eliminate_V_Removing = mkV "eliminate" "eliminates" "eliminated" "eliminated" "eliminating" ;
		evacuate_V_Removing = mkV "evacuate" "evacuates" "evacuated" "evacuated" "evacuating" ;
		pluck_V2_Removing = mkV2 (mkV "pluck" "plucks" "plucked" "plucked" "plucking") ;
		skim_V2_Removing = mkV2 (mkV "skim" "skims" "skimmed" "skimmed" "skimming") ;
		strip_V2_Removing = mkV2 (mkV "strip" "strips" "stripped" "stripped" "stripping") ;
		clear_V2_Removing = mkV2 (mkV "clear" "clears" "cleared" "cleared" "clearing") ;
		confiscate_V2_Removing = mkV2 (mkV "confiscate" "confiscates" "confiscated" "confiscated" "confiscating") ;
		cut_V2_Removing = mkV2 (irregDuplV "cut" "cut" "cut") ;
		discard_V2_Removing = mkV2 (mkV "discard" "discards" "discarded" "discarded" "discarding") ;
		dislodge_V2_Removing = mkV2 (mkV "dislodge" "dislodges" "dislodged" "dislodged" "dislodging") ;
		drain_V2_Removing = mkV2 (mkV "drain" "drains" "drained" "drained" "draining") ;
		dust_V2_Removing = mkV2 (mkV "dust" "dusts" "dusted" "dusted" "dusting") ;
		eject_V2_Removing = mkV2 (mkV "eject" "ejects" "ejected" "ejected" "ejecting") ;
		eliminate_V2_Removing = mkV2 (mkV "eliminate" "eliminates" "eliminated" "eliminated" "eliminating") ;
		empty_V2_Removing = mkV2 (mkV "empty" "empties" "emptied" "emptied" "emptying") ;
		evacuate_V2_Removing = mkV2 (mkV "evacuate" "evacuates" "evacuated" "evacuated" "evacuating") ;
		evict_V2_Removing = mkV2 (mkV "evict" "evicts" "evicted" "evicted" "evicting") ;
		excise_V2_Removing = mkV2 (mkV "excise" "excises" "excised" "excised" "excising") ;
		expel_V2_Removing = mkV2 (mkV "expel" "expels" "expelled" "expelled" "expelling") ;
		expunge_V2_Removing = mkV2 (mkV "expunge" "expunges" "expunged" "expunged" "expunging") ;
		extract_V2_Removing = mkV2 (mkV "extract" "extracts" "extracted" "extracted" "extracting") ;
		oust_V2_Removing = mkV2 (mkV "oust" "ousts" "ousted" "ousted" "ousting") ;
		prise_V2_Removing = mkV2 (mkV "prise" "prises" "prised" "prised" "prising") ;
		purge_V2_Removing = mkV2 (mkV "purge" "purges" "purged" "purged" "purging") ;
		remove_V2_Removing = mkV2 (mkV "remove" "removes" "removed" "removed" "removing") ;
		rinse_V2_Removing = mkV2 (mkV "rinse" "rinses" "rinsed" "rinsed" "rinsing") ;
		rip_V2_Removing = mkV2 (mkV "rip" "rips" "ripped" "ripped" "ripping") ;
		shave_V2_Removing = mkV2 (irregV "shave" "shaved" (variants {"shaved" ; "shaven"})) ;
		snatch_V2_Removing = mkV2 (mkV "snatch" "snatches" "snatched" "snatched" "snatching") ;
		swipe_V2_Removing = mkV2 (mkV "swipe" "swipes" "swiped" "swiped" "swiping") ;
		take_V2_Removing = mkV2 (irregV "take" "took" "taken") ;
		tear_V2_Removing = mkV2 (irregV "tear" "tore" "torn") ;
		unload_V2_Removing = mkV2 (mkV "unload" "unloads" "unloaded" "unloaded" "unloading") ;
		wash_V2_Removing = mkV2 (regV "wash") ;
		withdraw_V2_Removing = mkV2 (mkV "with" IrregEng.draw_V) ;
		take_V3_Removing = mkV3 (irregV "take" "took" "taken") ;

		disable_V2_Render_nonfunctional = mkV2 (mkV "disable" "disables" "disabled" "disabled" "disabling") ;
		incapacitate_V2_Render_nonfunctional = mkV2 (mkV "incapacitate" "incapacitates" "incapacitated" "incapacitated" "incapacitating") ;

		charter_V2_Renting = mkV2 (mkV "charter" "charters" "chartered" "chartered" "chartering") ;
		lease_V2_Renting = mkV2 (mkV "lease" "leases" "leased" "leased" "leasing") ;
		rent_V2_Renting = mkV2 (mkV "rent" "rents" "rented" "rented" "renting") ;

		lease_V2_Renting_out = mkV2 (mkV "lease" "leases" "leased" "leased" "leasing") ;
		rent_V2_Renting_out = mkV2 (mkV "rent" "rents" "rented" "rented" "renting") ;

		renounce_V2_Renunciation = mkV2 (mkV "renounce" "renounces" "renounced" "renounced" "renouncing") ;

		repel_V2_Repel = mkV2 (mkV "repel" "repels" "repelled" "repelled" "repelling") ;

		replace_V2_Replacing = mkV2 (mkV "replace" "replaces" "replaced" "replaced" "replacing") ;
		substitute_V2_Replacing = mkV2 (mkV "substitute" "substitutes" "substituted" "substituted" "substituting") ;

		rat_V_Reporting = mkV "rat" "rats" "ratted" "ratted" "ratting" ;
		snitch_V_Reporting = mkV "snitch" "snitches" "snitched" "snitched" "snitching" ;

		-- No target for Representing

		ask_V_Request = regV "ask" ;
		beg_V_Request = mkV "beg" "begs" "begged" "begged" "begging" ;
		demand_V_Request = mkV "demand" "demands" "demanded" "demanded" "demanding" ;
		implore_V_Request = mkV "implore" "implores" "implored" "implored" "imploring" ;
		order_V_Request = mkV "order" "orders" "ordered" "ordered" "ordering" ;
		plead_V_Request = irregV "plead" "pled" "pled" ;
		request_V_Request = mkV "request" "requests" "requested" "requested" "requesting" ;
		summon_V_Request = mkV "summon" "summons" "summoned" "summoned" "summoning" ;
		ask_V2_Request = mkV2 (regV "ask") ;
		beg_V2_Request = mkV2 (mkV "beg" "begs" "begged" "begged" "begging") ;
		beseech_V2_Request = mkV2 (mkV "beseech" "beseeches" "beseeched" "beseeched" "beseeching") ;
		command_V2_Request = mkV2 (mkV "command" "commands" "commanded" "commanded" "commanding") ;
		demand_V2_Request = mkV2 (mkV "demand" "demands" "demanded" "demanded" "demanding") ;
		implore_V2_Request = mkV2 (mkV "implore" "implores" "implored" "implored" "imploring") ;
		order_V2_Request = mkV2 (mkV "order" "orders" "ordered" "ordered" "ordering") ;
		plead_V2_Request = mkV2 (irregV "plead" "pled" "pled") ;
		request_V2_Request = mkV2 (mkV "request" "requests" "requested" "requested" "requesting") ;
		summon_V2_Request = mkV2 (mkV "summon" "summons" "summoned" "summoned" "summoning") ;
		urge_V2_Request = mkV2 (mkV "urge" "urges" "urged" "urged" "urging") ;
		ask_V2V_Request = mkV2V (regV "ask") noPrep to_Prep ;
		beg_V2V_Request = mkV2V (mkV "beg" "begs" "begged" "begged" "begging") noPrep to_Prep ;
		beseech_V2V_Request = mkV2V (mkV "beseech" "beseeches" "beseeched" "beseeched" "beseeching") noPrep to_Prep ;
		command_V2V_Request = mkV2V (mkV "command" "commands" "commanded" "commanded" "commanding") noPrep to_Prep ;
		entreat_V2V_Request = mkV2V (mkV "entreat" "entreats" "entreated" "entreated" "entreating") noPrep to_Prep ;
		implore_V2V_Request = mkV2V (mkV "implore" "implores" "implored" "implored" "imploring") noPrep to_Prep ;
		order_V2V_Request = mkV2V (mkV "order" "orders" "ordered" "ordered" "ordering") noPrep to_Prep ;
		request_V2V_Request = mkV2V (mkV "request" "requests" "requested" "requested" "requesting") noPrep to_Prep ;
		summon_V2V_Request = mkV2V (mkV "summon" "summons" "summoned" "summoned" "summoning") noPrep to_Prep ;
		tell_V2V_Request = mkV2V (irregV "tell" "told" "told") noPrep to_Prep ;
		urge_V2V_Request = mkV2V (mkV "urge" "urges" "urged" "urged" "urging") noPrep to_Prep ;
		entreat_V2_Request = mkV2 (mkV "entreat" "entreats" "entreated" "entreated" "entreating") ;

		research_V_Research = mkV "research" "researches" "researched" "researched" "researching" ;

		crumple_V2_Reshaping = mkV2 (mkV "crumple" "crumples" "crumpled" "crumpled" "crumpling") ;
		crush_V2_Reshaping = mkV2 (mkV "crush" "crushes" "crushed" "crushed" "crushing") ;
		deform_V2_Reshaping = mkV2 (mkV "deform" "deforms" "deformed" "deformed" "deforming") ;
		dent_V2_Reshaping = mkV2 (mkV "dent" "dents" "dented" "dented" "denting") ;
		flatten_V2_Reshaping = mkV2 (mkV "flatten" "flattens" "flattened" "flattened" "flattening") ;
		fold_V2_Reshaping = mkV2 (mkV "fold" "folds" "folded" "folded" "folding") ;
		mash_V2_Reshaping = mkV2 (mkV "mash" "mashes" "mashed" "mashed" "mashing") ;
		pulp_V2_Reshaping = mkV2 (mkV "pulp" "pulps" "pulped" "pulped" "pulping") ;
		scrunch_V2_Reshaping = mkV2 (mkV "scrunch" "scrunches" "scrunched" "scrunched" "scrunching") ;
		squash_V2_Reshaping = mkV2 (mkV "squash" "squashes" "squashed" "squashed" "squashing") ;
		warp_V2_Reshaping = mkV2 (mkV "warp" "warps" "warped" "warped" "warping") ;

		camp_V_Residence = mkV "camp" "camps" "camped" "camped" "camping" ;
		dwell_V_Residence = mkV "dwell" "dwells" "dwelt" "dwelt" "dwelling" ;
		live_V_Residence = regV "live" ;
		lodge_V_Residence = mkV "lodge" "lodges" "lodged" "lodged" "lodging" ;
		reside_V_Residence = mkV "reside" "resides" "resided" "resided" "residing" ;
		room_V_Residence = mkV "room" "rooms" "roomed" "roomed" "rooming" ;
		squat_V_Residence = mkV "squat" "squats" "squatted" "squatted" "squatting" ;
		stay_V_Residence = mkV "stay" "stays" "stayed" "stayed" "staying" ;

		deal_V_Resolve_problem = irregV "deal" "dealt" "dealt" ;
		work_through_V_Resolve_problem = partV (mkV "work" "works" "worked" "worked" "working") "through" ;
		clear_up_V2_Resolve_problem = mkV2 (partV (mkV "clear" "clears" "cleared" "cleared" "clearing") "up") ;
		deal_V2_Resolve_problem = mkV2 (irregV "deal" "dealt" "dealt") ;
		fix_V2_Resolve_problem = mkV2 (mkV "fix" "fixes" "fixed" "fixed" "fixing") ;
		resolve_V2_Resolve_problem = mkV2 (mkV "resolve" "resolves" "resolved" "resolved" "resolving") ;
		solve_V2_Resolve_problem = mkV2 (mkV "solve" "solves" "solved" "solved" "solving") ;
		work_through_V2_Resolve_problem = mkV2 (partV (mkV "work" "works" "worked" "worked" "working") "through") ;

		rebuff_V2_Respond_to_proposal = mkV2 (mkV "rebuff" "rebuffs" "rebuffed" "rebuffed" "rebuffing") ;
		reject_V2_Respond_to_proposal = mkV2 (mkV "reject" "rejects" "rejected" "rejected" "rejecting") ;

		respond_V_Response = mkV "respond" "responds" "responded" "responded" "responding" ;

		admit_V_Reveal_secret = mkV "admit" "admits" "admitted" "admitted" "admitting" ;
		confess_V_Reveal_secret = mkV "confess" "confesses" "confessed" "confessed" "confessing" ;
		confide_V_Reveal_secret = mkV "confide" "confides" "confided" "confided" "confiding" ;
		disclose_V_Reveal_secret = mkV "disclose" "discloses" "disclosed" "disclosed" "disclosing" ;
		divulge_V_Reveal_secret = mkV "divulge" "divulges" "divulged" "divulged" "divulging" ;
		reveal_V_Reveal_secret = mkV "reveal" "reveals" "revealed" "revealed" "revealing" ;
		confess_V2_Reveal_secret = mkV2 (mkV "confess" "confesses" "confessed" "confessed" "confessing") ;
		disclose_V2_Reveal_secret = mkV2 (mkV "disclose" "discloses" "disclosed" "disclosed" "disclosing") ;
		divulge_V2_Reveal_secret = mkV2 (mkV "divulge" "divulges" "divulged" "divulged" "divulging") ;
		confess_VQ_Reveal_secret = mkVQ (mkV "confess" "confesses" "confessed" "confessed" "confessing") ;
		disclose_VQ_Reveal_secret = mkVQ (mkV "disclose" "discloses" "disclosed" "disclosed" "disclosing") ;
		divulge_VQ_Reveal_secret = mkVQ (mkV "divulge" "divulges" "divulged" "divulged" "divulging") ;
		reveal_VQ_Reveal_secret = mkVQ (mkV "reveal" "reveals" "revealed" "revealed" "revealing") ;
		confess_VS_Reveal_secret = mkVS (mkV "confess" "confesses" "confessed" "confessed" "confessing") ;
		reveal_VS_Reveal_secret = mkVS (mkV "reveal" "reveals" "revealed" "revealed" "revealing") ;

		get_back_V_Revenge = partV (irregDuplV "get" "got" "gotten") "back" ;
		retaliate_V_Revenge = mkV "retaliate" "retaliates" "retaliated" "retaliated" "retaliating" ;
		retaliate_V2_Revenge = mkV2 (mkV "retaliate" "retaliates" "retaliated" "retaliated" "retaliating") ;

		discipline_V2_Rewards_and_punishments = mkV2 (mkV "discipline" "disciplines" "disciplined" "disciplined" "disciplining") ;
		punish_V2_Rewards_and_punishments = mkV2 (mkV "punish" "punishes" "punished" "punished" "punishing") ;
		reward_V2_Rewards_and_punishments = mkV2 (mkV "reward" "rewards" "rewarded" "rewarded" "rewarding") ;

		fly_V2_Ride_vehicle = mkV2 (irregV "fly" "flew" "flown") ;
		take_V2_Ride_vehicle = mkV2 (irregV "take" "took" "taken") ;

		rise_V_Rising_to_a_challenge = irregV "rise" "rose" "risen" ;

		bless_V2_Rite = mkV2 (mkV "bless" "blesses" "blessed" "blessed" "blessing") ;
		anoint_V2_Rite = mkV2 (mkV "anoint" "anoints" "anointed" "anointed" "anointing") ;
		baptize_V2_Rite = mkV2 (mkV "baptize" "baptizes" "baptized" "baptized" "baptizing") ;
		christen_V2_Rite = mkV2 (mkV "christen" "christens" "christened" "christened" "christening") ;
		circumcise_V2_Rite = mkV2 (mkV "circumcise" "circumcises" "circumcised" "circumcised" "circumcising") ;
		confirm_V2_Rite = mkV2 (mkV "confirm" "confirms" "confirmed" "confirmed" "confirming") ;
		consecrate_V2_Rite = mkV2 (mkV "consecrate" "consecrates" "consecrated" "consecrated" "consecrating") ;
		ordain_V2_Rite = mkV2 (mkV "ordain" "ordains" "ordained" "ordained" "ordaining") ;

		mug_V2_Robbery = mkV2 (mkV "mug" "mugs" "mugged" "mugged" "mugging") ;
		rob_V2_Robbery = mkV2 (mkV "rob" "robs" "robbed" "robbed" "robbing") ;

		decay_V_Rotting = mkV "decay" "decays" "decayed" "decayed" "decaying" ;
		decompose_V_Rotting = mkV "decompose" "decomposes" "decomposed" "decomposed" "decomposing" ;
		fester_V_Rotting = mkV "fester" "festers" "festered" "festered" "festering" ;
		perish_V_Rotting = mkV "perish" "perishes" "perished" "perished" "perishing" ;
		putrefy_V_Rotting = mkV "putrefy" "putrefies" "putrefied" "putrefied" "putrefying" ;
		rot_V_Rotting = mkV "rot" "rots" "rotted" "rotted" "rotting" ;
		spoil_V_Rotting = mkV "spoil" "spoils" "spoiled" "spoiled" "spoiling" ;

		rule_VS_Ruling_legally = mkVS (mkV "rule" "rules" "ruled" "ruled" "ruling") ;

		risk_V2_Run_risk = mkV2 (mkV "risk" "risks" "risked" "risked" "risking") ;
		risk_VV_Run_risk = mkVV (mkV "risk" "risks" "risked" "risked" "risking") ;

		comb_V2_Scouring = mkV2 (mkV "comb" "combs" "combed" "combed" "combing") ;
		ransack_V2_Scouring = mkV2 (mkV "ransack" "ransacks" "ransacked" "ransacked" "ransacking") ;
		scour_V2_Scouring = mkV2 (mkV "scour" "scours" "scoured" "scoured" "scouring") ;
		sift_V2_Scouring = mkV2 (mkV "sift" "sifts" "sifted" "sifted" "sifting") ;

		feel_V_Seeking = irregV "feel" "felt" "felt" ;
		forage_V_Seeking = mkV "forage" "forages" "foraged" "foraged" "foraging" ;
		fumble_V_Seeking = mkV "fumble" "fumbles" "fumbled" "fumbled" "fumbling" ;
		grope_V_Seeking = mkV "grope" "gropes" "groped" "groped" "groping" ;
		hunt_V_Seeking = regV "hunt" ;
		listen_V_Seeking = mkV "listen" "listened" ;
		pan_V_Seeking = mkV "pan" "pans" "panned" "panned" "panning" ;
		seek_V_Seeking = irregV "seek" "sought" "sought" ;

		seek_V2_Seeking_to_achieve = mkV2 (irregV "seek" "sought" "sought") ;

		amble_V_Self_motion = mkV "amble" "ambles" "ambled" "ambled" "ambling" ;
		back_V_Self_motion = mkV "back" "backs" "backed" "backed" "backing" ;
		barge_V_Self_motion = mkV "barge" "barges" "barged" "barged" "barging" ;
		bound_V_Self_motion = mkV "bound" "bounds" "bounded" "bounded" "bounding" ;
		burrow_V_Self_motion = mkV "burrow" "burrows" "burrowed" "burrowed" "burrowing" ;
		bustle_V_Self_motion = mkV "bustle" "bustles" "bustled" "bustled" "bustling" ;
		canter_V_Self_motion = mkV "canter" "canters" "cantered" "cantered" "cantering" ;
		caper_V_Self_motion = mkV "caper" "capers" "capered" "capered" "capering" ;
		clamber_V_Self_motion = mkV "clamber" "clambers" "clambered" "clambered" "clambering" ;
		climb_V_Self_motion = mkV "climb" "climbs" "climbed" "climbed" "climbing" ;
		crawl_V_Self_motion = mkV "crawl" "crawls" "crawled" "crawled" "crawling" ;
		creep_V_Self_motion = irregV "creep" "crept" "crept" ;
		dance_V_Self_motion = mkV "dance" "dances" "danced" "danced" "dancing" ;
		dart_V_Self_motion = mkV "dart" "darts" "darted" "darted" "darting" ;
		dash_V_Self_motion = mkV "dash" "dashes" "dashed" "dashed" "dashing" ;
		drive_V_Self_motion = irregV "drive" "drove" "driven" ;
		flit_V_Self_motion = mkV "flit" "flits" "flitted" "flitted" "flitting" ;
		flounce_V_Self_motion = mkV "flounce" "flounces" "flounced" "flounced" "flouncing" ;
		fly_V_Self_motion = irregV "fly" "flew" "flown" ;
		frolic_V_Self_motion = mkV "frolic" "frolics" "frolicked" "frolicked" "frolicking" ;
		gallivant_V_Self_motion = mkV "gallivant" "gallivants" "gallivanted" "gallivanted" "gallivanting" ;
		gambol_V_Self_motion = mkV "gambol" "gambols" "gambolled" "gambolled" "gambolling" ;
		hasten_V_Self_motion = mkV "hasten" "hastens" "hastened" "hastened" "hastening" ;
		hike_V_Self_motion = mkV "hike" "hikes" "hiked" "hiked" "hiking" ;
		hobble_V_Self_motion = mkV "hobble" "hobbles" "hobbled" "hobbled" "hobbling" ;
		hop_V_Self_motion = mkV "hop" "hops" "hopped" "hopped" "hopping" ;
		hurry_V_Self_motion = mkV "hurry" "hurries" "hurried" "hurried" "hurrying" ;
		jog_V_Self_motion = mkV "jog" "jogs" "jogged" "jogged" "jogging" ;
		jump_V_Self_motion = regV "jump" ;
		leap_V_Self_motion = irregV "leap" (variants {"leaped" ; "lept"}) (variants {"leaped" ; "lept"}) ;
		limp_V_Self_motion = mkV "limp" "limps" "limped" "limped" "limping" ;
		lope_V_Self_motion = mkV "lope" "lopes" "loped" "loped" "loping" ;
		lumber_V_Self_motion = mkV "lumber" "lumbers" "lumbered" "lumbered" "lumbering" ;
		lunge_V_Self_motion = mkV "lunge" "lunges" "lunged" "lunged" "lunging" ;
		lurch_V_Self_motion = mkV "lurch" "lurches" "lurched" "lurched" "lurching" ;
		march_V_Self_motion = mkV "march" "marches" "marched" "marched" "marching" ;
		mince_V_Self_motion = mkV "mince" "minces" "minced" "minced" "mincing" ;
		mosey_V_Self_motion = mkV "mosey" "moseys" "moseyed" "moseyed" "moseying" ;
		pace_V_Self_motion = mkV "pace" "paces" "paced" "paced" "pacing" ;
		pad_V_Self_motion = mkV "pad" "pads" "padded" "padded" "padding" ;
		parade_V_Self_motion = mkV "parade" "parades" "paraded" "paraded" "parading" ;
		plod_V_Self_motion = mkV "plod" "plods" "plodded" "plodded" "plodding" ;
		pounce_V_Self_motion = mkV "pounce" "pounces" "pounced" "pounced" "pouncing" ;
		prance_V_Self_motion = mkV "prance" "prances" "pranced" "pranced" "prancing" ;
		proceed_V_Self_motion = mkV "proceed" "proceeds" "proceeded" "proceeded" "proceeding" ;
		promenade_V_Self_motion = mkV "promenade" "promenades" "promenaded" "promenaded" "promenading" ;
		prowl_V_Self_motion = mkV "prowl" "prowls" "prowled" "prowled" "prowling" ;
		roam_V_Self_motion = mkV "roam" "roams" "roamed" "roamed" "roaming" ;
		romp_V_Self_motion = mkV "romp" "romps" "romped" "romped" "romping" ;
		rush_V_Self_motion = mkV "rush" "rushes" "rushed" "rushed" "rushing" ;
		sail_V_Self_motion = mkV "sail" "sails" "sailed" "sailed" "sailing" ;
		saunter_V_Self_motion = mkV "saunter" "saunters" "sauntered" "sauntered" "sauntering" ;
		scamper_V_Self_motion = mkV "scamper" "scampers" "scampered" "scampered" "scampering" ;
		scoot_V_Self_motion = mkV "scoot" "scoots" "scooted" "scooted" "scooting" ;
		scramble_V_Self_motion = mkV "scramble" "scrambles" "scrambled" "scrambled" "scrambling" ;
		scurry_V_Self_motion = mkV "scurry" "scurries" "scurried" "scurried" "scurrying" ;
		scuttle_V_Self_motion = mkV "scuttle" "scuttles" "scuttled" "scuttled" "scuttling" ;
		shuffle_V_Self_motion = mkV "shuffle" "shuffles" "shuffled" "shuffled" "shuffling" ;
		skip_V_Self_motion = mkV "skip" "skips" "skipped" "skipped" "skipping" ;
		skulk_V_Self_motion = mkV "skulk" "skulks" "skulked" "skulked" "skulking" ;
		slink_V_Self_motion = mkV "slink" "IRREG" "IRREG" "IRREG" "IRREG" ;
		slither_V_Self_motion = mkV "slither" "slithers" "slithered" "slithered" "slithering" ;
		slog_V_Self_motion = mkV "slog" "slogs" "slogged" "slogged" "slogging" ;
		slop_V_Self_motion = mkV "slop" "slops" "slopped" "slopped" "slopping" ;
		slosh_V_Self_motion = mkV "slosh" "sloshes" "sloshed" "sloshed" "sloshing" ;
		sneak_V_Self_motion = mkV "sneak" "sneaks" "sneaked" "sneaked" "sneaking" ;
		spring_V_Self_motion = irregV "spring" (variants {"sprang" ; "sprung"}) "sprung" ;
		sprint_V_Self_motion = mkV "sprint" "sprints" "sprinted" "sprinted" "sprinting" ;
		stagger_V_Self_motion = mkV "stagger" "staggers" "staggered" "staggered" "staggering" ;
		stalk_V_Self_motion = mkV "stalk" "stalks" "stalked" "stalked" "stalking" ;
		steal_V_Self_motion = irregV "steal" "stole" "stolen" ;
		step_V_Self_motion = mkV "step" "steps" "stepped" "stepped" "stepping" ;
		stomp_V_Self_motion = mkV "stomp" "stomps" "stomped" "stomped" "stomping" ;
		straggle_V_Self_motion = mkV "straggle" "straggles" "straggled" "straggled" "straggling" ;
		stride_V_Self_motion = irregV "stride" "strod" "stridden" ;
		stroll_V_Self_motion = mkV "stroll" "strolls" "strolled" "strolled" "strolling" ;
		strut_V_Self_motion = mkV "strut" "struts" "strutted" "strutted" "strutting" ;
		stumble_V_Self_motion = mkV "stumble" "stumbles" "stumbled" "stumbled" "stumbling" ;
		swagger_V_Self_motion = mkV "swagger" "swaggers" "swaggered" "swaggered" "swaggering" ;
		swim_V_Self_motion = irregDuplV "swim" "swam" "swum" ;
		swing_V_Self_motion = irregV "swing" "swung" "swung" ;
		taxi_V_Self_motion = mkV "taxi" "taxis" "taxied" "taxied" "taxiing" ;
		tiptoe_V_Self_motion = mkV "tiptoe" "IRREG" "IRREG" "IRREG" "IRREG" ;
		toddle_V_Self_motion = mkV "toddle" "toddles" "toddled" "toddled" "toddling" ;
		totter_V_Self_motion = mkV "totter" "totters" "tottered" "tottered" "tottering" ;
		traipse_V_Self_motion = mkV "traipse" "traipses" "traipsed" "traipsed" "traipsing" ;
		tramp_V_Self_motion = mkV "tramp" "tramps" "tramped" "tramped" "tramping" ;
		tread_V_Self_motion = irregV "tread" "trod" "trodden" ;
		trek_V_Self_motion = mkV "trek" "treks" "trekked" "trekked" "trekking" ;
		trip_V_Self_motion = mkV "trip" "trips" "tripped" "tripped" "tripping" ;
		troop_V_Self_motion = mkV "troop" "troops" "trooped" "trooped" "trooping" ;
		trot_V_Self_motion = mkV "trot" "trots" "trotted" "trotted" "trotting" ;
		trudge_V_Self_motion = mkV "trudge" "trudges" "trudged" "trudged" "trudging" ;
		trundle_V_Self_motion = mkV "trundle" "trundles" "trundled" "trundled" "trundling" ;
		venture_V_Self_motion = mkV "venture" "ventures" "ventured" "ventured" "venturing" ;
		waddle_V_Self_motion = mkV "waddle" "waddles" "waddled" "waddled" "waddling" ;
		wade_V_Self_motion = mkV "wade" "wades" "waded" "waded" "wading" ;
		walk_V_Self_motion = regV "walk" ;
		waltz_V_Self_motion = mkV "waltz" "waltzes" "waltzed" "waltzed" "waltzing" ;
		wander_V_Self_motion = mkV "wander" "wanders" "wandered" "wandered" "wandering" ;
		wriggle_V_Self_motion = mkV "wriggle" "wriggles" "wriggled" "wriggled" "wriggling" ;
		edge_V_Self_motion = mkV "edge" "edges" "edged" "edged" "edging" ;
		file_V_Self_motion = mkV "file" "files" "filed" "filed" "filing" ;
		rip_V_Self_motion = mkV "rip" "rips" "ripped" "ripped" "ripping" ;
		head_V_Self_motion = mkV "head" "heads" "headed" "headed" "heading" ;
		meander_V_Self_motion = mkV "meander" "meanders" "meandered" "meandered" "meandering" ;
		repair_V_Self_motion = mkV "repair" "repairs" "repaired" "repaired" "repairing" ;
		sidle_V_Self_motion = mkV "sidle" "sidles" "sidled" "sidled" "sidling" ;
		storm_V_Self_motion = mkV "storm" "storms" "stormed" "stormed" "storming" ;
		vault_V_Self_motion = mkV "vault" "vaults" "vaulted" "vaulted" "vaulting" ;
		make_V_Self_motion = irregV "make" "made" "made" ;
		skim_V_Self_motion = mkV "skim" "skims" "skimmed" "skimmed" "skimming" ;

		dispatch_V2_Sending = mkV2 (mkV "dispatch" "dispatches" "dispatched" "dispatched" "dispatching") ;
		export_V2_Sending = mkV2 (mkV "export" "exports" "exported" "exported" "exporting") ;
		forward_V2_Sending = mkV2 (mkV "forward" "forwards" "forwarded" "forwarded" "forwarding") ;
		mail_V2_Sending = mkV2 (mkV "mail" "mails" "mailed" "mailed" "mailing") ;
		post_V2_Sending = mkV2 (mkV "post" "posts" "posted" "posted" "posting") ;
		route_V2_Sending = mkV2 (mkV "route" "routes" "routed" "routed" "routing") ;
		send_V2_Sending = mkV2 (irregV "send" "sent" "sent") ;
		ship_V2_Sending = mkV2 (mkV "ship" "ships" "shipped" "shipped" "shipping") ;

		sentence_V2_Sentencing = mkV2 (mkV "sentence" "sentences" "sentenced" "sentenced" "sentencing") ;

		divide_V2_Separating = mkV2 (mkV "divide" "divides" "divided" "divided" "dividing") ;
		part_V2_Separating = mkV2 (mkV "part" "parts" "parted" "parted" "parting") ;
		partition_V2_Separating = mkV2 (mkV "partition" "partitions" "partitioned" "partitioned" "partitioning") ;
		segregate_V2_Separating = mkV2 (mkV "segregate" "segregates" "segregated" "segregated" "segregating") ;
		separate_V2_Separating = mkV2 (mkV "separate" "separates" "separated" "separated" "separating") ;
		split_V2_Separating = mkV2 (irregDuplV "split" "split" "split") ;
		segment_V2_Separating = mkV2 (mkV "segment" "segments" "segmented" "segmented" "segmenting") ;

		ignite_V2_Setting_fire = mkV2 (mkV "ignite" "ignites" "ignited" "ignited" "igniting") ;
		kindle_V2_Setting_fire = mkV2 (mkV "kindle" "kindles" "kindled" "kindled" "kindling") ;
		light_V2_Setting_fire = mkV2 (irregV "light" (variants {"lighted" ; "lit"}) "lighted") ;
		spark_V2_Setting_fire = mkV2 (mkV "spark" "sparks" "sparked" "sparked" "sparking") ;
		torch_V2_Setting_fire = mkV2 (mkV "torch") ;

		set_off_V_Setting_out = partV (irregDuplV "set" "set" "set") "off" ;

		fire_V2_Shoot_projectiles = mkV2 (mkV "fire" "fires" "fired" "fired" "firing") ;
		fire_off_V2_Shoot_projectiles = mkV2 (partV (mkV "fire" "fires" "fired" "fired" "firing") "off") ;
		launch_V2_Shoot_projectiles = mkV2 (mkV "launch" "launches" "launched" "launched" "launching") ;
		shoot_V2_Shoot_projectiles = mkV2 (irregV "shoot" "shot" "shot") ;

		rise_V_Sidereal_appearance = irregV "rise" "rose" "risen" ;

		sign_V2_Sign_agreement = mkV2 (mkV "sign" "signs" "signed" "signed" "signing") ;

		hush_V2_Silencing = mkV2 (mkV "hush" "hushes" "hushed" "hushed" "hushing") ;
		hush_up_V2_Silencing = mkV2 (partV (mkV "hush" "hushes" "hushed" "hushed" "hushing") "up") ;
		quiet_V2_Silencing = mkV2 (mkV "quiet" "quiets" "quieted" "quieted" "quieting") ;
		quiet_down_V2_Silencing = mkV2 (partV (mkV "quiet" "quiets" "quieted" "quieted" "quieting") "down") ;
		shush_V2_Silencing = mkV2 (mkV "shush" "shushes" "shushed" "shushed" "shushing") ;
		shut_up_V2_Silencing = mkV2 (partV (irregDuplV "shut" "shut" "shut") "up") ;
		silence_V2_Silencing = mkV2 (mkV "silence" "silences" "silenced" "silenced" "silencing") ;

		differ_V_Similarity = mkV "differ" "differs" "differed" "differed" "differing" ;

		-- No target for Simultaneity

		doze_V_Sleep = mkV "doze" "dozes" "dozed" "dozed" "dozing" ;
		drowse_V_Sleep = mkV "drowse" "drowses" "drowsed" "drowsed" "drowsing" ;
		hibernate_V_Sleep = mkV "hibernate" "hibernates" "hibernated" "hibernated" "hibernating" ;
		kip_V_Sleep = mkV "kip" "kips" "kipped" "kipped" "kipping" ;
		nap_V_Sleep = mkV "nap" "naps" "napped" "napped" "napping" ;
		sleep_V_Sleep = irregV "sleep" "slept" "slept" ;
		slumber_V_Sleep = mkV "slumber" "slumbers" "slumbered" "slumbered" "slumbering" ;
		snooze_V_Sleep = mkV "snooze" "snoozes" "snoozed" "snoozed" "snoozing" ;

		smuggle_V2_Smuggling = mkV2 (mkV "smuggle" "smuggles" "smuggled" "smuggled" "smuggling") ;

		marinate_V2_Soaking = mkV2 (mkV "marinate" "marinates" "marinated" "marinated" "marinating") ;
		soak_V2_Soaking = mkV2 (mkV "soak" "soaks" "soaked" "soaked" "soaking") ;

		absorb_V2_Soaking_up = mkV2 (mkV "absorb" "absorbs" "absorbed" "absorbed" "absorbing") ;

		echo_V_Sound_movement = mkV "echo" "echos" "echoed" "echoed" "echoing" ;
		reverberate_V_Sound_movement = mkV "reverberate" "reverberates" "reverberated" "reverberated" "reverberating" ;

		lecture_V_Speak_on_topic = mkV "lecture" "lectures" "lectured" "lectured" "lecturing" ;
		pontificate_V_Speak_on_topic = mkV "pontificate" "pontificates" "pontificated" "pontificated" "pontificating" ;
		tell_V_Speak_on_topic = irregV "tell" "told" "told" ;

		pronounce_V2_Spelling_and_pronouncing = mkV2 (mkV "pronounce" "pronounces" "pronounced" "pronounced" "pronouncing") ;
		spell_V2_Spelling_and_pronouncing = mkV2 (mkV "spell" "spells" "spelled" "spelled" "spelling") ;

		remain_V_State_continue = mkV "remain" "remains" "remained" "remained" "remaining" ;

		add_V_Statement = regV "add" ;
		address_V_Statement = mkV "address" "addresses" "addressed" "addressed" "addressing" ;
		affirm_V_Statement = mkV "affirm" "affirms" "affirmed" "affirmed" "affirming" ;
		attest_V_Statement = mkV "attest" "attests" "attested" "attested" "attesting" ;
		aver_V_Statement = mkV "aver" "avers" "averred" "averred" "averring" ;
		caution_V_Statement = mkV "caution" "cautions" "cautioned" "cautioned" "cautioning" ;
		comment_V_Statement = mkV "comment" "comments" "commented" "commented" "commenting" ;
		confirm_V_Statement = mkV "confirm" "confirms" "confirmed" "confirmed" "confirming" ;
		contend_V_Statement = mkV "contend" "contends" "contended" "contended" "contending" ;
		declare_V_Statement = mkV "declare" "declares" "declared" "declared" "declaring" ;
		gloat_V_Statement = mkV "gloat" "gloats" "gloated" "gloated" "gloating" ;
		insist_V_Statement = mkV "insist" "insists" "insisted" "insisted" "insisting" ;
		mention_V_Statement = mkV "mention" "mentions" "mentioned" "mentioned" "mentioning" ;
		preach_V_Statement = mkV "preach" "preaches" "preached" "preached" "preaching" ;
		proclaim_V_Statement = mkV "proclaim" "proclaims" "proclaimed" "proclaimed" "proclaiming" ;
		profess_V_Statement = mkV "profess" "professes" "professed" "professed" "professing" ;
		relate_V_Statement = mkV "relate" "relates" "related" "related" "relating" ;
		remark_V_Statement = mkV "remark" "remarks" "remarked" "remarked" "remarking" ;
		report_V_Statement = mkV "report" "reports" "reported" "reported" "reporting" ;
		say_V_Statement = irregV "say" "said" "said" ;
		speak_V_Statement = irregV "speak" "spoke" "spoken" ;
		suggest_V_Statement = mkV "suggest" "suggests" "suggested" "suggested" "suggesting" ;
		explain_V_Statement = mkV "explain" "explains" "explained" "explained" "explaining" ;
		talk_V_Statement = regV "talk" ;
		write_V_Statement = irregV "write" "wrote" "written" ;
		affirm_V2_Statement = mkV2 (mkV "affirm" "affirms" "affirmed" "affirmed" "affirming") ;
		allege_V2_Statement = mkV2 (mkV "allege" "alleges" "alleged" "alleged" "alleging") ;
		announce_V2_Statement = mkV2 (mkV "announce" "announces" "announced" "announced" "announcing") ;
		declare_V2_Statement = mkV2 (mkV "declare" "declares" "declared" "declared" "declaring") ;
		note_V2_Statement = mkV2 (mkV "note" "notes" "noted" "noted" "noting") ;
		proclaim_V2_Statement = mkV2 (mkV "proclaim" "proclaims" "proclaimed" "proclaimed" "proclaiming") ;
		propose_V2_Statement = mkV2 (mkV "propose" "proposes" "proposed" "proposed" "proposing") ;
		reaffirm_V2_Statement = mkV2 (mkV "reaffirm" "reaffirms" "reaffirmed" "reaffirmed" "reaffirming") ;
		recount_V2_Statement = mkV2 (mkV "recount" "recounts" "recounted" "recounted" "recounting") ;
		relate_V2_Statement = mkV2 (mkV "relate" "relates" "related" "related" "relating") ;
		report_V2_Statement = mkV2 (mkV "report" "reports" "reported" "reported" "reporting") ;
		say_V2_Statement = mkV2 (irregV "say" "said" "said") ;
		speak_V2_Statement = mkV2 (irregV "speak" "spoke" "spoken") ;
		tell_V2_Statement = mkV2 (irregV "tell" "told" "told") ;
		acknowledge_VS_Statement = mkVS (mkV "acknowledge" "acknowledges" "acknowledged" "acknowledged" "acknowledging") ;
		affirm_VS_Statement = mkVS (mkV "affirm" "affirms" "affirmed" "affirmed" "affirming") ;
		allege_VS_Statement = mkVS (mkV "allege" "alleges" "alleged" "alleged" "alleging") ;
		announce_VS_Statement = mkVS (mkV "announce" "announces" "announced" "announced" "announcing") ;
		assert_VS_Statement = mkVS (mkV "assert" "asserts" "asserted" "asserted" "asserting") ;
		aver_VS_Statement = mkVS (mkV "aver" "avers" "averred" "averred" "averring") ;
		comment_VS_Statement = mkVS (mkV "comment" "comments" "commented" "commented" "commenting") ;
		confirm_VS_Statement = mkVS (mkV "confirm" "confirms" "confirmed" "confirmed" "confirming") ;
		conjecture_VS_Statement = mkVS (mkV "conjecture" "conjectures" "conjectured" "conjectured" "conjecturing") ;
		contend_VS_Statement = mkVS (mkV "contend" "contends" "contended" "contended" "contending") ;
		note_VS_Statement = mkVS (mkV "note" "notes" "noted" "noted" "noting") ;
		proclaim_VS_Statement = mkVS (mkV "proclaim" "proclaims" "proclaimed" "proclaimed" "proclaiming") ;
		propose_VS_Statement = mkVS (mkV "propose" "proposes" "proposed" "proposed" "proposing") ;
		report_VS_Statement = mkVS (mkV "report" "reports" "reported" "reported" "reporting") ;
		say_VS_Statement = mkVS (irregV "say" "said" "said") ;
		state_VS_Statement = mkVS (mkV "state" "states" "stated" "stated" "stating") ;
		suggest_VS_Statement = mkVS (mkV "suggest" "suggests" "suggested" "suggested" "suggesting") ;
		add_VS_Statement = mkVS (regV "add") ;
		attest_VS_Statement = mkVS (mkV "attest" "attests" "attested" "attested" "attesting") ;
		avow_VS_Statement = mkVS (mkV "avow" "avows" "avowed" "avowed" "avowing") ;
		caution_VS_Statement = mkVS (mkV "caution" "cautions" "cautioned" "cautioned" "cautioning") ;
		declare_VS_Statement = mkVS (mkV "declare" "declares" "declared" "declared" "declaring") ;
		exclaim_VS_Statement = mkVS (mkV "exclaim" "exclaims" "exclaimed" "exclaimed" "exclaiming") ;
		explain_VS_Statement = mkVS (mkV "explain" "explains" "explained" "explained" "explaining") ;
		insist_VS_Statement = mkVS (mkV "insist" "insists" "insisted" "insisted" "insisting") ;
		mention_VS_Statement = mkVS (mkV "mention" "mentions" "mentioned" "mentioned" "mentioning") ;
		preach_VS_Statement = mkVS (mkV "preach" "preaches" "preached" "preached" "preaching") ;
		profess_VS_Statement = mkVS (mkV "profess" "professes" "professed" "professed" "professing") ;
		reaffirm_VS_Statement = mkVS (mkV "reaffirm" "reaffirms" "reaffirmed" "reaffirmed" "reaffirming") ;
		reiterate_VS_Statement = mkVS (mkV "reiterate" "reiterates" "reiterated" "reiterated" "reiterating") ;
		relate_VS_Statement = mkVS (mkV "relate" "relates" "related" "related" "relating") ;
		remark_VS_Statement = mkVS (mkV "remark" "remarks" "remarked" "remarked" "remarking") ;
		venture_VS_Statement = mkVS (mkV "venture" "ventures" "ventured" "ventured" "venturing") ;
		write_VS_Statement = mkVS (irregV "write" "wrote" "written") ;
		acknowledge_VV_Statement = mkVV (mkV "acknowledge" "acknowledges" "acknowledged" "acknowledged" "acknowledging") ;
		caution_VV_Statement = mkVV (mkV "caution" "cautions" "cautioned" "cautioned" "cautioning") ;
		profess_VV_Statement = mkVV (mkV "profess" "professes" "professed" "professed" "professing") ;
		propose_VV_Statement = mkVV (mkV "propose" "proposes" "proposed" "proposed" "proposing") ;
		report_VV_Statement = mkVV (mkV "report" "reports" "reported" "reported" "reporting") ;
		suggest_VV_Statement = mkVV (mkV "suggest" "suggests" "suggested" "suggested" "suggesting") ;
		attest_V2_Statement = mkV2 (mkV "attest" "attests" "attested" "attested" "attesting") ;
		avow_V2_Statement = mkV2 (mkV "avow" "avows" "avowed" "avowed" "avowing") ;
		caution_V2_Statement = mkV2 (mkV "caution" "cautions" "cautioned" "cautioned" "cautioning") ;
		preach_V2_Statement = mkV2 (mkV "preach" "preaches" "preached" "preached" "preaching") ;
		profess_V2_Statement = mkV2 (mkV "profess" "professes" "professed" "professed" "professing") ;
		reiterate_V2_Statement = mkV2 (mkV "reiterate" "reiterates" "reiterated" "reiterated" "reiterating") ;
		suggest_V2_Statement = mkV2 (mkV "suggest" "suggests" "suggested" "suggested" "suggesting") ;
		talk_V2_Statement = mkV2 (regV "talk") ;

		keep_V2_Storing = mkV2 (irregV "keep" "kept" "kept") ;
		store_V2_Storing = mkV2 (mkV "store" "stores" "stored" "stored" "storing") ;

		study_V_Studying = mkV "study" "studies" "studied" "studied" "studying" ;
		study_V2_Studying = mkV2 (mkV "study" "studies" "studied" "studied" "studying") ;

		convince_V2V_Suasion = mkV2V (mkV "convince" "convinces" "convinced" "convinced" "convincing") noPrep to_Prep ;
		persuade_V2V_Suasion = mkV2V (mkV "persuade" "persuades" "persuaded" "persuaded" "persuading") noPrep to_Prep ;
		convince_V2_Suasion = mkV2 (mkV "convince" "convinces" "convinced" "convinced" "convincing") ;
		dissuade_V2_Suasion = mkV2 (mkV "dissuade" "dissuades" "dissuaded" "dissuaded" "dissuading") ;

		file_V2_Submitting_documents = mkV2 (mkV "file" "files" "filed" "filed" "filing") ;
		submit_V2_Submitting_documents = mkV2 (mkV "submit" "submits" "submitted" "submitted" "submitting") ;

		fail_V_Success_or_failure = mkV "fail" ;
		succeed_V_Success_or_failure = mkV "succeed" "succeeds" "succeeded" "succeeded" "succeeding" ;
		fail_VV_Success_or_failure = mkVV (mkV "fail") ;
		fail_V2_Success_or_failure = mkV2 (mkV "fail") ;
		succeed_V2_Success_or_failure = mkV2 (mkV "succeed" "succeeds" "succeeded" "succeeded" "succeeding") ;

		succeed_V_Successful_action = mkV "succeed" "succeeds" "succeeded" "succeeded" "succeeding" ;
		fail_V_Successful_action = mkV "fail" ;

		convey_V2_Successfully_communicate_message = mkV2 (mkV "convey" "conveys" "conveyed" "conveyed" "conveying") ;

		suffice_V_Sufficiency = mkV "suffice" "suffices" "sufficed" "sufficed" "sufficing" ;

		provide_V2_Supply = mkV2 (mkV "provide" "provides" "provided" "provided" "providing") ;
		supply_V2_Supply = mkV2 (mkV "supply" "supplies" "supplied" "supplied" "supplying") ;

		bolster_V2_Supporting = mkV2 (mkV "bolster" "bolsters" "bolstered" "bolstered" "bolstering") ;
		buttress_V2_Supporting = mkV2 (mkV "buttress" "buttresses" "buttressed" "buttressed" "buttressing") ;
		support_V2_Supporting = mkV2 (mkV "support" "supports" "supported" "supported" "supporting") ;

		surrender_V_Surrendering = mkV "surrender" "surrenders" "surrendered" "surrendered" "surrendering" ;

		relinquish_V2_Surrendering_possession = mkV2 (mkV "relinquish" "relinquishes" "relinquished" "relinquished" "relinquishing") ;
		surrender_V2_Surrendering_possession = mkV2 (mkV "surrender" "surrenders" "surrendered" "surrendered" "surrendering") ;
		yield_V2_Surrendering_possession = mkV2 (mkV "yield" "yields" "yielded" "yielded" "yielding") ;

		replace_V2_Take_place_of = mkV2 (mkV "replace" "replaces" "replaced" "replaced" "replacing") ;
		succeed_V2_Take_place_of = mkV2 (mkV "succeed" "succeeds" "succeeded" "succeeded" "succeeding") ;
		substitute_V2_Take_place_of = mkV2 (mkV "substitute" "substitutes" "substituted" "substituted" "substituting") ;

		seize_V2_Taking = mkV2 (mkV "seize" "seizes" "seized" "seized" "seizing") ;

		advise_V_Telling = mkV "advise" "advises" "advised" "advised" "advising" ;
		tell_V_Telling = irregV "tell" "told" "told" ;
		advise_V2_Telling = mkV2 (mkV "advise" "advises" "advised" "advised" "advising") ;
		confide_V2_Telling = mkV2 (mkV "confide" "confides" "confided" "confided" "confiding") ;
		notify_V2_Telling = mkV2 (mkV "notify" "notifies" "notified" "notified" "notifying") ;
		tell_V2_Telling = mkV2 (irregV "tell" "told" "told") ;
		advise_VS_Telling = mkVS (mkV "advise" "advises" "advised" "advised" "advising") ;
		assure_VS_Telling = mkVS (mkV "assure" "assures" "assured" "assured" "assuring") ;
		confide_VS_Telling = mkVS (mkV "confide" "confides" "confided" "confided" "confiding") ;

		lodge_V_Temporary_stay = mkV "lodge" "lodges" "lodged" "lodged" "lodging" ;
		room_V_Temporary_stay = mkV "room" "rooms" "roomed" "roomed" "rooming" ;
		sleep_over_V_Temporary_stay = partV (irregV "sleep" "slept" "slept") "over" ;
		stay_V_Temporary_stay = mkV "stay" "stays" "stayed" "stayed" "staying" ;
		stay_over_V_Temporary_stay = partV (mkV "stay" "stays" "stayed" "stayed" "staying") "over" ;

		compose_V_Text_creation = mkV "compose" "composes" "composed" "composed" "composing" ;
		draft_V_Text_creation = mkV "draft" "drafts" "drafted" "drafted" "drafting" ;
		print_out_V_Text_creation = partV (mkV "print" "prints" "printed" "printed" "printing") "out" ;
		print_up_V_Text_creation = partV (mkV "print" "prints" "printed" "printed" "printing") "up" ;
		type_in_V_Text_creation = partV (mkV "type" "types" "typed" "typed" "typing") "in" ;
		utter_V_Text_creation = mkV "utter" "utters" "uttered" "uttered" "uttering" ;
		chronicle_V2_Text_creation = mkV2 (mkV "chronicle" "chronicles" "chronicled" "chronicled" "chronicling") ;
		compose_V2_Text_creation = mkV2 (mkV "compose" "composes" "composed" "composed" "composing") ;
		draft_V2_Text_creation = mkV2 (mkV "draft" "drafts" "drafted" "drafted" "drafting") ;
		jot_V2_Text_creation = mkV2 (mkV "jot" "jots" "jotted" "jotted" "jotting") ;
		jot_down_V2_Text_creation = mkV2 (partV (mkV "jot" "jots" "jotted" "jotted" "jotting") "down") ;
		pen_V2_Text_creation = mkV2 (mkV "pen" "pens" "penned" "penned" "penning") ;
		print_out_V2_Text_creation = mkV2 (partV (mkV "print" "prints" "printed" "printed" "printing") "out") ;
		print_up_V2_Text_creation = mkV2 (partV (mkV "print" "prints" "printed" "printed" "printing") "up") ;
		say_V2_Text_creation = mkV2 (irregV "say" "said" "said") ;
		type_V2_Text_creation = mkV2 (mkV "type" "types" "typed" "typed" "typing") ;
		type_in_V2_Text_creation = mkV2 (partV (mkV "type" "types" "typed" "typed" "typing") "in") ;
		type_out_V2_Text_creation = mkV2 (partV (mkV "type" "types" "typed" "typed" "typing") "out") ;
		type_up_V2_Text_creation = mkV2 (partV (mkV "type" "types" "typed" "typed" "typing") "up") ;
		utter_V2_Text_creation = mkV2 (mkV "utter" "utters" "uttered" "uttered" "uttering") ;
		write_V2_Text_creation = mkV2 (irregV "write" "wrote" "written") ;
		write_down_V2_Text_creation = mkV2 (partV (irregV "write" "wrote" "written") "down") ;
		write_out_V2_Text_creation = mkV2 (partV (irregV "write" "wrote" "written") "out") ;
		write_up_V2_Text_creation = mkV2 (partV (irregV "write" "wrote" "written") "up") ;

		nick_V_Theft = mkV "nick" "nicks" "nicked" "nicked" "nicking" ;
		pilfer_V_Theft = mkV "pilfer" "pilfers" "pilfered" "pilfered" "pilfering" ;
		pinch_V_Theft = mkV "pinch" "pinches" "pinched" "pinched" "pinching" ;
		shoplift_V_Theft = mkV "shoplift" "shoplifts" "shoplifted" "shoplifted" "shoplifting" ;
		steal_V_Theft = irregV "steal" "stole" "stolen" ;
		thieve_V_Theft = mkV "thieve" "thieves" "thieved" "thieved" "thieving" ;
		embezzle_V2_Theft = mkV2 (mkV "embezzle" "embezzles" "embezzled" "embezzled" "embezzling") ;
		filch_V2_Theft = mkV2 (mkV "filch" "filches" "filched" "filched" "filching") ;
		lift_V2_Theft = mkV2 (mkV "lift" "lifts" "lifted" "lifted" "lifting") ;
		misappropriate_V2_Theft = mkV2 (mkV "misappropriate" "misappropriates" "misappropriated" "misappropriated" "misappropriating") ;
		nick_V2_Theft = mkV2 (mkV "nick" "nicks" "nicked" "nicked" "nicking") ;
		pilfer_V2_Theft = mkV2 (mkV "pilfer" "pilfers" "pilfered" "pilfered" "pilfering") ;
		pinch_V2_Theft = mkV2 (mkV "pinch" "pinches" "pinched" "pinched" "pinching") ;
		purloin_V2_Theft = mkV2 (mkV "purloin" "purloins" "purloined" "purloined" "purloining") ;
		shoplift_V2_Theft = mkV2 (mkV "shoplift" "shoplifts" "shoplifted" "shoplifted" "shoplifting") ;
		snatch_V2_Theft = mkV2 (mkV "snatch" "snatches" "snatched" "snatched" "snatching") ;
		snitch_V2_Theft = mkV2 (mkV "snitch" "snitches" "snitched" "snitched" "snitching") ;
		steal_V2_Theft = mkV2 (irregV "steal" "stole" "stolen") ;
		swipe_V2_Theft = mkV2 (mkV "swipe" "swipes" "swiped" "swiped" "swiping") ;
		thieve_V2_Theft = mkV2 (mkV "thieve" "thieves" "thieved" "thieved" "thieving") ;

		flourish_V_Thriving = mkV "flourish" "flourishes" "flourished" "flourished" "flourishing" ;
		thrive_V_Thriving = irregV "thrive" (variants {"thrived" ; "throve"}) "thrived" ;
		flourish_V2_Thriving = mkV2 (mkV "flourish" "flourishes" "flourished" "flourished" "flourishing") ;

		derail_V2_Thwarting = mkV2 (mkV "derail" "derails" "derailed" "derailed" "derailing") ;
		foil_V2_Thwarting = mkV2 (mkV "foil" "foils" "foiled" "foiled" "foiling") ;
		forestall_V2_Thwarting = mkV2 (mkV "forestall" "forestalls" "forestalled" "forestalled" "forestalling") ;
		preclude_V2_Thwarting = mkV2 (mkV "preclude" "precludes" "precluded" "precluded" "precluding") ;
		prevent_V2_Thwarting = mkV2 (mkV "prevent") ;
		thwart_V2_Thwarting = mkV2 (mkV "thwart" "thwarts" "thwarted" "thwarted" "thwarting") ;

		address_V2_Topic = mkV2 (mkV "address" "addresses" "addressed" "addressed" "addressing") ;
		concern_V2_Topic = mkV2 (mkV "concern" "concerns" "concerned" "concerned" "concerning") ;
		cover_V2_Topic = mkV2 (mkV "cover" "covers" "covered" "covered" "covering") ;
		discuss_V2_Topic = mkV2 (mkV "discuss" "discusses" "discussed" "discussed" "discussing") ;
		treat_V2_Topic = mkV2 (mkV "treat" "treats" "treated" "treated" "treating") ;

		commute_V_Travel = mkV "commute" "commutes" "commuted" "commuted" "commuting" ;
		journey_V_Travel = mkV "journey" "journeys" "journeyed" "journeyed" "journeying" ;
		tour_V_Travel = mkV "tour" "tours" "toured" "toured" "touring" ;
		travel_V_Travel = mkV "travel" "travels" "traveled" "traveled" "traveling" ;
		voyage_V_Travel = mkV "voyage" "voyages" "voyaged" "voyaged" "voyaging" ;

		ascend_V_Traversing = mkV "ascend" "ascends" "ascended" "ascended" "ascending" ;
		circle_V_Traversing = mkV "circle" "circles" "circled" "circled" "circling" ;
		cross_V_Traversing = mkV "cross" "crosses" "crossed" "crossed" "crossing" ;
		descend_V_Traversing = mkV "descend" "descends" "descended" "descended" "descending" ;
		hop_V_Traversing = mkV "hop" "hops" "hopped" "hopped" "hopping" ;
		jump_V_Traversing = regV "jump" ;
		leap_V_Traversing = irregV "leap" (variants {"leaped" ; "lept"}) (variants {"leaped" ; "lept"}) ;
		pass_V_Traversing = mkV "pass" "passes" "passed" "passed" "passing" ;
		skirt_V_Traversing = mkV "skirt" "skirts" "skirted" "skirted" "skirting" ;
		traverse_V_Traversing = mkV "traverse" "traverses" "traversed" "traversed" "traversing" ;

		try_V2_Trying_out = mkV2 (mkV "try" "tries" "tried" "tried" "trying") ;
		try_out_V2_Trying_out = mkV2 (partV (mkV "try" "tries" "tried" "tried" "trying") "out") ;

		rumor_VS_Unattributed_information = mkVS (mkV "rumor") ;

		plummet_V_Undergo_change = mkV "plummet" "plummets" "plummeted" "plummeted" "plummeting" ;
		swing_V_Undergo_change = irregV "swing" "swung" "swung" ;
		veer_V_Undergo_change = mkV "veer" "veers" "veered" "veered" "veering" ;

		undergo_V2_Undergoing = mkV2 (mkV "under" IrregEng.go_V) ;

		doff_V2_Undressing = mkV2 (mkV "doff" "doffs" "doffed" "doffed" "doffing") ;
		kick_off_V2_Undressing = mkV2 (partV (mkV "kick" "kicks" "kicked" "kicked" "kicking") "off") ;
		peel_off_V2_Undressing = mkV2 (partV (mkV "peel" "peels" "peeled" "peeled" "peeling") "off") ;
		pull_off_V2_Undressing = mkV2 (partV (regV "pull") "off") ;
		remove_V2_Undressing = mkV2 (mkV "remove" "removes" "removed" "removed" "removing") ;
		shed_V2_Undressing = mkV2 (irregDuplV "shed" "shed" "shed") ;
		slip_V2_Undressing = mkV2 (mkV "slip" "slips" "slipped" "slipped" "slipping") ;
		strip_off_V2_Undressing = mkV2 (partV (mkV "strip" "strips" "stripped" "stripped" "stripping") "off") ;
		take_off_V2_Undressing = mkV2 (partV (irregV "take" "took" "taken") "off") ;
		throw_off_V2_Undressing = mkV2 (partV (irregV "throw" "threw" "thrown") "off") ;

		discharge_V2_Use_firearm = mkV2 (mkV "discharge" "discharges" "discharged" "discharged" "discharging") ;
		fire_V2_Use_firearm = mkV2 (mkV "fire" "fires" "fired" "fired" "firing") ;
		shoot_V2_Use_firearm = mkV2 (irregV "shoot" "shot" "shot") ;

		apply_V2_Using = mkV2 (mkV "apply" "applies" "applied" "applied" "applying") ;
		employ_V2_Using = mkV2 (mkV "employ" "employs" "employed" "employed" "employing") ;
		operate_V2_Using = mkV2 (mkV "operate" "operates" "operated" "operated" "operating") ;
		use_V2_Using = mkV2 (mkV "use" "uses" "used" "used" "using") ;

		clear_V2_Verdict = mkV2 (mkV "clear" "clears" "cleared" "cleared" "clearing") ;
		convict_V2_Verdict = mkV2 (mkV "convict" "convicts" "convicted" "convicted" "convicting") ;
		find_V2_Verdict = mkV2 (irregV "find" "found" "found") ;

		wager_VS_Wagering = mkVS (mkV "wager" "wagers" "wagered" "wagered" "wagering") ;

		wait_V_Waiting = regV "wait" ;

		awake_V_Waking_up = irregV "awake" "awoke" "awoken" ;
		come_to_V_Waking_up = partV (irregV "come" "came" "come") "to" ;
		get_up_V_Waking_up = partV (irregDuplV "get" "got" "gotten") "up" ;
		revive_V_Waking_up = mkV "revive" "revives" "revived" "revived" "reviving" ;
		wake_V_Waking_up = irregV "wake" "woke" "woken" ;
		wake_up_V_Waking_up = partV (irregV "wake" "woke" "woken") "up" ;

		dither_V_Waver_between_options = mkV "dither" "dithers" "dithered" "dithered" "dithering" ;
		vacillate_V_Waver_between_options = mkV "vacillate" "vacillates" "vacillated" "vacillated" "vacillating" ;
		waffle_V_Waver_between_options = mkV "waffle" "waffles" "waffled" "waffled" "waffling" ;
		waver_V_Waver_between_options = mkV "waver" "wavers" "wavered" "wavered" "wavering" ;

		have_on_V2_Wearing = mkV2 (partV (mk5V "have" "has" "had" "had" "having") "on") ;
		sport_V2_Wearing = mkV2 (mkV "sport" "sports" "sported" "sported" "sporting") ;
		wear_V2_Wearing = mkV2 (irregV "wear" "wore" "worn") ;

		win_V2_Win_prize = mkV2 (irregDuplV "win" "won" "won") ;

		pull_out_V_Withdraw_from_participation = partV (regV "pull") "out" ;
		withdraw_V_Withdraw_from_participation = mkV "with" IrregEng.draw_V ;

}
