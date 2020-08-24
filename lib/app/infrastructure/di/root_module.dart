import 'dart:convert';
import 'package:clean_arc_flutter/app/infrastructure/db/db_helper.dart';
import 'package:clean_arc_flutter/app/infrastructure/encrypter.dart';
import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/app/infrastructure/persistences/api_service.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
// Commonly here to declare dependency injection
class RootModule {
  static void init(Injector injector) {
    injector.registerSingleton<Endpoints>(
        (_) => Endpoints(DotEnv().env['BASE_URL']));
    injector.registerSingleton<UserData>((_) => UserData());
    injector.registerDependency<Dio>((Injector injector) {
      var dio = Dio();
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;
      var endpoints = injector.getDependency<Endpoints>();

      // use for log response and request data
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          request: true));
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor);

      dio.options.baseUrl = endpoints.baseUrl;

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      return dio;
    });

    injector.registerSingleton<EventBus>((Injector injector) {
      return EventBus();
    });

    injector.registerDependency<ApiService>((Injector injector) {
      return ApiService(
          injector.getDependency<Dio>(), injector.getDependency<EventBus>());
    });



    injector.registerDependency<Encrypter>((Injector injector) {
      return Encrypter();
    });

    injector.registerSingleton<Future<Database>>((Injector injector) async {
      String path = join(await getDatabasesPath(), DBHelper.DATABASE_NAME);
      return await openDatabase(path,
          version: int.parse(DotEnv().env['DB_VERSION']),
          onCreate: (db, version) async {
        return db.execute(DBHelper.CREATE_PKT_REPORTS_TABLE);
      });
    });
  }

  

  static parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}
