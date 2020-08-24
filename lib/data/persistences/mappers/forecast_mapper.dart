import 'package:clean_arc_flutter/domains/entities/forecast.dart';
import 'package:clean_arc_flutter/domains/entities/weather.dart';

class ForecastMapper {
  Forecast getForecastApiConverter(Map<String, dynamic> response) {
    List<WeatherForecast> weatherlist = List<WeatherForecast>();
    List<WeatherForecast> weatherlist2 = List<WeatherForecast>();
    List<WeatherIn> weather = List<WeatherIn>();
    var cod = response['cod'];
    var message = response['message'];
    var cnt = response['cnt'];
    var list = response['list'];
//    var data1 = response['list']['weather'];
    // list['weather'].forEach((v) {
    //   weather.add(new WeatherIn(
    //       id: v['id'], main: v['main'], description: v['description']));
    // });
    list.forEach((v) {
      weatherlist.add(new WeatherForecast(
        datetime: v['dt'],
        main: MainIn(
          temp: v['main']['temp'].toDouble(),
          feelslike: v['main']['feels_like'].toDouble(),
          tempmin: v['main']['temp_min'].toDouble(),
          tempmax: v['main']['temp_max'].toDouble(),
          pressure: v['main']['pressure'],
          humidity: v['main']['humidity'],
        ),
        weather: v['weather'].forEach((v) {
          weather.add(WeatherIn(
              id: v['id'], main: v['main'], description: v['description']));
        }),
        wind: WindIn(speed: v['wind']['speed'], deg: v['wind']['deg']),
        visibility: v['visibility'],
        dttext: v['dt_txt'],
      ));
    });    
    return Forecast(
      cod: cod,
      message: message,
      cnt: cnt,
      list: weatherlist,
      weather: weather,
    );
  }
}
