
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
instance LexiconHin of Lexicon = LexiconX  
with
(Syntax = SyntaxHin), 
(Symbolic = SymbolicHin), 
(Symbol = SymbolHin),
(Question = QuestionHin)
** open
Prelude,
ParadigmsHin, 
(CR = CommonRomance)
in {
flags
	coding = utf8 ;

--2: Atomic lexicon
oper
	abelian_A = mkA "A:be:lvi:"  ; --
	absolute_A = mkA "nirape:kX,S"  ;
	additive_A = mkA "yo:ga:tX,mak"  ;
	approximate_A = mkA "sanX,nikaT"  ; --
	approximately_AdA = mkAdA "lagb'ag" ;
	argument_N = mkN "pu:rX,v pX,ratibim.b"  ; --
	base_N = mkN "A:d'a:r"  ;
	binary_A = mkA "dX,viA:d'a:ri:"  ; --
	bound_N = mkN "paribam.d'"  ;
	calculate_V2 = mkV2 (compoundV "gaNan" (mkV "karna:"))  ;
	cartesian_A = mkA "ka:rX,ti:y"  ;
	ceiling_N = mkN "UcX,catam si:ma:"  ; --
	center_N = mkN "ke:m.dX,r"  ;
	class_N = mkN "varX,g"  ;
	closed_A = mkA "bam.d"  ;
	coefficient_N = mkN "guNam.k"  ;
	collinear_A = mkA "E:kare:k'asX,t"  ;
	column_N = mkN "sX,tam.b'"  ;
	common_A = mkA "sa:rX,v"  ;
	complex_A = mkA "samX,mis*X,r"  ;
	component_N = mkN "g'aTak"  ;
--	composition_N = mkN "sam.g'aTan"  ;  -- or sam.yo:jan if composition of functions
	composition_N = mkN "sam.yo:jan" ;
	compute_V2 = mkV2 (compoundV "gaNan" (mkV "karna:"))  ;
	configuration_N = mkN "sama:kr.ti"  ; --
	conjugate_N = mkN "sam.yugX,mi:"  masculine;
	constant_N = mkN "acar"  ;
	constant_A = mkN "acar"  ; -- constant function
	continuous_A = mkA "sam.tat"  ;
	coordinate_N = mkN "nirX,de:s*a:m.k"  ;
	cotangent_N = mkN "ko:TisX,parX,s*ajX,ya:"  ;
	cosecant_N = mkN "vX,yujX,ya:"  ;
	cosine_N = mkN "ko:TijX,ya:"  ;
	cube_N = mkN "g'an"  ;
	cubic_A = mkA "g'ana:ka:r"  ;
	curl_N = mkN "c'alX,la:"  ; --
	cyclic_A = mkA "A:varX,ti:"  ; --
	decide_V = compoundV "nirX,Nay" (mkV "karna:") ;
	decimal_A = mkA "das*malav"  ;
	define_V2 = mkV2 (compoundV "parib'a:Sa:" (mkV "de:na:"))  ;
	degree_N = mkN "ko:Ti"  ;
--      denote_V = mkV "pX,rakaT karna:"
	derivative_N = mkN "Avkalaj" ; -- -masculine ; --
	determinant_N = mkN "sa:raNik" ; -- -masculine ;
	determine_V = compoundV "nirX,d'a:rit" (mkV "krna")  ;
	deviation_N = mkN "vicalan"  ; --
	diagonal_A = mkA "vikarX,N"  ;
	difference_N = mkN "Am.tar" ; -- -masculine ;
	differentiate_V = compoundV "Avkalan" (mkV "karna:")  ; --
	direct_A = mkA "pX,ratX,yakX,S"  ;
	disprove_V = compoundV "k'aNX,Dan" (mkV "karna:")  ; --
	divergence_N = mkN "ApsaraN" ; -- -masculine ; --
	divide_V = compoundV "b'a:g" (mkV "karna:")  ;
	division_N = mkN "b'a:g"  ;
	divisor_N = mkN "b'a:jak"  ; --
	domain_N = mkN "pX,ra:m.t"  ;
	element_N = mkN "Avayav"  ;
	empty_A = mkA "rikX,t"  ;
	equal_A = mkA "tulX,y"  ;
	equivalent_A = mkA "samtulX,y"  ;
	evaluate_V2 = mkV2 "jancna"  ;
	exponential_N = mkN "carg'a:ta:m.k"  ;
	exterior_A = mkA "ba:hX,y"  ;
	fact_N = mkN "tat'X,y" masculine ;
	factor_N = mkN "guNak"  ;
	factorial_N = mkN "hat"  ;
--	find_V2 = mkV2 (compoundV "melwm" (mkV "krna"))  ;-- D'u:m.D'o
	find_V = mkV "D'u:m.D'o" ; --
	floor_N = mkN "nimX,n mu:lX,y"  ; -- 
	form_N = mkN "ru:p"  ; --
	fraction_N = mkN "b'inX,n" ; -- - masculine  ;
	function_N = mkN "p'alan"  ;
	gamma_N = mkN "ga:ma:"  ; --
	gamma_PN = mkPN "ga:ma:"  ; --
	gradient_N = mkN "Anupa:t" masculine ; --
	give_V = mkV "de:na:"  ;
-- -	great_A = mkA "great" "greater" "greatest" "greatly"  ;
	great_A = mkA "UtX,tam"  ;
	greatest_A = mkA "mahatX,tam"  ;
	group_N = mkN "mam.Dli:" feminine ; --
	hexadecimal_A = mkA "So:Das*a:d'a:ri:"  ; --
	hyperbolic_A = mkA ["Atiparavalaya:ka:r"]  ; --
	hold_V = mkV "d'a:raN karna:"  ; --
	identity_N = mkN "tatX,samak"  ; -- identity function
	imaginary_A = mkA "ka:lX,panik"  ;
	incident_A = mkA "pa:ti:"  ; --
	infinity_PN = mkPN "Anam.t"  ;
	-- infinity_minus_N = mkN ["minus infinity"]  ;
	infinity_minus_PN = mkPN ["R.N Anam.t"]  ;
	integer_A = mkA "pu:rX,Na:m.k"  ;
	integral_N = mkN "sama:kalan"  ; --
	integrate_V = mkV "sama:kalan karna:"  ; --
	interior_A = mkA "Am.tasX,t'ah."  ;
	intersection_N = mkN "sarX,vniSX,T'"  ;
	interval_N = mkN "Am.tara:l"  ;
	inverse_A = mkA "pX,ratilo:m"  ;
	inverse_N = mkN "pX,ratilo:m"  ;
	invert_V2 = mkV2 "pX,ratilo:m karna:"  ; -- vX,yutX,kX,ramaN karna:
	iterated_A = mkA "dohra:ya: gaya:"  ; --
	laplacian_N = mkN "le+ple:siAn"  ; --
	least_A = mkA "lag'utam"  ;
-- -	small_A = mkA "small" "less" "least" "less"  ;
	small_A = mkA "c'o:Ta:"  ;
	left_N = mkN "bayaN"  ;
	limit_N = mkN "si:ma:" feminine ;
	line_N = mkN "re:k'a:" feminine ;
	list_N = mkN "su:ci:"  ;
	little_A = mkA "c'o:Ta:"  ;
	logarithm_N = mkN "lag'ugaNak"  ;
	lower_A = mkA "nimX,n"  ;
	matrix_N = mkN "A:vX,yu:h" ; -- -masculine ;
	maximal_A = mkA "para:rX,d'X,y"  ; --
	mean_N = mkN "ma:d'X,y"  ;
	median_N = mkN "mad'X,yika:" feminine ;
	middle_A = mkA "mad'X,y"  ; --
	minimal_A = mkA "AlX,patam"  ; --
	mode_N = mkN "bahulak" ; -- -masculine ;
	moment_N = mkN "lmHh"  ;
	multiple_N = mkN "guNaj"  ;
	natural_A = mkA "sahaj"  ;
	negate_V2 = mkV2 (compoundV "k'am.Dan" (mkV "karna:"))  ;
	negative_N = mkN "R.Na:tX,mak"  ;
	node_N = mkN "A:sam.d'i"  ; --
	number_N = mkN "sam.k'X,ya:"  ;
	octal_A = mkA "ASX,Ta:d'a:ri:"  ; --
	open_A = mkA "k'ula:"  ;
	part_N = mkN "b'a:g" ; -- -masculine ;
	partial_A = mkA "A:m.s*ik"  ;
	point_N = mkN "bim.du"  ;
	polar_A = mkA "d'X,ruvi:ya"  ;
	polynomial_N = mkN "bahupad"  ;
	positive_A = mkA "d'ana:tmak"  ;
	power_N = mkN "g'a:t" feminine ;
	prime_A = mkA "Ab'a:jX,y"  ;
	primitive_N = mkN "A:dim"  ; --
	product_N = mkN "guNanp'al"  ; -- masculine
	proper_A = mkA "Ucit"  ;
	proposition_N = mkN "kat'an" ; -- -masculine ;
	prove_V = compoundV "sidX,d'" (mkV "karna:")  ;
	quotient_N = mkN "b'a:gp'al"  ;
	raise_V = mkV "baR'a:na:"  ;
	range_N = mkN "parisar"  ;
	rational_A = mkA "parime:y"  ;
	real_A = mkA "va:sX,tavik"  ;
	relation_N = mkN "sam.bam.d'"  ;
	remainder_N = mkN "s*e:Sp'al" ; -- -masculine ;
	right_N = mkN "da:hini:"  ;
	ring_N = mkN "rim.g"  ;
	root_N = mkN "mu:l" ; -- -masculine ;
	rounding_N = mkN "pu:rX,Nan" ; -- -masculine ; --
	row_N = mkN "pam.kX,ti"  ; --
	rule_N = mkN "niyam"  ;
	scalar_A = mkA "Adis*"  ;
	secant_N = mkN "c'e:dak re:k'a:" feminine  ;
	select_V = mkV "cunna:" ; -- compoundV "mntKb" (mkV "krna")  ;
	set_N = mkN "samucX,cay"  ;
	show_V = mkV "niru:pit karna:"  ;
	side_N = mkN "b'uj"  ;
	sine_N = mkN "ji:va:"  ;
        single_A = mkA "E:kal" ;
	simplify_V2 = mkV2 (compoundV "saral" (mkV "karna:"))  ;
	size_N = mkN "parima:N"  ; --
	solve_V2 = mkV2 (compoundV "hal" (mkV "krna"))  ;
	square_A = mkA "varX,ga:ka:r"  ;
	square_N = mkN "varX,g"  ;
	standard_A = mkA "ma:nak"  ;
	sum_N = mkN "yo:gp'al"  ;
	summation_N = mkN "yo:g sam.kX,riya:"  ;
--      symbol_N = mkN "pX,rati:k" 
	tangent_N = mkN "sX,parX,s*jX,ya:"  ;
	tend_V = mkV "j'ukna:"  ; --
	transpose_N = mkN "parivarX,t" masculine ; --
	transpose_V2 = mkV2 (compoundV "parivarX,t" (mkV "karna:")) ;
	true_A = mkA "satX,y"  ;
	truncation_N = mkN "c'inX,n karna:"  ; --
	typical_A = mkA "la:kX,SaNik"  ; --
	union_N = mkN "samX,milan"  ;
--      variable_N = mkN "car" 
	variance_N = mkN "b'inX,nta:"  ;
	value_N = mkN "ma:n"  ;
	vector_N = mkN "sadis*"  ;
	vectorial_A = mkA "sadis*"  ;
	zero_N = mkN "s*u:nX,y"  ;
	
oper
	add_V3 = mkV3 (mkV "add") "ko:" "se:"  ;
        assume_VS = mkVS (compoundV "ma:n" (mkV "le:na:")) ;
	decide_VQ = mkVQ decide_V ;
	determine_V2 = mkV2 determine_V ;
	determine_VQ = mkVQ determine_V ;
	differentiate_V2 = mkV2 differentiate_V ;
	differentiate_V3 = mkV3 differentiate_V  "ko:" "ke: sa:pe:kX,S" ; --respect_to_Prep  ;
	disprove_VS = mkVS disprove_V ;
	divide_V2 = mkV2 divide_V "ko:"  ;
	divide_V3 = mkV3 divide_V "ko:" "se:"  ;
	equal_A2 = mkA2 equal_A "ke:" ; -- to_Prep  ;
	equivalent_A2 = mkA2 equivalent_A "ke:" ; -- to_Prep  ;
	hold_for_V2 = mkV2 hold_V ["ke: liye:"] ; --for_Prep  ;
	integrate_V2 = mkV2 integrate_V  ;
	integrate_V3 = mkV3 integrate_V  "ko:" "ke: sa:pe:kX,S" ; -- respect_to_Prep  ;
	intersect_V3 = mkV3 (mkV "c'e:na:") "ko:" "کysath'"  ;
 	multiply_V3 = mkV3 (compoundV "guNa:" (mkV "karna:"))  "ko:" "se:" ; --by_Prep  ;
	prove_VS = mkVS prove_V  ;
	show_VS = mkVS show_V  ;
	subtract_V3 = mkV3 (compoundV "g'aTa:v" (mkV "karna:")) "ko:" "se:" ; -- from_Prep  ;
	raise_V2 = mkV2 raise_V  ;
	raise_V3 = mkV3 raise_V "ko:" ; -- to_Prep  ; -- -
 	range_V2 =mkV2 (mkV "Am.tara:l") "par" ;
        range_V3 = mkV3 (mkV "Am.tara:l") "se:"  "tak" ; 
	tend_V2 = mkV2 tend_V "ko:" ; -- to_Prep  ;
	unite_V3 = mkV3 (compoundV "samX,milan" (mkV "karna:")) "ko:" "se:" ;
	true_S = truthvalue "satX,y" ;
	false_S = truthvalue "AsatX,y"  ;

--2: Structural
oper
	mkSubjInd : Str -> Subj = \s -> {s= s; m= CR.Indic; lock_Subj= <>} ;
	--mkSubjConj : Str -> Subj = \s -> {s= s; m= CR.Conjunct; lock_Subj= <>} ;
	at_Prep = mkPrep "par" "par" ;
	over_Prep = mkPrep "par"  "par" ;
	respect_to_Prep = mkPrep ["ke: sa:pe:kX,S"] ["ke: sa:pe:kX,S"]   ;
	as_Subj = mkSubjInd "je+sa ki"  ;
	suchthat_Subj = mkSubjInd ["ta: ki"]  ;
	where_Subj = mkSubjInd "kaha:~"  ;
	about_Prep = mkPrep ["ke: ba:re:"] ["ke: ba:re:"] ;

--2: Other
oper
	makeN3 : N -> N3		= \noun -> mkN3 noun from_Prep "ko:" "" ;
	arc : N -> CN	= mkCNprefix "pX,ratilo:m" ;
	preACN : A -> CN -> CN	= mkCN ; -- \adj,cn -> mkCN (prefixA adj) cn ;
	prefixN :  Str -> N -> N	= \arc,sin -> {s= \\n,c => (arc ++ sin.s!n!c) ; g= sin.g ; lock_N=<> } ;
	two = n2_Numeral ;
	--byLeft_Adv : Adv		= by_AdvN left_N ;
	--byRight_Adv : Adv		= by_AdvN right_N ;
	--byBothSides_Adv : Adv	= by_AdvCN dos side_CN ;
	byLeft : CN -> CN = \cn -> mkCN cn (by_AdvN left_N) ;
	byRight : CN -> CN = \cn -> mkCN cn (by_AdvN right_N) ;
	byBothSides : CN -> CN = \cn -> mkCN cn (by_AdvCN two side_CN ) ;
	standard_deviation_CN = mkCN typical_A deviation_N ;
	not_a_number_CN	= mkCN (mkN "Asa:m.k'X,yik") ;

	radix_CN = mkCN (mkN "mu:l") ; 
	half_open_A = mkA "A:d'a: k'ula:" ;
	half_closed_A = mkA "A:d'a: bam.d" ;
	
} 
