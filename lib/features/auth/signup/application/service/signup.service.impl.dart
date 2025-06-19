import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/response/api.response.dart';
import 'package:zeazn_invest_app/core/network/response/message.response.dart';
import 'package:zeazn_invest_app/core/utils/enums/app.enums.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';

final SignupService signupService = Get.put(SignupServiceImpl());

class SignupServiceImpl implements SignupService {
  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> addPassword({
    required String password,
    required String confirmPassword,
  }) {
    return signupRepo.addPassword(
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> forgotPassword({
    required String email,
  }) {
    return signupRepo.forgotPassword(email: email);
  }

  @override
  Future<Either<ZFailure, ApiResponse<String>>> registerUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) {
    return signupRepo.registerUser(
      name: name,
      email: email,
      phone: phone,
      role: role,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Message>>> resendOTP({
    required String email,
  }) {
    return signupRepo.resendOTP(email: email);
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> resetPassword({
    required String password,
    required String confirmPassword,
  }) {
    return signupRepo.resetPassword(
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnForgotPassword({
    required String otp,
    required String email,
  }) {
    return signupRepo.verifyOTPOnForgotPassword(otp: otp, email: email);
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnRegister({
    required String otp,
    required String email,
  }) {
    return signupRepo.verifyOTPOnRegister(otp: otp, email: email);
  }
}
