import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';

import '../../../../domain/core/dto/use_cases/responses/confirm_response_dto_use_case.dart';
import '../../../../domain/core/dto/use_cases/responses/response_dto_use_case.dart';
import '../../../../domain/core/helpers/log_helper.dart';
import '../../../../domain/core/interfaces/repositories/remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  headers() {
    var headers = {
      "refreshtoken": getRefreshToken(),
    };
    return headers;
  }

  getRefreshToken() {
    var checkToken = (Brain.token.AccessToken ?? "").isNotEmpty;

    return checkToken ? Brain.token.RefreshToken : "";
  }

  @override
  Future<ConfirmResponseDtoUseCase> refreshToken({required Dio dio}) async {
    var result = await dio
        .post(
      "/identity/customer/refreshToken",
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      LogHelper.printLog(data: "Refresh Token Response: $response");
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      ConfirmResponseDtoUseCase confirmResponseDtoUseCase = ConfirmResponseDtoUseCase.fromJson(apiResult.Content);
      return confirmResponseDtoUseCase;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return ConfirmResponseDtoUseCase();
    });

    return result;
  }
}
