import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

import '../../../infrastructure/dal/daos/data_sources/remote_data_source_impl.dart';
import '../../../infrastructure/dal/services/database/storage_service_tables.dart';
import '../dto/models/token_model.dart';
import '../interfaces/use_cases/i_refresh_token_use_case.dart';
import 'log_helper.dart';

class AuthenticationInterceptor extends QueuedInterceptorsWrapper {
  final Dio _mainDio;
  late Dio _dio;
  final _lock = synchronized.Lock();
  IRefreshTokenUseCase? iRefreshTokenUseCase;

  AuthenticationInterceptor(this._mainDio, {this.iRefreshTokenUseCase}) {
    BaseOptions options = BaseOptions(
      baseUrl: Brain.baseDomain,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {
        "refreshtoken": getRefreshToken(),
        "cityid": Brain.cityID,
        "addressid": Brain.addressID,
        "type": "Flutter",
      },
    );
    _dio = Dio(options);

    _dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      handler.next(options);
      // return super.onRequest(options, handler);
    }));
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  void changeMainDomain(String url) {
    _dio.options.baseUrl = url;
  }

  getRefreshToken() {
    var checkToken = (Brain.token.accessToken ?? "").isNotEmpty;

    return checkToken ? Brain.token.refreshToken : "";
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if ((Brain.token.accessToken ?? "").isEmpty) {
      options.headers["authorization"] = "";
    } else {
      options.headers["authorization"] = "${Brain.token.tokenType} ${Brain.token.accessToken}";
    }

    if (options.data != null) {
      LogHelper.printLog(data: "Body: ${options.data}");
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // Conditions
    var checkError = err.response == null || err.response!.statusCode == null;

    if (checkError) {
      return super.onError(err, handler);
    }

    return await _lock.synchronized(() async {
      int responseCode = err.response!.statusCode!;
      if (responseCode == 401) {
        if ((Brain.token.accessToken ?? "").isNotEmpty) {
          bool checkTokenTime = (Brain.token.expiresOn ?? 0) > DateTime.now().millisecondsSinceEpoch;

          if (checkTokenTime) {
            RequestOptions options = err.response!.requestOptions;
            options.headers["authorization"] = "${Brain.token.tokenType} ${Brain.token.accessToken}";

            return _mainDio.fetch(options).then((r) => handler.resolve(r), onError: (e) => handler.reject(e));
          } else {
            RequestOptions options = err.response!.requestOptions;

            var result = await RemoteDataSourceImpl().refreshToken(dio: _dio);

            if (result.accessToken != null && (result.accessToken ?? "").isNotEmpty) {
              var newToken = result;

              int expiresOn = DateTime.now().add(Duration(seconds: newToken.expiresIn ?? 0)).millisecondsSinceEpoch;

              VMToken token = VMToken(
                accessToken: newToken.accessToken,
                refreshToken: newToken.refreshToken,
                tokenType: newToken.tokenType,
                expiresIn: newToken.expiresIn,
                expiresOn: expiresOn,
              );

              await Brain.storageService.deleteByProperty(StorageServiceTables.tableToken).then((value) async {
                await Brain.storageService
                    .insert(data: token.toJson(), storageServiceTables: StorageServiceTables.tableToken);
              });

              Brain.token = token;

              options.headers["authorization"] = "${newToken.tokenType} ${newToken.accessToken}";
              return _mainDio.fetch(options).then((r) => handler.resolve(r), onError: (e) => handler.reject(e));
            } else {
              logout();
            }
          }
        } else {
          logout();
        }
      }
      return super.onError(err, handler);
    });
  }

  void logout() {
    _mainDio.options.headers["authorization"] = "";

    Brain.logout();
  }
}
