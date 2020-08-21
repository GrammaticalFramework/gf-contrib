abstract WeatherFact = Locations, WeatherConditions ** {

  flags
    startcat = Fact ;

  cat
    Fact ;
    WeatherElement ;
    WeatherElementList ;

    FloatNum ;
    WindDirection ;

  fun
    ConditionFact : Location -> WeatherCondition -> Fact ;
    ElementFact : Location -> WeatherElement -> Fact ;
    ElementsFact : Location -> WeatherElementList -> Fact ;

    TwoElements : WeatherElement -> WeatherElement -> WeatherElementList ;
    MoreElements : WeatherElementList -> WeatherElement -> WeatherElementList ;

    Temperature : FloatNum -> WeatherElement ;
    Pressure : FloatNum-> WeatherElement ;
    Humidity : FloatNum -> WeatherElement ;
    WindSpeed : FloatNum -> WeatherElement ;
    WindDirectionE : WindDirection -> WeatherElement ;
    Clouds : FloatNum -> WeatherElement ;

    North, South, East, West : WindDirection ;
    NorthEast, NorthWest, SouthEast, SouthWest : WindDirection ;
    UnknownDir : WindDirection ;

    FNum : Float -> FloatNum ;
    UnknownNum : FloatNum ;

    UnknownCondition : WeatherCondition ;
}
