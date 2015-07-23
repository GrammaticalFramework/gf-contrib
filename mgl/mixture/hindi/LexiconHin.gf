{-
    Copyright 2006,2008 WebALT Inc.
    This file is part of the Mathematical Grammar Library, MGL.

    MGL is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    MGL is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with MGL.  If not, see <http://www.gnu.org/licenses/>.


 History:
 $Rev::               $:  Revision of last commit
 $Author::            $:  Author of last commit
 $Date::              $:  Date of last commit
-}

--# -path=present

instance LexiconHin of Lexicon = LexiconX  
with
	(Syntax = SyntaxHin), 
	(Symbolic = SymbolicHin), 
	(Symbol = SymbolHin),
	(Question = QuestionHin)
** open
	Prelude,
	ParadigmsHin, 
	(CR = CommonRomance)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = mkA "आबेलवी"  ; --
	absolute_A = mkA "निरपेक्ष"  ;
	additive_A = mkA "योगात्मक"  ;
	approximate_A = mkA "सन्निकट"  ; --
	approximately_AdA = mkAdA "लगभग" ;
	argument_N = mkN "पूर्व प्रतिबिंब"  ; --
	base_N = mkN "आधार"  ;
	binary_A = mkA "द्विआधारी"  ; --
	bound_N = mkN "परिबंध"  ;
	calculate_V2 = mkV2 (compoundV "गणन" (mkV "करना"))  ;
	cartesian_A = mkA "कार्तीय"  ;
	ceiling_N = mkN "उच्चतम सीमा"  ; --
	center_N = mkN "केंद्र"  ;
	class_N = mkN "वर्ग"  ;
	closed_A = mkA "बंद"  ;
	coefficient_N = mkN "गुणंक"  ;
	collinear_A = mkA "एकरेखस्त"  ;
	column_N = mkN "स्तंभ"  ;
	common_A = mkA "सार्व"  ;
	complex_A = mkA "सम्मिश्र"  ;
	component_N = mkN "घटक"  ;
--	composition_N = mkN "संघटन"  ;  -- or sam.yo:jan if composition of functions
	composition_N = mkN "संयोजन" ;
	compute_V2 = mkV2 (compoundV "गणन" (mkV "करना"))  ;
	configuration_N = mkN "समाकृति"  ; --
	conjugate_N = mkN "संयुग्मी"  masculine;
	constant_N = mkN "चर"  ;
	constant_A = mkN "चर"  ; -- constant function
	continuous_A = mkA "संतत"  ;
	coordinate_N = mkN "निर्देशांक"  ;
	cotangent_N = mkN "कोटिस्पर्शज्या"  ;
	cosecant_N = mkN "व्युज्या"  ;
	cosine_N = mkN "कोटिज्या"  ;
	cube_N = mkN "घन"  ;
	cubic_A = mkA "घनाकार"  ;
	curl_N = mkN "छल्ला"  ; --
	cyclic_A = mkA "आवर्ती"  ; --
	decide_V = compoundV "निर्णय" (mkV "करना") ;
	decimal_A = mkA "दशमलव"  ;
	define_V2 = mkV2 (compoundV "परिभाषा" (mkV "देना"))  ;
	degree_N = mkN "कोटि"  ;
--      denote_V = mkV "प्रकट करना"
	derivative_N = mkN "अवकलज" ; -- -masculine ; --
	determinant_N = mkN "सारणिक" ; -- -masculine ;
	determine_V = compoundV "निर्धारित" (mkV "करन")  ;
	deviation_N = mkN "विचलन"  ; --
	diagonal_A = mkA "विकर्ण"  ;
	difference_N = mkN "अंतर" ; -- -masculine ;
	differentiate_V = compoundV "अवकलन" (mkV "करना")  ; --
	direct_A = mkA "प्रत्यक्ष"  ;
	disprove_V = compoundV "खण्डन" (mkV "करना")  ; --
	divergence_N = mkN "अपसरण" ; -- -masculine ; --
	divide_V = compoundV "भाग" (mkV "करना")  ;
	division_N = mkN "भाग"  ;
	divisor_N = mkN "भाजक"  ; --
	domain_N = mkN "प्रांत"  ;
	element_N = mkN "अवयव"  ;
	empty_A = mkA "रिक्त"  ;
	equal_A = mkA "तुल्य"  ;
	equivalent_A = mkA "समतुल्य"  ;
	evaluate_V2 = mkV2 "जनचन"  ;
	exponential_N = mkN "चरघातांक"  ;
	exterior_A = mkA "बाह्य"  ;
	fact_N = mkN "तथ्य" masculine ;
	factor_N = mkN "गुणक"  ;
	factorial_N = mkN "हत"  ;
