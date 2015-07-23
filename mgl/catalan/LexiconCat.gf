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

instance LexiconCat of Lexicon =  LexiconX - [select_V3]
with
	(Syntax = SyntaxCat),
	(Symbolic = SymbolicCat), 
	(Symbol = SymbolCat),
	(Question = QuestionCat)
** open
	ParadigmsCat,
	(B = BeschCat),
	(CR = CommonRomance)
in {
flags
	coding = utf8 ;

oper
	select_V3	= dirdirV3 select_V ;

oper
	regMas : Str -> N = \s -> mkN s masculine ;
	regFem : Str -> N = \s -> mkN s feminine ; 
	regFem2 : Str -> Str -> N = \s1,s2 -> mkN s1 s2 feminine ;
	

oper
	abelian_A		= mkA "abelià" "abeliana" "abelians" "abelianes" "abelianament" ; 
	absolute_A		= regA "absolut" ; 
	accuracy_N 		= regFem "precisió" ; 
	additive_A		= mkA "additiu" "additiva" "additius" "additives" "additivament" ; 
	approximate_A	= mkA "aproximat" "aproximada" "aproximats" "aproximades" "aproximadament" ; 
	approximately_AdA = mkAdA "aproximadament" ;
	argument_N		= regMas "argument" ; 
      	assign_V		= mkV "assignar" ;
        assigned_A   		= regA "assignat" ;
	block_N                 = regMas "bloc" ;
	base_N			= regFem "base" ; 
	binary_A		= mkA "binari" "binària" "binaris" "binàries" "binàriament" ; 
	bound_N			= regFem "fita" ; 
	calculate_V2		= mkV2 "calcular" ;
	cartesian_A		= mkA "cartesià" "cartesiana" "cartesians" "cartesianes" "cartesianament" ; 
	ceiling_N		= (variants { regMas "sostre" ; regFem ["part entera superior"] }) ;
	center_N		= regMas "centre" ; 
	class_N			= regFem "classe" ; 
	closed_A		= mkA "tancat" "tancada" "tancats" "tancades" "tancadament" ; 
	coefficient_N		= regMas "coeficient" ; 
	collinear_A		= mkA "colineal" "colineal" "colineals" "colineals" "colinealment" ; 
	column_N		= regFem "columna" ; 
	common_A		= mkA "comú" "comuna" "comuns" "comunes" "comunment" ; 
	complex_A		= mkA "complex" "complexa" "complexos"  "complexes" "complexament" ;
	component_N		= regFem "component" ; 
	composition_N		= regFem "composició" ; 
	compute_V2		= mkV2 "calcular" ; 
	configuration_N 	= regFem "configuració" ; 
	conjugate_N		= regFem "conjugada" ; 
	constant_A		= mkA "constant" "constant" "constants" "constants" "constantment" ; 
	constant_N		= regFem "constant" ; 
	continuous_A		= mkA "continu" "contínua" "continus" "contínues" "contínuament" ; 
	coordinate_N		= regFem "coordenada" ; 
	cotangent_N		= regFem "cotangent" ; 
	cosecant_N		= regFem "cosecant" ; 
	cosine_N		= mkN "cosinus" "cosinus" masculine ; 
	cube_N			= regMas "cub" ; 
	cubic_A			= mkA "cúbic" "cúbica" "cúbics" "cúbiques" "cúbicament" ; 
	curl_N			= regMas "rotacional" ; 
	cyclic_A		= mkA "cíclic" "cíclica" "cíclics" "cícliques" "cíclicament" ; 
	decide_V		= mkV (B.servir_101 "decidir") ; 
	decimal_A		= mkA "decimal" "decimal" "decimals" "decimals" "decimalment" ; 
	define_V2		= mkV2 "definir" ; 
	degree_N		= regMas "grau" ; 
	derivative_N		= regFem "derivada" ; 
	determinant_N		= regMas "determinant" ; 
	determine_V		= regV "determinar" ; 
	deviation_N		= mkN "desviació" "desviacions" feminine ; 
	diagonal_A		= mkA "diagonal" "diagonal" "diagonals" "diagonals" "diagonalment" ; 
	difference_N		= regFem "diferència" ; 
	differentiate_V 	= mkV "derivar" ;
	digit_N 		= regFem "xifra";
	direct_A		= regA "directe" ; 
	disprove_V		= mkV "refutar" ; 
	divergence_N		= regFem "divergència" ; 
	divide_V		= mkV (B.servir_101 "dividir") ; 
	division_N		= regFem "divisió" ; 
	divisor_N		= regMas "divisor" ; 
	domain_N		= regMas "domini" ; 
	element_N		= regMas "element" ; 
	empty_A			= mkA "buit" "buida" "buits" "buides" "buidament" ; 
        end_V 			= mkV "surtir" ;  
	equal_A			= mkA "igual" "igual" "iguals" "iguals" "igualment" ; 
	equivalent_A		= mkA "equivalent" "equivalent" "equivalents" "equivalents" "equivalentment" ; 
	evaluate_V2		= mkV2 "avaluar" ; 
	exponential_N		= regFem "exponencial" ; 
	exterior_A		= mkA "exterior" "exterior" "exteriors" "exteriors" "exteriorment" ; 
	fact_N			= regMas "fet" ; 
	factor_N		= regMas "factor" ; 
	factorial_N		= regMas "factorial" ; 
	find_V2			= mkV2 "trobar" ; 
	floor_N			= (variants { regFem "terra" ; regFem ["part entera inferior"] }) ;
	form_N			= regFem "forma" ; 
	fraction_N		= regFem "fracció" ; 
	function_N		= regFem "funció" ; 
	gamma_N			= mkN "gamma" ; 
	gamma_PN		= mkPN "Gamma" ; 
	gradient_N		= regMas "gradient" ; 
	give_V			= mkV (B.donar_43 "donar") ; 
	great_A			= mkA "gran" "gran" "grans" "grans" "granment" ; 
	greatest_A		= regA "màxim" ; 
	group_N			= regMas "grup" ; 
	hexadecimal_A		= mkA "hexadecimal" "hexadecimal" "hexadecimals" "hexadecimals" "hexadecimalment" ; 
	hyperbolic_A		= mkA "hiperbòlic" "hiperbòlica" "hiperbòlics" "hiperbòliques" "hiperbòlicament" ; 
	hold_V			= reflV (mkV (B.desfer_39 "satisfer")) ; 
	identity_N		= regFem "identitat" ; 
	imaginary_A		= mkA "imaginari" "imaginària" "imaginaris" "imaginàries" "imaginàriament" ; 
	incident_A		= mkA "incident" "incident" "incidents" "incidents" "incidentment" ; 
	infinity_PN		= mkPN "Infinit" ; 
	infinity_minus_N 	= mkN ["menys infinit"] ; 
	infinity_minus_PN 	= mkPN ["menys Infinit"] ; 
	integer_A		= regA "enter" ; 
	integral_N		= regFem "integral" ; 
	integrate_V		= mkV "integrar" ; 
	interior_A		= mkA "interior" "interior" "interiors" "interiors" "interiorment" ; 
	intersection_N		= regFem "intersecció" ; 
	interval_N		= regMas "interval" ; 
	inverse_A		= mkA "invers" "inversa" "inversos" "inverses" "inversament" ; 
	inverse_N		= regFem "inversa" ; 
	invert_V2		= mkV2 (mkV (B.servir_101 "invertir")) ; 
	iterated_A		= mkA "iterat" "iterada" "iterats" "iterades" "iteradament" ; 
	laplacian_N		= regMas "laplacià" ; 
	least_A			= regA "mínim" ; 
	small_A			= mkA "petit" ; 
	left_N			= regFem "esquerra" ; 
	limit_N			= regMas "límit" ; 
	line_N			= regFem "recta" ; 
	list_N			= regFem "llista" ; 
	little_A		= regA "petit" ; 
	logarithm_N		= regMas "logaritme" ; 
	lower_A			= mkA "inferior" "inferior" "inferiors" "inferiors" "inferiorment" ; 
	matrix_N		= regFem "matriu" ; 
	maximal_A		= regA "màxim" ; 
	mean_N			= regFem "mitjana" ; 
	median_N		= regFem "mediana" ; 
	middle_A		= mkA "mig" "mitja" "mitjos" "mitges" "mitjanament" ; 
	minimal_A		= regA "mínim" ; 
	mode_N			= regFem "moda" ; 
	moment_N		= regMas "moment" ; 
	multiple_N		= mkN "múltiple" "múltiples" masculine ; 
	natural_A		= mkA "natural" "natural" "naturals" "naturals" "naturalment" ; 
	negate_V2		= mkV2 "negar" ; 
	negative_N		= regMas "oposat" ; 
	node_N			= regMas "node" ; 
	number_N		= regMas "número" ; 
	octal_A			= mkA "octal" "octal" "octals" "octals" "octalment" ; 
	open_A			= regA "obert" ; 
	part_N			= regFem "part" ; 
	partial_A		= mkA "parcial" "parcial" "parcials" "parcials" "parcialment" ; 
	place_N 		= regFem "xifra" ;
	point_N			= regMas "punt" ; 
	polar_A			= mkA "polar" "polar" "polars" "polars" "polarment" ; 
	polynomial_N		= regMas "polinomi" ; 
	positive_A		= mkA "positiu" "positiva" "positius" "positives" "positivament" ; 
	power_N			= regFem "potència" ; 
	prime_A			= regA "primer" ; 
	primitive_N		= regFem "primitiva" ; 
	product_N		= regMas "producte" ; 
	proper_A		= mkA "propi" "pròpia" "propis" "pròpies" "pròpiament" ; 
	proposition_N		= regFem "proposició" ; 
	prove_V			= mkV "demostrar" ; 
	quotient_N		= regMas "quocient" ; 
	raise_V			= regV "elevar" ; 
	rational_A		= mkA "racional" "racional" "racionals" "racionals" "racionalment" ; 
	real_A			= mkA "real" "real" "reals" "reals" "realment" ; 
	relation_N		= regFem "relació" ; 
	remainder_N		= variants {regFem "resta" ; regMas "residu"} ; 
	range_N			= variants{ regFem "imatge"; regMas "recorregut"} ; 
	right_N			= regFem "dreta" ; 
	ring_N			= regMas "anell" ; 
	root_N			= regFem "arrel" ; 
	rounding_N		= regMas "arrodoniment" ; 
	row_N			= regFem "fila" ; 
	rule_N			= regFem "regla" ; 
	scalar_A		= mkA "escalar" "escalar" "escalars" "escalars" "escalarment" ; 
	secant_N		= regFem "secant" ; 
	select_V		= regV "seleccionar" ; 
	set_N			= regMas "conjunt" ; 
	show_V			= mkV "mostrar" ; 
	side_N			= regMas "costat" ; 
	sine_N			= mkN "sinus" "sinus" masculine ; 
	single_A                = prefA (mkA "únic") ;
	simplify_V2		= mkV2 "simplificar" ; 
	size_N			= regMas "cardinal" ; 
	solve_V2		= mkV2 "resoldre" ; 
	square_A		= mkA "quadrat" "quadrada" "quadrats" "quadrades" "quadràticament" ; 
	square_N		= regMas "quadrat" ; 
	standard_A		= mkA "estàndard" "estàndard" "estàndards" "estàndards" "estàndardment" ; 
	sum_N			= regFem "suma" ; 
	summation_N		= mkN "sumatori" "sumatoris" masculine ; 
	tangent_N		= regFem "tangent" ; 
	tend_V			= mkV (B.servir_101 "tendir") ; 
	transpose_N		= regFem "transposada" ; 
	transpose_V2		= mkV2 "transposar" ; 
	true_A			= regA "cert" ; 
	truncation_N		= regMas "truncament" ; 
	typical_A		= mkA "típic" "típica" "típics" "típiques" "típicament" ; 
	union_N			= regFem "unió" ; 
	variance_N		= regFem "variància" ; 
	valer_V			= mkV (B.absoldre_1 "valdre") ;
	value_N			= regMas "valor" ; 
	vector_N		= regMas "vector" ; 
	vectorial_A		= mkA "vectorial" "vectorial" "vectorials" "vectorials" "vectorialment" ; 
	zero_N			= regMas "zero" ; 
	
oper
	add_V3			= dirV3 (mkV "sumar") to_Prep ;
        approximate_V2          = mkV2 "aproximar" ;
	assign_V3 		= dirV3 assign_V to_Prep ;
	assigned_A2             = mkA2 assigned_A to_Prep  ;
	assume_VS       	= mkVS (mkV "suposar") ;
        begin_V2 : V2 		= mkV2 (mkV "iniciar") ;  
	compounded_A2 		= mkA2 (mkA "compost") by8agent_Prep ; 
	decide_VQ		= mkVQ decide_V  ;  
	determine_V2		= mkV2 determine_V ;
	determine_VQ		= mkVQ determine_V ; 
	differentiate_V2 	= mkV2 differentiate_V ;  
	differentiate_V3 	= dirV3 differentiate_V respect_to_Prep ; 
	disprove_VS		= mkVS disprove_V ;
	divide_V2		= mkV2 divide_V ; -- to_Prep ;
	divide_V3		= dirV3 divide_V by_Prep ;
	equal_A2		= mkA2 equal_A to_Prep ; 
	equivalent_A2		= mkA2 equivalent_A to_Prep ;
	hold_for_V2		= mkV2 hold_V for_Prep ;
	integrate_V2		= mkV2 integrate_V ;
	integrate_V3		= dirV3 integrate_V respect_to_Prep ; 
	intersect_V3 		= dirV3 (mkV "intersecar") with_Prep ;	
	multiply_V3		= dirV3 (mkV "multiplicar") by_Prep ;
	prove_VS		= mkVS prove_V ;
	show_VS			= mkVS show_V ; 
	subtract_V3		= dirV3 (mkV "restar") to_Prep ; --from_Prep
	raise_V2		= mkV2 raise_V ;
	raise_V3		= dirV3 raise_V to_Prep ;
        range_V2                = mkV2 (mkV "variar") inside_Prep ;
	range_V3                = mkV3 (mkV "variar") from_Prep to_Prep ;   
        tend_V2			= mkV2 tend_V to_Prep ; 
	unite_V3 		= dirV3 (mkV (B.patir_81 "unir")) to_Prep ;

	true_S			= truthvalue "cert" ;
	false_S			= truthvalue "fals" ; 
	valer_V2		= mkV2 valer_V ;  --to be worth


oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep		= mkPrep "a" ; 
	over_Prep	= mkPrep "sobre" ; 
	respect_to_Prep	= mkPrep ["respecte a"] ; 
	as_Subj		= mkSubjInd "quan" ; 
	suchthat_Subj	= mkSubjConj ["tal que"] ; 
	where_Subj	= mkSubjInd "on" ; 
	about_Prep	= mkPrep ["prop de"] ;
        inside_Prep     = mkPrep "dins" ;
	from2_Prep 	= mkPrep ["des de"] ;
	till_Prep  	= mkPrep ["fins a"] ;

{-
	plus_Prep     	= mkPrep "més" ;
	times_Prep    	= mkPrep "per" ;
	intersection_Prep       = mkPrep "intersecció" ;
	union_Prep    	= mkPrep "unió" ;
	minus_Prep 	= mkPrep "menys" ;	
-}

        plus_Conj     = {s1 = [] ; s2 = "més" ; n = CR.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "per" ; n = CR.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "intersecció" ; n = CR.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "unió" ; n = CR.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "menys" ; n = CR.Sg} ;

	de_Prep = mkPrep "de" ; --Unfortunately part_Prep and possess_Prep do not work...

oper
	makeN3 : N -> N3		= \noun -> mkN3 noun genitive dative ;
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; lock_N=<> } ;
	dos = n2_Numeral ;

	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN dos side_CN ) ;

	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (regMas "no-número") ;
	radix_CN = mkCN base_N ; 

	assigned_to : NP -> AP	= mkAP assigned_A2 ;
} ;
