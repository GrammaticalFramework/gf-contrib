concrete WeatherFactAfrR of WeatherFact = LocationsAfr, WeatherConditionsAfr ** open Predef, SymbolicEng, Prelude in {

  lincat
    Fact = Str ;
    WeatherElement = { e : Str ; d : Str } ;
    WeatherElementList = Str ;

    FloatNum = { sym : Symb ; known : Bool } ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = loc++"het"++cond ;
    ElementFact loc descr = "die" ++ descr.e ++ "in" ++ loc ++ "is" ++ descr.d ;
    ElementsFact loc descrs = "in" ++ loc ++ "is" ++ descrs ;

    TwoElements e1 e2 = "die" ++ e1.e ++ e1.d ++ "en" ++ "die" ++ e2.e ++ e2.d ;
    MoreElements el e = "die" ++ e.e ++ e.d ++ "," ++ el ;

    Temperature n = mkElement "temperatuur" n.sym.s "grade Celsius" n.known ;
    Pressure n = mkElement "lugdruk" n.sym.s "hectopascal" n.known ;
    Humidity n = mkElement "humiditeit" n.sym.s "persent" n.known ;
    WindSpeed n = mkElement "windspoed" n.sym.s "kilometer per uur" n.known ;
    WindDirectionE d = { e = "windrigting" ; d = d } ;
    Clouds n = mkElement "wolkdekking" n.sym.s "persent" n.known ;

    North = "noord" ;
    South = "suid" ;
    East = "oos" ;
    West = "wes" ;
    NorthEast = "noord-oos" ;
    NorthWest = "noord-wes" ;
    SouthEast = "suid-oos" ;
    SouthWest = "suid-wes" ;
    UnknownDir = "onbekend" ;

    FNum f = { sym = mkSymb f.s ; known = True } ;
    UnknownNum = { sym = mkSymb "onbekend" ; known = False } ;

    UnknownCondition = "onbekende weerstoestande" ;

  oper
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