--	find_V2 = mkV2 (compoundV "मeलwम" (mkV "करन"))  ;-- D'u:m.D'o
	find_V = mkV "ढूंढo" ; --
	floor_N = mkN "निम्न मूल्य"  ; -- 
	form_N = mkN "रूप"  ; --
	fraction_N = mkN "भिन्न" ; -- - masculine  ;
	function_N = mkN "फलन"  ;
	gamma_N = mkN "गामा"  ; --
	gamma_PN = mkPN "गामा"  ; --
	gradient_N = mkN "अनुपात" masculine ; --
	give_V = mkV "देना"  ;
-- -	great_A = mkA "गरeत" "गरeतeर" "गरeतeसत" "गरeतलय"  ;
	great_A = mkA "उत्तम"  ;
	greatest_A = mkA "महत्तम"  ;
	group_N = mkN "मंडली" feminine ; --
	hexadecimal_A = mkA "षोडशाधारी"  ; --
	hyperbolic_A = mkA ["अतिपरवलयाकार"]  ; --
	hold_V = mkV "धारण करना"  ; --
	identity_N = mkN "तत्समक"  ; -- identity function
	imaginary_A = mkA "काल्पनिक"  ;
	incident_A = mkA "पाती"  ; --
	infinity_PN = mkPN "अनंत"  ;
	-- infinity_minus_N = mkN ["मिनुस िनफ़िनितय"]  ;
	infinity_minus_PN = mkPN ["R.ण अनंत"]  ;
	integer_A = mkA "पूर्णांक"  ;
	integral_N = mkN "समाकलन"  ; --
	integrate_V = mkV "समाकलन करना"  ; --
	interior_A = mkA "अंतस्थः"  ;
	intersection_N = mkN "सर्वनिष्ठ"  ;
	interval_N = mkN "अंतराल"  ;
	inverse_A = mkA "प्रतिलोम"  ;
	inverse_N = mkN "प्रतिलोम"  ;
	invert_V2 = mkV2 "प्रतिलोम करना"  ; -- vX,yutX,kX,ramaN karna:
	iterated_A = mkA "दoहराया गया"  ; --
	laplacian_N = mkN "लैपलेसिअन"  ; --
	least_A = mkA "लघुतम"  ;
-- -	small_A = mkA "समलल" "लeसस" "लeसत" "लeसस"  ;
	small_A = mkA "छोटा"  ;
	left_N = mkN "बयण"  ;
	limit_N = mkN "सीमा" feminine ;
	line_N = mkN "रेखा" feminine ;
	list_N = mkN "सूची"  ;
	little_A = mkA "छोटा"  ;
	logarithm_N = mkN "लघुगणक"  ;
	lower_A = mkA "निम्न"  ;
	matrix_N = mkN "आव्यूह" ; -- -masculine ;
	maximal_A = mkA "परार्ध्य"  ; --
	mean_N = mkN "माध्य"  ;
	median_N = mkN "मध्यिका" feminine ;
	middle_A = mkA "मध्य"  ; --
	minimal_A = mkA "अल्पतम"  ; --
	mode_N = mkN "बहुलक" ; -- -masculine ;
	moment_N = mkN "लमHह"  ;
	multiple_N = mkN "गुणज"  ;
	natural_A = mkA "सहज"  ;
	negate_V2 = mkV2 (compoundV "खंडन" (mkV "करना"))  ;
	negative_N = mkN "R.णात्मक"  ;
	node_N = mkN "आसंधि"  ; --
	number_N = mkN "संख्या"  ;
	octal_A = mkA "अष्टाधारी"  ; --
	open_A = mkA "खुला"  ;
	part_N = mkN "भाग" ; -- -masculine ;
	partial_A = mkA "आंशिक"  ;
	point_N = mkN "बिंदु"  ;
	polar_A = mkA "ध्रुवीय"  ;
	polynomial_N = mkN "बहुपद"  ;
	positive_A = mkA "धनातमक"  ;
	power_N = mkN "घात" feminine ;
	prime_A = mkA "अभाज्य"  ;
	primitive_N = mkN "आदिम"  ; --
	product_N = mkN "गुणनफल"  ; -- masculine
	proper_A = mkA "उचित"  ;
	proposition_N = mkN "कथन" ; -- -masculine ;
	prove_V = compoundV "सिद्ध" (mkV "करना")  ;
	quotient_N = mkN "भागफल"  ;
	raise_V = mkV "बढ़ाना"  ;
	range_N = mkN "परिसर"  ;
	rational_A = mkA "परिमेय"  ;
	real_A = mkA "वास्तविक"  ;
	relation_N = mkN "संबंध"  ;
	remainder_N = mkN "शेषफल" ; -- -masculine ;
	right_N = mkN "दाहिनी"  ;
	ring_N = mkN "रिंग"  ;
	root_N = mkN "मूल" ; -- -masculine ;
	rounding_N = mkN "पूर्णन" ; -- -masculine ; --
	row_N = mkN "पंक्ति"  ; --
	rule_N = mkN "नियम"  ;
	scalar_A = mkA "अदिश"  ;
	secant_N = mkN "छेदक रेखा" feminine  ;
	select_V = mkV "चुनना" ; -- compoundV "मनतKब" (mkV "करन")  ;
	set_N = mkN "समुच्चय"  ;
	show_V = mkV "निरूपित करना"  ;
	side_N = mkN "भुज"  ;
	sine_N = mkN "जीवा"  ;
        single_A = mkA "एकल" ;
	simplify_V2 = mkV2 (compoundV "सरल" (mkV "करना"))  ;
	size_N = mkN "परिमाण"  ; --
	solve_V2 = mkV2 (compoundV "हल" (mkV "करन"))  ;
	square_A = mkA "वर्गाकार"  ;
	square_N = mkN "वर्ग"  ;
	standard_A = mkA "मानक"  ;
	sum_N = mkN "योगफल"  ;
	summation_N = mkN "योग संक्रिया"  ;
