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
 $Author:: caprotti   $:  Author of last commit
 $Date:: 2010-06-16 1#$:  Date of last commit

-}

--# -path=.:prelude:present

interface Lexicon = open Cat in {

--2: Preps, etc.
oper
  suchthat_Subj : Subj ; 
  as_Subj : Subj ;
  where_Subj : Subj ;
  if_Subj : Subj ;
  otherwise_Adv : Adv ;
  what_IComp : IComp ;
  about_Prep, over_Prep, respect_to_Prep, from_Prep, to_Prep : Prep ;


--2: Common Nouns: Usually a combination of A and N
oper
  absolute_value_CN : CN ;
  arccosecant_CN : CN ;
  arccosine_CN : CN ;
  arccotangent_CN : CN ;
  arcsecant_CN : CN ;
  arcsine_CN : CN ;
  arctangent_CN : CN ;
  argument_CN : CN ;
  binary_number_CN : CN ;
  cartesian_coordinate_CN : CN ;
  cartesian_product_CN: CN ;
  ceiling_CN : CN ;
  closed_interval_CN : CN ;
  column_CN : CN ;
  complex_conjugate_CN : CN ;
  complex_number_CN : CN ;
  composition_CN : CN ;
  configuration_CN : CN ;
  cosecant_CN : CN ;
  cosine_CN : CN ;
  cotangent_CN : CN ;
  cube_CN : CN;
  cuberoot_CN : CN ;
  curl_CN : CN ;
  decimal_number_CN : CN ;
  determinant_CN : CN ;
  derivative_CN : CN ;
  difference_CN : CN ;
  divergence_CN : CN ;
  domain_CN : CN ;
  element_CN : CN ; 
  element_linalg_CN : CN ;
  empty_set_CN : CN ;
  exponential_CN : CN ;
  factor_CN : CN ;
  factorial_CN : CN ;
  factorial_CN : CN ;
  floor_CN: CN ;
  form_CN : CN ;
  fraction_CN : CN ;
  function_CN : CN ;
  gradient_CN : CN ;
  greatest_common_divisor_CN : CN ; 
  hexadecimal_number_CN : CN ;
  hyperbolic_cosecant_CN : CN ;
  hyperbolic_cosine_CN : CN ;	  
  hyperbolic_cotangent_CN : CN ;
  hyperbolic_secant_CN : CN ;
  hyperbolic_sine_CN : CN ;
  hyperbolic_tangent_CN : CN ;
  identity_CN : CN ;
  imaginary_part_CN : CN ;
  integer_division_CN : CN ;
  integer_number_CN : CN ;
  integral_CN : CN ;
  integral_interval_CN : CN ;
  intersection_CN : CN ;
  interval_CN : CN ; 
  inverse_function_CN : CN ;
  inverse_number_CN : CN ;
  iterated_derivative_CN : CN ;
  laplacian_CN : CN ;
  least_common_multiple_CN : CN ;
  left_composition_CN : CN ;
  left_inverse_function_CN : CN ;
  limit_CN : CN ;
  line_CN : CN ;
  list_CN : CN ;
  logarithm_CN : CN ;
  lower_bound_CN : CN ;
  matrix_CN : CN ;
  maximal_element_CN : CN ;
  mean_CN : CN ;
  median_CN : CN ;
  midpoint_CN : CN ;
  minimal_element_CN : CN ;
  mode_CN : CN ;
  moment_CN : CN ;
  multiple_CN : CN ;
  natural_number_CN : CN ;
  natural_logarithm_CN : CN ;
  negative_CN : CN ;    -- unary minus
  octal_number_CN : CN ;
  open_interval_CN : CN ;
  outer_product_CN : CN ;
  partial_derivative_CN : CN ;
  point_CN : CN ;
  polar_coordinate_CN : CN ;
  power_CN : CN ;
  prime_number_CN : CN ;
  primitive_CN : CN ;
  product_CN : CN ;
  proper_subset_CN : CN ;
  proposition_CN : CN ;
  quotient_CN : CN ;
  radix_CN : CN ;
  range_CN : CN ;
  rational_number_CN : CN ;
  real_number_CN : CN ;
  real_part_CN : CN ;
  right_composition_CN : CN ;
  right_inverse_function_CN : CN ;
  remainder_CN : CN ;
  root_CN : CN ;
  rounding_CN : CN ;
  row_CN : CN ;
  scalar_product_CN : CN ;
  secant_CN : CN ;
  set_CN : CN ;
  side_CN : CN ;
  sine_CN : CN ;
  single_element_CN : CN ;
  size_CN : CN ;
  squareroot_CN : CN ;
  square_CN : CN ;
  standard_deviation_CN : CN ;
  subset_CN : CN ;
  sum_CN : CN ;
  summation_CN : CN ;
  tangent_CN : CN ;
  transpose_CN : CN ;
  truncation_CN : CN ;
  union_CN : CN ;
  value_CN : CN ;
  variance_CN : CN ;
  vector_CN : CN ;
  vector_product_CN : CN ;
  
-- 3: Special Nouns
  function_N3 : N3 ;
  fact_CN : S -> CN ;
	
-- 2: A, Adv and AP
oper
  true_AP : AP ;
  equal_to, equivalent_to, greater_than, less_than : NP -> AP;
  approximately_AdA : AdA ;

-- 2: Other
oper
	is_incident, is_collinear : NP -> Cl ;
	divided_by : (_,_:NP) -> Cl ;
	given_by, determined_by : CN -> NP -> NP ;
	tend_to : NP -> VP ;
	not_a_number_CN : CN ;
	e_NP, imaginary_NP, gamma_NP, infinity_NP, infinity_minus_NP,
	pi_NP : NP ;
	true_S, false_S : S ;
		

--2: Verbs

oper
  alternate_V2 : V2 ;
  approximate_V2 : V2 ;
  assert_VS : VS ;
  assume_VS : VS ;
  add_V3 : V3 ;
  associate_V3 : V3 ;
  belong_V2 : V2 ;
  calculate_V2 : V2 ;
  centralize_V2 : V2 ;
  collect_V2 : V2 ;
  compose_V2 : V2 ;
  compute_V2 : V2 ;
  contain_V2 : V2 ;
  concatenate_V3 : V3 ;
  configure_V2 : V2 ;
  conjugate_V2 : V2 ;
  continue_V2 : V2 ;
  converge_V : V ;
  convert_V3 : V3 ;
  count_V2 : V2 ;
  decide_VQ : VQ ;
  decompose_V3 : V3 ;
  define_V2 : V2 ;
  derive_V3 : V3 ;
  determine_V2 : V2 ;
  determine_VQ : VQ ;
  deviate_V2 : V2 ;
  differentiate_V2 : V2 ; differentiate_V3 : V3 ;
  disprove_VS : VS ;
  diverge_V : V ;
  divide_V2 : V2 ; divide_V3 : V3 ;
  eliminate_V2 : V2 ;
  -- equal_V2 : V2 ;
  -- estimate_V2 : V2 ;
  evaluate_V2 : V2 ;
  -- exist_V : V ;
  -- expand_V2 : V2 ;
  -- explore_V2 : V2 ;
  -- extend_V2 : V2 ;
  -- factorize_V2 : V2 ;
  find_V2 : V2;
  -- generalize_V2 : V2 ;
  -- generate_V2 : V2 ;
  hold_for_V2 : V2 ;
  -- imply_V2 : V2 ;
  integrate_V2 : V2 ; integrate_V3 : V3 ;
  -- intersect_V2 : V2 ; 
  -- intersect_V3 : V3 ;
  invert_V2 : V2 ;
  -- join_V3 : V3 ;
  -- lead_V2 : V2 ;
  -- let_V2 : V2 ; 
  -- let_V3 : V3 ; 
  -- list_V2 : V2 ;
  -- look_up_V2 : V2 ;
  -- map_V3 : V3 ;
  multiply_V3 : V3 ;
  negate_V2 : V2 ;
  -- normalize_V2 : V2 ;
  -- obtain_V2 : V2 ;
  -- orbit_V2 : V2 ;
  -- order_V2 : V2 ;
  -- pair_V3 : V3 ;
  -- permutate_V2 : V2 ;
  -- point_V2 : V2 ;
  -- project_V2 : V2 ;
  prove_VS : VS ;
  raise_V2 : V2 ; raise_V3 : V3 ;
  range_V3 : V3 ;
  -- reduce_V2 : V2 ;
  -- reduce_V3 : V3 ;
  -- relate_V3 : V3 ;
  -- remain_V2 : V2 ;
  -- represent_V2 : V2 ;
  -- result_V2 : V2 ;
  -- rotate_V : V ;
  -- round_V3 : V3 ;
  -- round_off_V2 : V2 ;
  -- search_V2 : V2 ;
  select_V2 : V2 ; select_V3 : V3 ;
  show_VS : VS ;
  simplify_V2 : V2 ;
  solve_V2 : V2 ;
  -- substitute_V2 : V2 ;
  subtract_V3 : V3 ;
  -- support_V2 : V2 ;
  -- suppose_VS : VS ;
  tend_V : V ;
  transpose_V2 : V2 ;
  -- truncate_V2 : V2 ;
} ;



