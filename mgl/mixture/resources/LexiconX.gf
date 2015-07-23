incomplete resource LexiconX =
open
	PredefAbs,
	Syntax, 
	Symbolic,
	Symbol,
	Question
in {
oper
	mkAdvBy : NP -> Adv = Syntax.mkAdv by_Prep ;
	mkAdvA : A -> Adv = Syntax.mkAdv ;
	by_Prep: Prep = by8agent_Prep ;
	truthvalue : Str -> S = \s -> let sy : Symb -> S = symb in sy (mkSymb s) ; 
	mkCNprefix : Str -> N -> CN = \arc,sin -> mkCN (prefixN arc sin) ; 
	hyperbolic : CN -> CN = mkCN hyperbolic_A ;
	sub : N -> CN = mkCNprefix "sub" ;
	passiveBy : V2 -> (_,_:NP) -> NP = \v,np1,np2 -> mkNP (mkNP np1 v) (mkAdvBy np2) ;
	passiveByCN : V2 -> CN -> NP -> NP = \give,cn,np2 -> let
		np1 : NP = mkNP the_Art cn
		in passiveBy give np1 np2 ;
	by_AdvN : N -> Adv = \n -> mkAdvBy (mkNP the_Art (mkCN n)) ;
	by_AdvCN : Numeral -> CN -> Adv = \num,cn -> mkAdvBy (mkNP the_Art (mkNum num) cn) ;
	inverse_function : CN = variants
			{	mkCN inverse_A function_N ; 
				mkCN inverse_N } ;
	comparative : A -> NP -> AP = mkAP ;
	
	absolute_value_CN		= mkCN absolute_A value_N ;
 	arccosecant_CN			= arc cosecant_N ;
	arccosine_CN			= arc cosine_N ;
	arccotangent_CN			= arc cotangent_N ;
	arctangent_CN			= arc tangent_N ;
	arcsecant_CN			= arc secant_N ;
	arcsine_CN			= arc sine_N ;
	argument_CN			= mkCN argument_N ;
	binary_number_CN	= mkCN binary_A number_N ;
	cartesian_coordinate_CN
						= mkCN cartesian_A coordinate_N ;
	cartesian_product_CN
						=  mkCN cartesian_A product_N ;
	ceiling_CN			= mkCN ceiling_N ;
	closed_interval_CN	= mkCN closed_A interval_N ;
	column_CN			= mkCN column_N ;
	complex_conjugate_CN	= mkCN complex_A conjugate_N ;
	complex_number_CN	= mkCN complex_A number_N ;
	composition_CN		= mkCN composition_N ;
	configuration_CN	= mkCN configuration_N ;
	cosecant_CN		= mkCN cosecant_N ;
	cosine_CN		= mkCN cosine_N ;
	cotangent_CN		= mkCN cotangent_N ;
	cube_CN			= mkCN cube_N ;
	cuberoot_CN		= mkCN cubic_A root_N ;
	curl_CN			= mkCN curl_N ;
	decimal_number_CN	= mkCN decimal_A number_N ;
	derivative_CN		= mkCN derivative_N ;
	determinant_CN		= mkCN determinant_N ;
	determined_by		= passiveByCN (dirV2 determine_V) ;
	difference_CN 		= mkCN difference_N ;
	divergence_CN		= mkCN divergence_N ;
	-- divide_V2 : V2 ;
	domain_CN 		= mkCN domain_N ;
	e_NP			= mkNP (mkPN "e") ;
	element_CN		= mkCN element_N ;
	element_linalg_CN	= mkCN component_N ;
	empty_set_CN		= mkCN empty_A set_N ;
	equal_to : NP -> AP	= mkAP equal_A2 ;
	equivalent_to : NP -> AP	= mkAP equivalent_A2 ;
	exponential_CN		= mkCN exponential_N ;
	fact_CN : S -> CN = \prop -> let -- : S -> CN
						fact : CN = mkCN fact_N ;
						proposition : CN = mkCN proposition_N ;
						f : CN -> S -> CN = mkCN
					in variants {f fact prop ; f proposition prop} ;
	factor_CN               = mkCN factor_N ;
	factorial_CN            = mkCN factorial_N ; 
	floor_CN		= mkCN floor_N ;				-- integer_A part_N ;
	form_CN                 = mkCN form_N ;
	fraction_CN		= mkCN fraction_N ;
	function_N3		= makeN3 function_N ;
        function_CN             = mkCN function_N ;
	gamma_NP		= mkNP gamma_PN ;
	given_by		= passiveByCN (dirV2 give_V) ;
	-- hold_for_V2 :		defined per language
	gradient_CN		= mkCN gradient_N ;
	greater_than		= comparative great_A ;
	greatest_common_divisor_CN	= preACN greatest_A (preACN common_A (mkCN divisor_N)) ;
	hexadecimal_number_CN	= mkCN hexadecimal_A number_N ;
	hyperbolic_cosecant_CN	= hyperbolic cosecant_CN ;
	hyperbolic_cosine_CN	= hyperbolic cosine_CN ;
	hyperbolic_cotangent_CN	= hyperbolic cotangent_CN ;
	hyperbolic_secant_CN	= hyperbolic secant_CN ;
	hyperbolic_sine_CN		= hyperbolic sine_CN ;
	hyperbolic_tangent_CN	= hyperbolic tangent_CN ;
	imaginary_NP 			= mkNP (mkPN "i") ;   
	identity_CN		= mkCN identity_N ;
	imaginary_part_CN	= mkCN imaginary_A part_N ;
	infinity_NP		= mkNP infinity_PN ;
	infinity_minus_NP	= mkNP infinity_minus_PN ;
	integer_division_CN 	= mkCN integer_A division_N ;
	integer_number_CN	= mkCN integer_A number_N ; 
	integral_CN		= mkCN integral_N ;
	integral_interval_CN 	= mkCN integer_A interval_N ;
	intersection_CN 	= mkCN intersection_N ;
	interval_CN		= mkCN interval_N ;
	inverse_number_CN 	= mkCN inverse_A number_N ;
	inverse_function_CN	= inverse_function ; 
	is_collinear : NP -> Cl = \np -> mkCl np collinear_A ;
	is_incident : NP -> Cl	= \np -> mkCl np incident_A ; 
	iterated_derivative_CN	= mkCN iterated_A derivative_N ;
	laplacian_CN		= mkCN laplacian_N ;
	least_common_multiple_CN = preACN least_A (preACN common_A (mkCN multiple_N)) ;
	left_composition_CN 	= byLeft  composition_CN ;
	left_inverse_function_CN	= byLeft inverse_function_CN ;
	less_than		= comparative small_A ;
	limit_CN 		= mkCN limit_N ;
	line_CN			= mkCN line_N ;
	list_CN 		= mkCN list_N ;
	logarithm_CN		= mkCN logarithm_N ;
	lower_bound_CN		= mkCN lower_A bound_N ;
	matrix_CN		= mkCN matrix_N ;
	maximal_element_CN 	= mkCN maximal_A element_N ;
	mean_CN			= mkCN mean_N ;
	median_CN 		= mkCN median_N ;
	midpoint_CN 		= mkCN middle_A point_N ;
	minimal_element_CN	= mkCN minimal_A element_N ; 
	mode_CN			= mkCN mode_N ;
	moment_CN		= mkCN moment_N ;
	multiple_CN 		= mkCN multiple_N ;
	natural_number_CN	= mkCN natural_A number_N ; 
	natural_logarithm_CN	= mkCN natural_A logarithm_N ;
	negative_CN 		= mkCN negative_N ;    -- for unary minus
	octal_number_CN		= mkCN octal_A number_N ;
	open_interval_CN	= mkCN open_A interval_N ; 
	outer_product_CN 	= mkCN exterior_A product_N ;
	partial_derivative_CN	= mkCN partial_A derivative_N ;
	pi_NP			= mkNP (mkPN "pi") ;
	point_CN		= mkCN point_N ;
	polar_coordinate_CN	= mkCN polar_A coordinate_N ;
	power_CN 		= mkCN power_N ;
	prime_number_CN		= mkCN positive_A (mkCN prime_A number_N) ;
	primitive_CN		= mkCN primitive_N ;
	product_CN 		= mkCN product_N ;
	proper_subset_CN	= mkCN proper_A (sub set_N) ;
	proposition_CN		= mkCN proposition_N ;
	quotient_CN 		= mkCN quotient_N ;
	raise_V2		= dirV2 raise_V ;
	range_CN		= mkCN range_N ;
	rational_number_CN	= mkCN rational_A number_N ; 
	real_number_CN		= mkCN real_A number_N ;
	real_part_CN 		= mkCN real_A part_N ;
	remainder_CN 		= mkCN remainder_N ;
	right_composition_CN	= byRight composition_CN ; 
	right_inverse_function_CN     = byRight inverse_function_CN ;
	root_CN			= mkCN root_N ;
	rounding_CN		= mkCN rounding_N ;
	row_CN			= mkCN row_N ;
	scalar_product_CN 	= mkCN scalar_A product_N ;
	secant_CN 		= mkCN secant_N ;	
	select_V2		= dirV2 select_V ;
	select_V3		= dirdirV3 select_V ;
	--select_V3		= mkV3 select_V ;
	set_CN 			= mkCN set_N ;
	side_CN			= mkCN side_N ;
	sine_CN			= mkCN sine_N ;
        single_element_CN       = mkCN single_A element_N ;
	size_CN 		= mkCN size_N ;
	square_CN 		= mkCN square_N ;
	squareroot_CN 		= mkCN square_A root_N ;
	standard_deviation_CN	= mkCN standard_A deviation_N ;
	subset_CN 		= sub set_N ;
	sum_CN 			= mkCN sum_N ;
	summation_CN		= mkCN summation_N ;
	tangent_CN		= mkCN tangent_N ;
	tend_to			= mkVP tend_V2 ; --let -- : NP -> VP	
	transpose_CN 		= mkCN transpose_N ;
	true_AP			= mkAP true_A ;
	truncation_CN 		= mkCN truncation_N ;
	union_CN 		= mkCN union_N ;
	value_CN		= mkCN value_N ;
	variance_CN 		= mkCN variance_N ;
	vector_CN		= mkCN vector_N ;
	vector_product_CN 	= mkCN vectorial_A product_N ;
	
	what_IComp = CompIP what_IP ;
	
	f_inverse : CN -> CN = mkCN inverse_A ;
}
	
			
