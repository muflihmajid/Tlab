import 'package:clean_arc_flutter/app/repositories/api/weather_current_api_repository.dart';
import 'package:clean_arc_flutter/use_cases/weather_current/weather.dart';
import 'package:injector/injector.dart';
import 'package:clean_arc_flutter/use_cases/forecast_weather/forecast.dart';
import 'package:clean_arc_flutter/app/repositories/api/forecast_api_repositories.dart';

// Commonly here to declare dependency injection
class UseCaseModule {
  static void init(Injector injector) {
    // Use case

    injector.registerDependency<GetWeatherUseCase>((Injector injector) {
      return GetWeatherUseCase(
          injector.getDependency<WeatherCurrentApiRepository>());
    });

    injector.registerDependency<GetForcastUsecase>((Injector injector) {
      return GetForcastUsecase(injector.getDependency<ForecastApiRepository>());
    });
  }
}
