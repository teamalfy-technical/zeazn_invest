import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/enums/app.enums.dart';
import 'package:zeazn_invest_app/env/env.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

final LoginDs loginDs = Get.put(LoginDsImpl());

class LoginDsImpl implements LoginDs {
  @override
  Future<ApiResponse<User>> loginUser({
    required String email,
    required String password,
  }) async {
    final payload = dio.FormData.fromMap({
      'email': email,
      'password': password,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.login,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<List<Message>>> logout() async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        endPoint: Env.logout,
      );
      return ApiResponse<List<Message>>.fromJson(
        res,
        (data) => (data as List).map((e) => Message.fromJson(e)).toList(),
      );
    });
  }
}
