import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class ProfileDs {
  Future<ApiResponse<User>> getProfile();

  Future<ApiResponse<User>> showUserProfile({required String userId});
}
