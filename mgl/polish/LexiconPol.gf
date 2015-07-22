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

instance LexiconPol of Lexicon =  LexiconX - [select_V3,right_inverse_function_CN,right_composition_CN,primitive_CN,pi_NP,negative_CN,primitive_CN,left_inverse_function_CN, left_composition_CN, imaginary_NP, e_NP, exponential_CN]
with
	(Syntax = SyntaxPol), 
	(Symbolic = SymbolicPol), 
	(Symbol = SymbolPol),
    (Question = QuestionPol),
	(Structural = StructuralPol)
** open
	Prelude,
	ParadigmsPol,
	MorphoPol,
	ExtraPol
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = mkCompAdj "abelowy"  ;
	absolute_A = mkRegAdj "absolutny" "absolutniejszy" "absolutnie" "absolutniej";
	additive_A = mkCompAdj "addytywny"  ; 
	approximate_A = mkCompAdj "przybliżony" ;
	approximately_AdA = ss "w przybliżeniu" ;
	binary_A = mkCompAdj "binarny"  ;
	cartesian_A = mkCompAdj "kartezjański" "kartezjańsko";
	closed_A = mkCompAdj "domknięty"  ;
	collinear_A = mkCompAdj "liniowy" "liniowo" ;
	common_A = mkCompAdj "zwyczajny" "zwyczajnie" ;
	complex_A = mkCompAdj "zespolony"  ;
	constant_A = mkCompAdj "stały"  ;
	continuous_A = mkCompAdj "ciągły"  ;
	cubic_A = mkCompAdj "sześcienny"  ;
	cyclic_A = mkCompAdj "cykliczny"  ;
	decimal_A = mkCompAdj "dziesiętny"  ;
	diagonal_A = mkCompAdj "przekątniowy"  ;
	direct_A = mkCompAdj "bezpośredni"  ;
	empty_A = mkCompAdj "pusty"  "pusto" ;
	equal_A = mkCompAdj "równy" "równie" ;
	equivalent_A = mkCompAdj "równoważny" "równoważnie" ;
	exterior_A = mkCompAdj "zewnętrzny"  ;
	gamma_PN = mkPN "Gamma" mkNTable0021 FemSg ;
	great_A = mkRegAdj "wielki" "wiekszy" "wielce" "więcej"  ;
	greatest_A = mkCompAdj "największy"  ;
	hexadecimal_A = mkCompAdj "szesnastkowy"  ;
	hyperbolic_A = mkCompAdj "hiperboliczny"  ;
	imaginary_A = mkCompAdj "urojony"  ;
	incident_A = mkCompAdj "incydentny"  ;
	infinity_PN = mkPN "nieskończoność" mkNTable0475 FemSg  ;
	infinity_minus_PN = mkPN ["minus nieskończoność"] mkNTable0475 FemSg  ;
	integer_A = mkCompAdj "całkowity"  ;
	interior_A = mkCompAdj "wewnętrzny"  ;
	inverse_A = mkCompAdj "odwrotny"  ;
	iterated_A = mkCompAdj "iterowany"  ;
	least_A = mkCompAdj "najmniejszy"  ;
	small_A = mkRegAdj "mały" "mniejszy" "mało" "mniej"  ;
	little_A = mkCompAdj "mały"  ; 
	lower_A = mkCompAdj "mniejszy"  ;
	maximal_A = mkCompAdj "maksymalny"  ;
	middle_A = mkCompAdj "środkowy"  ;
	minimal_A = mkCompAdj "minimalny"  ;
	natural_A = mkCompAdj "naturalny"  ;
	octal_A = mkCompAdj "ósemkowy"  ;
	open_A = mkCompAdj "otwarty"  ;
	partial_A = mkCompAdj "częściowy"  ;
	polar_A = mkCompAdj "biegunowy"  ;
	positive_A = mkCompAdj "dodatni"  ;
	prime_A = mkCompAdj "pierwszy"  ;
	proper_A = mkCompAdj "właściwy"  ;
	rational_A = mkCompAdj "wymierny"  ;
	real_A = mkCompAdj "rzeczywisty"  ;
	scalar_A = mkCompAdj "skalarny"  ;
	single_A = mkCompAdj "pojedynczy"  ;
	square_A = mkCompAdj "kwadratowy"  ;
	standard_A = mkCompAdj "standardowy"  ;
	true_A = mkCompAdj "prawdziwy"  ;
	typical_A = mkCompAdj "typowy"  ;
	vectorial_A = mkCompAdj "wektorowy"  ;

  oper  argument_N = mkN (mkNTable0231 "argument") (Masc Inanimate) ;
  oper  base_N = mkN (mkNTable0021 "baza") (Fem) ;
  oper  bound_N = mkN (mkNTable0402 "ograniczenie") (Neut) ;
  oper  ceiling_N = mkN (mkNTable0231 "sufit") (Masc Inanimate) ;
  oper  center_N = mkN (mkNTable0435 "środek") (Masc Inanimate) ;
  oper  class_N = mkN (mkNTable0021 "klasa") (Fem) ;
  oper  coefficient_N = mkN (mkNTable0271 "współczynnik") (Masc Inanimate) ;
  oper  column_N = mkN (mkNTable0021 "kolumna") (Fem) ;
  oper  component_N = mkN (mkNTable0231 "komponent") (Masc Inanimate) ;
  oper  composition_N = (mkN (mkNTable0402 "złożenie") (Neut) ) ;
  oper  configuration_N = mkN (mkNTable0094 "konfiguracja") (Fem) ;
  oper  conjugate_N = mkN (mkNTable0402 "sprzężenie") (Neut) ;
  oper  constant_N = mkN (mkNTable0013 "stała") (Fem) ;
  oper  coordinate_N = mkN (mkNTable0013 "współrzędna") (Fem) ;
  oper  cotangent_N = mkN (mkNTable0131 "cotangens") (Masc Inanimate) ;
  oper  cosecant_N = mkN (mkNTable0131 "cosecans") (Masc Inanimate) ;
  oper  cosine_N = mkN (mkNTable0131 "cosinus") (Masc Inanimate) ;
  oper  cube_N = mkN (mkNTable0096 "sześcian") (Masc Inanimate) ;
  oper  curl_N = mkN (mkNTable0094 "rotacja") (Fem) ;
  oper  degree_N = mkN (mkNTable0563 "stopień") (Masc Inanimate) ;
  oper  derivative_N = mkN (mkNTable0013 "pochodna") (Fem) ;
  oper  determinant_N = mkN (mkNTable0271 "wyznacznik") (Masc Inanimate) ;
  oper  deviation_N = mkN (mkNTable0402 "odchylenie") (Neut) ;
  oper  difference_N = mkN (mkNTable0175 "różnica") (Fem) ;
  oper  divergence_N = mkN (mkNTable0094 "dywergencja") (Fem) ;
  oper  division_N = mkN (mkNTable0402 "dzielenie") (Neut) ;
  oper  divisor_N = mkN (mkNTable0271 "dzielnik") (Masc Inanimate) ;
  oper  domain_N = mkN (mkNTable0021 "dziedzina") (Fem) ;
  oper  element_N = mkN (mkNTable0231 "element") (Masc Inanimate) ;
  oper  fact_N = mkN (mkNTable0231 "fakt") (Masc Inanimate) ;
  oper  factor_N = mkN (mkNTable0271 "czynnik") (Masc Inanimate) ;
  oper  factorial_N = mkN (mkNTable0145 "silnia") (Fem) ;
  oper  floor_N = mkN (mkNTable0689 "podłoga") (Fem) ;
  oper  form_N = mkN (mkNTable0021 "forma") (Fem) ;
  oper  fraction_N = mkN (mkNTable0435 "ułamek") (Masc Inanimate) ;
  oper  function_N = mkN (mkNTable0094 "funkcja") (Fem) ;
  oper  gamma_N = mkN (mkNTable0021 "gamma") (Fem) ;
  oper  gradient_N = mkN (mkNTable0231 "gradient") (Masc Inanimate) ;
  oper  group_N = mkN (mkNTable0021 "grupa") (Fem) ;
  oper  identity_N = mkN (mkNTable0475 "identyczność") (Fem) ;
  oper  integral_N = mkN (mkNTable0006 "całka") (Fem) ;
  oper  intersection_N = mkN (mkNTable0192 "podział") (Masc Inanimate) ;
  oper  interval_N = mkN (mkNTable0096 "odstęp") (Masc Inanimate) ;
  oper  inverse_N = mkN (mkNTable0475 "odwrotność") (Fem) ;
  oper  laplacian_N = mkN (mkNTable0096 "laplasjan") (Masc Inanimate) ;
  oper  left_N = mkN (mkNTable0175 "lewica") (Fem) ;
  oper  limit_N = mkN (mkNTable0175 "granica") (Fem) ;
  oper  line_N = mkN (mkNTable0013 "prosta") (Fem) ;
  oper  list_N = mkN (mkNTable0098 "lista") (Fem) ;
  oper  logarithm_N = mkN (mkNTable0096 "logarytm") (Masc Inanimate) ;
  oper  matrix_N = mkN (mkNTable0550 "macierz") (Fem) ;
  oper  mean_N = mkN (mkNTable0755 "średnia") (Fem) ;
  oper  median_N = mkN (mkNTable0021 "mediana") (Fem) ;
  oper  mode_N = mkN (mkNTable0096 "tryb") (Masc Inanimate) ;
  oper  moment_N = mkN (mkNTable0231 "moment") (Masc Inanimate) ;
  oper  multiple_N = mkN (mkNTable0475 "wielokrotność") (Fem) ;
  oper  node_N = mkN (mkNTable0742 "węzeł") (Masc Inanimate) ;
  oper  number_N = mkN (mkNTable0021 "liczba") (Fem) ;
  oper  part_N = mkN (mkNTable0475 "część") (Fem) ;
  oper  point_N = mkN (mkNTable0231 "punkt") (Masc Inanimate) ;
  oper  polynomial_N = mkN (mkNTable0096 "wielomian") (Masc Inanimate) ;
  oper  power_N = mkN (mkNTable0030 "potęga") (Fem) ;
  oper  product_N = mkN (mkNTable0231 "produkt") (Masc Inanimate) ;
  oper  proposition_N = mkN (mkNTable0111 "osąd") (Masc Inanimate) ;
  oper  quotient_N = mkN (mkNTable0096 "iloraz") (Masc Inanimate) ;
  oper  range_N = mkN (mkNTable0096 "zakres") (Masc Inanimate) ;
  oper  relation_N = mkN (mkNTable0094 "relacja") (Fem) ;
  oper  remainder_N = mkN (mkNTable0026 "reszta") (Fem) ;
  oper  right_N = mkN (mkNTable0488 "prawo") (Neut) ;
  oper  ring_N = mkN (mkNTable0468 "pierścień") (Masc Inanimate) ;
  oper  root_N = mkN (mkNTable0435 "pierwiastek") (Masc Inanimate) ;
  oper  rounding_N = mkN (mkNTable0402 "zaokrąglenie") (Neut) ;
  oper  row_N = mkN (mkNTable0621 "rząd") (Masc Inanimate) ;
  oper  rule_N = mkN (mkNTable0152 "reguła") (Fem) ;
  oper  secant_N = mkN (mkNTable0013 "sieczna") (Fem) ;
  oper  set_N = mkN (mkNTable0466 "zbiór") (Masc Inanimate) ;
  oper  side_N = mkN (mkNTable0021 "strona") (Fem) ;
  oper  sine_N = mkN (mkNTable0131 "sinus") (Masc Inanimate) ;
  oper  size_N = mkN (mkNTable0117 "rozmiar") (Masc Inanimate) ;
  oper  square_N = mkN (mkNTable0231 "kwadrat") (Masc Inanimate) ;
  oper  sum_N = mkN (mkNTable0021 "suma") (Fem) ;
  oper  summation_N = mkN (mkNTable0402 "dodawanie") (Neut) ;
  oper  tangent_N = mkN (mkNTable0096 "tangens") (Masc Inanimate) ;
  oper  transpose_N = mkN (mkNTable0094 "transpozycja") (Fem) ;
  oper  truncation_N = mkN (mkNTable0402 "zaokrąglenie") (Neut) ;
  oper  union_N = mkN (mkNTable0021 "suma") (Fem) ;
  oper  variance_N = mkN (mkNTable0094 "wariancja") (Fem) ;
  oper  value_N = mkN (mkNTable0475 "wartość") (Fem) ;
  oper  vector_N = mkN (mkNTable0181 "wektor") (Masc Inanimate) ;
  oper  zero_N = mkN (mkNTable0521 "zero") (Neut) ;

	
