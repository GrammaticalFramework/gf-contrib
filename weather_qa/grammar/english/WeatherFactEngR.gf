concrete WeatherFactEngR of WeatherFact = LocationsEng, WeatherConditionsEng ** open Predef, SymbolicEng, Prelude in {

  lincat
    Fact = Str ;
    WeatherElement = { e : Str ; d : Str } ;
    WeatherElementList = Str ;

    FloatNum = { sym : Symb ; known : Bool } ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = loc++"has"++cond ;
    ElementFact loc descr = "the" ++ descr.e ++ "in" ++ loc ++ "is" ++ descr.d ;
    ElementsFact loc descrs = "in" ++ loc ++ comma ++ descrs ;

    TwoElements e1 e2 = "the" ++ e1.e ++ "is" ++ e1.d ++ "and" ++ "the" ++ e2.e ++ "is" ++ e2.d ;
    MoreElements el e = "the" ++ e.e ++ "is" ++ e.d ++ comma ++ el ;

    Temperature n = mkElement "temperature" n.sym.s "degrees Celsius" n.known ;
    Pressure n = mkElement "pressure" n.sym.s "hectopascal" n.known ;
    Humidity n = mkElement "humidity" n.sym.s "percent" n.known ;
    WindSpeed n = mkElement "wind speed" n.sym.s "kilometers an hour" n.known ;
    WindDirectionE d = { e = "wind direction" ; d = d } ;
    Clouds n = mkElement "cloud coverage" n.sym.s "percent" n.known ;

    North = "north" ;
    South = "south" ;
    East = "east" ;
    West = "west" ;
    NorthEast = "north east" ;
    NorthWest = "north west" ;
    SouthEast = "south east" ;
    SouthWest = "south west" ;
    UnknownDir = "unknown" ;

    FNum f = { sym = mkSymb f.s ; known = True } ;
    UnknownNum = { sym = mkSymb "unknown" ; known = False } ;

    UnknownCondition = "unknown weather conditions" ;

  oper

    comma : Str = variants { SOFT_BIND++"," ; [] } ;

    mkElement : Str -> Str -> Str -> Bool -> { e : Str ; d : Str } = \e,d,m,k -> case k of {
      True => {
        e = e ;
        d = d ++ m
      } ;
      False => {
        e = e ;
        d = d
      }
    } ;
}
