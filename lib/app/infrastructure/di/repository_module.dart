import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/app/infrastructure/persistences/api_service.dart';
import 'package:clean_arc_flutter/app/repositories/api/forecast_api_repositories.dart';
import 'package:clean_arc_flutter/app/repositories/api/weather_current_api_repository.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/forecast_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/weather_current.dart';
import 'package:injector/injector.dart';


class RepositoryModule {

  static void init(Injector injector) {

    injector.registerDependency<WeatherCurrentApiRepository>( (Injector injector) {
      return WeatherCurrentApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<WeatherMapper>()
      );
    });

    injector.registerDependency<ForecastApiRepository>( (Injector injector) {
      return ForecastApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<ForecastMapper>()
      );
    });
  }
}