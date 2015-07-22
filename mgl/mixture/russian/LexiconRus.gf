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

instance LexiconRus of Lexicon =  LexiconX - [select_V3,right_inverse_function_CN,right_composition_CN,primitive_CN,pi_NP,negative_CN,primitive_CN,left_inverse_function_CN, left_composition_CN, imaginary_NP, e_NP, exponential_CN]
with
	(Syntax = SyntaxRus), 
	(Symbolic = SymbolicRus), 
	(Symbol = SymbolRus),
    (Question = QuestionRus),
	(Structural = StructuralRus)
** open
	Prelude,
	ParadigmsRus,
	MorphoRus,
	ExtraRus,
	(R = ResRus)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = mkA "абелевый" ;
	absolute_A = mkA "абсолютный" ;
	additive_A = mkA "аддитивный"  ; 
	approximate_A = mkA "приближенный" ;
	approximately_AdA = ss "приблизительно" ;
	binary_A = mkA "бинарный"  ;
	cartesian_A = mkA "декартовый";
	closed_A = mkA "замкнутый"  ;
	collinear_A = mkA "коллинеарный" ;
	common_A = mkA "общий" ;
	complex_A = mkA "комплексный"  ;
	constant_A = mkA "постоянный"  ;
	continuous_A = mkA "непрерывный"  ;
	cubic_A = mkA "кубический"  ;
	cyclic_A = mkA "циклический"  ;
	decimal_A = mkA "десятичный"  ;
	diagonal_A = mkA "диагональный"  ;
	direct_A = mkA "прямой"  ;
	empty_A = mkA "пустой" ;
	equal_A = mkA "равный" ;
	equivalent_A = mkA "эквивалентный" ;
	exterior_A = mkA "внешний"  ;
	gamma_PN = mkPN "гамма" Fem Sg Inanimate ;
	great_A = mkA "большой" "больше" ;
	greatest_A = mkA "наибольший"  ;
	hexadecimal_A = mkA "шестнадцатеричный"  ;
	hyperbolic_A = mkA "гиперболический"  ;
	imaginary_A = mkA "мнимый"  ;
	incident_A = mkA "инцидентный"  ;
	infinity_PN = mkN "бесконечность" ;
	infinity_minus_PN = mkN "минус бесконечность" ;
	integer_A = mkA "целый"  ;
	interior_A = mkA "внутренний"  ;
	inverse_A = mkA "обратный"  ;
	iterated_A = mkA "повторяемый"  ;
	least_A = mkA "наименьший"  ;
	small_A = mkA "малый" "меньше"  ;
	little_A = mkA "малый"  ; 
	lower_A = mkA "нижний"  ;
	maximal_A = mkA "максимальный"  ;
	middle_A = mkA "средний"  ;
	minimal_A = mkA "минимальный"  ;
	natural_A = mkA "натуральный"  ;
	octal_A = mkA "восьмеричный"  ;
	open_A = mkA "открытый"  ;
	partial_A = mkA "частный"  ;
	polar_A = mkA "полярный"  ;
	positive_A = mkA "положительный"  ;
	prime_A = mkA "простой"  ;
	proper_A = mkA "свойственный"  ;
	rational_A = mkA "рациональный"  ;
	real_A = mkA "вещественный"  ;
	scalar_A = mkA "скалярный"  ;
	single_A = mkA "единственный"  ;
	square_A = mkA "квадратный"  ;
	standard_A = mkA "стандартный"  ;
	true_A = mkA "истинный"  ;
	typical_A = mkA "типичный"  ;
	vectorial_A = mkA "векторный"  ;

