concrete WeatherFactNsoQ of WeatherFact = LocationsNso, WeatherConditionsNso ** open Predef, SymbolicEng in {

  lincat
    Fact = Str ;
    WeatherElement = { s : Str ; c : ClassGender ; n : Number } ;
    WeatherElementList = { s : Str ; c : ClassGender ; n : Number } ;

    FloatNum = Str ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = "boso bja" ++ loc ++ "bo bjang" ++ q_mark ;
    ElementFact loc we =  we.s ++ possessivePart!we.n!we.c ++ loc ++ "ke eng" ++ q_mark ;
    ElementsFact loc el = el.s ++ possessivePart!el.n!el.c ++ loc ++ "ke eng" ++ q_mark ;

    TwoElements e1 e2 = { s = e1.s ++ "le" ++ e2.s ; c = e2.c ; n = e2.n } ;
    MoreElements es e = { s = e.s ++ comma ++ es.s ; c = es.c ; n = es.n } ;

    Temperature n = { s = "themperetsha" ; c = C9_10 ; n = Sg } ;
    Pressure n = { s = "kgatelelo" ; c = C9_10 ; n = Sg } ;
    Humidity n = { s = "monola" ; c = C9_10 ; n = Sg } ;
    WindSpeed n = { s = "lebello la moya" ; c = C5_6 ; n = Sg } ;
    WindDirectionE d = { s = "thoko ya moya" ; c = C3_4 ; n = Sg } ;
    Clouds n = { s = "sepipo sa maru" ; c = C7_8 ; n = Sg } ;

    North = [] ;
    South = [] ;
    East = [] ;
    West = [] ;
    NorthEast = [] ;
    NorthWest = [] ;
    SouthEast = [] ;
    SouthWest = [] ;
    UnknownDir = [] ;

    FNum f = [] ;
    UnknownNum = [] ;

    UnknownCondition = [] ;

  param
    Number = Sg | Pl ;
    ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C11_10 | C14_6 | C15 | C16 | C8_14 | C2_2b | C_SomePlace | CName  ;

  oper
    q_mark : Str = variants { SOFT_BIND++"?" ; [] } ;
    comma : Str = variants { SOFT_BIND++"," ; [] } ;

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
