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

instance LexiconSpa of Lexicon =  LexiconX - [select_V3, inverse_number_CN, ceiling_CN, floor_CN, function_N3]
with
	(Syntax = SyntaxSpa), 
	(Symbolic = SymbolicSpa), 
        (Symbol = SymbolSpa),
	(Question = QuestionSpa)
** open
	ParadigmsSpa,
	IrregSpa,
	(B = BeschSpa),
	(CR = CommonRomance),
        (X = ConstructX)
in {
flags
	coding = utf8 ;
oper
	regMas : Str -> N 	  = \s -> mkN s masculine ;
	regFem : Str -> N 	  = \s -> mkN s feminine ; 
	regFem2 : Str -> Str -> N = \s1,s2 -> mkN s1 s2 feminine ;

--2: Atomic lexicon
oper
	abelian_A		= mkA "abeliano" ; 
	absolute_A		= mkA"absoluto" ;
	accuracy_N = regFem "precisión" ;
	additive_A		= mkA"aditivo" ;
	approximate_A		= mkA "aproximado" ;
	approximately_AdA	= mkAdA "aproximadamente" ;
	argument_N		= regMas "argumento" ;
      	assign_V		= mkV "asignar" ;
        assigned_A   		= regA "asignado" ;
	block_N                 = regMas "bloque" ;
	base_N			= regFem "base" ;
	binary_A		= mkA"binario" ;
	bound_N			= regFem "cota" ;
	calculate_V2		= mkV2 "calcular" ;
	cartesian_A		= mkA "cartesiano" ;
	ceiling_N		= regMas "redondeo" ;
	center_N		= regMas "centro" ;
	class_N			= regFem "clase" ;
	closed_A		= mkA"cerrado" ;
	coefficient_N		= regMas "coeficiente" ;
	collinear_A		= mkA"colineal" ;
	column_N		= regFem "columna" ;
	common_A		= mkA "común" "común" "comunes" "comunes" "comunmente" ;
	complex_A		= mkA"complejo" ;
	component_N		= regFem "componente" ;
	composition_N		= regFem2 "composición" "composiciones" ;
	compute_V2		= mkV2 "calcular" ;
	configuration_N 	= regFem2 "configuración" "configuraciones" ;
	conjugate_N		= regFem "conjugada" ;
	constant_A		= mkA"constante" ;
	constant_N		= regFem "constante" ;
	continuous_A		= mkA"continuo" ;
	coordinate_N		= regFem "coordenada" ;
	cotangent_N		= regFem "cotangente" ;
	cosecant_N		= regFem "cosecante" ;
	cosine_N		= regMas "coseno" ;
	cube_N			= regMas "cubo" ;
	cubic_A			= mkA"cúbico" ;
	curl_N			= regMas "rotacional" ;
	cyclic_A		= mkA"cíclico" ;
	decide_V		= mkV "decidir" ;
	decimal_A		= mkA"decimal" ;
	define_V2		= mkV2 "definir" ;
	degree_N		= regMas "grado" ;
	derivative_N		= regFem "derivada" ;
	determinant_N		= regMas "determinante" ;
	determine_V		= mkV "determinar" ;
	deviation_N		= regFem2 "desviación" "desviaciones" ;
	diagonal_A		= mkA"diagonal" ;
	difference_N		= regFem "diferencia" ;
	differentiate_V 	= mkV "derivar" ;
	digit_N 		= regFem "cifra" ;
	direct_A		= mkA "directo" ;
	disprove_V		= mkV "refutar" ;
	divergence_N		= regFem "divergencia" ;
	divide_V		= mkV "dividir" ;
	division_N		= regFem2 "división" "divisones" ;
	divisor_N		= regMas "divisor" ;
	domain_N		= regMas "dominio" ;
	element_N		= regMas "elemento" ;
        end_V 			= verboV (B.salir_73 "salir") ;
	empty_A			= mkA"vacío" ;
	equal_A			= mkA"igual" ;
	equivalent_A	        = mkA"equivalente" ;
	evaluate_V2		= mkV2 "evaluar" ;
	exponential_N		= regFem "exponencial" ;
	exterior_A		= mkA"exterior" ;
	fact_N			= regMas "hecho" ;
	factor_N		= regMas "factor" ;
	factorial_N		= regMas "factorial" ;
	find_V2			= mkV2 encontrar_V ;
	floor_N			= regMas "redondeo" ;
	form_N			= regFem "forma" ;
	fraction_N		= regFem2 "fracción" "fracciones" ;
	function_N		= regFem2 "función" "funciones" ;
	gamma_N			= regFem "gama" ;
	gamma_PN		= mkPN "Gama" ;
	gradient_N		= regMas "gradiente" ;
	give_V			= dar_V ;
	great_A			= mkA (mkA "grande") (mkA "mayor") ;
	greatest_A		= mkA"máximo" ;
	group_N			= regMas "grupo" ;
	hexadecimal_A		= mkA"hexadecimal" ;
	hyperbolic_A		= mkA"hiperbólico" ;
	hold_V			= reflV (mkV "satisfacer") ;
	identity_N		= regFem "identidad" ;
	imaginary_A		= mkA"imaginario" ; 
	incident_A		= mkA "incidente" ;
	infinity_PN		= mkPN "infinito" ;
	infinity_minus_N	= regMas ["menos infinito"] ;
	infinity_minus_PN 	= mkPN ["menos Infinito"] ;
	integer_A		= mkA"entero" ;
	integral_N		= regFem "integral" ;
	integrate_V		= mkV "integrar" ;
	interior_A		= mkA"interior" ;
	intersection_N		= regFem2 "intersección" "intersecciones" ;
	interval_N		= regMas "intervalo" ;
	inverse_A		= mkA"inverso" ;
	inverse_N		= regFem "inversa" ;
	invert_V2		= mkV2 "invertir" ;
	iterated_A		= mkA"iterado" ;
	laplacian_N		= regMas "laplaciano" ;
	least_A			= mkA"mínimo" ;
	small_A			= mkA (mkA "pequeño") (mkA "menor") ;
	left_N			= regFem "izquierda" ;
	limit_N			= regMas "límite" ;
	line_N			= regFem "recta" ;
	list_N			= regFem "lista" ;
	little_A		= mkA (mkA "pequeño") (mkA "menor") ;
	logarithm_N		= regMas "logaritmo" ;
	lower_A			= mkA"inferior" ;
	matrix_N		= regFem "matriz" ;
	maximal_A		= mkA"máximo" ;
	mean_N			= regFem "media" ;
	median_N		= regFem "mediana" ;
	middle_A		= mkA "medio" ;
	minimal_A		= mkA"mínimo" ;
	mode_N			= regFem "moda" ;
	moment_N		= regMas "momento" ;
	multiple_N		= regMas "múltiplo" ;
	natural_A		= mkA"natural" ;
	negate_V2		= mkV2 negar_V ;
	negative_N		= regMas "opuesto" ;
	node_N			= regMas "nodo" ;
	number_N		= regMas "número" ;
	octal_A			= mkA"octal" ;
	open_A			= mkA"abierto" ;
	part_N			= regFem "parte" ;
	partial_A		= mkA"parcial" ;
	place_N 		= regFem "cifra" ;
	point_N			= regMas "punto" ;
	polar_A			= mkA"polar" ;
	polynomial_N		= regMas "polinomio" ;
	positive_A		= mkA "positivo" ;
	power_N			= regFem "potencia" ;
	prime_A			= mkA"primo" ;
	primitive_N		= regFem "primitiva" ;
	product_N		= regMas "producto" ;
	proper_A		= mkA"propio" ;
	proposition_N		= regFem2 "proposición" "proposiciones" ;
	prove_V			= demostrar_V ;
	quotient_N		= regMas "cociente" ;
	raise_V			= mkV "elevar" ;
	rational_A		= mkA "racional" ;
	real_A			= mkA "real" ;
	relation_N		= regFem2 "relación" "relaciones" ;
	remainder_N		= regMas (variants { "resto" ; "residuo" }) ;
	range_N			= variants{regFem "imagen" ; regMas "recorrido"} ;
	right_N			= regFem "derecha" ;
	ring_N			= regMas "anillo" ; 
	root_N			= regFem "raíz" ;
	rounding_N		= regMas "redondeo" ;
	row_N			= regFem "fila" ;
	rule_N			= regFem "regla" ;
	scalar_A		= mkA "escalar" ;
	secant_N		= regFem "secante" ;
	select_V		= mkV "seleccionar" ;
	set_N			= regMas "conjunto" ;
	show_V			= mostrar_V ;
	side_N			= regMas "lado" ;
	sine_N			= regMas "seno" ;
        single_A                = prefA (mkA "único") ;
	simplify_V2		= mkV2 "simplificar" ;
	size_N			= regMas "cardinal" ;
	solve_V2		= mkV2 resolver_V ;
	square_A		= mkA "cuadrado" ;
	square_N		= regMas "cuadrado" ;
	standard_A		= mkA "estándar" "estándar" "estándar" "estándar" "estándarmente";
	sum_N			= regFem "suma" ;
	summation_N		= regMas "sumatorio" ;
	tangent_N		= regFem "tangente" ;
	tend_V			= tender_V ;
	transpose_N		= regFem "transpuesta" ;
	transpose_V2		= mkV2 trasponer_V ;
	true_A			= mkA"verdadero" ;
	truncation_N		= regMas "truncamiento" ;
	typical_A		= mkA "típico" ;
	union_N			= regFem2 "unión" "uniones" ;
	variance_N		= regFem "varianza" ;
	valer_V			= mkV "valer" ;
	value_N			= regMas "valor" ;
	vector_N		= regMas "vector" ;
	vectorial_A		= mkA "vectorial" ;
	zero_N			= regMas "cero" ;
	
oper
	add_V3			= dirV3 (mkV "sumar") to_Prep ;
        approximate_V2          = mkV2 "aproximar" ;
	assign_V3 		= dirV3 assign_V to_Prep ;
	assigned_A2             = mkA2 assigned_A to_Prep  ;
	assume_VS		= mkVS suponer_V ;
        begin_V2 : V2 		= mkV2 (mkV "iniciar") ;  
	compounded_A2    	= mkA2 (mkA "compuesto") by8agent_Prep ;
	decide_VQ		= mkVQ decide_V  ; 
	determine_V2	        = mkV2 determine_V ;
	determine_VQ     	= mkVQ determine_V ;
	differentiate_V2        = mkV2 differentiate_V ;
	differentiate_V3        = dirV3 differentiate_V respect_to_Prep ;
	disprove_VS		= mkVS disprove_V ;
	divide_V2		= mkV2 divide_V to_Prep ;
	divide_V3		= dirV3 divide_V by_Prep ;
 	equal_A2		= mkA2 equal_A to_Prep ;
	equivalent_A2      	= mkA2 equivalent_A to_Prep ;
	hold_for_V2		= mkV2 hold_V for_Prep ;
	integrate_V2	        = mkV2 integrate_V ;
	integrate_V3	        = dirV3 integrate_V respect_to_Prep ;
	intersect_V3 		= dirV3 (mkV "intersecar") with_Prep ;	
	multiply_V3		= dirV3 (mkV "multiplicar") by_Prep ;
	prove_VS		= mkVS prove_V ;
	select_V3		= dirdirV3 select_V ;
	show_VS			= mkVS show_V ;
	subtract_V3		= dirV3 (mkV "restar") to_Prep ; --from_Prep
	raise_V2		= mkV2 raise_V ;
	raise_V3		= dirV3 raise_V to_Prep ;
   	range_V2       		= mkV2 (mkV "variar") in_Prep ; 
	range_V3 	        = mkV3 (mkV "variar") (mkPrep "desde") (mkPrep "hasta") ;
	tend_V2			= mkV2 tend_V to_Prep ;
	unite_V3 		= dirV3 (mkV "unir") to_Prep ;

	true_S			= truthvalue "verdadero" ;
	false_S			= truthvalue "falso" ;
	valer_V2		= mkV2 valer_V ;  --to be worth

--2: Structural
oper
	mkSubjInd : Str -> Subj  = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep			= mkPrep "en" ;
	over_Prep		= mkPrep "sobre" ;
	respect_to_Prep		= mkPrep ["con respecto a"] ;
	as_Subj			= mkSubjInd "cuando" ; 
        suchthat_Subj		= mkSubjConj ["tal que"] ; 
	where_Subj		= mkSubjInd "donde" ; 
	about_Prep	        = mkPrep ["cerca de"] ;
        till_Prep  		= mkPrep "hasta" ;
	from2_Prep 		= mkPrep "desde" ;
{-
	plus_Prep     		= mkPrep "más" ;
	times_Prep    		= mkPrep "por" ;
	intersection_Prep       = mkPrep "intersección" ;
	union_Prep    		= mkPrep "unión" ;
	minus_Prep 		= mkPrep "menos" ;	
-}

        plus_Conj     = {s1 = [] ; s2 = "más" ; n = CR.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "por" ; n = CR.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "intersección" ; n = CR.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "unión" ; n = CR.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "menos" ; n = CR.Sg} ;


--2: Other
oper
	makeN3 : N -> N3	= \noun -> mkN3 noun genitive dative ;
	arc : N -> CN		= mkCNprefix "arco" ;
	preACN : A -> CN -> CN	= \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N
				= \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; lock_N=<> } ;
	dos 			= n2_Numeral ;

	--byLeft_Adv : Adv	= by_AdvN left_N ;
	--byRight_Adv : Adv	= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;

	byLeft : CN -> CN 	= \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN	= \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN 	= \cn -> mkCN cn (by_AdvCN dos side_CN ) ;

	standard_deviation_CN 	= mkCN typical_A deviation_N ;
	not_a_number_CN		= mkCN (regMas "no-número") ;
	radix_CN 		= mkCN base_N ; 

        inverse_number_CN 	= mkCN (regMas "inverso") ;

        ceiling_CN 		= mkCN ceiling_N (X.mkAdv ["hacia arriba"]);
        floor_CN 		= mkCN floor_N (X.mkAdv ["hacia abajo"]);

	function_N3 : N3 	= mkN3 function_N from2_Prep till_Prep ;  

	assigned_to : NP -> AP	= mkAP assigned_A2 ;
} ;