--      symbol_N = mkN "प्रतीक" 
	tangent_N = mkN "स्पर्शज्या"  ;
	tend_V = mkV "झुकना"  ; --
	transpose_N = mkN "परिवर्त" masculine ; --
	transpose_V2 = mkV2 (compoundV "परिवर्त" (mkV "करना")) ;
	true_A = mkA "सत्य"  ;
	truncation_N = mkN "छिन्न करना"  ; --
	typical_A = mkA "लाक्षणिक"  ; --
	union_N = mkN "सम्मिलन"  ;
--      variable_N = mkN "चर" 
	variance_N = mkN "भिन्नता"  ;
	value_N = mkN "मान"  ;
	vector_N = mkN "सदिश"  ;
	vectorial_A = mkA "सदिश"  ;
	zero_N = mkN "शून्य"  ;
	
oper
	add_V3 = mkV3 (mkV "दद") "को" "से"  ;
        assume_VS = mkVS (compoundV "मान" (mkV "लेना")) ;
 	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V ;
 	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = mkV2 differentiate_V ;
	differentiate_V3 = mkV3 differentiate_V  "को" "के सापेक्ष" ; --respect_to_Prep  ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = mkV2 divide_V "को"  ;
	divide_V3 = mkV3 divide_V "को" "से"  ;
	equal_A2 = mkA2 equal_A "के" ; -- to_Prep  ;
	equivalent_A2 = mkA2 equivalent_A "के" ; -- to_Prep  ;
	hold_for_V2 = mkV2 hold_V ["के लिये"] ; --for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = mkV3 integrate_V  "को" "के सापेक्ष" ; -- respect_to_Prep  ;
	intersect_V3 = mkV3 (mkV "छेना") "को" "کयसतh'"  ;
 	multiply_V3 = mkV3 (compoundV "गुणा" (mkV "करना"))  "को" "से" ; --by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = mkV3 (compoundV "घटाव" (mkV "करना")) "को" "से" ; -- from_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = mkV3 raise_V "को" ; -- to_Prep  ; -- -
 	range_V2 =mkV2 (mkV "अंतराल") "पर" ;
        range_V3 = mkV3 (mkV "अंतराल") "से"  "तक" ; 
	tend_V2 = mkV2 tend_V "को" ; -- to_Prep  ;
	unite_V3 = mkV3 (compoundV "सम्मिलन" (mkV "करना")) "को" "से" ;
	true_S = truthvalue "सत्य" ;
	false_S = truthvalue "असत्य"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	--mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep = mkPrep "पर" "पर" ;
	over_Prep = mkPrep "पर"  "पर" ;
	respect_to_Prep = mkPrep ["के सापेक्ष"] ["के सापेक्ष"]   ;
	as_Subj = mkSubjInd "जैस कि"  ;
	suchthat_Subj = mkSubjInd ["ता कि"]  ;
	where_Subj = mkSubjInd "कहa:~"  ;
	about_Prep = mkPrep ["के बारे"] ["के बारे"] ;

        plus_Conj     = sd2 [] "plus" ** {n = CR.Sg} ; 
	times_Conj    = sd2 [] "times" ** {n = CR.Sg} ;  
	intersection_Conj     = sd2 [] "intersection" ** {n = CR.Sg} ; 
	union_Conj    = sd2 [] "union" ** {n = CR.Sg} ;
	minus_Conj    = sd2 [] "minus" ** {n = CR.Sg} ;

--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep "को" "" ;
	arc : N -> CN	= mkCNprefix "प्रतिलोम" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\n,c => (arc ++ sin.s!n!c) ; g= sin.g ; lock_N=<> } ;
	two = n2_Numeral ;
	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (mkN "असांख्यिक") ;

	radix_CN = mkCN (mkN "मूल") ; 
	half_open_A = mkA "आधा खुला" ;
	half_closed_A = mkA "आधा बंद" ;
	
} 
