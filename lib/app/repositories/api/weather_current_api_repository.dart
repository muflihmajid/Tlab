

import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/data/infrastructures/api_service_interface.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/weather_current.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/weather_current_repository.dart';
import 'package:clean_arc_flutter/domains/entities/weather.dart';

class WeatherCurrentApiRepository extends WeatherRepositories {
  ApiServiceInterface _service;
  Endpoints _endpoints;
  WeatherMapper _mapper;

  WeatherCurrentApiRepository(ApiServiceInterface service, Endpoints endpoints, WeatherMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  Future<WeatherCurrent> getAll(Map<String, String> params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        _endpoints.weathercur(), 
        RequestType.get,
        params: params
      );
    } catch (error) {
      rethrow;
    }
    return _mapper.getWeatherApiConverter(resp);
  }
}