oper
	equal_A2 = mkA2 equal_A "" DatNoPrep  ;
	equivalent_A2 = mkA2 equivalent_A "" DatNoPrep  ;
	true_S = truthvalue "prawda" ;
	false_S = truthvalue "fałsz"  ;

--2: Structural
oper
	at_Prep = lin Prep (mkPrep "na" Instr)  ; 
	over_Prep = lin Prep (mkPrep "nad" Instr)  ;
	respect_to_Prep = lin Prep (mkPrep ["ze względu na"] Acc)  ;
	as_Subj = lin Subj (ss "jako")  ;
	suchthat_Subj = lin Subj (ss ["tak , że"])  ; -- FIXME
	where_Subj = lin Subj (ss "where")  ;
	about_Prep = lin Prep (mkPrep "o" Loc) ;

        plus_Conj     = {s1=""; s2="plus";  sent1=""; sent2=["plus"]};
        times_Conj    = {s1=""; s2="times";  sent1=""; sent2=["times"]};
	intersection_Conj     = {s1=""; s2="intersection";  sent1=""; sent2=["intersection"]}; 
	union_Conj    = {s1=""; s2="union";  sent1=""; sent2=["union"]};
	minus_Conj    = {s1=""; s2="minus";  sent1=""; sent2=["minus"]};

