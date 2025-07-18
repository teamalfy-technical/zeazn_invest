import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';

final SignupRepo signupRepo = Get.put(SignupRepoImpl());

class SignupRepoImpl implements SignupRepo {
  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> addPassword({
    required String password,
    required String confirmPassword,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await signupDs.addPassword(
            password: password,
            confirmPassword: confirmPassword,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> forgotPassword({
    required String email,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await signupDs.forgotPassword(email: email),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<String>>> registerUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await signupDs.registerUser(
            name: name,
            email: email,
            phone: phone,
            role: role,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Message>>> resendOTP({
    required String email,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await signupDs.resendOTP(email: email),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await signupDs.resetPassword(
            password: password,
            confirmPassword: confirmPassword,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnForgotPassword({
    required String otp,
    required String email,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await signupDs.verifyOTPOnForgotPassword(
          otp: otp,
          email: email,
        );
        ZSecureStorage().saveAuthResponse(res.data?.toJson());
        return res;
      },
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> verifyOTPOnRegister({
    required String otp,
    required String email,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await signupDs.verifyOTPOnRegister(otp: otp, email: email);
        zeaznLogger.w(res.data?.toJson());
        ZSecureStorage().saveAuthResponse(res.data?.toJson());
        zeaznLogger.w('Token: ${ZSecureStorage().getAuthResponse()?.token}');
        return res;
      },
    );
  }

  @override
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
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await signupDs.submitKYC(
          nameOnId: nameOnId,
          numberOnId: numberOnId,
          idType: idType,
          dobOnId: dobOnId,
          sexOnId: sexOnId,
          expiryDateOnId: expiryDateOnId,
          selfieImage: selfieImage,
          idFrontImage: idFrontImage,
          idBackImage: idBackImage,
        );

        return res;
      },
    );
  }

  @override
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
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await signupDs.updateKYC(
          nameOnId: nameOnId,
          numberOnId: numberOnId,
          idType: idType,
          dobOnId: dobOnId,
          sexOnId: sexOnId,
          expiryDateOnId: expiryDateOnId,
          selfieImage: selfieImage,
          idFrontImage: idFrontImage,
          idBackImage: idBackImage,
        );

        return res;
      },
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<Message>>>> addLocation({
    required String country,
    required String city,
    required double latitude,
    required double longitude,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async {
        final res = await signupDs.addLocation(
          country: country,
          city: city,
          latitude: latitude,
          longitude: longitude,
        );
        return res;
      },
    );
  }
}
