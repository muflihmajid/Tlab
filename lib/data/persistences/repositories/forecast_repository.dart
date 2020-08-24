import 'package:clean_arc_flutter/domains/entities/forecast.dart';

abstract class ForecastRepositories {
  Future<Forecast>getAll(Map<String, String> params);
}