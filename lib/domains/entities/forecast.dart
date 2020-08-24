// Declaring Entities and its property
class Forecast {
  String cod;
  int message;
  int cnt;
  List<WeatherIn> weather;
  List<WeatherForecast> list;
  Forecast({this.cod, this.message, this.list, this.cnt, this.weather});
}

class WeatherForecast {
  List<WeatherIn> weather;
  MainIn main;
  WindIn wind;
  int visibility;
  int datetime;
  String dttext;
  String icon;

  WeatherForecast(
      {this.weather,
      this.main,
      this.visibility,
      this.datetime,
      this.wind,
      this.dttext});
}

class WindIn {
  double speed;
  int deg;

  WindIn({this.speed, this.deg});
}

class MainIn {
  double temp;
  double feelslike;
  double tempmin;
  double tempmax;
  int pressure;
  int humidity;

  MainIn({
    this.temp,
    this.feelslike,
    this.tempmin,
    this.tempmax,
    this.pressure,
    this.humidity,
  });
}

class WeatherIn {
  int id;
  String main;
  String description;

  WeatherIn({this.id, this.main, this.description});
}
