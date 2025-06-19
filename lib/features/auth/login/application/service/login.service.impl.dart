import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

final LoginService loginService = Get.put(LoginServiceImpl());

class LoginServiceImpl implements LoginService {
  @override
  Future<Either<ZFailure, ApiResponse<User>>> loginUser({
    required String email,
    required String password,
  }) {
    return loginRepo.loginUser(email: email, password: password);
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> logout() {
    return loginRepo.logout();
  }
}
