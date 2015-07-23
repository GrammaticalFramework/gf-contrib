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

instance LexiconFre of Lexicon =  LexiconX - [sub]
with
	(Syntax = SyntaxFre), 
	(Symbolic = SymbolicFre), (Symbol = SymbolFre),
	(Question = QuestionFre)
** open
	ParadigmsFre,
	(I = IrregFre),
	(CR = CommonRomance)
in {
flags
	coding = utf8 ;

oper
	regMas : Str -> N = \s -> mkN s masculine ;
	regFem : Str -> N = \s -> mkN s feminine ; 
	regFem2 : Str -> Str -> N = \s1,s2 -> mkN s1 s2 feminine ;

	sub : N -> CN = mkCNprefix "sous-" ;

--2: Atomic lexicon
oper
	abelian_A = regA "abelien"  ;
	absolute_A = regA "absolu"  ;
	additive_A = regA "additif"  ;
	approximate_A = mkA "approximative"  ;
	approximately_AdA = mkAdA "à peu près" ;
	argument_N = regMas "argument"  ;
	base_N = regFem "base" ;
	binary_A = regA "binaire"  ;
	bound_N = regFem "borne"  ;
	calculate_V2 = mkV2 "calculer" ;
	cartesian_A = regA "cartesien"  ;
	ceiling_N = regMas "plafond"  ;
	center_N = regMas "centre"  ;
	class_N = regFem "classe"  ;
	closed_A = regA "fermé"  ;
	coefficient_N = regMas "coefficient"  ;
	collinear_A = regA "colinéair"  ;
	column_N = regFem "colonne"  ;
	common_A = regA "commun"  ;
	complex_A = regA "complexe"  ;
	component_N = regFem "composante"  ;
	composition_N = regFem "composition"  ;
	compute_V2 = mkV2 "calculer" ;
	configuration_N = regFem "configuration"  ;
	conjugate_N = regFem "conjugué"  ;
	constant_A = regA "constant"  ;
	constant_N = regFem "constante"  ;
	continuous_A = regA "continu"  ;
	coordinate_N = regFem "coordonnée"  ;
	cotangent_N = regFem "cotangente"  ;
	cosecant_N = regFem "cosécante"  ;
	cosine_N = mkN "cosinus" "cosinus" masculine  ;
	cube_N = regMas "cube"  ;
	cubic_A = regA "cubique"  ;
	curl_N = regMas "rotationnel"  ;
	cyclic_A = regA "cyclique"  ;
	decide_V = mkV "décider" ;
	decimal_A = regA "décimal"  ;
	define_V2 = mkV2 "définir" ;
	degree_N = regMas "degré"  ;
	derivative_N = regFem "dérivée"  ;
	determinant_N = regMas "déterminant"  ;
	determine_V = regV "déterminer"  ;
	deviation_N = mkN "déviation" "déviations" feminine  ;
	diagonal_A = regA "diagonale"  ;
	difference_N = regFem "différence"  ;
	differentiate_V = mkV "dériver" ; 
	direct_A = regA "directe"  ;
	disprove_V = mkV "réfuter" ; 
	divergence_N = regFem "divergence"  ;
	divide_V = regV "diviser"  ;
	division_N = regFem "division"  ;
	divisor_N = regMas "diviseur"  ;
	domain_N = regMas "domaine"  ;
	element_N = regMas "élément"  ;
	empty_A = regA "vide"  ;
	equal_A = regA "égal"  ;
	equivalent_A = regA "équivalent"  ;
	evaluate_V2 = mkV2 "évaluer" ; 
	exponential_N = regFem "exponentielle"  ;
	exterior_A = regA "extérieur"  ;
	fact_N = regMas "fait"  ;
	factor_N = regMas "facteur"  ;
	factorial_N = regFem "factorielle"  ;
	find_V2 = mkV2 "trouver" ; 
	floor_N = regMas "sol"  ;
	form_N = regFem "forme"  ;
	fraction_N = regFem "fraction"  ;
	function_N = regFem "fonction"  ;
	gamma_N = mkN "gamma"  ;
	gamma_PN = mkPN "gamma"  ;
	gradient_N = regMas "gradient"  ;
	give_V = regV "donner"  ;
	great_A = regA "grand"  ;
	greatest_A = regA "le plus grand"  ;
	group_N = regMas "groupe"  ;
	hexadecimal_A = regA "hexadécimal"  ;
	hyperbolic_A = regA "hiperbolique"  ;
	hold_V = regV "satisfaire"  ;
	identity_N = regFem "identitée"  ;
	imaginary_A = regA "imaginaire"  ;
	incident_A = regA "incident"  ;
	infinity_PN = mkPN "infini"  ;
	infinity_minus_N = mkN ["moins infini"]  ;
	infinity_minus_PN = mkPN ["moins infini"]  ;
	integer_A = regA "entier"  ;
	integral_N = regFem "intégral"  ;
	integrate_V = mkV "intégrer" ;
	interior_A = regA "intérieur"  ;
	intersection_N = regFem "intersection"  ;
	interval_N = regMas "intervalle"  ;
	inverse_A = regA "invers"  ;
	inverse_N = regFem "inverse"  ;
	invert_V2 = mkV2 "invertir" ;
	iterated_A = regA "itéré"  ;
	laplacian_N = regMas "laplacien"  ;
	least_A = regA "le plus petit"  ;
	small_A = regA "petit"  ;
	left_N = regFem "gauche"  ;
	limit_N = regFem "limite"  ;
	line_N = regFem "ligne"  ;
	list_N = regFem "liste"  ;
	little_A = regA "petit"  ;
	logarithm_N = regMas "logarithme"  ;
	lower_A = regA "inferieur"  ;
	matrix_N = regFem "matrice"  ;
	maximal_A = regA "maximal"  ;
	mean_N = regFem "moyenne"  ;
	median_N = regFem "médiane"  ;
	middle_A = regA "moyen"  ;
	minimal_A = regA "minimal"  ;
	mode_N = regFem "mode"  ;
	moment_N = regMas "moment"  ;
	multiple_N = mkN "multiple" "multiples" masculine  ;
	natural_A = regA "naturel"  ;
	negate_V2 = mkV2 "nier" ;
	negative_N = regMas "opposé"  ;
	node_N = regMas "node"  ;
	number_N = regMas "nombre"  ;
	octal_A = regA "octal"  ;
	open_A = regA "ouvert"  ;
	part_N = regFem "partie"  ;
	partial_A = regA "partiel"  ;
	point_N = regMas "point"  ;
	polar_A = mkA "polaire" "polaire" "polaires" "polairement"  ;
	polynomial_N = regMas "polynôme"  ;
	positive_A = mkA "positif" "positive"  ;
	power_N = regFem "puissance"  ;
	prime_A = mkA "premier" "première"  ;
	primitive_N = regFem "primitive"  ;
	product_N = regMas "produit"  ;
	proper_A = mkA "propre"  ;
	proposition_N = regFem "proposition"  ;
	prove_V = mkV "demontrer" ; 
	quotient_N = regMas "quotient"  ;
	raise_V = regV "élever"  ;
	rational_A = regA "racional"  ;
	real_A = regA "réel"  ;
	relation_N = regFem "relation"  ;
	remainder_N = regMas "reste"  ;
	range_N = regMas "recorregut"  ;
	right_N = regFem "droite"  ;
	ring_N = regMas "anneau"  ;
	root_N = regFem "racine"  ;
	rounding_N = regMas "arrondi"  ;
	row_N = regFem "ligne"  ;
	rule_N = regFem "règle"  ;
	scalar_A = regA "scalair"  ;
	secant_N = regFem "sécante"  ;
	select_V = regV "choisir"  ;
	set_N = regMas "ensemble"  ;
	show_V = mkV "montrer" ; 
	side_N = regMas "côté"  ;
	sine_N = mkN "sinus" "sinus" masculine  ;
	single_A  = prefA (mkA "unique") ; 
	simplify_V2 = mkV2 "simplifier" ; 
	size_N = regMas "cardinal"  ;
	solve_V2 = mkV2 "résoudre" ;
	square_A = regA "carré"  ;
	square_N = regMas "carré"  ;
	standard_A = regA "standard"  ;
	sum_N = regFem "somme"  ;
	summation_N = regFem "somme"  ;
	tangent_N = regFem "tangente"  ;
	-- tend_V = I.tendre_V2  ;
	transpose_N = regFem "transposition"  ;
	transpose_V2 = mkV2 "transposer" ; 
	true_A = regA "vrai"  ;
	truncation_N = regMas "troncature"  ;
	typical_A = regA "typique"  ;
	union_N = regFem "union"  ;
	variance_N = regFem "variance"  ;
	value_N = regFem "valeur"  ;
	vector_N = regMas "vecteur"  ;
	vectorial_A = regA "vectoriel"  ;
	zero_N = regMas "zéro"  ;
	
oper
	add_V3 = dirV3 (mkV "additionner") to_Prep ;
    assume_VS = mkVS (mkV "supposer") ; -- plz revise, AR?
	decide_VQ = mkVQ decide_V ; 
	determine_V2 = mkV2 determine_V ;
	determine_VQ =  mkVQ determine_V ;
	differentiate_V2 = mkV2 differentiate_V ;
	differentiate_V3 = dirV3 differentiate_V respect_to_Prep ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = mkV2 divide_V to_Prep ;
	divide_V3 = dirV3 divide_V by_Prep ;
	equal_A2 =  mkA2 equal_A to_Prep ;
	equivalent_A2 = mkA2 equivalent_A to_Prep ; 
	hold_for_V2 = mkV2 hold_V for_Prep ; 
	integrate_V2 = mkV2 integrate_V ;
	integrate_V3 = dirV3 integrate_V respect_to_Prep ;
	multiply_V3 = dirV3 (mkV "multiplier") by_Prep ;
	prove_VS = mkVS prove_V ;
	show_VS = mkVS show_V ;
	subtract_V3 = dirV3 (mkV "soustraire") from_Prep ;
	raise_V2 = mkV2 raise_V ;
	raise_V3 = dirV3 raise_V to_Prep ;
        range_V2 =mkV2 (mkV "varier") over_Prep ;
	range_V3 = mkV3 (mkV "varier") from_Prep to_Prep ;
	tend_V2 = I.tendre_V2 ;
	true_S = truthvalue "vrai" ; 
	false_S = truthvalue "faux" ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep = mkPrep "à" ;
	over_Prep = mkPrep "sur" ;
	respect_to_Prep = mkPrep ["par rapport à"] ;
	as_Subj = mkSubjInd "lorsque" ;
	suchthat_Subj =  mkSubjConj ["tel que"] ;
	where_Subj = mkSubjInd "où" ;
	about_Prep = mkPrep ["d'environ"] ;

{-
	plus_Prep     = mkPrep "plus"  ;
	times_Prep    = mkPrep "times"  ;
	intersection_Prep     = mkPrep "intersection"  ;
	union_Prep    = mkPrep "union"  ;
	minus_Prep    = mkPrep "minus"  ;
-}

        plus_Conj     = {s1 = [] ; s2 = "plus" ; n = CR.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "times" ; n = CR.Sg} ;  
	intersection_Conj     = {s1 = [] ; s2 = "intersection" ; n = CR.Sg} ; 
	union_Conj    = {s1 = [] ; s2 = "union" ; n = CR.Sg} ;
	minus_Conj    = {s1 = [] ; s2 = "minus" ; n = CR.Sg} ;

--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun genitive dative ;
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; lock_N=<> } ;
	deux = n2_Numeral ;
	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN deux side_CN ) ;
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (regMas ["pas an nombre"]) ;
	radix_CN = mkCN base_N ; 
} ;
