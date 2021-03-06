import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'authentication_interceptor.dart';
import 'brain.dart';

class BaseDio {
  late Dio _dio;
  late AuthenticationInterceptor _tokenInterceptor;

  Dio _initDio() {
    BaseOptions baseOptions = new BaseOptions(
      baseUrl: Brain.baseDomain,
      connectTimeout: 25000,
      receiveTimeout: 25000,
      responseType: ResponseType.json,
      headers: headers(),
    );

    Dio dio = new Dio(baseOptions);
    _tokenInterceptor = new AuthenticationInterceptor(dio);
    dio.interceptors.add(_tokenInterceptor);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }

    return dio;
  }

  void changeWebDomain(String domain) {
    _dio.options.baseUrl = domain;
  }

  BaseDio() {
    _dio = _initDio();
  }

  Dio get dio => _dio;

  headers() {
    "";
    var headers = {
      "authorization": "${Brain.token.TokenType} ${Brain.token.AccessToken}",
      "cityid": Brain.cityID,
      "addressid": Brain.addressID,
      "type": "Flutter",
      "platform": kIsWeb ? "webapp" : Brain.platform,
      "os": Brain.os,
      "application": "hadish.sesoot",
      "appversion": Brain.appVersion,
      "buildnumber": Brain.appBuildNumber,
      "deviceid": (kIsWeb) ? ((Brain.playerID != null) ? Brain.playerID : "") : Brain.deviceID,
      "playerid": (Brain.playerID != null) ? Brain.playerID : "",
    };
    return headers;
  }
}
