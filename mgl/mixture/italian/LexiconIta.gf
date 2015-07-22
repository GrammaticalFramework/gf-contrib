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

instance LexiconIta of Lexicon =  LexiconX - [select_V3, sub]
with
	(Syntax = SyntaxIta), 
	(Symbolic = SymbolicIta), (Symbol = SymbolIta),
	(Question = QuestionIta),
	(Structural = StructuralIta)
** open
	ParadigmsIta,
	--IrregIta, -- BeschIta,
	(CR = CommonRomance)
in {
flags
	coding = utf8 ;
	
	oper
		select_V3 : V3
			= mkV3 select_V from_Prep to_Prep ;

	sub : N -> CN = mkCNprefix "sotto" ;

oper
	regMas : Str -> N = \s -> mkN s masculine ;
	regFem : Str -> N = \s -> mkN s feminine ; 
	regFem2 : Str -> Str -> N = \s1,s2 -> mkN s1 s2 feminine ;

--2: Atomic lexicon
oper
	abelian_A = mkA "abeliano"  ;
	absolute_A = regA "assoluto"  ;
	additive_A = regA "additivo"  ;
	approximate_A = mkA "approssimato"  ;
	approximately_AdA = mkAdA "approssimativamente" ;
	argument_N = regMas "argomento"  ;
	base_N = regFem "base"  ;
	binary_A = regA "binario"  ;
	bound_N = regMas "limite"  ;
	calculate_V2 = mkV2 "calcolare"  ;
	cartesian_A = regA "cartesiano"  ;
	ceiling_N = regMas "tetto"  ;
	center_N = regMas "centro"  ;
	class_N = regFem "classe"  ;
	closed_A = regA "chiuso"  ;
	coefficient_N = regMas "coefficiente"  ;
	collinear_A = regA "collineare"  ;
	column_N = regFem "colonna"  ;
	common_A = mkA "comune"  ;
	complex_A = regA "completo"  ;
	component_N = regFem "componente"  ;
	composition_N = regFem "composizione"  ;
	compute_V2 = mkV2 "computare"  ;
	configuration_N = regFem "configurazione"  ;
	conjugate_N = regFem "coniugata"  ;
	constant_A = regA "costante"  ;
	constant_N = regFem "costante"  ;
	continuous_A = regA "continuo"  ;
	coordinate_N = regFem "coordinata"  ;
	cotangent_N = regFem "cotangente"  ;
	cosecant_N = regFem "cosecante"  ;
	cosine_N = regMas "coseno"  ;
	cube_N = regMas "cubo"  ;
	cubic_A = regA "cubico"  ;
	curl_N = regMas "rotazionale"  ;
	cyclic_A = regA "ciclico"  ;
	decide_V = mkV "decidire"  ;
	decimal_A = regA "decimale"  ;
	define_V2 = mkV2 "definire"  ;
	degree_N = regMas "grado"  ;
	derivative_N = regFem "derivata"  ;
	determinant_N = regMas "determinante"  ;
	determine_V = regV "determinare"  ;
	deviation_N = regFem "deviazione"  ;
	diagonal_A = regA "diagonale"  ;
	difference_N = regFem "differenza"  ;
	differentiate_V = mkV "differenziare"  ;
	direct_A = regA "diretto"  ;
	disprove_V = mkV "confutare"  ;
	divergence_N = regFem "divergenza"  ;
	divide_V = regV "dividere"  ;
	division_N = regFem "divisione"  ;
	divisor_N = regMas "divisore"  ;
	domain_N = regMas "dominio"  ;
	element_N = regMas "elemento"  ;
	empty_A = regA "vuoto"  ;
	equal_A = regA "uguale"  ;
	equivalent_A = regA "equivalente"  ;
	evaluate_V2 = mkV2 "valutare"  ;
	exponential_N = regFem "esponenziale"  ;
	exterior_A = regA "esteriore"  ;
	fact_N = regMas "fatto"  ;
	factor_N = regMas "fattore"  ;
	factorial_N = regMas "fattoriale"  ;
	find_V2 = mkV2 "trovare"  ;
	floor_N = regMas "suolo"  ;
	form_N = regFem "forma"  ;
	fraction_N = regFem "frazione"  ;
	function_N = regFem "funzione"  ;
	gamma_N = regFem "gamma" ;
	gamma_PN = mkPN "gamma"  ;
	gradient_N = regMas "gradiente"  ;
	give_V = regV "dare"  ;
	great_A = mkA (regA "grande") (regA "maggiore")  ;
	greatest_A = regA "massimo"  ;
	group_N = regMas "gruppo"  ;
	hexadecimal_A = regA "esadecimale"  ;
	hyperbolic_A = regA "iperbolico"  ;
	hold_V = reflV (regV "soddisfare")  ;
	identity_N = regFem "identità"  ;
	imaginary_A = regA "immaginario"  ;
	incident_A = regA "incidente"  ;
	infinity_PN = mkPN "infinito"  ;
	infinity_minus_N = regMas ["meno infinito"]  ;
	infinity_minus_PN = mkPN ["meno infinito"]  ;
	integer_A = regA "intero"  ;
	integral_N = regFem "integrale"  ;
	integrate_V = mkV "integrare"  ;
	interior_A = regA "interior"  ;
	intersection_N = regFem "intersezione"  ;
	interval_N = regMas "intervallo"  ;
	inverse_A = regA "inverso"  ;
	inverse_N = regN "inversa"  ;
	invert_V2 = mkV2 "invertire"  ;
	iterated_A = regA "iterato"  ;
	laplacian_N = regMas "laplaciano"  ;
	least_A = regA "minimo"  ;
	small_A = mkA (regA "piccolo") (regA "minore")  ;
	left_N = regFem "sinistra"  ;
	limit_N = regMas "limite"  ;
	line_N = regFem "retta"  ;
	list_N = regFem "lista"  ;
	little_A = mkA (regA "piccolo") (regA "minore")  ;
	logarithm_N = regMas "logaritmo"  ;
	lower_A = regA "inferiore" ;
	matrix_N = regFem "matrice"  ;
	maximal_A = regA "massimo"  ;
	mean_N = regFem "media"  ;
	median_N = regFem "mediana"  ;
	middle_A = mkA "medio"  ;
	minimal_A = regA "minimo"  ;
	mode_N = regFem "modo"  ;
	moment_N = regMas "momento"  ;
	multiple_N = mkN "multiplo"  ;
	natural_A = regA "naturale"  ;
	negate_V2 = mkV2 "negare"  ;  
	negative_N = regMas "opposto"  ;
	node_N = regMas "nodo"  ;
	number_N = regMas "numero"  ;
	octal_A = regA "ottale"  ;
	open_A = regA "aperto"  ;
	part_N = regFem "parte"  ;
	partial_A = regA "parziale"  ;
	point_N = regMas "punto"  ;
	polar_A = regA "polare"  ;
	polynomial_N = regMas "polinomio"  ;
	positive_A = regA "positivo"  ;
	power_N = regFem "potenza"  ;
	prime_A = regA "primo"  ;
	primitive_N = regFem "primitiva"  ;
	product_N = regMas "prodotto"  ;
	proper_A = regA "proprio"  ;
	proposition_N = regFem "proposizione"  ;
	prove_V = mkV "dimostrare"  ;
	quotient_N = regMas "quoziente"  ;
	raise_V = regV "elevare"  ;
	range_V2 =mkV2 (mkV "variare") over_Prep ;
	range_V3 = mkV3 (mkV "variare") from_Prep to_Prep ;
	rational_A = regA "razionale"  ;
	real_A = regA "reale"  ;
	relation_N = regFem "relazione"  ;
	remainder_N = regMas (variants { "resto" ; "residuo" }) ;
	range_N = regMas "campo"  ;
	right_N = regFem "destra"  ;
	ring_N = regMas "anello"  ;
	root_N = regFem "radice"  ;
	rounding_N = regMas "arrotondamento"  ;
	row_N = regFem "riga"  ;
	rule_N = regFem "regola"  ;
	scalar_A = regA "scalare"  ;
	secant_N = regFem "secante"  ;
	select_V = regV "selezionare"  ;
	set_N = regMas "insieme"  ;
	show_V = mkV "mostrare" ;
	side_N = regMas "lato"  ;
	sine_N = regMas "seno"  ;
        single_A  = prefA (mkA "unico") ; 
	simplify_V2 = mkV2 "semplificare"  ;
	size_N = regMas "cardinalità"  ;
	solve_V2 = mkV2 "risolvere" ;
	square_A = regA "quadrato"  ;
	square_N = regMas "quadrado"  ;
	standard_A = regA "standard"  ;
        subset_N = regMas "sottoinsieme";
        subset_CN = regMas "sottoinsieme";
	proper_subset_CN = mkCN proper_A (regMas "sottoinsieme") ;
	sum_N = regFem "somma"  ;
	summation_N = regFem "sommatoria"  ;
	tangent_N = regFem "tangente"  ;
	tend_V = verboV (ardere_23 "tendere")  ;
	transpose_N = regFem "trasposta"  ;
	transpose_V2 = mkV2 "trasporre"  ;
	true_A = regA "vero"  ;
	truncation_N = regMas "troncamento"  ;
	typical_A = regA "tipico"  ;
	union_N = regFem "unione"  ;
 	variance_N = regFem "varianza"  ;
	value_N = regMas "valore"  ;
	vector_N = regMas "vettore"  ;
	vectorial_A = regA "vettoriale"  ;
	zero_N = regMas "zero"  ;
	

oper
	add_V3 = dirV3 (mkV "sumar") to_Prep  ;
    assume_VS = mkVS (mkV "supporre") ;  -- plz revise, OC
	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V  ;
	determine_VQ = mkVQ determine_V  ;
	differentiate_V2 = mkV2 differentiate_V  ;
	differentiate_V3 = dirV3 differentiate_V respect_to_Prep  ;
	disprove_VS = mkVS disprove_V  ;
	divide_V2 = mkV2 divide_V to_Prep  ;
	divide_V3 = dirV3 divide_V by_Prep  ;
	equal_A2 = mkA2 equal_A to_Prep  ;
	equivalent_A2 = mkA2 equivalent_A to_Prep  ;
	hold_for_V2 = mkV2 hold_V for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	--integrate_V3 = ? -- dirV3 integrate_V respect_to_Prep  ;
        intersect_V3 = dirV3 (mkV "intersecare") with_Prep ;
	multiply_V3 = dirV3 (mkV "multiplicar") by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = dirV3 (mkV "restar") from_Prep  ;
	--raise_V2 = ? -- mkV2 raise_V  ;
	--raise_V3 = ? -- dirV3 raise_V to_Prep  ;
        range_V2 =mkV2 (mkV "variare") over_Prep ;
	range_V3 = mkV3 (mkV "variare") from_Prep to_Prep ;
	tend_V2 = mkV2 tend_V to_Prep  ;
        unite_V3 = dirV3 (mkV "unire") to_Prep ;
	true_S = truthvalue "vero"  ;
	false_S = truthvalue "falso"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep = mkPrep "a"  ;  -- ??? a, all'...
	over_Prep = mkPrep "sopra"  ;
	respect_to_Prep = mkPrep ["rispetto a"]  ;
	as_Subj = mkSubjInd "come"  ;
	suchthat_Subj = mkSubjConj ["tale che"]  ;
	where_Subj = mkSubjInd "dove"  ;
	about_Prep = mkPrep ["di circa"]  ;

        plus_Conj     = {s1 = [] ; s2 = "più" ; n = CR.Sg} ; 			-- la somma di x ed y
	times_Conj    = {s1 = [] ; s2 = "per" ; n = CR.Sg} ;  		-- can also say "x moltiplicato per y", "il prodotto di x ed y"
	intersection_Conj     = {s1 = [] ; s2 = "intersezione" ; n = CR.Sg} ; 	--l'intersezione di x ed y
	union_Conj    = {s1 = [] ; s2 = "unione" ; n = CR.Sg} ;     		-- l'unione di x ed y
	minus_Conj    = {s1 = [] ; s2 = "differenza" ; n = CR.Sg} ; 		-- la differenza x meno y

--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun genitive dative ;
	arc : N -> CN	= mkCNprefix "arco" ;
	preACN : A -> CN -> CN	= \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; lock_N=<> } ;
	due = n2_Numeral ;
	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN due side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN due side_CN ) ;
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (regMas "non-è-un-numero") ;
	radix_CN = mkCN base_N ; 
} ;
