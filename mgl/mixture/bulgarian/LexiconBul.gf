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

--# -path=alltenses

instance LexiconBul of Lexicon =  LexiconX - [pi_NP, imaginary_NP, e_NP, sub]
with
	(Syntax = SyntaxBul), 
	(Symbolic = SymbolicBul), 
	(Symbol = SymbolBul),
	(Question = QuestionBul)
** open
        Prelude,
	ParadigmsBul,
	(R = ResBul)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
        sub : N -> CN = mkCNprefix "под" ;

	abelian_A = mkA076 "абелев"  ;
	absolute_A = mkA079 "абсолютен"  ;
	additive_A = mkA079 "адитивен"  ;
	approximate_A = mkA079 "приблизителен"  ;
	approximately_AdA = mkAdA "approximately" ;
	argument_N = mkN007 "аргумент"  ;
	base_N = mkN041 "основа"   ;
	binary_A = mkA079 "двоичен"  ;
	bound_N = mkN041 "граница"  ;
	calculate_V2 = dirV2 (actionV (mkV186 "пресмятам") (mkV152 "пресметна")) ;
	cartesian_A = mkA076 "декартов"  ;
	ceiling_N = mkN072 "приближение"  ;
	center_N = mkN009a "център"  ;
	class_N = mkN001 "клас"  ;
	closed_A = mkA076 "затворен"  ;
	coefficient_N = mkN007 "коефициент"  ;
	collinear_A = mkA085 "колинеен"  ;
	column_N = mkN041 "колона"  ;
	common_A = mkA076 "общ"  ;
	complex_A = mkA079 "комплексен"  ;
	component_N = mkN007 "компонент"  ;
	composition_N = mkN047 "композиция"  ;
	compute_V2 = dirV2 (actionV (mkV186 "изчислявам") (mkV174 "изчисля")) ;
	configuration_N = mkN047 "конфигурация"  ;
	conjugate_N = mkN054 "спрегнато"  ;
	constant_A = mkA079 "константен"  ;
	constant_N = mkN041 "константа"  ;
	continuous_A = mkA076 "непрекъснат"  ;
	coordinate_N = mkN041 "координата"  ;
	cotangent_N = mkN007 "котангенс"  ;
	cosecant_N = mkN007 "косеканс"  ;
	cosine_N = mkN007 "косинус"  ;
	cube_N = mkN001 "куб"  ;
	cubic_A = mkA079 "кубичен"  ;
	curl_N = mkN041 "къдрица"  ;
	cyclic_A = mkA079 "цикличен"  ;
	decide_V = actionV (mkV187 "определям") (mkV174 "определя")  ;
	decimal_A = mkA079 "десетичен" ;
	define_V2 = dirV2 (stateV (mkV186 "дефинирам")) ;
	degree_N = mkN007 "градус"  ;
	derivative_N = mkN041 "производна" ;
	determinant_N = mkN041 "детерминанта" ;
	determine_V = actionV (mkV187 "определям") (mkV174 "определя")  ;
	deviation_N = mkN072 "отклонение" ;
	diagonal_A = mkA079 "диагонален" ;
	difference_N = mkN041 "разлика" ;
	differentiate_V = stateV (mkV186 "диференцирам") ;
	direct_A = mkA079 "директен"  ;
	disprove_V = stateV (mkV173 "правя") ;
	divergence_N = mkN047 "дивергенция"  ;
	divide_V = stateV (mkV174 "деля")  ;
	division_N = mkN072 "деление"  ;
	divisor_N = mkN031 "делител"  ;
	domain_N = mkN007 "домейн"  ;
	element_N = mkN007 "елемент"  ;
	empty_A = mkA079 "празен"  ;
	equal_A = mkA079 "равен"  ;
	equivalent_A = mkA079 "еквивалентен"  ;
	evaluate_V2 = dirV2 (stateV (mkV173 "правя")) ;
	exponential_N = mkN041 "експонента"  ;
	exterior_A = mkA079 "външен"  ;
	fact_N = mkN007 "факт"  ;
	factor_N = mkN007 "фактор"  ;
	factorial_N = mkN007 "факториел"  ;
	find_V2 = dirV2 (stateV (mkV173 "правя")) ;
	floor_N = mkN072 "приближение"  ;
	form_N = mkN041 "форма"  ;
	fraction_N = mkN049 "дроб"  ;
	function_N = mkN047 "функция"  ;
	gamma_N = mkN041 "гама"  ;
	gamma_PN = mkPN "Гама" R.Fem  ;
	gradient_N = mkN007 "градиент"  ;
	give_V = stateV (mkV168 "дам")  ;
	great_A = mkA081 "голям"  ;
	greatest_A = mkA081 "най-голям"  ;
	group_N = mkN041 "група"  ;
	hexadecimal_A = mkA079 "шестнадесетичен"  ;
	hyperbolic_A = mkA079 "хиперболичен"  ;
	hold_V = stateV (mkV176 "важа")  ;
	identity_N = mkN049 "идентичност"  ;
	imaginary_A = mkA079 "имагинерен"  ;
	incident_A = mkA079 "инцидентен" ;
	infinity_PN = mkPN "Безкрайност" R.Fem ;
	infinity_minus_N = mkN049 ["минус безкрайност"] ;
	infinity_minus_PN = mkPN "Минус Безкрайност" R.Fem ;
	integer_A = mkA076 "целочислен"  ;
	integral_N = mkN007 "интеграл"  ;
	integrate_V = stateV (mkV173 "правя") ;
	interior_A = mkA079 "вътрешен"  ;
	intersection_N = mkN072 "сечение"  ;
	interval_N = mkN007 "интервал"  ;
	inverse_A = mkA079 "обратен"  ;
	inverse_N = mkN054 "нещо" ;
	invert_V2 = dirV2 (stateV (mkV173 "правя")) ;
	iterated_A = mkA079 "многократен"  ;
	laplacian_N = mkN007 "лапласиан"  ;
	least_A = mkA080 "най-малък"  ;
	small_A = mkA080 "малък"  ;
	left_N = mkN054 "нещо" ;
	limit_N = mkN041 "граница"  ;
	line_N = mkN047 "линия"  ;
	list_N = mkN014 "списък"  ;
	little_A = mkA079 "грозен" ;
	logarithm_N = mkN009 "логаритъм"  ;
	lower_A = mkA079 "грозен" ;
	matrix_N = mkN041 "матрица"  ;
	maximal_A = mkA079 "максимален" ;
	mean_N = mkN054 "нещо" ;
	median_N = mkN041 "медиана" ;
	middle_A = mkA079 "грозен" ;
	minimal_A = mkA079 "грозен" ;
	mode_N = mkN054 "нещо" ;
	moment_N = mkN007 "момент"  ;
	multiple_N = mkN054 "нещо" ;
	natural_A = mkA079 "грозен" ;
	negate_V2 = dirV2 (stateV (mkV173 "правя")) ;
	negative_N = mkN054 "нещо" ;
	node_N = mkN054 "нещо" ;
	number_N = mkN054 "число"  ;
	octal_A = mkA079 "осмичен"  ;
	open_A = mkA076 "отворен"  ;
	part_N = mkN049 "част"  ;
	partial_A = mkA079 "частен"  ;
	point_N = mkN041 "точка"  ;
	polar_A = mkA079 "полярен"  ;
	polynomial_N = mkN054 "нещо" ;
	positive_A = mkA079 "положителен"  ;
	power_N = mkN049 "мощност"  ;
	prime_A = mkA076 "прост"  ;
	primitive_N = mkN007 "примитив"  ;
	product_N = mkN072 "произведение"  ;
	proper_A = mkA079 "грозен" ;
	proposition_N = mkN072 "твърдение"  ;
	prove_V = stateV (mkV173 "правя") ;
	quotient_N = mkN062 "частно"  ;
	raise_V = stateV (mkV173 "правя") ;
	range_N = mkN007 "диапазон"  ;
	rational_A = mkA079 "рационален"  ;
	real_A = mkA079 "реален"  ;
	relation_N = mkN047 "релация"  ;
	remainder_N = mkN014 "остатък"  ;
	right_N = mkN054 "нещо" ;
	ring_N = mkN007 "пръстен"  ;
	root_N = mkN007 "корен"  ;
	rounding_N = mkN071 "закръгляване"  ;
	row_N = mkN001 "ред"  ;
	rule_N = mkN054 "правило"  ;
	scalar_A = mkA079 "скаларен"  ;
	secant_N = mkN007 "секанс"  ;
	select_V = actionV (mkV186 "избирам") (mkV170 "избера")  ;
	set_N = mkN054 "множество"  ;
	show_V = stateV (mkV173 "правя") ;
	side_N = mkN041 "страна"  ;
	sine_N = mkN007 "синус"  ;
	single_A = mkA079 "единствен" ; 
	simplify_V2 = dirV2 (stateV (mkV173 "правя")) ;
	size_N = mkN007 "размер"  ;
	solve_V2 = dirV2 (stateV (mkV173 "правя")) ;
	square_A = mkA079 "квадратен"  ;
	square_N = mkN007 "квадрат"  ;
	standard_A = mkA079 "стандартен"  ;
	sum_N = mkN041 "сума"  ;
	summation_N = mkN071 "сумиране"  ;
	tangent_N = mkN007 "тангенс"  ;
	tend_V = stateV (mkV173 "правя") ;
	transpose_N = mkN054 "нещо" ;
	transpose_V2 = dirV2 (stateV (mkV173 "правя")) ;
	true_A = mkA079 "истинен"  ;
	truncation_N = mkN071 "отрязване"  ;
	typical_A = mkA079 "типичен"  ;
	union_N = mkN072 "обединение"  ;
	variance_N = mkN054 "нещо" ;
	value_N = mkN049 "стойност"  ;
	vector_N = mkN007 "вектор"  ;
	vectorial_A = mkA079 "векторен"  ;
	zero_N = mkN041 "нула"  ;
	
