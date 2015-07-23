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

instance LexiconEng of Lexicon =  LexiconX - [left_inverse_function_CN, right_inverse_function_CN, vector_product_CN, left_composition_CN, right_composition_CN]
with
	(Syntax = SyntaxEng), 
	(Symbolic = SymbolicEng), 
	(Symbol = SymbolEng),
	(Question = QuestionEng)
** open
	ParadigmsEng,
	(I=IrregEng), 
	(CR = CommonRomance)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = regA "Abelian"  ;
	absolute_A = regA "absolute"  ;
	additive_A = regA "additive"  ;
	approximate_A = mkA "aproximate" "approximately"  ;
	approximately_AdA = mkAdA "approximately" ;
      	assign_V = mkV "assign" ;
        assigned_A = regA "assigned" ;
	argument_N = regN "argument" ;
	base_N = mkN "base" ;
	binary_A = regA "binary" ;
	block_N = mkN "block" ;
	bound_N = mkN "bound" ;
	calculate_V2 = mkV2 "calculate"  ;
	cartesian_A = regA "cartesian"  ;
	ceiling_N = regN "ceiling"  ;
	center_N = regN "center"  ;
	class_N = regN "class"  ;
	closed_A = regA "closed"  ;
	coefficient_N = regN "coefficient"  ;
	collinear_A = regA "collinear"  ;
	column_N = regN "column"  ;
	common_A = regA "common"  ;
	complex_A = regA "complex"  ;
	component_N = regN "component"  ;
	composition_N = regN "composition"  ;
	compute_V2 = mkV2 "compute"  ;
	configuration_N = regN "configuration"  ;
	conjugate_N = regN "conjugate"  ;
	constant_A = regA "constant"  ;
	constant_N = regN "constant"  ;
	continuous_A = regA "continuous"  ;
	coordinate_N = regN "coordinate"  ;
	cotangent_N = regN "cotangent"  ;
	cosecant_N = regN "cosecant"  ;
	cosine_N = mkN "cosine"  ;
	cube_N = regN "cube"  ;
	cubic_A = regA "cube"  ;
	curl_N = regN "curl"  ;
	cyclic_A = regA "cyclic"  ;
	decide_V = mkV "decide"  ;
	decimal_A = regA "decimal"  ;
	define_V2 = mkV2 "define"  ;
	degree_N = regN "degree"  ;
	derivative_N = regN "derivative"  ;
	determinant_N = regN "determinant"  ;
	determine_V = regV "determine"  ;
	deviation_N = regN "deviation"  ;
	diagonal_A = regA "diagonal"  ;
	difference_N = regN "difference"  ;
	differentiate_V = mkV "differentiate"  ;
	digit_N = regN "digit" ;
	direct_A = regA "direct"  ;
	disprove_V = mkV "disprove"  ;
	divergence_N = regN "divergence"  ;
	divide_V = regV "divide"  ;
	division_N = regN "division"  ;
	divisor_N = regN "divisor"  ;
	domain_N = regN "domain"  ;
	element_N = regN "element"  ;
	empty_A = regA "empty"  ;
	equal_A = regA "equal"  ;
	equivalent_A = regA "equivalent"  ;
	evaluate_V2 = mkV2 "evaluate"  ;
	exponential_N = regN "exponential"  ;
	exterior_A = regA "exterior"  ;
	fact_N = regN "fact"  ;
	factor_N = regN "factor"  ;
	factorial_N = regN "factorial"  ;
	find_V2 = mkV2 "find"  ;
	floor_N = regN "floor"  ;
	form_N = regN "form"  ;
	fraction_N = regN "fraction"  ;
	function_N = regN "function"  ;
	gamma_N = mkN "gamma"  ;
	gamma_PN = mkPN "Gamma"  ;
	gradient_N = mkN "gradient"  ;
	give_V = I.give_V  ;
	great_A = mkA "great" "greater" "greatest" "greatly"  ;
	greatest_A = regA "greatest"  ;
	group_N = regN "group"  ;
	hexadecimal_A = regA "hexadecimal"  ;
	hyperbolic_A = regA "hyperbolic"  ;
	hold_V = regV "hold"  ;
	identity_N = regN "identity"  ;
	imaginary_A = regA "imaginary"  ;
	incident_A = regA "incident"  ;
	infinity_PN = mkPN "infinity"  ;
	-- infinity_minus_N = mkN ["minus infinity"]  ;
	infinity_minus_PN = mkPN ["minus infinity"]  ;
	integer_A = regA "integer"  ;
	integral_N = regN "integral"  ;
	integrate_V = mkV "integrate"  ;
	interior_A = regA "interior"  ;
	intersection_N = regN "intersection"  ;
	interval_N = regN "interval"  ;
	inverse_A = regA "inverse"  ;
	inverse_N = regN "inverse"  ;
	invert_V2 = mkV2 "invert"  ;
	iterated_A = regA "iterated"  ;
	laplacian_N = regN "Laplacian"  ;
	least_A = regA "least"  ;
	small_A = mkA "small" "less" "least" "less"  ;
	left_N = mkN "left"  ;
	left_composition_N = mkN "left-composition";
	limit_N = regN "limit"  ;
	line_N = regN "line"  ;
	list_N = regN "list"  ;
	little_A = regA "little"  ;
	logarithm_N = regN "logarithm"  ;
	lower_A = regA "lower"  ;
	matrix_N = regN "matrix"  ;
	maximal_A = regA "maximal"  ;
	mean_N = regN "mean"  ;
	median_N = regN "median"  ;
	middle_A = regA "mid"  ;
	minimal_A = regA "minimal"  ;
	mode_N = regN "mode"  ;
	moment_N = regN "moment"  ;
	multiple_N = regN "multiple"  ;
	natural_A = regA "natural"  ;
	negate_V2 = mkV2 "negate"  ;
	negative_N = regN "negative"  ;
	node_N = regN "node"  ;
	number_N = regN "number"  ;
	octal_A = regA "octal"  ;
	open_A = regA "open"  ;
	part_N = regN "part"  ;
	partial_A = regA "partial" ;
	place_N = regN "place" ;
	point_N = regN "point"  ;
	polar_A = regA "polar"  ;
	polynomial_N = regN "polynomial"  ;
	positive_A = regA "positive"  ;
	power_N = regN "power"  ;
	prime_A = regA "prime"  ;
	primitive_N = regN "primitive"  ;
	product_N = regN "product"  ;
	proper_A = regA "proper"  ;
	proposition_N = regN "proposition"  ;
	prove_V = mkV "prove"  ;
	quotient_N = regN "quotient"  ;
	raise_V = regV "raise"  ;
	range_N = regN "range"  ;
        range_V2 =mkV2 (regV "range") over_Prep ;
	range_V3 = mkV3 (regV "range") from_Prep to_Prep ;
	rational_A = regA "rational"  ;
	real_A = regA "real"  ;
	relation_N = regN "relation"  ;
	remainder_N = regN "remainder"  ;
	right_N = mkN "right"  ;
	right_composition_N = mkN "right-composition";
	ring_N = regN "ring"  ;
	root_N = regN "root"  ;
	rounding_N = regN "rounding"  ;
	row_N = regN "row"  ;
	rule_N = regN "rule"  ;
	scalar_A = regA "scalar"  ;
	secant_N = regN "secant"  ;
	select_V = regV "select"  ;
	set_N = regN "set"  ;
	show_V = mkV "show"  ;
	side_N = regN "side"  ;
	sine_N = regN "sine"  ;
	single_A = mkA "only" ;
	simplify_V2 = mkV2 "simplify"  ;
	size_N = regN "size"  ;
	solve_V2 = mkV2 "solve" ;
	square_A = regA "square"  ;
	square_N = regN "square"  ;
	standard_A = regA "standard"  ;
	sum_N = regN "sum"  ;
	summation_N = regN "summation"  ;
	tangent_N = regN "tangent"  ;
	tend_V = regV "tend"  ;
	transpose_N = regN "transpose"  ;
	transpose_V2 = mkV2 "transpose"  ;
	true_A = regA "true"  ;
	truncation_N = regN "truncation"  ;
	typical_A = regA "typical"  ;
	union_N = regN "union"  ;
	variance_N = regN "variance"  ;
	value_N = regN "value"  ;
	vector_N = regN "vector"  ;
	vectorial_A = regA "vectorial"  ; 
	zero_N = regN "zero"  ;
	
