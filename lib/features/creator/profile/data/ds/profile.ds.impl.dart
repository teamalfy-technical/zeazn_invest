import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/enums/app.enums.dart';
import 'package:zeazn_invest_app/env/env.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';

final ProfileDs profileDs = Get.put(ProfileDsImpl());

class ProfileDsImpl implements ProfileDs {
  @override
  Future<ApiResponse<User>> getProfile() async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,

        endPoint: Env.getProfile,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<User>> showUserProfile({required String userId}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProfile}/$userId',
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }
}
