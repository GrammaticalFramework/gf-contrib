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

instance LexiconSwe of Lexicon =
        LexiconX - [select_V3, sub, squareroot_CN,standard_deviation_CN,primitive_CN,scalar_product_CN,vector_product_CN,left_composition_CN,right_composition_CN]
with
	(Syntax = SyntaxSwe), 
	(Symbolic = SymbolicSwe), 
	(Symbol = SymbolSwe),
	(Question = QuestionSwe)
** open
	ParadigmsSwe,
	IrregSwe,
        (CS = CommonScand)
in {
flags
	coding = utf8 ;
	
	oper
	select_V3 =  dirdirV3 select_V  ;

	sub : N -> CN = mkCNprefix "del" ;

 	squareroot_N    = mkN "kvadratrot" "kvadratrötter" ;
 	squareroot_CN    = mkCN squareroot_N ;

--2: Atomic lexicon
oper
	abelian_A = mkA "abelsk"  ;
	absolute_A = mkA "absolut"  ;
	additive_A = mkA "additiv"  ;
	approximate_A = mkA "ungefärlig"  ;
	approximately_AdA = mkAdA "ungefär" ;
	argument_N = mkN "argument" "argument"  ;
	base_N = mkN "bas" "baser";
	binary_A = mkA "binär"  ;
	bound_N = mkN "gräns" "gränser" ;
	calculate_V2 = mkV2 "beräkna"  ;
	cartesian_A = mkA "kartesisk"  ;
	ceiling_N = mkN "tak" "tak"  ;
	center_N = mkN "medelpunkt" "medelpunkter" ;
	class_N = mkN "klass" "klasser" ;
	closed_A = mkA "sluten"  ;
	coefficient_N = mkN "koefficient" "koefficienter" ;
	collinear_A = mkA "kolinjär"  ;
	column_N = mkN "kolumn" "kolumner" ;
	common_A = mkA "gemensam" "gemensamt" "gemensamma" "gemensammare" "gemensammast" ;
	complex_A = mkA "komplex"  ;
	component_N = mkN "komponent" "komponenter" ;
	composition_N = mkN "komposition" "kompositioner" ;
	compute_V2 = mkV2 "beräkna"  ;
	configuration_N = mkN "konfiguration" "konfigurationer" ;
	conjugate_N = mkN "konjugat" "konjugat" ;
	constant_A = mkA "konstant" ;
	constant_N = mkN "konstant" "konstanter"  ;
	continuous_A = mkA "kontinuerlig"  ;
	coordinate_N = mkN "koordinat" "koordinater" ;
	cotangent_N = mkN "cotangens"  ;
	cosecant_N = mkN "cosecans"  ;
	cosine_N = mkN "cosinus"  ;
	cube_N = mkN "kub" "kuber" ;
	cubic_A = mkA "kubisk"  ;
	curl_N = mkN "rotation" "rotationer" ;
	cyclic_A = mkA "cyklisk"  ;
	decide_V = mkV "avgöra"  ;
	decimal_A = mkA "decimal"  ;
	define_V2 = mkV2 "definiera"  ;
	degree_N = mkN "grad" "grader" ;
	derivative_N = mkN "derivata" ;
	determinant_N = mkN "determinant" "determinanter" ;
	determine_V = mkV "bestämma" "bestämde" "bestämt" ;
--	deviation_N = mkN "avvikelse" "avvikelser" ;
	diagonal_A = mkA "diagonal"  ;
	difference_N = mkN "differens" "differenser" ;
	differentiate_V = mkV "derivera"  ;
	direct_A = mkA "direkt"  ;
	disprove_V = mkV "motbevisa"  ;
	divergence_N = mkN "divergens" "divergenser" ;
	divide_V = mkV "dividera"  ;
	division_N = mkN "division" "divisioner" ;
	divisor_N = mkN "delare" "delare"  ;
	domain_N = mkN "domän" "domän" ;
	element_N = mkN "element" "element" ;
	empty_A = mkA "tom" "tomt" "tomma" "tommare" "tommast" ;
	equal_A = mkA "lika"  ;
	equivalent_A = mkA "ekvivalent"  ;
	evaluate_V2 = mkV2 "beräkna"  ;
	exponential_N = mkN "exponentialfunktion" "exponentialfunktioner";
	exterior_A = mkA "yttre"  ;
	fact_N = mkN "faktum" "fakta"  ;
	factor_N = mkN "faktor" "faktorer" ;
	factorial_N = mkN "fakultet" "fakulteter" ;
	find_V2 = mkV2 "hitta"  ;
	floor_N = mkN "golv" "golv" ;
	form_N = mkN "form" "former" ;
	fraction_N = mkN "bråk" "bråk" ;
	function_N = mkN "funktion" "funktioner" ;
	gamma_N = mkN "gamma"  ;
	gamma_PN = mkPN "Gamma"  ;
	gradient_N = mkN "gradient" "gradienter" ;
	give_V = mkV "ge" "gav" "givit" ;
	great_A = mkA "stor" "större" "störst"  ;
	greatest_A = mkA "största"  ;
	group_N = mkN "grupp" "grupper" ;
	hexadecimal_A = mkA "hexadecimal"  ;
	hyperbolic_A = mkA "hyperbolisk"  ;
	hold_V = mkV "gälla"  ;
	identity_N = mkN "identitet" "identiteter" ;
	imaginary_A = mkA "imaginär"  ;
	incident_A = mkA "sammanträffande"  ;
	infinity_PN = mkPN "oändligheten"  ;
	infinity_minus_N = mkN ["minus oändlighet"]  ;
	infinity_minus_PN = mkPN ["minus oändligheten"]  ;
	integer_A = mkA "hel"  ;
	integral_N = mkN "integral" "integraler" ;
	integrate_V = mkV "integrera"  ;
	interior_A = mkA "inre"  ;
	intersection_N = mkN "snitt" "snitt" ;
	interval_N = mkN "intervall" "intervall" ;
	inverse_A = mkA "inverterad"  ;
	inverse_N = mkN "invers" "inverser" ;
	invert_V2 = mkV2 "invertera"  ;
	iterated_A = mkA "itererad" "itererat" "itererade" "itererade" 
                        -- More variation is needed for these forms:
                        ["mer itererad"] ["mest itererad"] ["mest itererade"]
			-- I don't know how to include the following forms:
                        -- ["mer itererat"] ["mest itererat"]
                        -- ["mer itererade"] ["mest itererade"]
			;
	laplacian_N = mkN "Laplaceoperator" "Laplaceoperatorer"  ;
	least_A = mkA "minsta"  ;
	small_A = mkA "liten" "litet" "lilla" "små" "mindre" "minst" "minsta"  ;
	left_N = mkN "vänster"  ;
	limit_N = mkN "gränsvärde" "gränsvärden" ;
	line_N = mkN "linje" "linjer" ;
	list_N = mkN "lista"  ;
	little_A = mkA "liten" "litet" "lilla" "små" "mindre" "minst" "minsta"  ;
	logarithm_N = mkN "logaritm" "logaritmer" ;
	lower_A = mkA "undre"  ;
	matrix_N = mkN "matris" "matriser" ;
	maximal_A = mkA "maximal"  ;
	mean_N = mkN "medelvärde" "medelvärden" ;
	median_N = mkN "median" "medianer" ;
	middle_A = mkA "mellan"  ;
	minimal_A = mkA "minimal"  ;
	mode_N = mkN "typtal" "typtal" ;
	moment_N = mkN "moment" "moment" ;
	multiple_N = mkN "multipel" "multiplar" ;
	natural_A = mkA "naturlig"  ;
	negate_V2 = mkV2 "negera"  ;
	negative_N = mkN "negation" ;
	node_N = mkN "nod" "noder" ;
	number_N = mkN "tal" "tal"  ;
	octal_A = mkA "oktal"  ;
	open_A = mkA "öppen"  ;
	part_N = mkN "del" "delen" "delar" "delarna" ;
	partial_A = mkA "partiell"  ;
	point_N = mkN "punkt" "punkter" ;
	polar_A = mkA "polär"  ;
	polynomial_N = mkN "polynom" "polynom" ;
	positive_A = mkA "positiv"  ;
	power_N = mkN "potens" "potenser" ;
	prime_A = mkA "primär"  ;
	primitive_N = mkN "primitiv" "primitiver" ;
	product_N = mkN "produkt" "produkter" ;
	proper_A = mkA "äkta"  ;
	proposition_N = mkN "påstående"  ;
	prove_V = mkV "visa"  ;
	quotient_N = mkN "kvot" "kvoter" ;
	raise_V = mkV "upphöja" "upphöjde" "upphöjt"  ;
	rational_A = mkA "rationell"  ;
	real_A = mkA "reell"  ;
	relation_N = mkN "relation" "relationer" ;
	remainder_N = mkN "rest" "rester" ;
	range_N = mkN "kodomän" "kodomäner" ;
	right_N = mkN "höger"  ;
	ring_N = mkN "ring"  ;
	root_N = mkN "rot" "rötter" ;
	rounding_N = mkN "avrundning"  ;
	row_N = mkN "rad" "rader" ;
	rule_N = mkN "regel" "regler" ;
	scalar_A = mkA "skalär" ;
	secant_N = mkN "sekant" "sekanter" ;
	select_V = mkV "välja"  ;
	set_N = mkN "mängd" "mängder" ;
	show_V = mkV "visa"  ;
	side_N = mkN "sida" ;
	sine_N = mkN "sinus"  ;
        single_A = mkA "enda" ;
	simplify_V2 = mkV2 "förenkla"  ;
	size_N = mkN "storlek"  ;
	solve_V2 = mkV2 "lösa"  ;
	square_A = mkA "kvadratisk"  ;
	square_N = mkN "kvadrat" "kvadrater" ;
--	standard_A = mkA "standard" ;
	sum_N = mkN "summa"  ;
	summation_N = mkN "summa"  ;
	tangent_N = mkN "tangent" "tangeter" ;
	tend_V = mkV "gå" "går" "gå" "gick" "gått" "gått"  ;
	transpose_N = mkN "transponering"  ;
	transpose_V2 = mkV2 "trasponera"  ;
	true_A = mkA "sann" "sant" ;
	truncation_N = mkN "trunkering"  ;
	typical_A = mkA "typisk"  ;
	union_N = mkN "union" "unioner" ;
	variance_N = mkN "varians" "varianser" ;
	value_N = mkN "värde"  ;
	vector_N = mkN "vektor" "vektorer" ;
	vectorial_A = mkA "vektoriell"  ;
	zero_N = mkN "noll" "nollan" "nollor" "nollorna" ;
	
oper
	add_V3 = dirV3 (mkV "addera") to_Prep  ;
	assume_VS = mkVS (mkV "anta" "antar" "anta" "antog" "antagit" "antagen") ;
	decide_VQ = mkVQ decide_V   ;
	determine_V2 = mkV2 determine_V  ;
	determine_VQ = mkVQ determine_V  ;
	differentiate_V2 = mkV2 differentiate_V  ;
	differentiate_V3 = dirV3 differentiate_V respect_to_Prep  ;
	disprove_VS = mkVS disprove_V  ;
	divide_V2 = mkV2 divide_V ; --to_Prep  ;
	divide_V3 = dirV3 divide_V with_Prep  ;
	equal_A2 = mkA2 equal_A with_Prep  ;
	equivalent_A2 = mkA2 equivalent_A with_Prep  ;
	hold_for_V2 = mkV2 hold_V for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = dirV3 integrate_V respect_to_Prep  ;
	multiply_V3 = dirV3 (mkV "multiplicera") with_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = dirV3 (mkV "subtrahera") from_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = dirV3 raise_V to_Prep  ;
        range_V2 =mkV2 (mkV "gå" "går" "gå" "gick" "gått" "gången") over_Prep ;
	range_V3 = mkV3 (mkV "gå" "går" "gå" "gick" "gått" "gången") from_Prep to_Prep ;
	tend_V2 = mkV2 tend_V to_Prep  ;
	true_S =  truthvalue "sant"  ;
	false_S = truthvalue "falskt"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; lock_Subj= <>} ;
	at_Prep = mkPrep "vid"  ; -- preposition can't be translated out of context!!!
	over_Prep = mkPrep "över"  ; -- preposition can't be translated out of context!!!
	respect_to_Prep = mkPrep ["med avseende på"]  ;
	as_Subj = mkSubjInd "då"  ;
	suchthat_Subj = mkSubjConj ["sådant att"]  ; -- missing agreement !!
	where_Subj = mkSubjInd "där"  ;
	about_Prep = mkPrep ["omkring"]  ;

