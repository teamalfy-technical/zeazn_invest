import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:zeazn_invest_app/core/errors/errors.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';

abstract class SignupRepo {
  Future<Either<ZFailure, ApiResponse<String>>> registerUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  });

  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnRegister({
    required String otp,
    required String email,
  });

  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnForgotPassword({
    required String otp,
    required String email,
  });

  Future<Either<ZFailure, ApiResponse<User>>> submitKYC({
    required String nameOnId,
    required String numberOnId,
    required String idType,
    required String dobOnId,
    required String sexOnId,
    required String expiryDateOnId,
    required File selfieImage,
    required File idFrontImage,
    required File idBackImage,
  });

  Future<Either<ZFailure, ApiResponse<User>>> updateKYC({
    required String nameOnId,
    required String numberOnId,
    required String idType,
    required String dobOnId,
    required String sexOnId,
    required String expiryDateOnId,
    required File selfieImage,
    required File idFrontImage,
    required File idBackImage,
  });

  Future<Either<ZFailure, ApiResponse<List<Message>>>> addPassword({
    required String password,
    required String confirmPassword,
  });

  Future<Either<ZFailure, ApiResponse<List<Message>>>> addLocation({
    required String country,
    required String city,
    required double latitude,
    required double longitude,
  });

  Future<Either<ZFailure, ApiResponse<List<Message>>>> forgotPassword({
    required String email,
  });

  Future<Either<ZFailure, ApiResponse<List<Message>>>> resetPassword({
    required String password,
    required String confirmPassword,
  });

  Future<Either<ZFailure, ApiResponse<Message>>> resendOTP({
    required String email,
  });
}
