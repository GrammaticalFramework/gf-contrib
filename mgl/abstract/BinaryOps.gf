abstract BinaryOps = Ground ** 
{
fun
--From Arith1
	bin_plus, bin_times : ValNum -> ValNum -> ValNum ;
  	bin_minus, bin_over : ValNum -> ValNum -> ValNum ;  


--From Logic1
	bin_and,
    	bin_or,
    	bin_xor : Prop -> Prop -> Prop ;

--From Set1
	bin_intersect,
	bin_union,
	bin_cartesian_product : ValSet -> ValSet -> ValSet ;


}

