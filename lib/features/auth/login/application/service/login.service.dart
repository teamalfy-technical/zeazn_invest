import 'package:fpdart/fpdart.dart';
import 'package:zeazn_invest_app/core/errors/errors.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class LoginService {
  Future<Either<ZFailure, ApiResponse<User>>> loginUser({
    required String email,
    required String password,
  });

  Future<Either<ZFailure, ApiResponse<List<Message>>>> logout();
}
