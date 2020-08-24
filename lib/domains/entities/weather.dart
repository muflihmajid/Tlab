// Declaring Entities and its property
class WeatherCurrent {
  List<Weather> weather;
  Main main;
  Wind wind;
  int visibility;
  int datetime;

  WeatherCurrent(
      {this.weather, this.main, this.visibility, this.datetime, this.wind});
}

class Wind {
  double speed;
  int deg;

  Wind({this.speed, this.deg});
}

class Main {
  double temp;
  double feelslike;
  double tempmin;
  double tempmax;
  int pressure;
  int humidity;

  Main({
    this.temp,
    this.feelslike,
    this.tempmin,
    this.tempmax,
    this.pressure,
    this.humidity,
  });
}

class Weather {
  int id;
  String main;
  String description;

  Weather({this.id, this.main, this.description});
}