oper
	add_V3 = dirV3 (mkV "add") to_Prep  ;
        approximate_V2          = mkV2 "approximate" ;
	assign_V3 		= dirV3 assign_V to_Prep ;
	assigned_A2             = mkA2 assigned_A to_Prep  ;
	assume_VS = mkVS (mkV "assume") ;
        begin_V2 : V2 = mkV2 (mkV "begin") ;  
	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V ;
	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = mkV2 differentiate_V ;
	differentiate_V3 = dirV3 differentiate_V respect_to_Prep  ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = mkV2 divide_V ; -- to_Prep  ;
	divide_V3 = dirV3 divide_V by_Prep  ;
        end_V2 : V2 = mkV2 (mkV "end") ;  
	equal_A2 = mkA2 equal_A to_Prep  ;
	equivalent_A2 = mkA2 equivalent_A to_Prep  ;
	hold_for_V2 = mkV2 hold_V for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = dirV3 integrate_V respect_to_Prep  ;
	intersect_V3 = dirV3 (mkV "intersect") with_Prep ;	
	multiply_V3 = dirV3 (mkV "multiply") by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = dirV3 (mkV "subtract") from_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = dirV3 raise_V to_Prep  ;
	tend_V2 = mkV2 tend_V to_Prep  ;
	unite_V3 = dirV3 (mkV "unite") with_Prep ;

	true_S = truthvalue "true" ;
	false_S = truthvalue "false"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	--mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep       = mkPrep "at"  ;
	over_Prep     = mkPrep "over"  ;
	respect_to_Prep = mkPrep ["with respect to"]  ;
	as_Subj       = mkSubjInd "as"  ;
	suchthat_Subj = mkSubjInd ["such that"]  ;
	where_Subj    = mkSubjInd "where"  ;
	about_Prep    = mkPrep "about" ;

        plus_Conj     = mkConj "plus" ;
	times_Conj    = mkConj "times"  ;
	intersection_Conj     = mkConj "intersection"  ;
	union_Conj    = mkConj "union"  ;
	minus_Conj    = mkConj "minus"  ;

