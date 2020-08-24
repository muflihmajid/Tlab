import 'package:clean_arc_flutter/domains/entities/weather.dart';

class WeatherMapper {
  WeatherCurrent getWeatherApiConverter(Map<String, dynamic> response) {
    List<Weather> weather = List<Weather>();
    var data = response['weather'];
    data.forEach((v) {
      weather.add(new Weather(
          id: v['id'], main: v['main'], description: v['description']));
    });
    return WeatherCurrent(
        datetime: response['dt'],
        main: Main(
          temp: response['main']['temp'],
          feelslike: response['main']['feels_like'],
          tempmin: response['main']['temp_min'],
          tempmax: response['main']['temp_max'],
          pressure: response['main']['pressure'],
          humidity: response['main']['humidity'],
        ),
        visibility: response['visibility'],
        wind: Wind(
            speed: response['wind']['speed'], deg: response['wind']['deg']),
        weather: weather);
  }
}