oper
        argument_N = mkN "аргумент" ;
        base_N = mkN "основание" ;
        bound_N = mkN "граница" ;
        ceiling_N = mkN "потолок" ;
        center_N = mkN "центр" ;
        class_N = mkN "класс" ;
        coefficient_N = mkN "коэффициент" ;
        column_N = mkN "колонка" ;
        component_N = mkN "компонент" ;
        composition_N = mkN "композиция" ;
        configuration_N = mkN "конфигурация" ;
        conjugate_N = mkN "спряжение" ;
        constant_N = mkN "константа" ;
        coordinate_N = mkN "координата" ;
        cotangent_N = mkN "контангенс" ;
        cosecant_N = mkN "косеканс" ;
        cosine_N = mkN "косинус" ;
        cube_N = mkN "куб" ;
        curl_N = mkN "кривая" ;
        degree_N = mkN "степень" ;
        derivative_N = mkN "производная" ;
        determinant_N = mkN "определитель" ;
        deviation_N = mkN "отклонение" ;
        difference_N = mkN "разница" ;
        divergence_N = mkN "дивергенция" ;
        division_N = mkN "деление" ;
        divisor_N = mkN "делитель" ;
        domain_N = mkN "область" ;
        element_N = mkN "элемент" ;
        fact_N = mkN "факт" ;
        factor_N = mkN "множитель" ;
        factorial_N = mkN "факториал" ;
        floor_N = mkN "пол" ;
        form_N = mkN "форма" ;
        fraction_N = mkN "дробь" ;
        function_N = mkN "функция" ;
        gamma_N = mkN "гамма" ;
        gradient_N = mkN "градиент" ;
        group_N = mkN "группа" ;
        identity_N = mkN "идентичность" ;
        integral_N = mkN "интеграл" ;
        intersection_N = mkN "пересечение" ;
        interval_N = mkN "интервал" ;
        inverse_N = mkN "противоположность" ;
        laplacian_N = mkN "лапласиан" ;
        left_N = mkN "левое" ;
        limit_N = mkN "предел" ;
        line_N = mkN "линия" ;
        list_N = mkN "список" ;
        logarithm_N = mkN "логарифм" ;
        matrix_N = mkN "матрица" ;
        mean_N = mkN "среднее" ;
        median_N = mkN "медиана" ;
        mode_N = mkN "режим" ;
        moment_N = mkN "момент" ;
        multiple_N = mkN "множитель" ;
        node_N = mkN "вершина" ;
        number_N = mkN "число" ;
        part_N = mkN "часть" ;
        point_N = mkN "точка" ;
        polynomial_N = mkN "многочлен" ;
        power_N = mkN "степень" ;
        product_N = mkN "произведение" ;
        proposition_N = mkN "высказывание" ;
        quotient_N = mkN "частное" ;
        range_N = mkN "диапазон" ;
        relation_N = mkN "отношение" ;
        remainder_N = mkN "остаток" ;
        right_N = mkN "правое" ;
        ring_N = mkN "кольцо" ;
        root_N = mkN "корень" ;
        rounding_N = mkN "округление" ;
        row_N = mkN "ряд" ;
        rule_N = mkN "правило" ;
        secant_N = mkN "секанс" ;
        set_N = mkN "множество" ;
        side_N = mkN "сторона" ;
        sine_N = mkN "синус" ;
        size_N = mkN "размер" ;
        square_N = mkN "квадрат" ;
        sum_N = mkN "сумма" ;
        summation_N = mkN "сложение" ;
        tangent_N = mkN "тангенс" ;
        transpose_N = mkN "транспозиция" ;
        truncation_N = mkN "округление" ;
        union_N = mkN "объединение" ;
        variance_N = mkN "колебание" ;
        value_N = mkN "значение" ;
        vector_N = mkN "вектор" ;
        zero_N = mkN "нуль" ;

	
oper
	equal_A2 = mkA2 equal_A "" Dat  ;
	equivalent_A2 = mkA2 equivalent_A "" Dat  ;
	true_S = truthvalue "истина" ;
	false_S = truthvalue "ложь"  ;

--2: Structural
oper
	at_Prep = lin Prep (mkPrep "на" Inst)  ; 
	over_Prep = lin Prep (mkPrep "на" Inst)  ;
	respect_to_Prep = lin Prep (mkPrep ["по отношению к"] Acc)  ;
	as_Subj = lin Subj (ss "как")  ;
	suchthat_Subj = lin Subj (ss ["такой , как"])  ; -- FIXME
	where_Subj = lin Subj (ss "где")  ;
	about_Prep = lin Prep (mkPrep "о" (Prepos PrepOther)) ;

        plus_Conj     = {s1 = [] ; s2 = "plus" ; n = R.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "times" ; n = R.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "intersection" ; n = R.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "union" ; n = R.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "minus" ; n = R.Sg} ;

--2: Other
oper
	prefixN :  Str -> N -> N        = \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; anim = sin.anim ; lock_N=<> } ;		
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep to_Prep ;
	arc : N -> CN	= mkCNprefix "арк" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	-- byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	not_a_number_CN	= mkCN (mkN "не число") ; ---TODO
