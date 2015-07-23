--# -path=.:prelude:alltenses
instance LexiconFin of Lexicon = open
        (P=ParadigmsFin),
        Prelude,
        ConstructorsFin,
        SymbolFin,
        SymbolicFin, 
        (M=MorphoFin),
        (S=StructuralFin),
        (R=ResFin),
        (Q=QuestionFin)
in {

flags coding = utf8 ;

oper

    -- morphological/syntactic auxiliaries
        comparative : A -> NP -> AP  = mkAP ;       
        truthvalue  : Str -> S       = \s ->
                                       let sy : Symb -> S = symb;
                                       in sy (mkSymb s) ; 

    -- common words/prefixes
        be_V         : V    = P.vOlla ;
        function_N   : N    = P.mkN "funktio" ;
        number_N     : N    = P.mkN "luku" ;
        root_N       : N    = P.mkN "juuri" "juuria" ;
        cosecant_N   : N    = P.mkN "kosekantti" ;
        cosine_N     : N    = P.mkN "kosini" ;
        cotangent_N  : N    = P.mkN "kotangentti" ;
        interval_N   : N    = P.mkN "väli" ;
        secant_N     : N    = P.mkN "sekantti" ;
        sine_N       : N    = P.mkN "sini" ;
        tangent_N    : N    = P.mkN "tangentti" ;
        hyperbolic_A : A    = P.mkA "hyperbolinen" ;
        hyperbolic   : N -> CN = mkCN hyperbolic_A ;
        inverse_A    : A    = P.mkA "käänteinen" ; --?
        left_A       : A    = P.mkA (M.nForms2N (M.dSuurin "vasen")) ;
        greatest_A   : A    = P.mkA (M.nForms2N (M.dSuurin "suurin")) ;
        least_A      : A    = P.mkA (M.nForms2N (M.dSuurin "pienin")) ;
        single_A     : A    = P.mkA (P.mkN "ainoa" "ainoan" "ainoaa" "ainoana" "ainoaan"
                                       "ainoiden" "ainoita" "ainoina" "ainoissa" "ainoihin") ;
        by_Prep     : Prep = P.postPrep P.genitive "toimesta" ;
        passiveBy   : V2 -> (_,_:NP) -> NP = \v,np1,np2 -> mkNP (mkNP np1 v) (mkAdv by_Prep np2) ;
        passiveByCN : V2 -> CN -> NP -> NP = \give,cn,np2 -> let
                np1 : NP = mkNP cn
                in passiveBy give np1 np2 ;


        e_N : N = P.mkN "e" "e:itä" ; 
        --P.mk10N "e" "e:n" "e:tä" "e:nä" "e:hen" "e:iden" "e:itä" "e:inä" "e:issä" "e:ihin" ;
        i_N : N = -- P.mkN "i" "i:itä" ;
          P.mk10N "i" "i:n" "i:tä" "i:nä" "i:hin" "i:iden" "i:itä" "i:inä" "i:issä" "i:ihin" ;
        --as of Jun 2011, dSDP in MorphoFin should accept the constructions with 2 forms

oper
      

-- Prepositions, adverbs etc.

        about_Prep                  = P.casePrep P.elative ;
        approximately_AdA           = ss "likimain" ** {lock_AdA = <>} ;
        as_Subj                     = ss "kun" ** {lock_Subj = <>} ;
        at_Prep                     = P.casePrep P.inessive ;
        by8agent_Prep               = by_Prep ;
        byBothSides_Adv             = P.mkAdv "molemmilta puolilta" ;
        byLeft_Adv                  = P.mkAdv "vasemmalta" ;
        byRight_Adv                 = P.mkAdv "oikealta" ;           
        byBothSides : CN -> CN      = \cn -> mkCN cn byBothSides_Adv ;
        byLeft      : CN -> CN      = \cn -> mkCN cn byLeft_Adv ;
        byRight     : CN -> CN      = \cn -> mkCN cn byRight_Adv ;

        --for_Prep                    = P.casePrep P.allative ; 
        from_Prep                   = P.casePrep P.elative ;
        over_Prep                   = P.prePrep P.adessive "jaettuna" ;
        respect_to_Prep             = P.postPrep P.genitive "suhteen" ;
        to_Prep                     = P.casePrep P.illative ;
        suchthat_Subj               = ss ["siten, että"] ** {lock_Subj = <>} ;
        where_Subj                  = ss "kun" ** {lock_Subj = <>} ;
        if_Subj                     = ss "jos" ** {lock_Subj = <>} ;
        otherwise_Adv               = P.mkAdv "muutoin" ;
        what_IComp                  = Q.CompIP S.whatSg_IP ;

-- Common nouns and noun phrases

        absolute_value_CN           = mkCN (P.mkN "itseis" (P.mkN "arvo"));
        arccosecant_CN              = mkCN (P.mkN "arkus" cosecant_N) ;
        arccosine_CN                = mkCN (P.mkN "arkus" cosine_N) ;
        arccotangent_CN             = mkCN (P.mkN "arkus" cotangent_N) ;
        arcsecant_CN                = mkCN (P.mkN "arkus" secant_N) ;
        arcsine_CN                  = mkCN (P.mkN "arkus" sine_N) ;
        arctangent_CN               = mkCN (P.mkN "arkus" tangent_N) ;
        argument_CN                 = mkCN (P.mkN "vaihe" (P.mkN "kulma"));
        binary_number_CN            = mkCN (P.mkN "binääri" number_N) ;
        cartesian_coordinate_CN     = mkCN (P.mkA "karteesinen") (P.mkN "koordinaatti") ;
        cartesian_product_CN        = mkCN (P.mkA "karteesinen") (P.mkN "tulo") ;
        ceiling_CN                  = mkCN (P.mkN "katto") ;
        closed_interval_CN          = mkCN (P.mkA "suljettu") (P.mkN "väli") ;
        column_CN                   = mkCN (P.mkN "sarake") ;
        complex_conjugate_CN        = mkCN (P.mkN "kompleksi" (P.mkN "konjugaatti")) ;
        complex_number_CN           = mkCN (P.mkN "kompleksi" number_N) ;
        composition_CN              = mkCN (P.mkA "yhdistetty") function_N ;
        configuration_CN            = mkCN (P.mkN "konfiguraatio") ;
        cosecant_CN                 = mkCN cosecant_N ;
        cosine_CN                   = mkCN cosine_N ;
        cotangent_CN                = mkCN cotangent_N ;
        cube_CN                     = mkCN (P.mkN "kuutio" "kuutioita") ;
        cuberoot_CN                 = mkCN (P.mkN "kuutio" root_N);
        curl_CN                     = mkCN (P.mkN "roottori") ;
        decimal_number_CN           = mkCN (P.mkN "desimaali" number_N) ;
        derivative_CN               = mkCN (P.mkN "derivaatta") ;
        determinant_CN              = mkCN (P.mkN "determinantti") ;
        difference_CN               = mkCN (P.mkN "erotus" "erotuksia") ;
        divergence_CN               = mkCN (P.mkN "divergenssi") ;
        domain_CN                   = mkCN (P.mkN "määrittely" (P.mkN "joukko")) ;
        e_NP                        = mkNP (P.mkPN e_N) ;
        element_CN                  = mkCN (P.mkN "alkio" "alkioita") ;
        element_linalg_CN           = element_CN ;
        empty_set_CN                = mkCN (P.mkA "tyhjä") (P.mkN "joukko") ;
        exponential_CN              = mkCN (P.mkN "eksponentti" function_N) ;        
        fact_CN                     = \prop -> let 
                                          fact : CN = mkCN (P.mkN "lause") ;
                                          f : CN -> S -> CN = mkCN
                                          in f fact prop ;
        factor_CN                   = mkCN (P.mkN "tekijä" "tekijöitä") ;
        factorial_CN                = mkCN (P.mkN "kertoma") ;
        floor_CN                    = mkCN (P.mkN "lattia") ;
        form_CN                     = mkCN (P.mkN "muoto") ;
        fraction_CN                 = mkCN (P.mkN "murto-" (P.mkN "osa")) ;
        function_N3                 = P.mkN3 function_N (P.casePrep P.ablative) (P.casePrep P.allative) ;
        function_CN                 = mkCN function_N ;
        gamma_NP                    = mkNP (P.mkPN "Gamma") ;
        gradient_CN                 = mkCN (P.mkN "gradientti") ;
        greatest_common_divisor_CN  = mkCN greatest_A (mkCN (P.mkA "yhteinen") factor_CN) ;
        hexadecimal_number_CN       = mkCN (P.mkN "heksadesimaali" number_N) ;
        hyperbolic_cosecant_CN      = hyperbolic cosecant_N ;
        hyperbolic_cosine_CN        = hyperbolic cosine_N ;
        hyperbolic_cotangent_CN     = hyperbolic cotangent_N ;
        hyperbolic_secant_CN        = hyperbolic secant_N ;
        hyperbolic_sine_CN          = hyperbolic sine_N ;
        hyperbolic_tangent_CN       = hyperbolic tangent_N ;
        imaginary_NP                        = mkNP (P.mkPN i_N) ;
        identity_CN                 = mkCN (P.mkN "identiteetti") ;
        imaginary_part_CN           = mkCN (P.mkN "imaginääri" (P.mkN "osa")) ;
        infinity_NP                 = mkNP (P.mkPN (P.mkN "ääretön" "äärettömiä")) ;
        infinity_minus_NP           = mkNP (P.mkPN (mkCN (P.mkA "negatiivinen") (P.mkN "ääretön" "äärettömiä"))) ;
        integer_division_CN         = mkCN (P.mkN "osa" (P.mkN "määrä")) ;
        integer_number_CN           = mkCN (P.mkN "kokonais" number_N) ;
        integral_CN                 = mkCN (P.mkN "integraali") ;
        integral_interval_CN        = mkCN (P.mkN "kokonaisluku" interval_N) ;
        intersection_CN             = mkCN (P.mkN "leikkaus") ;
        interval_CN                 = variants {
                                                mkCN (P.mkA "jatkuva") interval_N ;
                                                mkCN interval_N } ;
        inverse_number_CN           = mkCN (P.mkN "käänteis" number_N) ;
        inverse_function_CN         = mkCN (P.mkN "käänteis" function_N) ;
        iterated_derivative_CN      = mkCN (P.mkA "iteroitu") (P.mkN "derivaatta") ;
        laplacian_CN                = mkCN (P.mkN2 (P.mkN "operaattori")) (S.makeNP (P.mkN "Laplace" "Laplaceja") M.Sg) ;
        least_common_multiple_CN    = mkCN least_A (mkCN (P.mkA "yhteinen") (mkCN (P.mkN "jaettava" "jaettavia"))) ;
        left_composition_CN         = mkCN left_A composition_CN ;
        left_inverse_function_CN    = mkCN left_A inverse_function_CN ;
        limit_CN                    = mkCN (P.mkN "raja-" (P.mkN "arvo")) ;
        line_CN                     = mkCN (P.mkN "suora") ;
        list_CN                     = mkCN (P.mkN "lista") ;
        logarithm_CN                = mkCN (P.mkN "logaritmi") ;
        lower_bound_CN              = mkCN (P.mkN "ala" (P.mkN "raja")) ;
        matrix_CN                   = mkCN (P.mkN "matriisi") ;
        maximal_element_CN          = mkCN (P.mkN "maksimi" (P.mkN "alkio"))  ;
        mean_CN                     = mkCN (P.mkN "keski" (P.mkN "arvo")) ;
        median_CN                   = mkCN (P.mkN "mediaani") ;
        midpoint_CN                 = mkCN (P.mkN "keski" (P.mkN "piste")) ;
        minimal_element_CN          = mkCN (P.mkN "minimi" (P.mkN "alkio")) ;
        mode_CN                     = mkCN (P.mkN "moodi") ;
        moment_CN                   = mkCN (P.mkN "momentti") ;
        multiple_CN                 = mkCN (P.mkN "monikerta") ;
        natural_number_CN           = mkCN (P.mkA "luonnollinen") number_N ;
        natural_logarithm_CN        = mkCN (P.mkA "luonnollinen") (P.mkN "logaritmi") ;
        negative_CN                 = mkCN (P.mkN "negatiivinen") ;
        not_a_number_CN             = mkCN (P.mkN "epä" (P.mkN "numero")) ;
        octal_number_CN             = mkCN (P.mkN "oktaali" number_N) ;
        open_interval_CN            = mkCN (P.mkA "avoin") interval_N ;
        outer_product_CN            = mkCN (P.mkN "ulko" (P.mkN "tulo")) ;
        partial_derivative_CN       = mkCN (P.mkN "osittais" (P.mkN "derivaatta")) ;
        pi_NP                       = mkNP (P.mkPN ( 
          P.mk10N "π" "π:n" "π:tä" "π:nä" "π:hin" "π:iden" "π:itä" "π:inä" "π:issä" "π:ihin")) ;
        point_CN                    = mkCN (P.mkN "piste") ;
        polar_coordinate_CN         = mkCN (P.mkN "napa" (P.mkN "koordinaatti")) ;
        power_CN                    = mkCN (P.mkN "potenssi") ;
        prime_number_CN             = mkCN (P.mkN "alku" number_N) ;
        primitive_CN                = mkCN (P.mkN "integraali" function_N) ;
        product_CN                  = mkCN (P.mkN "tulo") ;
        proper_subset_CN            = mkCN (P.mkA "aito") subset_CN ;
        proposition_CN              = mkCN (P.mkN "lause") ;
        quotient_CN                 = mkCN (P.mkN "osa" (P.mkN "määrä")) ;
        radix_CN                    = mkCN (P.mkN "kanta" number_N) ;
        range_CN                    = mkCN (P.mkN "arvo" (P.mkN "joukko")) ; --other meaning: mkCN (P.mkN "vaihtelu" (P.mkN "väli")) ; 
        rational_number_CN          = mkCN (P.mkN "rationaali" (number_N)) ;
        real_number_CN              = mkCN (P.mkN "reaali" number_N) ;
        real_part_CN                = mkCN (P.mkN "reaali" (P.mkN "osa")) ;
        remainder_CN                = mkCN (P.mkN "jako" (P.mkN "jäännös")) ;
        right_composition_CN        = mkCN (P.mkA "oikea") composition_CN ;
        right_inverse_function_CN   = mkCN (P.mkA "oikea") inverse_function_CN ;
        root_CN                     = mkCN (P.mkN "juuri" "juuria")  ;
        rounding_CN                 = mkCN (P.mkN "pyöristys") ;
        row_CN                      = mkCN (P.mkN "rivi") ;
        scalar_product_CN           = mkCN (P.mkN "skalaari" (P.mkN "tulo")) ;
        secant_CN                   = mkCN secant_N ;       
        set_CN                      = mkCN (P.mkN "joukko") ;
        set_N                       = P.mkN "joukko" ;
        side_CN                     = mkCN (P.mkN "sivu") ;
        sine_CN                     = mkCN sine_N ;
        single_element_CN           = mkCN single_A element_CN ;  --TODO: revise
        size_CN                     = mkCN (P.mkN "koko") ;
        square_CN                   = mkCN (P.mkN "neliö") ;
        squareroot_CN               = mkCN (P.mkN "neliö" root_N) ;
        standard_deviation_CN       = mkCN (P.mkN "keski" (P.mkN "hajonta")) ;
        subset_CN                   = mkCN (P.mkN "osa" (P.mkN "joukko")) ;
        sum_CN                      = mkCN (P.mkN "summa") ;   -- the sum of 2 , pi and 3
        summation_CN                = mkCN (P.mkN "summaus") ; -- the summation of 2 between 1 and 10
        tangent_CN                  = mkCN tangent_N ;
        transpose_CN                = mkCN (P.mkN "transpoosi") ;
        truncation_CN               = mkCN (P.mkN "katkaisu") ;
        union_CN                    = mkCN (P.mkN "yhdiste") ;
        value_CN                    = mkCN (P.mkN "arvo") ;
        variance_CN                 = mkCN (P.mkN "varianssi") ;
        vector_CN                   = mkCN (P.mkN "vektori") ;
        vector_product_CN           = mkCN (P.mkN "vektori" (P.mkN "tulo")) ;

-- Adjectives and AP

        equal_to                    = let
                                          mkap : A2 -> NP -> AP = mkAP
                                          in mkap (P.mkA2 (P.mkA (P.mkN "yhtäsuuri" "yhtäsuuria"))
                                                          (P.prePrep P.nominative "kuin")) ;

        equivalent_to               = let
                                          mkap : A2 -> NP -> AP = mkAP
                                          in mkap (P.mkA2 (P.mkA "ekvivalentti") 
                                                          (P.postPrep P.genitive "kanssa")) ;

        greater_than                = comparative (P.mkA (P.mkN "suuri" "suuria")) ;
        less_than                   = comparative (P.mkA (P.mkN "pieni" "pieniä")) ;
        true_AP                     = mkAP (P.mkA "totta") ; 

-- Verbs
        add_V3                      = P.dirV3 (P.mkV "lisätä") P.illative ;
        alternate_V2                = P.mkV2 (P.mkV "vaihdella") ;
        approximate_V2              = P.mkV2 "approksimoida" ;
        assert_VS                   = P.mkVS (P.mkV "väittää") ;
        assume_VS                   = P.mkVS (P.mkV "olettaa") ;
        assign_V3                   = P.mkV3 (P.mkV "asettaa") 
                                              P.accPrep (P.postPrep P.genitive "arvoksi") ; --?
        associate_V3                = P.dirV3 (P.mkV "liittää") P.illative ;
        belong_V2                   = P.mkV2 (P.mkV "kuulua") P.illative ;
        calculate_V2                = P.mkV2 (P.mkV "laskea") ;
        centralize_V2               = P.mkV2 (P.mkV "keskittää") ;
        collect_V2                  = P.mkV2 (P.mkV "kerätä") ;
        compose_V2                  = P.mkV2 (P.mkV "yhdistää") ;
        compute_V2                  = P.mkV2 (P.mkV "laskea") ;
        contain_V2                  = P.mkV2 (P.mkV "sisältää") ;
        concatenate_V3              = P.dirV3 (P.mkV "katenoida") P.illative ;
        configure_V2                = P.mkV2 (P.mkV "konfiguroida") ;
        conjugate_V2                = P.mkV2 (P.mkV "konjugoida") ;
        continue_V2                 = P.mkV2 (P.mkV "jatkaa") ;
        converge_V                  = P.mkV "supeta" "suppeni" ;
        convert_V3                  = P.dirV3 (P.mkV "muuntaa") P.translative ;
        count_V2                    = P.mkV2 (P.mkV "laskea") ;
        decide_VQ                   = P.mkVQ (P.mkV "päätellä") ; --päättää?
        decompose_V3                = P.dirV3 (P.mkV "jakaa") P.illative ;
        define_V2                   = P.mkV2 (P.mkV "määritellä") ;
        derive_V3                   = P.dirV3 (P.mkV "johtaa") P.elative ;
        determine_V2                = P.mkV2 (P.mkV "määrittää") ;
        determine_VQ                = P.mkVQ (P.mkV "määrittää") ;
        deviate_V2                  = P.mkV2 (P.mkV "poiketa") P.elative ;
        differentiate_V2            = P.mkV2 (P.mkV "derivoida") ;
        differentiate_V3            = P.mkV3 (P.mkV "derivoida") P.accPrep respect_to_Prep ;
        disprove_VS                 = P.mkVS (P.mkV "kumota") ;
        diverge_V                   = P.mkV "hajaantua" ;
        divide_V2                   = P.mkV2 (P.mkV "jakaa") ;
        divide_V3                   = P.dirV3 (P.mkV "jakaa") P.adessive ;
        eliminate_V2                = P.mkV2 (P.mkV "eliminoida") ;
        evaluate_V2                 = P.mkV2 (P.mkV "laskea") (P.postPrep P.genitive "arvo") ; ----
        find_V2                     = P.mkV2 (P.mkV "etsiä") ;
        hold_for_V2                 = P.mkV2 (P.mkV "pitää") (P.prePrep P.allative "paikkansa") ;
        integrate_V2                = P.mkV2 (P.mkV "integroida") ;
        integrate_V3                = P.mkV3 (P.mkV "integroida") P.accPrep respect_to_Prep ;
        invert_V2                   = P.mkV2 (P.mkV "kääntää") ;
        multiply_V3                 = P.dirV3 (P.mkV "kertoa") P.adessive;
        negate_V2                   = P.mkV2 (P.mkV "ottaa") (P.postPrep P.elative "negaatio") ; ----
        prove_VS                    = P.mkVS (P.mkV "todistaa") ;
        raise_V2                    = P.mkV2 (P.mkV "korottaa") ;
        raise_V3                    = P.dirV3 (P.mkV "korottaa") P.illative ;
        range_V2                    = P.mkV2 (P.mkV "vaihdella") (P.postGenPrep "sisällä") ;
        range_V3                    = P.mkV3 (P.mkV "vaihdella")
                                             (P.casePrep P.illative) (P.prePrep P.elative "välillä");
        select_V2                   = P.mkV2 (P.mkV "valita") ;
        select_V3                   = P.dirV3 (P.mkV "valita") P.elative ;
        show_VS                     = P.mkVS (P.mkV "osoittaa") ;
        simplify_V2                 = P.mkV2 (P.mkV "yksinkertaistaa") ;
        solve_V2                    = P.mkV2 (P.mkV "ratkaista") ;
        subtract_V3                 = P.dirV3 (P.mkV "vähentää") P.elative ;
        transpose_V2                = P.mkV2 (P.mkV "transponoida") ;
        tend_V                      = P.mkV "lähestyä" ;

{-
        equal_V2                    = P.mkV2 be_V (P.prePrep P.nominative "yhtä suuri kuin");
        estimate_V2                 = P.mkV2 (P.mkV "arvioida") ;
        exist_V                     = be_V ; ---- "olla olemassa"
        expand_V2                   = P.mkV2 (P.mkV "laventaa") ;
        explore_V2                  = P.mkV2 (P.mkV "tutkia") ;
        extend_V2                   = P.mkV2 (P.mkV "laajentaa") ;
        factorize_V2                = P.mkV2 (P.mkV "jakaa") (P.postPrep P.nominative "tekijöihin") ; ----
        generalize_V2               = P.mkV2 (P.mkV "yleistää") ;
        generate_V2                 = P.mkV2 (P.mkV "generoida") ;
        imply_V2                    = P.mkV2 (P.mkV "implikoida") ;
        intersect_V2                = P.mkV2 (P.mkV "leikata") (P.postPrep P.genitive "kanssa") ;
        intersect_V3                = P.dirV3 (P.mkV "leikata") P.adessive ; --?
        join_V3                     = P.dirV3 (P.mkV "liittää") P.illative ;
        lead_V2                     = P.mkV2 (P.mkV "johtaa") ;
        let_V2                      = P.mkV2 be_V P.nominative; ---- "olkoon"?
        let_V3                      = P.mkV3 be_V (P.casePrep P.nominative) (P.casePrep P.nominative) ; ---- 
        list_V2                     = P.mkV2 (P.mkV "luetella") ;
        look_up_V2                  = P.mkV2 (P.mkV "etsiä") ;
        map_V3                      = P.dirV3 (P.mkV "kuvata" "kuvasi") P.allative ; --or translative
        normalize_V2                = P.mkV2 (P.mkV "normalisoida") ;
        obtain_V2                   = P.mkV2 (P.mkV "saada") ;
        orbit_V2                    = P.mkV2 (P.mkV "kiertää") ;
        order_V2                    = P.mkV2 (P.mkV "järjestää") ;
        pair_V3                     = P.mkV3 (P.mkV "parittaa")
                                              P.accPrep (P.postPrep P.genitive "kanssa") ; ----
        permutate_V2                = P.mkV2 (P.mkV "permutoida") ;
        point_V2                    = P.mkV2 (P.mkV "osoittaa") ;
        project_V2                  = P.mkV2 (P.mkV "projisoida") ;
        reduce_V2                   = P.mkV2 (P.mkV "vähentää") ;
        reduce_V3                   = P.dirV3 (P.mkV "vähentää") P.elative ;
        relate_V3                   = P.dirV3 (P.mkV "liittää") P.illative ;
        remain_V2                   = P.mkV2 (P.mkV "jäädä") ;
        represent_V2                = P.mkV2 (P.mkV "esittää") ;
        result_V2                   = P.mkV2 (P.mkV "seurata") ;
        rotate_V                    = P.mkV "pyöriä" ;
        round_V3                    = P.mkV3 (P.mkV "pyöristää")
                                              P.accPrep (P.postPrep P.genitive "tarkkuudella") ;
        round_off_V2                = P.mkV2 (P.mkV "pyöristää") ;
        search_V2                   = P.mkV2 (P.mkV "etsiä") ;
        substitute_V2               = P.mkV2 (P.mkV "korvata") ;
        support_V2                  = P.mkV2 (P.mkV "tukea") ;
        suppose_VS                  = P.mkVS (P.mkV "olettaa") ;
        truncate_V2                 = P.mkV2 (P.mkV "katkaista") ;
-}

        plus_Conj     = {s1 = [] ; s2 = "plus" ; n = R.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "kertaa" ; n = R.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "leikkaus" ; n = R.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "yhdiste" ; n = R.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "miinus" ; n = R.Sg} ;


-- Other
        determined_by               = passiveByCN (P.mkV2 (P.mkV "määritellä")) ;
        f_inverse : CN -> CN        = mkCN inverse_A ; --?
        given_by                    = passiveByCN (P.mkV2 (P.mkV "antaa")) ;
        divided_by                  = \dve,dvr -> let
                                          divided : A2 =
                                            (P.mkA2 (P.mkA "jaollinen") (P.casePrep P.adessive))
                                          in mkCl dve divided dvr ;
        is_collinear                = \np -> mkCl np (P.mkA "kolineaarinen") ;
        is_incident                 = \np -> mkCl np (P.mkAdv "yhteydessä") ; --?
        tend_to                     = \np -> let
                                          tend : V2 = P.mkV2 (P.mkV "lähestyä") P.partitive 
                                          in mkVP tend np;
    	true_S                      = truthvalue "tosi" ;
        false_S                     = truthvalue "epätosi" ;

}
