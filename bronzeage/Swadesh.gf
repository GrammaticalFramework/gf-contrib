abstract Swadesh = {

  cat
    V ;
    V2 ;
    V3 ;
    A ;
    N ;
    Pron ;
    Det ;
    Card ;
    Prep ;
    IAdv ;
    IP ;
    NP ;
    Adv ; 
    Conj ;
    Ord ;

    MassN ;

  fun

    -- Pronouns

    i_NP : NP ;
    youSg_NP : NP ;
    he_NP : NP ;
    we_NP : NP ;
    youPl_NP : NP ;
    they_NP : NP ;
    whoPl_IP : IP ; -- only one who in Swadesh 207
    whoSg_IP : IP ;
    whatPl_IP : IP ; -- only one what in Swadesh 207
    whatSg_IP : IP ;

    -- Determiners

    that_Det : Det ;
    this_Det : Det ;
----    all_Predet : Predet ;
    many_Det : Det ;
    some_Det : Det ;

    left_Ord : Ord ;
    right_Ord : Ord ;

    -- Adverbs

    here_Adv : Adv ;
    there_Adv : Adv ;
    where_IAdv : IAdv ;
    when_IAdv : IAdv ;
    how_IAdv : IAdv ;
    far_Adv : Adv ;

    -- Conjunctions

    and_Conj : Conj ;

    -- Prepositions

--    at_Prep : Prep ;  
    in_Prep : Prep ;
    with_Prep : Prep ;

    -- not -- ?
    -- if -- ?
    -- because -- ?

    -- Numerals

    one_Det : Card ;
    two_Num : Card ;
    three_Num : Card ;
    four_Num : Card ;
    five_Num : Card ;

    -- Adjectives

    bad_A : A ;
    big_A : A ;
    black_A : A ;
    cold_A : A ;
    correct_A : A ;
    dirty_A : A ;
    dry_A : A ;
    dull_A : A ;
    full_A : A ;
    good_A : A ;
    green_A : A ;
    heavy_A : A ;
    long_A : A ;
    narrow_A : A ;
    near_A : A ;
    new_A : A ;
    old_A : A ;
----    other_A : A ;
    red_A : A ;
    rotten_A : A ;
    round_A : A ;
    sharp_A : A ;
    short_A : A ;
    small_A : A ;
    smooth_A : A ;
    straight_A : A ;
    thick_A : A ;
    thin_A : A ;
    warm_A : A ;
    wet_A : A ;
    white_A : A ;
    wide_A : A ;
    yellow_A : A ;

    -- Nouns

    animal_N : N ;
    ashes_N : MassN ;
    back_N : N ;
    bark_N : MassN ;
    belly_N : N ;
    bird_N : N ;
    blood_N : MassN ;
    bone_N : N ;
    breast_N : N ;
    child_N : N ;
    cloud_N : N ;
    day_N : N ;
    dog_N : N ;
    dust_N : MassN ;
    ear_N : N ;
    earth_N : MassN ;
    egg_N : N ;
    eye_N : N ;
    fat_N : MassN ;
----    father_N : N ;
    feather_N : N ;
    fingernail_N : N ;
    fire_N : N ;
    fish_N : N ;
    flower_N : N ;
    fog_N : MassN ;
    foot_N : N ;
    forest_N : N ;
    fruit_N : N ;
    grass_N : N ;
    guts_N : N ;
    hair_N : N ;
    hand_N : N ;
    head_N : N ;
    heart_N : N ;
    horn_N : N ;
    husband_N : N ;
    ice_N : MassN ;
    knee_N : N ;
    lake_N : N ;
    leaf_N : N ;
    leg_N : N ;
    liver_N : N ;
    louse_N : N ;
    man_N : N ;
    meat_N : MassN ;
    moon_N : N ;
----    mother_N : N ;
    mountain_N : N ;
    mouth_N : N ;
    name_N : N ;
    neck_N : N ;
    night_N : N ;
    nose_N : N ;
    person_N : N ;
    rain_N : MassN ;
    river_N : N ;
    road_N : N ;
    root_N : N ;
    rope_N : N ;
    salt_N : MassN ;
    sand_N : MassN ;
    sea_N : N ;
    seed_N : N ;
    skin_N : N ;
    sky_N : N ;
    smoke_N : MassN ;
    snake_N : N ;
    snow_N : MassN ;
    star_N : N ;
    stick_N : N ;
    stone_N : N ;
    sun_N : N ;
    tail_N : N ;
    tongue_N : N ;
    tooth_N : N ;
    tree_N : N ;
    water_N : MassN ;
    wife_N : N ;
    wind_N : N ;
    wing_N : N ;
    woman_N : N ;
    worm_N : N ;
    year_N : N ;

    -- Verbs

    bite_V2 : V2 ;
    blow_V : V ;
    breathe_V : V ;
    burn_V : V ;
    come_V : V ;
    count_V2 : V2 ;
    cut_V2 : V2 ;
    die_V : V ;
    dig_V : V ;
    drink_V2 : V2 ;
    eat_V2 : V2 ;
    fall_V : V ;
    fear_V2 : V2 ;
    fight_V2 : V2 ;
    float_V : V ;
    flow_V : V ;
    fly_V : V ;
    freeze_V : V ;
    give_V3 : V3 ;
    hear_V2 : V2 ;
    hit_V2 : V2 ;
    hold_V2 : V2 ;
    hunt_V2 : V2 ;
    kill_V2 : V2 ;
    know_V2 : V2 ;
    laugh_V : V ;
    lie_V : V ;
    live_V : V ;
    play_V : V ;
    pull_V2 : V2 ;
    push_V2 : V2 ;
    rub_V2 : V2 ;
    say_V : V ;
    scratch_V2 : V2 ;
    see_V2 : V2 ;
    sew_V : V ;
    sing_V : V ;
    sit_V : V ;
    sleep_V : V ;
    smell_V : V ;
    spit_V : V ;
    split_V2 : V2 ;
    squeeze_V2 : V2 ;
    stab_V2 : V2 ;
    stand_V : V ;
    suck_V2 : V2 ;
    swell_V : V ;
    swim_V : V ;
    think_V : V ;
    throw_V2 : V2 ;
    tie_V2 : V2 ;
    turn_V : V ;
    vomit_V : V ;
    walk_V : V ;
    wash_V2 : V2 ;
    wipe_V2 : V2 ;

}
