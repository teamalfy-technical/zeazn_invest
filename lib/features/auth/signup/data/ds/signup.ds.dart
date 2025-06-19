import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class SignupDs {
  Future<ApiResponse<String>> registerUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  });

  Future<ApiResponse<User>> verifyOTPOnRegister({
    required String otp,
    required String email,
  });

  Future<ApiResponse<User>> verifyOTPOnForgotPassword({
    required String otp,
    required String email,
  });

  Future<ApiResponse<List<Message>>> addPassword({
    required String password,
    required String confirmPassword,
  });

  Future<ApiResponse<List<Message>>> forgotPassword({required String email});

  Future<ApiResponse<List<Message>>> resetPassword({
    required String password,
    required String confirmPassword,
  });

  Future<ApiResponse<Message>> resendOTP({required String email});
}
