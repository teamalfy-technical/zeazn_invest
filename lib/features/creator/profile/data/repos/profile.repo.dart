import 'package:fpdart/fpdart.dart';
import 'package:zeazn_invest_app/core/errors/errors.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class ProfileRepo {
  Future<Either<ZFailure, ApiResponse<User>>> getProfile();

  Future<Either<ZFailure, ApiResponse<User>>> showUserProfile({
    required String userId,
  });
}
