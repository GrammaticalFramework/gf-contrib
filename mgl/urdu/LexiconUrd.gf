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
instance LexiconUrd of Lexicon = LexiconX  
with
(Syntax = SyntaxUrd), 
(Symbolic = SymbolicUrd), 
(Symbol = SymbolUrd),
(Question = QuestionUrd)
** open
Prelude,
ParadigmsUrd, 
(CR = CommonRomance)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = mkA "ابیلیں"  ; --
	absolute_A = mkA "قطعی"  ;
	additive_A = mkA "جمعی"  ;
	approximate_A = mkA "تقریما"  ; --
	approximately_AdA = mkAdA "تقربا" ;
	argument_N = mkN "ارگومنٹ"  ; --
	base_N = mkN "قاعدہ"  ;
	binary_A = mkA "دوہرا"  ; --
	bound_N = mkN "محدود"  ;
	calculate_V2 = mkV2 (compoundV "معلوم" (mkV "كرنا"))  ;
	cartesian_A = mkA "كارتیسی"  ;
	ceiling_N = mkN "سیلنگ"  ; --
	center_N = mkN "مركز"  ;
	class_N = mkN "جماعت"  ;
	closed_A = mkA "بند"  ;
	coefficient_N = mkN "عددی سر"  ;
	collinear_A = mkA "ہم خطع"  ;
	column_N = mkN "كالم"  ;
	common_A = mkA "مشترك"  ;
	complex_A = mkA "مركبہ"  ;
	component_N = mkN "جز تركیبی"  ;
	composition_N = mkN "تركیب"  ;
	compute_V2 = mkV2 (compoundV "معلوم" (mkV "كرنا"))  ;
	configuration_N = mkN "روپ"  ; --
	conjugate_N = mkN "زوج"  ;
	constant_A = mkA "مستقل"  ;
	constant_N = mkN "مستقل"  ;
	continuous_A = mkA "مسلسل"  ;
	coordinate_N = mkN "محدد"  ;
	cotangent_N = mkN "مماس التمام"  ;
	cosecant_N = mkN "قاطع التمام"  ;
	cosine_N = mkN "التمام"  ;
	cube_N = mkN "مكعب"  ;
	cubic_A = mkA "مكعبی"  ;
	curl_N = mkN "كرل"  ; --
	cyclic_A = mkA "سایكلك"  ; --
	decide_V = compoundV "فعصلہ" (mkV "كرنا") ;
	decimal_A = mkA "اشاریہ"  ;
	define_V2 = mkV2 (compoundV "تعریف" (mkV "كرنا"))  ;
	degree_N = mkN "درجہ"  ;
	derivative_N = mkN "مشتق"  ; --
	determinant_N = mkN "مقطعہ"  ;
	determine_V = compoundV "معلوم" (mkV "كرنا")  ;
	deviation_N = mkN "انحراف"  ; --
	diagonal_A = mkA "وتر"  ;
	difference_N = mkN "فرق"  ;
	differentiate_V = mkV "ممیز"  ; --
	direct_A = mkA "راست"  ;
	disprove_V = compoundV "تردید" (mkV "كرنا")  ; --
	divergence_N = mkN "پھیلاو"  ; --
	divide_V = compoundV "تقسیم" (mkV "كرنا")  ;
	division_N = mkN "تقسیم"  ;
	divisor_N = mkN "مقسوم علیہ"  ; --
	domain_N = mkN "حلقہ اثر"  ;
	element_N = mkN "عنصر"  ;
	empty_A = mkA "خالی"  ;
	equal_A = mkA "برابر"  ;
	equivalent_A = mkA "مترادف"  ;
	evaluate_V2 = mkV2 "جانچنا"  ;
	exponential_N = mkN "سریع"  ;
	exterior_A = mkA "بیرونی"  ;
	fact_N = mkN "حقایق"  ;
	factor_N = mkN "جزو ظربی"  ;
	factorial_N = mkN "جزو ضربیہ"  ;
	find_V2 = mkV2 (compoundV "معلوم" (mkV "كرنا"))  ;
	floor_N = mkN "فلور"  ; --
	form_N = mkN "قسم"  ; --
	fraction_N = mkN "كسر"  ;
	function_N = mkN "تفعل"  ;
	gamma_N = mkN "گاما"  ; --
	gamma_PN = mkPN "گاما"  ; --
	gradient_N = mkN "گریڈینٹ"  ; --
	give_V = mkV "دینا"  ;
