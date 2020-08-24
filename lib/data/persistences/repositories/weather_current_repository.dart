import 'package:clean_arc_flutter/domains/entities/weather.dart';

abstract class WeatherRepositories {
  Future<WeatherCurrent>getAll(Map<String, String> params);
}