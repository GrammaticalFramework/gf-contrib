--# -path=.:../Ground:../lexicon

concrete SetName1Sage of SetName1 = GroundSage **
open
	Prelude,
	myFormal in
{
lin
	set_N = constant "NN" ;      --Non negative integer semiring
	set_P = constant "Primes()" ;
	set_Z = constant "ZZ" ;
	set_Q = constant "QQ" ;
	set_R = constant "RR" ;
	set_C = constant "CC" ;
    
    mkSet x = constant x.s ;
}

