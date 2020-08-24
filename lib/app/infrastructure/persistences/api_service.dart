import 'dart:convert';
import 'dart:async';

import 'package:clean_arc_flutter/app/infrastructure/event/dio_error.dart';
import 'package:clean_arc_flutter/data/infrastructures/api_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';

class ApiService extends ApiServiceInterface {
  Dio _dio;
  EventBus _eventBus;
  bool _needThrowError;

  ApiService(Dio dio, EventBus eventBus) {
    _dio = dio;
    _eventBus = eventBus;
  }

  // send http request
  Future<Map<String, dynamic>> invokeHttp(dynamic url, RequestType type,
      {Map<String, String> headers,
      dynamic body,
      Map<String, String> params,
      Encoding encoding,
      bool needThrowError = true}) async {
    Response response;
    this._needThrowError = needThrowError;
    try {
      response = await _invoke(url, type,
          headers: headers, body: jsonEncode(body), params: params);
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  // setup requiest type and configuration
  Future<Response> _invoke(dynamic url, RequestType type,
      {Map<String, String> headers,
      dynamic body,
      Map<String, String> params}) async {
    Response response;
    try {
      switch (type) {
        case RequestType.get:
          response = await _dio.get(
            url,
            options: buildCacheOptions(Duration(days: 7),
                options: Options(headers: headers),
                forceRefresh: true,
                maxStale: Duration(days: 7)),
            queryParameters: params,
          );
          break;
        case RequestType.post:
          response = await _dio.post(url,
              data: body,
              options: Options(
                headers: headers,
              ));
          break;
        case RequestType.put:
          response = await _dio.put(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.patch:
          response = await _dio.patch(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.delete:
          response = await _dio.delete(url, options: Options(headers: headers));
          break;
      }
      if (response.statusCode != 200) {
        throw DioError(
            response: new Response(
                statusCode: response.data['cod'],
                data: {'message': response.data['message']}));
      }
      return response;
    } on DioError catch (e) {
      print("erorr lhoo");
      this.notifyError(e.response);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  void notifyError(Response resp) {
    _eventBus.fire(new DioErrorEvent(
        code: resp.data['cod'],
        message: resp.data['message'],
        origin:'default'));
  }
}
