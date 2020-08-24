import 'dart:async';

import 'package:clean_arc_flutter/data/persistences/repositories/forecast_repository.dart';
import 'package:clean_arc_flutter/domains/entities/forecast.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// Declaring usecase of the entity
class GetForcastUsecase extends UseCase<Forecast, Map<String, String>> {
  ForecastRepositories _repository;

  GetForcastUsecase(this._repository);

  @override
  Future<Stream<Forecast>> buildUseCaseStream(Map<String, String> params) async {
    StreamController<Forecast> _controller = StreamController();
    try {
      Forecast forecast = await _repository.getAll(params);
      _controller.add(forecast);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
