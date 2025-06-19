import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class LoginDs {
  Future<ApiResponse<User>> loginUser({
    required String email,
    required String password,
  });

  Future<ApiResponse<List<Message>>> logout();
}