--
	radix_CN = mkCN base_N ; 

	calculate_V2 = dirV2 (regV imperfective first "вычисля" "ю" "вычислял" "вычисляй" "вычислять") ;
	compute_V2 = dirV2 (regV imperfective first "вычисля" "ю" "вычислял" "вычисляй" "вычислять") ;
	decide_V = dirV2 (regV imperfective first "реша" "ю" "решал" "решай" "решать") ;
	define_V2 = dirV2 (regV imperfective first "определя" "ю" "определял" "определяй" "определять") ;

	determine_V = regV imperfective first "определя" "ю" "определял" "определяй" "определять" ;
	differentiate_V = regV imperfective first "дифференциру" "ю" "дифференцировал" "дифференцируй" "дифференцировать" ;
	disprove_V = regV imperfective first "дифференциру" "ю" "дифференцировал" "дифференцируй" "дифференцировать" ;
	divide_V = regV imperfective second "дел" "ю" "делил" "дели" "делить" ;
	evaluate_V2 = dirV2 (regV imperfective first "вычисля" "ю" "вычислял" "вычисляй" "вычислять") ;
	find_V2 = dirV2 (regV imperfective second "нахож" "у" "находил" "находи" "находить") ;
	give_V = regV imperfective first "да" "ю" "давал" "дай" "давать" ;
	--hold_V = dirV2 (mkV "określić" conj53 "określać" conj53); 
	integrate_V = regV imperfective first "интегриру" "ю" "интегрировал" "интегрируй" "интегрировать" ;
	invert_V2 = dirV2 (regV imperfective first "инвертиру" "ю" "инвертировал" "инвертируй" "инвертировать") ;
	negate_V2 = dirV2 (regV imperfective first "отрица" "ю" "отрицал" "отрицай" "отрицать") ;
	range_V2 =  mkV2 (regV imperfective first "изменя" "ю" "изменял" "изменяй" "изменять") "по" Dat ;
	prove_V = regV imperfective first "доказыва" "ю" "доказывал" "доказывай" "доказывать" ;
	raise_V = regV imperfective second "повыша" "ю" "повышал" "повышай" "повышать" ;
	select_V = regV imperfective second "выбира" "ю" "выбирал" "выбирай" "выбирать" ;
	show_V = regV imperfective second "показыва" "ю" "показывал" "показывал" "показывать" ;
	simplify_V2 = dirV2 (regV imperfective second "упроща" "ю" "упрощал" "упрощай" "упрощать") ;
	solve_V2 = dirV2 (regV imperfective second "реша" "ю" "решал" "решай" "решать") ;
	tend_V = regV imperfective second "стрем" "люсь" "стремился" "стремись" "стремиться" ;
	transpose_V2 = dirV2 (regV imperfective second "транспониру" "ю" "транспонировал" "транспонируй" "транспонировать") ;
	add_V3 = mkV3 (regV imperfective second "складыва" "ю" "складывал" "складывай" "складывать") "" "с" Acc Inst ;
	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V "как" Acc ;
	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = dirV2 differentiate_V ;
	differentiate_V3 = mkV3 differentiate_V "" "по" Acc Dat ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = dirV2 divide_V ;
	divide_V3 = mkV3 divide_V "" "на" Acc Acc ;
	hold_for_V2 = mkV2 (regV imperfective second "выполня" "юсь" "выполнялся" "выполняйся" "выполняться") "для" Gen;
	range_V3 = mkV3 (regV imperfective first "изменя" "ю" "изменял" "изменяй" "изменять") "от" "до" Gen Gen ;
	integrate_V2 = dirV2 integrate_V ;
	integrate_V3 = mkV3 integrate_V "" "по" Acc Dat ;
	multiply_V3 = regV imperfective second "умножа" "ю" "умножал" "умножай" "умножать" ;
	assume_VS = regV imperfective second "предполага" "ю" "предполагал" "предплагай" "предполагать" ;
	prove_VS = mkVS prove_V ;
	show_VS =  mkVS show_V ;
	subtract_V3 = regV imperfective second "вычита" "ю" "вычитал" "вычитай" "вычитать" ;

	select_V3 = mkV3 select_V "" "из" Acc Gen ;
	tend_V2 = mkV2 tend_V "к" Dat ;

	right_inverse_function_CN = mod (mkA "левый") (inverse_N);
	left_inverse_function_CN =  mod (mkA "правый") (inverse_N);
	right_composition_CN = mod (mkA "правый") (composition_N);
	left_composition_CN = mod (mkA "левый") (composition_N);
	pi_NP = mkNP (mkN "Пи");
	negative_CN = mkCN (mkAP (mkA "отрицательный")) (mkCN number_N);
	imaginary_NP = mkNP (mkN "i");
	e_NP = mkNP (mkN "e") ;
	primitive_CN = mkCN (mkAP (mkA "примитивный")) (mkCN value_N);
	exponential_CN = mkCN (mkAP (mkA "экспоненциальный")) (mkCN function_N);

  	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;

}