--2: Other
oper
	prefixN :  Str -> N -> N        = \arc,sin -> {s= \\t => (arc + sin.s!t) ; g= sin.g ; lock_N=<> } ;		
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep to_Prep ;
	arc : N -> CN	= mkCNprefix "arc" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	-- byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	not_a_number_CN	= mkCN (mkN (\\_=>"not-a-number") Neut) ; ---TODO
--
	radix_CN = mkCN base_N ; 

	calculate_V2 = dirV2 (mkV "liczyć" conj87 "wyliczyć" conj87); 
	compute_V2 = dirV2 (mkV "obliczać" conj98 "obliczyć" conj87); 
	decide_V = (mkV "decydować" conj53 "zdecydować" conj53); 
	define_V2 = dirV2 (mkV "definiować" conj53 "zdefiniować" conj53); 

	determine_V = (mkV "określać" conj98 "określić" conj75); 
	differentiate_V =  (mkV "odróżniać" conj98 "odróżnić" conj74); 
	disprove_V = (mkV "obalać" conj98 "obalić" conj75);  
	divide_V =  (mkV "dzielić" conj75 "podzielić" conj75); 
	evaluate_V2 = dirV2 (mkV "wyliczać" conj98 "wyliczyć" conj87); 
	find_V2 = dirV2 (mkV "znajdować" conj53 "znaleźć" conj40); 
	give_V = mkV "dawać" conj57 "dać" conj99 ;
	--hold_V = dirV2 (mkV "określić" conj53 "określać" conj53); 
	-- integrate_V = dirV2 (mkV "określić" conj53 "określać" conj53); 
	invert_V2 = dirV2 (mkV "odwracać" conj98 "odwrócić" conj81); 
	negate_V2 = mkV2 (mkV "zaprzeczać" conj98 "zaprzeczyć" conj87) "" Dat; 
	range_V2 =  mkV2 (mkV "przebiegać" conj98 "przebiec" conj15) "po" Loc; 
	prove_V = mkV "dowodzić" conj80em "dowieść" conj29; 
	raise_V = mkV "podnosić" conj83 "podnieść" conj31;
	select_V = (mkV "wybierać" conj98 "wybrać" conj66); 
	show_V = (mkV "pokazywać" conj55 "pokazać" conj59); 
	simplify_V2 = dirV2 (mkV "upraszczać" conj98 "uprościć" conj84); 
	solve_V2 = dirV2 (mkV "rozwiązywać" conj59 "rozwiązać" conj54); 
	tend_V = (mkV "zdążać" conj98 "zdążyć" conj87); 
	transpose_V2 = dirV2 (mkV "transponować" conj53 "transponować" conj53); 
	add_V3 = mkV3 (mkV "dodawać" conj57 "dodać" conj99) "" "do" Acc Gen; 
	decide_VQ = dirV2 (mkV "decydować" conj53 "zdecydować" conj53); 
	determine_V2 = dirV2 (mkV "określać" conj98 "określić" conj75); 
	determine_VQ = dirV2 (mkV "określać" conj98 "określić" conj75); 
	differentiate_V2 = dirV2 (mkV "różniczkować" conj53 "zróżniczkować" conj53); 
	differentiate_V3 = mkV3 (mkV "różniczkować" conj53 "zróżniczkować" conj53) "" "po" Acc Loc;
	disprove_VS = dirV2 (mkV "obalać" conj98 "obalić" conj75); 
	divide_V2 = dirV2 (mkV "dzielić" conj75 "podzielić" conj75); 
	divide_V3 = mkV3 (mkV "dzielić" conj75 "podzielić" conj75) "" "przez" Acc Acc; 
	hold_for_V2 = mkV2 (mkV "zachodzić" conj80 "zajść" conj41) "dla" Gen; 
	range_V3 =  mkV3 (mkV "przebiegać" conj98 "przebiec" conj15) "od" "do" Gen Gen; 
	integrate_V2 = dirV2 (mkV "całkować" conj53 "scałkować" conj53); 
	integrate_V3 = mkV3 (mkV "całkować" conj53 "scałkować" conj53) "" "po" Acc Loc;
	multiply_V3 = mkV3 (mkV "mnożyć" conj53 "pomnozyć" conj53) "" "przez" Acc Acc; 
	assume_VS = lin VS (mkV "założyć" conj88a "zakładać" conj98);
	prove_VS = mkV "dowodzić" conj80em "dowieść" conj29;
	show_VS =  mkV "pokazywać" conj54 "pokazać" conj59;
	subtract_V3 = mkV3 (mkV "odejmować" conj53 "odjąć" conj53) "" "od" Acc Gen; 

	select_V3 = mkV3 (mkV "wybierać" conj53 "wybrać" conj53) "" "z" Acc Gen;
	tend_V2 = mkV2 (mkMonoVerb "dążyć" conj87 Imperfective) "do" Acc; 
	right_inverse_function_CN = mod (mkCompAdj "lewy") (inverse_N);
	left_inverse_function_CN =  mod (mkCompAdj "prawy") (inverse_N);
	right_composition_CN = mod (mkCompAdj "prawy") (composition_N);
	left_composition_CN = mod (mkCompAdj "lewy") (composition_N);
	pi_NP = mkPN "pi" mkNTable0000 FemSg ;
	negative_CN = QualifierCN (mkAP (mkCompAdj "ujemny")) (mkCN number_N);
	imaginary_NP = mkPN "i" mkNTable0000 FemSg ;
	e_NP = mkPN "e" mkNTable0000 FemSg ;
	primitive_CN = QualifierCN (mkAP (mkCompAdj "pierwotny")) (mkCN value_N);
	exponential_CN = QualifierCN (mkAP (mkCompAdj "wykładniczy")) (mkCN function_N);
}