-- -	great_A = mkA "گرعات" "گرعاتعر" "گرعاتعست" "گرعاتلی"  ;
	great_A = mkA "بڑا"  ;
	greatest_A = mkA "اعظم"  ;
	group_N = mkN "گروپ"  ; --
	hexadecimal_A = mkA "ہیگزا ڈیسیمل"  ; --
	hyperbolic_A = mkA ["ہایپربولك"]  ; --
	hold_V = mkV "ہoلد"  ; --
	identity_N = mkN "اكای"  ;
	imaginary_A = mkA "خیالی"  ;
	incident_A = mkA "انسیڈنٹ"  ; --
	infinity_PN = mkPN "لا متناہی"  ;
	-- infinity_minus_N = mkN ["مiنuس iنفiنiتی"]  ;
	infinity_minus_PN = mkPN ["منفی لا متناہی"]  ;
	integer_A = mkA "صیح عدد"  ;
	integral_N = mkN "انٹیگرل"  ; --
	integrate_V = mkV "انٹیگریٹ"  ; --
	interior_A = mkA "اندرونی"  ;
	intersection_N = mkN "تقاطع"  ;
	interval_N = mkN "وقفہ"  ;
	inverse_A = mkA "معكوسی"  ;
	inverse_N = mkN "معكوس"  ;
	invert_V2 = mkV2 "قوس معكوس"  ; --
	iterated_A = mkA "ایٹریٹڈ"  ; --
	laplacian_N = mkN "لیپلیسین"  ; --
	least_A = mkA "كم"  ;
-- -	small_A = mkA "سمالل" "لعسس" "لعاست" "لعسس"  ;
	small_A = mkA "چھوٹا"  ;
	left_N = mkN "بایاں"  ;
	limit_N = mkN "انتہا"  ;
	line_N = mkN "خط"  ;
	list_N = mkN "فہرست"  ;
	little_A = mkA "چھوٹا"  ;
	logarithm_N = mkN "لوگارتھم"  ;
	lower_A = mkA "نیچلا"  ;
	matrix_N = mkN "قالب"  ;
	maximal_A = mkA "میكسیمل"  ; --
	mean_N = mkN "اوسط"  ;
	median_N = mkN "وسطانیہ"  ;
	middle_A = mkA "وسط"  ; --
	minimal_A = mkA "مینیمل"  ; --
	mode_N = mkN "عادہ"  ;
	moment_N = mkN "لمحہ"  ;
	multiple_N = mkN "اظعاف"  ;
	natural_A = mkA "قدرتی"  ;
	negate_V2 = mkV2 (compoundV "نفی" (mkV "كرنا"))  ;
	negative_N = mkN "منفی"  ;
	node_N = mkN "مركزی تقg-ہ"  ; --
	number_N = mkN "عدد"  ;
	octal_A = mkA "آكٹل"  ; --
	open_A = mkA "كھلا"  ;
	part_N = mkN "حصہ"  ;
	partial_A = mkA "جزوی"  ;
	point_N = mkN "نقطہ"  ;
	polar_A = mkA "قطبی"  ;
	polynomial_N = mkN "كثیر رقمی"  ;
	positive_A = mkA "مثبت"  ;
	power_N = mkN "طاقت"  ;
	prime_A = mkA "مفرد"  ;
	primitive_N = mkN "جامد"  ; --
	product_N = mkN "حاصل ظرب"  ;
	proper_A = mkA "اصلی"  ;
	proposition_N = mkN "دعوی"  ;
	prove_V = compoundV "ثابت" (mkV "كرنا")  ;
	quotient_N = mkN "حاصل"  ;
	raise_V = mkV "بڑھانا"  ;
	range_N = mkN "وسعت"  ;
	rational_A = mkA "ناطق"  ;
	real_A = mkA "حقیقی"  ;
	relation_N = mkN "رشتہ"  ;
	remainder_N = mkN "باقی"  ;
	right_N = mkN "قایمہ"  ;
	ring_N = mkN "دایرہ"  ;
	root_N = mkN "اصل"  ;
	rounding_N = mkN "رونڈنگ"  ; --
	row_N = mkN "رoو"  ; --
	rule_N = mkN "اصول"  ;
	scalar_A = mkA "عددی"  ;
	secant_N = mkN "قاطی"  ;
	select_V = compoundV "منتخب" (mkV "كرنا")  ;
	set_N = mkN "مجمویہ"  ;
	show_V = mkV "دكھانا"  ;
	side_N = mkN "طرف"  ;
	sine_N = mkN "جیب"  ;
        single_A = mkA "صرف" ;
	simplify_V2 = mkV2 (compoundV "وضاحت" (mkV "كرنا"))  ;
	size_N = mkN "سiزع"  ; --
	solve_V2 = mkV2 (compoundV "حل" (mkV "كرنا"))  ;
	square_A = mkA "مربعی"  ;
	square_N = mkN "مربع"  ;
	standard_A = mkA "معاری"  ;
	sum_N = mkN "مجموعہ"  ;
	summation_N = mkN "مجموعہ"  ;
	tangent_N = mkN "مماس"  ;
	tend_V = mkV "جھكنا"  ; --
	transpose_N = mkN "ٹرانسپوز"  ; --
	transpose_V2 = mkV2 (compoundV "ترتعب" (mkV "بدلنا")) ;
	true_A = mkA "صیح"  ;
	truncation_N = mkN "چھانٹ"  ; --
	typical_A = mkA "تمثیلا"  ; --
	union_N = mkN "اتصال"  ;
	variance_N = mkN "مغایرت"  ;
	value_N = mkN "قیمت"  ;
	vector_N = mkN "سمتیہ"  ;
	vectorial_A = mkA "راسی"  ;
	zero_N = mkN "صفر"  ;
	
