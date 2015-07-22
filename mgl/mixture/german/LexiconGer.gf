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

instance LexiconGer of Lexicon =  LexiconX - [select_V3, subset_CN, proper_subset_CN, arcosecant_CN, arccosecant_CN, arccosine_CN, arccotangent_CN, arctangent_CN, arcsecant_CN, arcsine_CN, pi_NP, equal_to, squareroot_CN, cuberoot_CN, real_part_CN, imaginary_part_CN, e_NP, imaginary_NP, left_inverse_function_CN , right_inverse_function_CN, passiveBy]
with
	(Syntax = SyntaxGer), 
	(Symbolic = SymbolicGer), 
	(Symbol = SymbolGer),
	(Question = QuestionGer),
	(Structural = StructuralGer)
 ** open
	Prelude,
	ParadigmsGer,
	IrregGer,
	(CR = CommonRomance),
        (R = ResGer),
        NounGer   
in {
flags
	coding = utf8 ;
	
oper
	select_V3 : V3
		= mkV3 select_V from_Prep to_Prep ;

oper
	regMas : Str -> Str -> N = \s,p -> mkN s p masculine ;
	regFem : Str -> Str -> N = \s,p -> mkN s p feminine ; 
	--regFem2 : Str -> Str -> N = \s1,s2 -> mkN s1 s2 feminine ;

--2: Atomic lexicon
oper
	abelian_A = mkA "abelsch"  ;
	absolute_A = mkA "absolut"  ;
        add_V = mkV "addieren" ;
	additive_A = mkA "additiv"  ;
	approximate_A = mkA "approximativ"  ;
	approximately_AdA = ss "etwa" ** {lock_AdA = <>};
	argument_N = mkN "Argument" "Argumente" neuter  ;
	base_N = mkN "Base"  ;
	binary_A = mkA "binär"  ;
	block_N = mkN "Block" ;
	bound_N = mkN "Schranke"  ;
	calculate_V2 = mkV2 "rechnen"  ;
	cartesian_A = mkA "kartesisch"  ;
	ceiling_N = mkN "Aufrundung"  ;
	center_N = mkN "Mittelpunt" "Mittelpunkte" masculine  ;
	class_N = mkN "Klasse"  ;
	closed_A = mkA "abgeschlossen" ;   --(variants {"geschlossen" ; "abgeschlossen"}) ;
	coefficient_N = mkN "Koeffizient" "Koeffizienten" masculine ;
	collinear_A = mkA "kollinear"  ;
	column_N = mkN "Spalte"  ;
	common_A = mkA "gemeinsame"  ;
	complex_A = mkA "komplex"  ;
	component_N = mkN "Komponente"  ;
	composition_N = mkN "Komposition"  ;
	compute_V2 = mkV2 "berechnen"  ;
	configuration_N = mkN (variants {"Konfiguration"  ; "Anordnung"}) ;
	conjugate_N = mkN "Konjugierte"  ;
	constant_A = mkA "konstant"  ;
	constant_N = mkN "Konstante"  ;
	continuous_A = mkA "stetig"  ;
	coordinate_N = mkN "Koordinate"  ;
	cotangent_N = mkN "Kotangens" "Kotangens" "Kotangens" "Kotangens" "Kotangens" "Kotangens" masculine ;
	cosecant_N = mkN "Kosekans" "Kosekans" "Kosekans" "Kosekans" "Kosekans" "Kosekans"  masculine  ; 
	cosine_N = mkN "Kosinus" "Kosinus" "Kosinus" "Kosinus" "Kosinus" "Kosinus" masculine ;
	cube_N = mkN "Kubus" "Kubus" "Kubus" "Kubus" "Kuben" "Kuben" masculine ;
	cubic_A = mkA "kubisch"  ;
	curl_N = mkN "Rotation"  ;
	cyclic_A = mkA "zyklisch"  ;
	decide_V = mkV "entscheiden"  ;
	decimal_A = mkA "dezimal"  ;
	define_V2 = mkV2 "definieren"  ;
	degree_N = mkN "Grad" "Grade" masculine  ;
	derivative_N = mkN "Ableitung"  ;
	determinant_N = mkN "Determinante"  ;
	determine_V = mkV "bestimmen"  ;
	deviation_N = mkN "Abweichung"  ;
	diagonal_A = mkA "diagonal"  ;
	difference_N = mkN "Differenz" "Differenzen" feminine  ;
	differentiate_V = mkV (variants {"ableiten" ; "differenzieren"} ) ;
	digit_N = mkN "Stelle" "Stellen" feminine ;
	direct_A = mkA "direkt"  ;
	disprove_V = mkV "widerlegen"  ;
	divergence_N = mkN "Divergenz" "Divergenzen" feminine  ;
	divide_V = mkV "teilen"  ;
	division_N = mkN "Division"  ;
	divisor_N = mkN "Teiler" ;
	domain_N = mkN "Definitionsbereich" "Definitionsbereiche" "Definitionsbereiche" "Definitionsbereiches" "Definitionsbereiche" "Definitionsbereichen" masculine  ;
	element_N = mkN "Element" "Elemente" neuter ;
	empty_A = mkA "leer"  ;
	equal_A = mkA "gleich" "gleich" "gleich";
	equivalent_A = mkA "äquivalent"  ;
	evaluate_V2 = mkV2 "beurteilen"  ;
	exponential_N = mkN "Exponentialfunktion"  ;
	exterior_A = mkA "äußerer"  ;
	fact_N = mkN "Tatsache"  ;
	factor_N = mkN "Teiler" "Teiler" masculine  ;
	factorial_N = mkN "Fakultät" "Fakultäten" feminine  ;
	find_V2 = mkV2 "finden"  ;
	floor_N = mkN "Abrundung"  ;
	form_N = mkN "Form" "Formen" feminine  ;
	fraction_N = mkN "Bruch" "Bruch" "Bruch" "Bruches" "Brüche" "Brüchen" masculine  ;
	function_N = mkN "Funktion"  ;
	gamma_N = mkN "gamma"  ;
	gamma_PN = my_mkPN "Gamma"  ;
	gradient_N = mkN "Gradient" "Gradienten" masculine  ;
	give_V = mkV "geben" "gibt" "gab" "gäbe" "gegeben"  ;
	great_A = mkA "groß" "größer" "größte"  ;
	greatest_A = mkA "größte"  ;
	group_N = mkN "Gruppe"  ;
	hexadecimal_A = mkA "hexadezimal"  ;
	hyperbolic_A = mkA "hyperbolisch"  ;
	hold_V = mkV "gelten" "gilt" "gilt" "galt" "gälte" "gegolten";  
	identity_N = mkN "Identität" "Identitäten" feminine ;
	imaginary_A = mkA "imaginär"  ;
	incident_A = mkA "inzident"  ;
	infinity_PN = mkPN "Undendliche"  ;
	infinity_minus_N = mkN ["Minus Unendlichkeit"]  ;
	infinity_minus_PN = mkPN ["Minus Undendliche"]  ;
	integer_A = mkA (variants {"ganzzahlig" ; "integer"}) ;
	integral_N = mkN "Integral" "Integrale" neuter  ;
	integrate_V = mkV "integrieren"  ;
	interior_A = mkA "inner"  ;
	intersection_N = mkN "Durchschnitt" "Durchschnitte" masculine ;
	interval_N = mkN "Intervall" "Intervalle" neuter ;
	inverse_A = mkA "invers"  ;
	inverse_N = mkN "Inverse"  ;
	invert_V2 = mkV2 "umkehren"  ;
	iterated_A = mkA "iteriert"  ;
	laplacian_N = mkN "Laplace-Operator" "Laplace-Operatoren" masculine ;
	least_A = mkA "kleinste"  ;
	small_A = invarA "wenige"  ;
	left_N = mkN "Linke"  ;
	limit_N = mkN "Grenzwert" "Grenzwerte" masculine  ;
	line_N = mkN "Gerade"  ;
	list_N = mkN "Liste"  ;
	little_A = mkA "wenig"  ;
	logarithm_N = mkN "Logarithmus" "Logarithmen" masculine ;
	lower_A = mkA "niedriger"  ;
	matrix_N = mkN "Matrix" "Matrizen" feminine  ;
	maximal_A = mkA "maximal"  ;
	mean_N = mkN "Mittelwert" "Mittelwerte" masculine  ;
	median_N = mkN "Median" "Mediane" masculine  ;
	middle_A = mkA "mittlere"  ;
	minimal_A = mkA "minimal"  ;
	mode_N = mkN "Modalwert" "Modalwerte" masculine  ;
	moment_N = mkN "Moment" "Momente" neuter  ;
	multiple_N = mkN "Vielfache" "Vielfache" neuter  ;
	natural_A = mkA "natürlich"  ;
	negate_V2 = mkV2 "negieren"  ;
	negative_N = mkN "Negativ" "Negative" neuter ;
	node_N = mkN "Knoten" "Knoten" masculine  ;
	number_N = mkN "Zahl" "Zahlen" feminine  ;
	octal_A = mkA "oktal"  ;
	open_A = mkA "offen"  ;
	part_N = mkN "Teil" "Teile" masculine  ;
	partial_A = mkA "partiell"  ;
	place_N = mkN "Stelle" "Stellen" feminine ;
	point_N = mkN "Punkt" "Punkte" masculine  ;
	polar_A = mkA "polar"  ;
	polynomial_N = mkN "Polynom" "Polynome" neuter  ;
	positive_A = mkA "positiv"  ;
	power_N = mkN "Potenz" "Potenzen" feminine  ;
	prime_A = mkA "prim"  ;
	primitive_N = mkN "Stammfunktion"  ;
	product_N = mkN "Produkt" "Produkt" "Produkt" "Produktes" "Produkte" "Produkten" neuter  ;
	proper_A = mkA "eigentlich"  ;
	proposition_N = mkN "Satz" "Sätze" masculine  ;
	prove_V = mkV "beweisen"  ;
	quotient_N = mkN "Quotient" "Quotienten" masculine  ;
	raise_V = mkV "potenzieren"  ;
	rational_A = mkA "rational"  ;
	real_A = mkA "reell"  ;
	relation_N = mkN "Relation"  ;
	remainder_N = mkN "Rest" "Reste" masculine  ;
	range_N = mkN "Bildbereich" "Bildbereiche" masculine  ;
	right_N = mkN "Rechts" "Rechte" neuter  ;
	ring_N = mkN "Ring" "Ringe" masculine  ;
	root_N = mkN "Wurzel" "Wurzeln" feminine  ;
	rounding_N = mkN "Rundung"  ;
	row_N = mkN "Zeile"  ;
	rule_N = mkN "Regel" "Regeln" feminine  ;
	scalar_A = mkA "skalar"  ;
	secant_N = mkN "Sekans" "Sekans" "Sekans" "Sekans" "Sekans" "Sekans" masculine  ;
	select_V = mkV "selektieren"  ;
	set_N = mkN "Menge"  ;
	proper_subset_CN = mkCN (mkA "echt") (mkN "Teilmenge")  ;
	subset_CN = mkCN (mkN "Teilmenge")  ;
	show_V = mkV "zeigen"  ;
	side_N = mkN "Seite"  ;
	sine_N = mkN "Sinus" "Sinus"  "Sinus" "Sinus"  "Sinus" "Sinus" masculine  ;
	single_A = mkA "einzig" ;
	simplify_V2 = mkV2 "vereinfachen"  ;
	size_N = mkN "Größe"  ;
	solve_V2 = mkV2 "lösen"  ;
	square_A = mkA "quadratisch"  ;
	square_N = mkN "Quadrat" "Quadrate" neuter  ;
	standard_A = mkA "standard"  ;
	sum_N = mkN "Summe"  ;
	summation_N = mkN "Summe"  ;
	tangent_N = mkN "Tangens" "Tangens" "Tangens" "Tangens" "Tangens" "Tangens" masculine  ;
	tend_V = mkV "konvergieren"; -- before: tendieren  ;
	transpose_N = mkN "Transponierte"  ;
	transpose_V2 = mkV2 "trasponieren"  ;
	true_A = mkA "wahr"  ;
	truncation_N = mkN "Trunkierung"  ;   --before: Abrundung
	typical_A = mkA "typisch"  ;
	union_N = mkN "Vereinigung"  ;
	variance_N = mkN "Varianz" "Varianz" feminine ;
	value_N = mkN "Wert" "Werte" masculine ;
	vector_N = mkN "Vektor" "Vektor" "Vektor" "Vektors" "Vektoren" "Vektoren" masculine ;
	vectorial_A = mkA "vektoriell" ;
	zero_N = mkN "Null" "Nullen" feminine ;
	
	arccosecant_N	= mkN "Arcuskosekans" "Arcuskosekans" "Arcuskosekans" "Arcuskosekans" "Arcuskosekans" "Arcuskosekans" masculine;
	arccosine_N	= mkN "Arcuskosinus"  "Arcuskosinus" "Arcuskosinus" "Arcuskosinus" "Arcuskosinus" "Arcuskosinus" masculine;
	arccotangent_N	= mkN "Arcuskotangens" "Arcuskotangens" "Arcuskotangens" "Arcuskotangens" "Arcuskotangens" "Arcuskotangens" masculine;
	arctangent_N	= mkN "Arcustangens" "Arcustangens" "Arcustangens" "Arcustangens" "Arcustangens" "Arcustangens" masculine;
	arcsecant_N	= mkN "Arcussekans" "Arcussekans" "Arcussekans" "Arcussekans" "Arcussekans" "Arcussekans" masculine;
	arcsine_N	= mkN "Arcussinus" "Arcussinus" "Arcussinus" "Arcussinus" "Arcussinus" "Arcussinus" masculine ;
	
 	squareroot_N    = mkN "Quadratwurzel" "Quadratwurzeln" feminine ;
        cuberoot_N      = mkN "Kubikwurzel" "Kubikwurzeln" feminine ;

	real_part_N     = mkN "Realteil" "Realteile" masculine  ;
        imaginary_part_N = mkN "Imaginärteil" "Imaginärteile" masculine  ;

        durchlaufen_V =  mkV "durchlaufen" "durchläuft" "durchlief" "durchliefe" "durchgelaufen" ;

	
oper
	abbilden_V2 = mkV2 (mkV "abbilden") ;
     	add_V2 = mkV2 add_V (mkPrep "dazu" accusative) ;
       	add2_V2 = mkV2 add_V ;
	add_V3 = dirV3 add_V to_Prep  ;
       	approximate_V2 = mkV2 "approximieren" ;
	assume_VS = mkVS (mkV "an ," (mkV "nehmen")) ;  --cheat: the coma should be in the sentence
        begin_V2 : V2 = mkV2 (mkV "starten") ;  
	decide_VQ = mkVQ decide_V   ;
	determine_V2 = mkV2 determine_V  ;
	determine_VQ = mkVQ determine_V  ;
	differentiate_V2 = mkV2 differentiate_V  ;
	differentiate_V3 = dirV3 differentiate_V to_Prep  ; --ableiten nach
	disprove_VS = mkVS disprove_V  ;
	divide_V2 = mkV2 divide_V accusative  ;
	divide_V3 = dirV3 divide_V through_Prep  ;
        end_V2 : V2 = mkV2 (mkV "beenden") ;  
--	equal_A2 = mkA2 equal_A zu_Prep;                    -- obsolete: equal_to redefined "x gleich y" !!
	equivalent_A2 = mkA2 equivalent_A zu_Prep ;
	hold_for_V2  = mkV2 hold_V for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = dirV3 integrate_V to_Prep  ;         --integration über f (oder von f) nach x  
	intersect_V3 = dirV3 (mkV "schneiden") with_Prep ;	
	multiply_V3  = dirV3 (mkV "multiplizieren") by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS  = mkVS show_V  ;
	subtract_V3 = dirV3 (mkV "subtrahieren") von_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = dirV3 raise_V to_Prep  ;                 --changed by "x hoch y" !!
        range_V2 = mkV2 durchlaufen_V accusative ; 
	range_V3 = mkV3 laufen_V part_Prep till_Prep ;   
	tend_V2  = mkV2 tend_V gegen_Prep ; 
        unite_V3 = dirV3 (mkV "vereinigen") with_Prep ;	
   
	true_S  = truthvalue "wahr"  ;
	false_S = truthvalue "falsch"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj  = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep 	= mkPrep "an" dative ;
	over_Prep 	= mkPrep "über"  accusative ;
	respect_to_Prep = mkPrep ["in Bezug auf"] accusative ; 
   	as_Subj 	= mkSubjInd "als"  ;
	suchthat_Subj 	= mkSubjConj ["so dass"]  ;
	where_Subj 	= mkSubjInd "wo"  ;
	about_Prep 	= mkPrep ["etwa so"] dative  ;
        gegen_Prep 	= mkPrep "gegen" accusative ;
	till_Prep  	= mkPrep "bis" dative ;
	wobei_Subj 	= ss  [", wobei"] ** {lock_Subj = <>};
	onto_Prep  	= mkPrep "auf" accusative ;

{-	plus_Prep     		= mkPrep "plus" nominative;
	times_Prep    		= mkPrep "mal" nominative;
	intersection_Prep       = mkPrep "durchschnitt" nominative;
	union_Prep    		= mkPrep "vereinigt" nominative;
	minus_Prep 		= mkPrep "minus" nominative ;
-}
 
        plus_Conj     	  = {s1 = [] ; s2 = "plus" ; n = R.Sg} ;
	times_Conj    	  = {s1 = [] ; s2 = "mal" ; n = R.Sg} ;
	intersection_Conj = {s1 = [] ; s2 = "durchschnitt" ; n = R.Sg} ;
	union_Conj    	  = {s1 = [] ; s2 = "vereinigt" ; n = R.Sg} ;
	minus_Conj    	  = {s1 = [] ; s2 = "minus" ; n = R.Sg} ;

        upto_Prep = mkPrep ["bis auf"] accusative ;
	hoch_Prep 		= mkPrep "hoch" nominative ;
  
--2: Other
oper

	--makeN3 : N -> N3		= \noun -> mkN3 noun genitive dative ;
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep to_Prep ;
--	arc : N -> CN	= mkCNprefix "Arcus" ;
	preACN : A -> CN -> CN	= mkCN ; --\adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	
	  = \arc,sin -> {s= \\n,c => (arc + sin.s!n!c) ; g= sin.g ; lock_N=<> } ;
	dos = n2_Numeral ;

	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;

	byLeft : CN -> CN = \cn -> mkCN (mkA "linksseitig") cn ; 
	byRight : CN -> CN = \cn -> mkCN (mkA "rechtsseitig") cn ; 
	byBothSides : CN -> CN = \cn -> mkCN (mkA "beidseitig") cn ; 

      	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (mkN "keine-Zahl") ;
	radix_CN = mkCN base_N ; 

        left_inverse_function_CN = mkCN (mkA "Links-Inverse") function_N;
	right_inverse_function_CN = mkCN (mkA "Rechts-Inverse") function_N;
	
	arccosecant_CN	= mkCN arccosecant_N ;
	arccosine_CN	= mkCN arccosine_N ;
	arccotangent_CN	= mkCN arccotangent_N ;
	arctangent_CN	= mkCN arctangent_N ;
	arcsecant_CN	= mkCN arcsecant_N ;
	arcsine_CN	= mkCN arcsine_N ;

   	
        npcNom = R.NPC R.Nom ; 


        apposAP : Str -> NP -> AP = \gleich,np ->
            {s = \\_ => gleich ++ np.s!npcNom; isPre = False; lock_AP = <>} ; 

        equal_to = apposAP "gleich" ;	

	squareroot_CN     = mkCN squareroot_N ;
        cuberoot_CN 	  = mkCN cuberoot_N ; 

	real_part_CN 	  = mkCN real_part_N ;
	imaginary_part_CN = mkCN imaginary_part_N ;

        my_mkPN : Str -> PN = \s -> lin PN {s = table {
                        R.Gen        => "von" ++ s ;
       	                _      => s   }} ;

	pi_NP 		= mkNP (my_mkPN "Pi") ;
	e_NP		= mkNP (my_mkPN "e") ;
	imaginary_NP	= mkNP (my_mkPN "i") ;
	
        passiveBy : V2 -> (_,_:NP) -> NP = \v,np1,np2 -> mkNP np1 (mkAdvBy (mkNP np2 v)) ;
} 