{-	plus_Prep     = mkPrep "plus"  ;
	times_Prep    = mkPrep "times"  ;
	intersection_Prep     = mkPrep "intersection"  ;
	union_Prep    = mkPrep "union"  ;
	minus_Prep    = mkPrep "minus"  ;
-}

        plus_Conj     = {s1 = [] ; s2 = "plus"  ; n = CS.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "gånger" ; n = CS.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "snitt" ; n = CS.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "union" ; n = CS.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "minus" ; n = CS.Sg} ;


--2: Other
oper
	prefixA : A -> A = \a -> a ; -- FIX IT !!
	makeN3 : N -> N3 = \noun -> mkN3 noun from_Prep to_Prep ;
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> sin ** {s= \\n,sp,c => (arc + sin.s!n!sp!c) } ;
	dos = n2_Numeral ;
	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN dos side_CN ) ;
	standard_deviation_CN = mkCN (mkN "standardavvikelse" "standardavvikelser");
	primitive_CN		= mkCN (mkA "primitiv") function_N ;
	scalar_product_CN = mkCN (mkN "skalärprodukt" "skalärprodukter");
      --vector_product_CN = mkCN (mkN "vektorprodukt" "vektorprodukter");
	vector_product_CN = mkCN (mkN "kryssprodukt" "kryssprodukter");
	left_composition_CN = mkCN (mkN "vänsterkomposition" "vänsterkompositioner");
	right_composition_CN = mkCN (mkN "högerkomposition" "högerkompositioner");

	not_a_number_CN	= mkCN (mkN ["inte ett tal"]);
	radix_CN = mkCN base_N ; 

} ;
