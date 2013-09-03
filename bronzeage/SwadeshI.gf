incomplete concrete SwadeshI of Swadesh = open Syntax, Lexicon in {

  lincat
    V = Syntax.V ;
    V2 = Syntax.V2 ;
    V3 = Syntax.V3 ;
    A = Syntax.A ;
    N = Syntax.N ;
    Pron = Syntax.Pron ;
    Det = Syntax.Det ;
    Card = Syntax.Card ;
    Prep = Syntax.Prep ;
    IAdv = Syntax.IAdv ;
    IP = Syntax.IP ;
    NP = Syntax.NP ;
    Adv = Syntax.Adv ;
    Conj = Syntax.Conj ;
    Ord = Syntax.Ord ;

    MassN = Syntax.N ;

  lin

    -- Pronouns

    i_NP = mkNP i_Pron ;
    youSg_NP = mkNP youSg_Pron ;
    he_NP = mkNP he_Pron ;
    we_NP = mkNP we_Pron ;
    youPl_NP = mkNP youPl_Pron ;
    they_NP = mkNP they_Pron ;
    whoPl_IP = whoPl_IP ;
    whoSg_IP = whoSg_IP ;
    whatPl_IP = whatPl_IP ;
    whatSg_IP = whatSg_IP ;

    -- Determiners

    this_Det = mkDet this_Quant ;
    that_Det = mkDet that_Quant ;
    many_Det = many_Det ;
    some_Det = someSg_Det ;
----    few_Det =  few_Det ;

--   left_Ord = Syntax.left_Ord ;
--   right_Ord = Syntax.right_Ord ;
    -- Adverbs
    here_Adv = Syntax.here_Adv;
    there_Adv = Syntax.there_Adv;
    where_IAdv = Syntax.where_IAdv;
    when_IAdv = Syntax.when_IAdv;
    how_IAdv = Syntax.how_IAdv;
    far_Adv = Lexicon.far_Adv ;
    -- not : Adv ; -- ?
    -- Conjunctions
    and_Conj = and_Conj ;
    -- Prepositions
    in_Prep = Syntax.in_Prep ;
    with_Prep = Syntax.with_Prep ;
    -- Numerals
    one_Det = mkCard n1_Numeral ;
    two_Num = mkCard n2_Numeral ;
    three_Num = mkCard n3_Numeral ;
    four_Num = mkCard n4_Numeral ;
    five_Num = mkCard n5_Numeral ;

    -- Adjectives
    bad_A = Lexicon.bad_A ;
    big_A = Lexicon.big_A ;
    black_A = Lexicon.black_A ;
    cold_A = Lexicon.cold_A ;
   correct_A = Lexicon.correct_A ;
    dirty_A = Lexicon.dirty_A ;
   dry_A = Lexicon.dry_A ;
   dull_A = Lexicon.dull_A ;
   full_A = Lexicon.full_A ;
    good_A = Lexicon.good_A ;
    green_A = Lexicon.green_A ;
   heavy_A = Lexicon.heavy_A ;
    long_A = Lexicon.long_A ;
    narrow_A = Lexicon.narrow_A ;
   near_A = Lexicon.near_A ;
    new_A = Lexicon.new_A ;
    old_A = Lexicon.old_A ;
---- other_A = Lexicon.other_A ;
    red_A = Lexicon.red_A ;
   rotten_A = Lexicon.rotten_A ;
   round_A = Lexicon.round_A ;
   sharp_A = Lexicon.sharp_A ;
    short_A = Lexicon.short_A ;
    small_A = Lexicon.small_A ;
   smooth_A = Lexicon.smooth_A ;
   straight_A = Lexicon.straight_A ;
    thick_A = Lexicon.thick_A ;
    thin_A = Lexicon.thin_A ;
    warm_A = Lexicon.warm_A ;
   wet_A = Lexicon.wet_A ;
    white_A = Lexicon.white_A ;
   wide_A = Lexicon.wide_A ;
    yellow_A = Lexicon.yellow_A ;

    -- Nouns
   animal_N = Lexicon.animal_N ;
   ashes_N = Lexicon.ashes_N ;
   back_N = Lexicon.back_N ;
   bark_N = Lexicon.bark_N ;
   belly_N = Lexicon.belly_N ;
    bird_N = Lexicon.bird_N;
   blood_N = Lexicon.blood_N ;
   bone_N = Lexicon.bone_N ;
   breast_N = Lexicon.breast_N ;
    child_N = Lexicon.child_N ;
   cloud_N = Lexicon.cloud_N ;
   day_N = Lexicon.day_N ;
    dog_N = Lexicon.dog_N ;
   dust_N = Lexicon.dust_N ;
   ear_N = Lexicon.ear_N ;
   earth_N = Lexicon.earth_N ;
   egg_N = Lexicon.egg_N ;
   eye_N = Lexicon.eye_N ;
   fat_N = Lexicon.fat_N ;
   feather_N = Lexicon.feather_N ;
   fingernail_N = Lexicon.fingernail_N ;
   fire_N = Lexicon.fire_N ;
    fish_N = Lexicon.fish_N ;
   flower_N = Lexicon.flower_N ;
   fog_N = Lexicon.fog_N ;
   foot_N = Lexicon.foot_N ;
   forest_N = Lexicon.forest_N ;
    fruit_N = Lexicon.fruit_N ;
   grass_N = Lexicon.grass_N ;
   guts_N = Lexicon.guts_N ;
   hair_N = Lexicon.hair_N ;
   hand_N = Lexicon.hand_N ;
   head_N = Lexicon.head_N ;
   heart_N = Lexicon.heart_N ;
   horn_N = Lexicon.horn_N ;
    husband_N = Lexicon.man_N ; --- aviomies
   ice_N = Lexicon.ice_N ;
   knee_N = Lexicon.knee_N ;
    lake_N = Lexicon.lake_N ;
   leaf_N = Lexicon.leaf_N ;
   leg_N = Lexicon.leg_N ;
   liver_N = Lexicon.liver_N ;
   louse_N = Lexicon.louse_N ;
    man_N = Lexicon.man_N ;
    meat_N = Lexicon.meat_N ;
    moon_N = Lexicon.moon_N ;
----   mother_N = Lexicon.mother_N ;
    mountain_N = Lexicon.mountain_N ;
   mouth_N = Lexicon.mouth_N ;
   name_N = Lexicon.name_N ;
   neck_N = Lexicon.neck_N ;
   night_N = Lexicon.night_N ;
   nose_N = Lexicon.nose_N ;
   person_N = Lexicon.person_N ;
   rain_N = Lexicon.rain_N ;
    river_N = Lexicon.river_N ;
   road_N = Lexicon.road_N ;
   root_N = Lexicon.root_N ;
   rope_N = Lexicon.rope_N ;
   salt_N = Lexicon.salt_N ;
   sand_N = Lexicon.sand_N ;
    sea_N = Lexicon.sea_N ;
   seed_N = Lexicon.seed_N ;
   skin_N = Lexicon.skin_N ;
   sky_N = Lexicon.sky_N ;
   smoke_N = Lexicon.smoke_N ;
    snake_N = Lexicon.snake_N ;
   snow_N = Lexicon.snow_N ;
    star_N = Lexicon.star_N ;
   stick_N = Lexicon.stick_N ;
    stone_N = Lexicon.stone_N ;
    sun_N = Lexicon.sun_N ;
   tail_N = Lexicon.tail_N ;
   tongue_N = Lexicon.tongue_N ;
   tooth_N = Lexicon.tooth_N ;
    tree_N = Lexicon.tree_N ;
    water_N = Lexicon.water_N ;
   wife_N = Lexicon.wife_N ;
   wind_N = Lexicon.wind_N ;
   wing_N = Lexicon.wing_N ;
    woman_N = Lexicon.woman_N ;
   worm_N = Lexicon.worm_N ;
   year_N = Lexicon.year_N ;
    -- Verbs
   bite_V2 = Lexicon.bite_V2 ;
   blow_V = Lexicon.blow_V ;
   breathe_V = Lexicon.breathe_V ;
   burn_V = Lexicon.burn_V ;
    come_V = Lexicon.come_V ;
   count_V2 = Lexicon.count_V2 ;
   cut_V2 = Lexicon.cut_V2 ;
   die_V = Lexicon.die_V ;
   dig_V = Lexicon.dig_V ;
   drink_V2 = Lexicon.drink_V2 ;
   eat_V2 = Lexicon.eat_V2 ;
   fall_V = Lexicon.fall_V ;
   fear_V2 = Lexicon.fear_V2 ;
   fight_V2 = Lexicon.fight_V2 ;
   float_V = Lexicon.float_V ;
   flow_V = Lexicon.flow_V ;
   fly_V = Lexicon.fly_V ;
   freeze_V = Lexicon.freeze_V ;
   give_V3 = Lexicon.give_V3 ;
   hear_V2 = Lexicon.hear_V2 ;
   hit_V2 = Lexicon.hit_V2 ;
   hold_V2 = Lexicon.hold_V2 ;
   hunt_V2 = Lexicon.hunt_V2 ;
   kill_V2 = Lexicon.kill_V2 ;
   know_V2 = Lexicon.know_V2 ;
   laugh_V = Lexicon.laugh_V ;
   lie_V = Lexicon.lie_V ;
    live_V = Lexicon.live_V ;
--    play_V = Lexicon. play_V2 ;
   pull_V2 = Lexicon.pull_V2 ;
   push_V2 = Lexicon.push_V2 ;
   rub_V2 = Lexicon.rub_V2 ;
--   say_V = Lexicon.say_VS ;
   scratch_V2 = Lexicon.scratch_V2 ;
    see_V2 = Lexicon.see_V2 ;
   sew_V = Lexicon.sew_V ;
   sing_V = Lexicon.sing_V ;
   sit_V = Lexicon.sit_V ;
    sleep_V = Lexicon.sleep_V ;
   smell_V = Lexicon.smell_V ;
   spit_V = Lexicon.spit_V ;
   split_V2 = Lexicon.split_V2 ;
   squeeze_V2 = Lexicon.squeeze_V2 ;
   stab_V2 = Lexicon.stab_V2 ;
   stand_V = Lexicon.stand_V ;
   suck_V2 = Lexicon.suck_V2 ;
   swell_V = Lexicon.swell_V ;
   swim_V = Lexicon.swim_V ;
   think_V = Lexicon.think_V ;
   throw_V2 = Lexicon.throw_V2 ;
   tie_V2 = Lexicon.tie_V2 ;
   turn_V = Lexicon.turn_V ;
   vomit_V = Lexicon.vomit_V ;
    walk_V = Lexicon.walk_V ;
   wash_V2 = Lexicon.wash_V2 ;
   wipe_V2 = Lexicon.wipe_V2 ;

}