oper
	add_V3 = mkV3 (mkV "ادد") "كو" "میں"  ;
    assume_VS = mkVS (compoundV "فرض" (mkV "كرنا")) ;
	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V ;
	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = mkV2 differentiate_V ;
	differentiate_V3 = mkV3 differentiate_V  "كو" "كے لحاظ سے" ; --respect_to_Prep  ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = mkV2 divide_V "كو"  ;
	divide_V3 = mkV3 divide_V "كو" "پر"  ;
	equal_A2 = mkA2 equal_A "كے" ; -- to_Prep  ;
	equivalent_A2 = mkA2 equivalent_A "كے" ; -- to_Prep  ;
	hold_for_V2 = mkV2 hold_V ["كے لیی"] ; --for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = mkV3 integrate_V  "كو" "كے لحاظ سے" ; -- respect_to_Prep  ;
	intersect_V3 = mkV3 (mkV "کاٹنا") "كو" "کیساتھ"  ;
 	multiply_V3 = mkV3 (compoundV "ضرب" (mkV "دینا"))  "كو" "سے" ; --by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = mkV3 (compoundV "تفریق" (mkV "كرنا")) "كو" "سے" ; -- from_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = mkV3 raise_V "كو" ; -- to_Prep  ; -- -
 	range_V2 =mkV2 (mkV "رینج") "پر" ;
        range_V3 = mkV3 (mkV "رینج") "سے"  "تك" ; 
	tend_V2 = mkV2 tend_V "كو" ; -- to_Prep  ;
	unite_V3 = mkV3 (compoundV "متحد" (mkV "كرنا")) "كو" "سے" ;
	true_S = truthvalue "صیح" ;
	false_S = truthvalue "غلط"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	--mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep = mkPrep "پر" "پر" ;
	over_Prep = mkPrep "پر"  "پر" ;
	respect_to_Prep = mkPrep ["كے لحاظ سے"] ["كے لحاظ سے"]   ;
	as_Subj = mkSubjInd "جیسا كہ"  ;
	suchthat_Subj = mkSubjInd ["تا كہ"]  ;
	where_Subj = mkSubjInd "كہاں"  ;
	about_Prep = mkPrep ["كے متعلق"] ["كے متعلق"] ;

        plus_Conj     = sd2 [] "پلس" ** {n = CR.Pl} ;
        times_Conj    = sd2 [] "گنا" ** {n = CR.Pl} ;
        intersection_Conj     = sd2 [] "انٹرسیکشن" ** {n = CR.Pl} ;
        union_Conj    = sd2 [] "یونین" ** {n = CR.Pl} ;
        minus_Conj    = sd2 [] "مائنس" ** {n = CR.Pl} ; 



--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep "كو" "" ;
	arc : N -> CN	= mkCNprefix "ارچ" ;
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
	not_a_number_CN	= mkCN (mkN "غلط عدد") ;

	radix_CN = mkCN (mkN "ریڈكس") ; 
	half_open_A = mkA "آدھا كھلا" ;
	half_closed_A = mkA "آدھا بند" ;
	
} 
