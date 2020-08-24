import 'package:clean_arc_flutter/data/persistences/mappers/forecast_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/weather_current.dart';
import 'package:injector/injector.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton<UserMapper>((_) => UserMapper());
    injector.registerSingleton<WeatherMapper>((_) => WeatherMapper());
    injector.registerSingleton<ForecastMapper>((_) => ForecastMapper());
  }
}
