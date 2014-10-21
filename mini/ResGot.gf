resource ResGot = open Prelude in {
  flags coding = utf8 ;


  -- parameters

  param
    Number = Sg | Du | Pl ;
    Gender = Masc | Neutr | Fem ;
    Case   = Nom | Gen | Dat | Acc ;  -- TODO: vocative
    Agr    = Ag Gender Number Person ;
    TTense  = Pres | Pret ;
    Person = Per1 | Per2 | Per3 ;
    VForm = VInf | VPres Number Person | VPret Number Person ;
    ADecl  = Strong | Weak ;
    ConjOp = Max | Add ;              -- number of compound given arguments


    -- parts of speech

  oper

    NP = {
      s : Case => Str ;
      a : Agr
      } ;

    -- for predication

    neg : Bool -> Str = \b -> case b of {True => [] ; False => "ni"} ;

    wisan_V = mkVerb "wisan" "im" "is" "ist"
      "siju" "sijuts" "sijum" "sijuþ" "sind"
      "was" "wast" "was" "wesu"
      "wesuts" "wesum" "wesuþ" "wesun" ;


    -- for coordination

    conjAgr : ConjOp -> Agr -> Agr -> Agr = \o,xa,ya ->
      case <xa,ya> of {
        <Ag xg xn xp, Ag yg yn yp> =>
          Ag (conjGender xg yg) (conjNumber o xn yn) (conjPerson xp yp)
      } ;

    conjGender : Gender -> Gender -> Gender = \g,h ->
      case g of {Masc => Masc ; _ => h} ;

    conjNumber : ConjOp -> Number -> Number -> Number = \o,m,n ->
      case o of {
	Max => case <m,n> of {
	  <Pl,_> | <_,Pl> => Pl ;
	  <Du,_> | <_,Du> => Du ;
	  <_,_>           => Sg
	  } ;
	Add => case <m,n> of {
	  <Sg,Sg> => Du ;
	  <_,_>   => Pl
	  }
      } ;

    conjPerson : Person -> Person -> Person = \p,q ->
      case <p,q> of {
        <Per1,_> | <_,Per1> => Per1 ;
        <Per2,_> | <_,Per2> => Per2 ;
        _                   => Per3
      } ;


    -- for morphology

    Noun : Type = {s : Number => Case => Str ; g : Gender} ;

    mkNoun : (x1,_,_,_,_,_,_,x8 : Str) -> Gender -> Noun =
      \dags, dagis, daga, dag, dagos, dage, dagam, dagans, g -> {
	s = table {
	  Sg => table {
	    Nom => dags  ;
	    Gen => dagis ;
	    Dat => daga  ;
	    Ack => dag
	    } ;
	  Du | Pl => table {
	    Nom => dagos  ;
	    Gen => dage   ;
	    Dat => dagam  ;
	    Ack => dagans
	    }
	  } ;
	g = g
      } ;

    Verb : Type = {s : VForm => Str} ;

    agrV : Verb -> Agr -> TTense -> Str =
      \v,a,t -> case <a,t> of {
	<Ag _ n p, Pres> => v.s ! VPres n p ;
	<Ag _ n p, Pret> => v.s ! VPret n p
      } ;

    mkVerb : (x0,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,x16 : Str) -> Verb =
      \x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16 -> {
	s =  table {
	  VInf => x0 ;
	  VPres Sg Per1 => x1 ;
	  VPres Sg Per2 => x2 ;
	  VPres Sg Per3 => x3 ;
	  VPres Du Per1 => x4 ;
	  VPres Du Per2 => x5 ;
	  VPres Pl Per1 => x6 ;
	  VPres Pl Per2 => x7 ;
	  VPres (Du | Pl) Per3 => x8 ;
	  VPret Sg Per1 => x9 ;
	  VPret Sg Per2 => x10 ;
	  VPret Sg Per3 => x11 ;
	  VPret Du Per1 => x12 ;
	  VPret Du Per2 => x13 ;
	  VPret Pl Per1 => x14 ;
	  VPret Pl Per2 => x15 ;
	  VPret (Du | Pl) Per3 => x16
	  }
      } ;

    -- define a strong verb from its theme
    strongVerb : (_,_,_,_: Str) -> Verb = \niman, nam, nemum, nimands ->
      let
	nim : Str = case niman of {
	  _ + "an" => init(init(niman)) ;
	  _        => niman
	  } ;
	nem = init(init nemum) ;
	phonology : Str -> Str = \s ->
	  case s of {
	    -- more cases needed in the future
	    x + "bt" => x + "ft";
	    _ => s
	  }
      in {
	s = table {
	  VInf => niman ;
	  VPres Sg Per1 => nim + "a" ;
	  VPres Sg Per2 => nim + "is" ;
	  VPres Sg Per3 => nim + "iþ" ;
	  VPres Du Per1 => nim + "os" ;
	  VPres Du Per2 => nim + "ats" ;
	  VPres Pl Per1 => nim + "am";
	  VPres Pl Per2 => nim + "iþ" ;
	  VPres (Du | Pl) Per3 => nim +"and" ;
	  VPret Sg Per1 => nam + "" ;
	  VPret Sg Per2 => phonology(nam + "t") ;
	  VPret Sg Per3 => nam + "" ;
	  VPret Du Per1 => nem + "u";
	  VPret Du Per2 => nem + "uts" ;
	  VPret Pl Per1 => nem + "um" ;
	  VPret Pl Per2 => nem + "uþ" ;
	  VPret (Du | Pl) Per3 => nem + "un"
	  }
      } ;

    Adj : Type = {s : ADecl => Gender => Number => Case => Str} ;

    mkAdj : (x1,_,_,_,_,_,_,_,_,_,_,_,_,
	       _,_,_,_,_,_,_,_,_,_,_,_,_,
	       _,_,_,_,_,_,_,_,_,_,_,_,_,
	       _,_,_,_,_,_,_,_,x48 : Str) -> Adj =
      \x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,
      x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,
      x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,
      x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48 -> {
	s = table {
	  Strong => table {
	    Masc => table {
	      Sg => table {
		Nom => x1 ;
		Gen => x2 ;
		Dat => x3 ;
		Ack => x4
		} ;
	      Du | Pl => table {
		Nom => x5 ;
		Gen => x6 ;
		Dat => x7 ;
		Ack => x8
		}
	      } ;
	    Neutr => table {
	      Sg => table {
		Nom => x9 ;
		Gen => x10 ;
		Dat => x11 ;
		Ack => x12
		};
	      Du | Pl => table {
		Nom => x13 ;
		Gen => x14 ;
		Dat => x15 ;
		Ack => x16
		}
	      };
	    Fem => table {
	      Sg => table {
		Nom => x17 ;
		Gen => x18 ;
		Dat => x19 ;
		Ack => x20
		} ;
	      Du | Pl => table {
		Nom => x21 ;
		Gen => x22 ;
		Dat => x23 ;
		Ack => x24
		}
	      }
	    } ;
	  Weak => table {
	    Masc => table {
	      Sg => table {
		Nom => x25 ;
		Gen => x26 ;
		Dat => x27 ;
		Ack => x28
		} ;
	      Du | Pl => table {
		Nom => x29 ;
		Gen => x30 ;
		Dat => x31 ;
		Ack => x32
		}
	      } ;
	    Neutr => table {
	      Sg => table {
		Nom => x33 ;
		Gen => x34 ;
		Dat => x35 ;
		Ack => x36
		};
	      Du | Pl => table {
		Nom => x37 ;
		Gen => x38 ;
		Dat => x39 ;
		Ack => x40
		}
	      };
	    Fem => table {
	      Sg => table {
		Nom => x41 ;
		Gen => x42 ;
		Dat => x43 ;
		Ack => x44
		} ;
	      Du | Pl => table {
		Nom => x45 ;
		Gen => x46 ;
		Dat => x47 ;
		Ack => x48
		}
	      }
	    }
	  }
      } ;


    adjSuffixes : ADecl => Gender => Number => Case => Str =
      table {
	Strong => table {
	  Masc => table {
	    Sg => table {
	      Nom => "s" ; Gen => "is" ; Dat => "amma" ; Ack => "ana"
	      } ;
	    Du | Pl => table {
	      Nom => "ai" ; Gen => "aize" ; Dat => "aim" ; Ack => "ans"
	      }
	    } ;
	  Neutr => table {
	    Sg => table {
	      Nom => "" ; Gen => "is" ; Dat => "amma" ; Ack => ""
	      };
	    Du | Pl => table {
	      Nom => "a" ; Gen => "aize" ; Dat => "aim" ; Ack => "a"
	      }
	    };
	  Fem => table {
	    Sg => table {
	      Nom => "a" ; Gen => "aizos" ; Dat => "ai" ; Ack => "a"
	      } ;
	    Du | Pl => table {
	      Nom => "os" ; Gen => "aizo" ; Dat => "aim" ; Ack => "os"
	      }
	    }
	  } ;
	Weak => table {
	  Masc => table {
	    Sg => table {
	      Nom => "a" ; Gen => "ins" ; Dat => "in" ; Ack => "an"
	      } ;
	    Du | Pl => table {
	      Nom => "ans" ; Gen => "ane" ; Dat => "am" ; Ack => "ans"
	      }
	    } ;
	  Neutr => table {
	    Sg => table {
	      Nom => "o" ; Gen => "ins" ; Dat => "in" ; Ack => "o"
	      };
	    Du | Pl => table {
	      Nom => "ona" ; Gen => "ane" ; Dat => "am" ; Ack => "ona"
	      }
	    };
	  Fem => table {
	    Sg => table {
	      Nom => "o" ; Gen => "ons" ; Dat => "on" ; Ack => "on"
	      } ;
	    Du | Pl => table {
	      Nom => "ons" ; Gen => "ono" ; Dat => "om" ; Ack => "ons"
	      }
	    }
	  }
      } ;

    Det = {s : Gender => Case => Str ; n : Number ; f : ADecl} ;

    mkDet : (x1,_,_,_,_,_,_,_,_,_,_,x12 : Str) -> Number -> ADecl -> Det =
      \x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,number,form -> {
	s = table {
	  Masc => table {
	    Nom => x1 ;
	    Gen => x2 ;
	    Dat => x3 ;
	    Acc => x4
	    } ;
	  Neutr => table {
	    Nom => x5 ;
	    Gen => x6 ;
	    Dat => x7 ;
	    Acc => x8
	    } ;
	  Fem => table {
	    Nom => x9 ;
	    Gen => x10 ;
	    Dat => x11 ;
	    Acc => x12
	    }
	};
	n = number ;
	f = form
      } ;

    pronNP : (n,g,d,a : Str) -> Gender -> Number -> Person -> NP =
      \n,g,d,a,gen,num,per -> {
	s = table {
	  Nom => n ;
	  Gen => g ;
	  Dat => d ;
	  Acc => a
	  } ;
	a = Ag gen num per
      } ;

}
