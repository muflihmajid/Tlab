import 'dart:async';

import 'package:clean_arc_flutter/data/persistences/repositories/weather_current_repository.dart';
import 'package:clean_arc_flutter/domains/entities/weather.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// Declaring usecase of the entity
class GetWeatherUseCase extends UseCase<WeatherCurrent, Map<String, String>> {
  WeatherRepositories _repository;

  GetWeatherUseCase(this._repository);

  @override
  Future<Stream<WeatherCurrent>> buildUseCaseStream(Map<String, String> params) async {
    StreamController<WeatherCurrent> _controller = StreamController();
    try {
      WeatherCurrent weather = await _repository.getAll(params);
      _controller.add(weather);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