oper
	add_V3 = dirV3 (stateV (mkV173 "правя")) to_Prep   ;
    assume_VS = mkVS (stateV (mkV173 "правя")) ;  -- KA to fix it
	decide_VQ = mkVQ decide_V  ;
	determine_V2 = dirV2 determine_V ;
	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = dirV2 differentiate_V  ;
	differentiate_V3 = dirV3 differentiate_V respect_to_Prep   ;
	disprove_VS = mkVS disprove_V  ;
	divide_V2 = prepV2 divide_V to_Prep   ;
	divide_V3 = dirV3 divide_V by_Prep   ;
	equal_A2 = mkA2 equal_A to_Prep   ;
	equivalent_A2 = mkA2 equivalent_A (mkPrep "на" R.Acc) ;
	hold_for_V2 = prepV2 (stateV (mkV176 "важа")) for_Prep   ;
	integrate_V2 = dirV2 integrate_V ;
	integrate_V3 = dirV3 integrate_V respect_to_Prep   ;
	multiply_V3 = dirV3 (stateV (mkV173 "правя")) by_Prep   ;
	prove_VS = mkVS prove_V   ;
	show_VS = mkVS show_V   ;
	subtract_V3 = dirV3 (stateV (mkV173 "правя")) from_Prep   ;
	raise_V2 = dirV2 (stateV (mkV173 "правя")) ;
	raise_V3 = dirV3 raise_V to_Prep   ;
        range_V2 = prepV2 (stateV (mkV186 "варирам")) (mkPrep "в" R.Acc);
        range_V3 = mkV3 (stateV (mkV186 "варирам")) (mkPrep "от" R.Acc) (mkPrep "до" R.Acc);
	tend_V2 = prepV2 tend_V to_Prep   ;
	true_S = truthvalue "true"  ;
	false_S = truthvalue "false"   ;
	pi_NP = mkNP (mkPN "пи" R.Neut) ;
	imaginary_NP = mkNP (mkPN "i" R.Neut) ;
	
