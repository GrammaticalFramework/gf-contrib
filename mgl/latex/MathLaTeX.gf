--# -path=.:../lexicon:prelude:present:mathematical

resource MathLaTeX = 
 open 
      Prelude,
      myFormal
in
{
oper
	rel = infixn 0 ;
}

