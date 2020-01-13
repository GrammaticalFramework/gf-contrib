concrete WeatherFactNsoR of WeatherFact = LocationsNso, WeatherConditionsNso ** open Predef, SymbolicEng, Prelude in {

  lincat
    Fact = Str ;
    WeatherElement = { e : Str ; c : ClassGender ; n : Number ; d : Str } ;
    WeatherElementList = { e : Str ; c : ClassGender ; n : Number } ;

    FloatNum = { sym : Symb ; known : Bool } ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = loc++"e na le"++cond ;
    ElementFact loc descr = descr.e ++ possessivePart!descr.n!descr.c ++ loc ++ "ke" ++ descr.d ;
    ElementsFact loc descrs =  descrs.e ++ possessivePart!descrs.n!descrs.c ++ loc ;

    TwoElements e1 e2 = { e = e1.e ++ "ke" ++ e1.d ++ "le" ++ e2.e ++ "ke" ++ e2.d ; c = e2.c ; n = e2.n } ;
    MoreElements el e = { e = e.e ++ "ke" ++ e.d ++ comma ++ el.e ; c = el.c ; n = el.n } ;

    Temperature n = mkElement "themperetsha" C9_10 Sg n.sym.s "" n.known ;
    Pressure n = mkElement "kgatelelo" C9_10 Sg n.sym.s "" n.known ;
    Humidity n = mkElement "monola" C9_10 Sg n.sym.s "" n.known ;
    WindSpeed n = mkElement "lebello la moya" C5_6 Sg n.sym.s "" n.known ;
    WindDirectionE d = { e = "thoko ya moya" ; c = C3_4 ; n = Sg ; d = d } ;
    Clouds n = mkElement "sepipo sa maru" C9_10 Sg n.sym.s "" n.known ;

    North = "leboa" ;
    South = "borwa" ;
    East = "bohlabela" ;
    West = "bodikela" ;
    NorthEast = "leboa bohlabela" ;
    NorthWest = "leboa bodikela" ;
    SouthEast = "borwa bohlabela" ;
    SouthWest = "borwa bodikela" ;
    UnknownDir = "unknown" ;

    FNum f = { sym = mkSymb f.s ; known = True } ;
    UnknownNum = { sym = mkSymb "[unknown]" ; known = False } ;

    UnknownCondition = "[unknown weather conditions]" ;

  param
    Number = Sg | Pl ;
    ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C11_10 | C14_6 | C15 | C16 | C8_14 | C2_2b | C_SomePlace | CName  ;

  oper
    comma : Str = variants { SOFT_BIND++"," ; [] } ;

    mkElement : Str -> ClassGender -> Number -> Str -> Str -> Bool -> { e : Str ; d : Str ; c : ClassGender ; n : Number } = \e,c,n,d,m,k -> case k of {
      True => {
        e = e ;
        d = d ++ m ;
        c = c ;
        n = n
      } ;
      False => {
        e = e ;
        d = d ;
        c = c ;
        n = n
      }
    } ;

    possessivePart : Number => ClassGender => Str = table {
      Sg =>  table {
        C1_2   => "wa" ;
				C1a_2a => "wa" ;
				C3_4   => "wa" ;
				C5_6   => "la" ;
				C7_8   => "sa" ;
				C9_10  => "ya" ;
				C14_6  => "bja" ;
				_ => "e"
			} ;
			Pl =>  table {
				C1_2   => "ba" ;
				C1a_2a => "ba" ;
				C3_4   => "ya" ;
				C5_6   => "a" ;
				C7_8   => "tša" ;
				C9_10  => "tša" ;
				C14_6  => "a" ;
				_ => "e"
			}
    } ;
}