e_NP = mkNP (mkPN "e" R.Neut) ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; lock_Subj= <>} ;
	--mkSubjConj : Str -> Subj = \s -> {s= s; lock_Subj= <>} ;
	at_Prep = mkPrep "от" R.Acc ;
	over_Prep = mkPrep "???????" R.Acc ;
	respect_to_Prep = mkPrep "???????" R.Acc ;
	as_Subj = mkSubjInd "as" ;
	suchthat_Subj = mkSubjInd ["such that"] ;
	where_Subj = lin Subj (ss "където") ;
	about_Prep = mkPrep "???????" R.Acc ;

        plus_Conj     = {s=[]; conj=False; distr=False; n = R.Sg} ; --ss "plus" ;  
	times_Conj    = {s=[]; conj=False; distr=False; n = R.Sg} ; --ss "times" ;   
	intersection_Conj     = {s=[]; conj=False; distr=False; n = R.Sg} ; --ss "intersection" ; 
	union_Conj    = {s=[]; conj=False; distr=False; n = R.Sg} ; --ss "union" ;
	minus_Conj    = {s=[]; conj=False; distr=False; n = R.Sg} ; --ss "minus" ;


--2: Other
oper
	makeN3 : N -> N3		= \noun -> prepN3 noun from_Prep to_Prep ;
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\nf => arc + sin.s!nf ; g= sin.g ; lock_N=<> } ;
	two = n2_Numeral ;
	byLeft_Adv : Adv		= by_AdvN left_N ;
	byRight_Adv : Adv		= by_AdvN right_N ;
	byBothSides_Adv : Adv	= by_AdvCN two side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (mkN054 "нещо") ;
	radix_CN = mkCN (mkN054 "нещо") ; 
	half_open_A = mkA079 "грозен" ;
	half_closed_A = mkA079 "грозен" ;

} 
