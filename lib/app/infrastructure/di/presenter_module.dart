import 'package:clean_arc_flutter/app/ui/pages/weather/presenter.dart';
import 'package:clean_arc_flutter/use_cases/forecast_weather/forecast.dart';
import 'package:clean_arc_flutter/use_cases/weather_current/weather.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<WeatherPresenter>((Injector injector) {
      return WeatherPresenter(
          injector.getDependency<GetWeatherUseCase>(),
          injector.getDependency<GetForcastUsecase>());
    });
  }
}
