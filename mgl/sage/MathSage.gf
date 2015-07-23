--# -path=.:../lexicon:prelude:present:mathematical

resource MathSage =
open 
      Prelude,
      myFormal
in
{
oper
	rel = infixn 0 ;
}

