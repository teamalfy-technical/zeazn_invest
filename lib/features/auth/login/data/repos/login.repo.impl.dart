import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

final LoginRepo loginRepo = Get.put(LoginRepoImpl());

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<ZFailure, ApiResponse<User>>> loginUser({
    required String email,
    required String password,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await loginDs.loginUser(email: email, password: password);
        ZSecureStorage().saveAuthResponse(res.data?.toJson());
        return res;
      },
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> logout() async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await loginDs.logout(),
    );
  }
}
