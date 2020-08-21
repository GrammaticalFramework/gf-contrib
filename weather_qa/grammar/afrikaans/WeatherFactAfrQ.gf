concrete WeatherFactAfrQ of WeatherFact = LocationsAfr, WeatherConditionsAfr ** open Predef, SymbolicEng in {

  lincat
    Fact = Str ;
    WeatherElement = Str ;
    WeatherElementList = Str ;

    FloatNum = Str ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = "hoe is die weer in" ++ loc ++ q_mark ;
    ElementFact loc we = "wat is die" ++ we ++ "in" ++ loc ++ q_mark ;
    ElementsFact loc el = "wat is die" ++ el ++ "in" ++ loc ++ q_mark ;

    TwoElements e1 e2 = e1 ++ "en" ++ e2 ;
    MoreElements es e = e ++ comma ++ es ;

    Temperature n = "temperatuur" ;
    Pressure n = "lugdruk" ;
    Humidity n = "humiditeit" ;
    WindSpeed n = "windspoed" ;
    WindDirectionE d = "windrigting" ;
    Clouds n = "wolkdekking" ;

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

  oper
    q_mark : Str = variants { SOFT_BIND++"?" ; [] } ;
    comma : Str = variants { SOFT_BIND++"," ; [] } ;
}
