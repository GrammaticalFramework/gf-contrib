abstract WeatherConditions = {

  cat
    WeatherCondition ;

  fun
    thunderstorm_with_light_rain : WeatherCondition ;
    thunderstorm_with_rain : WeatherCondition ;
    thunderstorm_with_heavy_rain : WeatherCondition ;
    light_thunderstorm : WeatherCondition ;
    thunderstorm : WeatherCondition ;
    heavy_thunderstorm : WeatherCondition ;
    ragged_thunderstorm : WeatherCondition ;
    thunderstorm_with_light_drizzle : WeatherCondition ;
    thunderstorm_with_drizzle : WeatherCondition ;
    thunderstorm_with_heavy_drizzle : WeatherCondition ;

    light_intensity_drizzle : WeatherCondition ;
    drizzle : WeatherCondition ;
    heavy_intensity_drizzle : WeatherCondition ;
    light_intensity_drizzle_rain : WeatherCondition ;
    drizzle_rain : WeatherCondition ;
    heavy_intensity_drizzle_rain : WeatherCondition ;
    shower_rain_and_drizzle : WeatherCondition ;
    heavy_shower_rain_and_drizzle : WeatherCondition ;
    shower_drizzle : WeatherCondition ;

    light_rain : WeatherCondition ;
    moderate_rain : WeatherCondition ;
    heavy_intensity_rain : WeatherCondition ;
    very_heavy_rain : WeatherCondition ;
    extreme_rain : WeatherCondition ;
    freezing_rain : WeatherCondition ;
    light_intensity_shower_rain : WeatherCondition ;
    shower_rain : WeatherCondition ;
    heavy_intensity_shower_rain : WeatherCondition ;
    ragged_shower_rain : WeatherCondition ;

    light_snow : WeatherCondition ;
    snow : WeatherCondition ;
    heavy_snow : WeatherCondition ;
    sleet : WeatherCondition ;
    shower_sleet : WeatherCondition ;
    light_rain_and_snow : WeatherCondition ;
    rain_and_snow : WeatherCondition ;
    light_shower_snow : WeatherCondition ;
    shower_snow : WeatherCondition ;
    heavy_shower_snow : WeatherCondition ;

    mist : WeatherCondition ;
    smoke : WeatherCondition ;
    haze : WeatherCondition ;
    sand_dust_whirls : WeatherCondition ;
    fog : WeatherCondition ;
    sand : WeatherCondition ;
    dust : WeatherCondition ;
    volcanic_ash : WeatherCondition ;
    squalls : WeatherCondition ;
    tornado : WeatherCondition ;

    clear_sky : WeatherCondition ;

    few_clouds : WeatherCondition ;
    scattered_clouds : WeatherCondition ;
    broken_clouds : WeatherCondition ;
    overcast_clouds : WeatherCondition ;
}
