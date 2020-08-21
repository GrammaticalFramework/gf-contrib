concrete WeatherFactEngQ of WeatherFact = LocationsEng, WeatherConditionsEng ** open Predef, SymbolicEng in {

  lincat
    Fact = Str ;
    WeatherElement = Str ;
    WeatherElementList = Str ;

    FloatNum = Str ;
    WindDirection = Str ;

  lin
    ConditionFact loc cond = "what is the weather like in" ++ loc ++ q_mark ;
    ElementFact loc we = "what is the" ++ we ++ "in" ++ loc ++ q_mark ;
    ElementsFact loc el = "what" ++ variants { "are" ; "is" } ++ "the" ++ el ++ "in" ++ loc ++ q_mark ;

    TwoElements e1 e2 = e1 ++ "and" ++ e2 ;
    MoreElements es e = e ++ comma ++ es ;

    Temperature n = "temperature" ;
    Pressure n = "pressure" ;
    Humidity n = "humidity" ;
    WindSpeed n = "wind speed" ;
    WindDirectionE d = "wind direction" ;
    Clouds n = "cloud coverage" ;

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
