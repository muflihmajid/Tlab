

import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/data/infrastructures/api_service_interface.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/forecast_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/forecast_repository.dart';
import 'package:clean_arc_flutter/domains/entities/forecast.dart';

class ForecastApiRepository extends ForecastRepositories {
  ApiServiceInterface _service;
  Endpoints _endpoints;
  ForecastMapper _mapper;

  ForecastApiRepository(ApiServiceInterface service, Endpoints endpoints, ForecastMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  Future<Forecast> getAll(Map<String, String> params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        _endpoints.forecast(), 
        RequestType.get,
        params: params
      );
    } catch (error) {
      rethrow;
    }
    return _mapper.getForecastApiConverter(resp);
  }
}