{-
        plus_Prep     = mkPrep "plus"  ;
	times_Prep    = mkPrep "times"  ;
	intersection_Prep     = mkPrep "intersection"  ;
	union_Prep    = mkPrep "union"  ;
	minus_Prep    = mkPrep "minus"  ;
-}
        upto_Prep     = mkPrep ["up to"] ;

--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun (mkPrep "mapping") to_Prep ;   --from_Prep. I hope we only use makeN3 in lambda
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\n,c => (arc + sin.s!n!c) ; g= sin.g ; lock_N=<> } ;
	two = n2_Numeral ;

	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;

  	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (mkN "not-a-number") ;
--
	radix_CN = mkCN (mkN "radix") ; 
 	left_half_open_A = mkA "left-half-open" ;
        right_half_open_A = mkA "right-half-open" ;
        left_half_closed_A = mkA "left-half-closed" ;
        right_half_closed_A = mkA "right-half-closed" ;
        --half_open_A = mkA "half-open" ;
	left_inverse_function_CN = mkCN (mkA "left-inverse") function_N;
	right_inverse_function_CN = mkCN (mkA "right-inverse") function_N;
        left_composition_CN = mkCN left_composition_N ;
        right_composition_CN = mkCN right_composition_N ; 
	vector_product_CN = mkCN (mkA "cross") product_N ;

	assigned_to : NP -> AP	= mkAP assigned_A2 ;
} 
