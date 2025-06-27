import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/env/env.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';

final SignupDs signupDs = Get.put(SignupDsImpl());

class SignupDsImpl implements SignupDs {
  @override
  Future<ApiResponse<List<Message>>> addPassword({
    required String password,
    required String confirmPassword,
  }) async {
    final payload = dio.FormData.fromMap({
      'password': password,
      'c_password': confirmPassword,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.addPassword,
      );
      return ApiResponse<List<Message>>.fromJson(
        res,
        (data) => (data as List).map((e) => Message.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<List<Message>>> forgotPassword({
    required String email,
  }) async {
    final payload = dio.FormData.fromMap({'email': email});
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.forgotPassword,
      );
      return ApiResponse<List<Message>>.fromJson(
        res,
        (data) => (data as List).map((e) => Message.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<String>> registerUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) async {
    final payload = dio.FormData.fromMap({
      'name': name,
      'email': email,
      'phone': phone,
      'role': role == UserRole.creator ? 0 : 1,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.register,
      );
      return ApiResponse<String>.fromJson(res, (data) => data);
    });
  }

  @override
  Future<ApiResponse<Message>> resendOTP({required String email}) async {
    final payload = dio.FormData.fromMap({'email': email});
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.resendOTP,
      );
      return ApiResponse<Message>.fromJson(
        res,
        (data) => Message.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<List<Message>>> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    final payload = dio.FormData.fromMap({
      'password': password,
      'c_password': confirmPassword,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.resetPassword,
      );
      return ApiResponse<List<Message>>.fromJson(
        res,
        (data) => (data as List).map((e) => Message.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<User>> verifyOTPOnForgotPassword({
    required String otp,
    required String email,
  }) async {
    final payload = dio.FormData.fromMap({'otp': otp, 'email': email});
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.verifyOTPOnForgotPassword,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<User>> verifyOTPOnRegister({
    required String otp,
    required String email,
  }) async {
    final payload = dio.FormData.fromMap({'otp': otp, 'email': email});
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.verifyOTPOnRegister,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<User>> submitKYC({
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
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: dio.FormData.fromMap({
          'national_id_type': idType,
          'name_on_id': nameOnId,
          'dob_on_id': dobOnId,
          'sex': sexOnId,
          'expiry_date': expiryDateOnId,
          'national_id_number': numberOnId,
          'selfie_image': await dio.MultipartFile.fromFile(
            selfieImage.path,
            filename: selfieImage.path.split('/').last.split('.').first,
          ),
          'id_image_front': await dio.MultipartFile.fromFile(
            idFrontImage.path,
            filename: idFrontImage.path.split('/').last.split('.').first,
          ),
          'id_image_back': await dio.MultipartFile.fromFile(
            idBackImage.path,
            filename: idBackImage.path.split('/').last.split('.').first,
          ),
        }),
        endPoint: Env.storeKYC,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<User>> updateKYC({
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
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: dio.FormData.fromMap({
          'national_id_type': idType,
          'name_on_id': nameOnId,
          'dob_on_id': dobOnId,
          'sex': sexOnId,
          'expiry_date': expiryDateOnId,
          'national_id_number': numberOnId,
          'selfie_image': await dio.MultipartFile.fromFile(
            selfieImage.path,
            filename: selfieImage.path.split('/').last.split('.').first,
          ),
          'id_image_front': await dio.MultipartFile.fromFile(
            idFrontImage.path,
            filename: idFrontImage.path.split('/').last.split('.').first,
          ),
          'id_image_back': await dio.MultipartFile.fromFile(
            idBackImage.path,
            filename: idBackImage.path.split('/').last.split('.').first,
          ),
        }),
        endPoint: Env.updateKYC,
      );
      return ApiResponse<User>.fromJson(res, (data) => User.fromJson(data));
    });
  }

  @override
  Future<ApiResponse<List<Message>>> addLocation({
    required String country,
    required String city,
    required double latitude,
    required double longitude,
  }) async {
    final payload = dio.FormData.fromMap({
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.addLocation,
      );
      return ApiResponse<List<Message>>.fromJson(
        res,
        (data) => (data as List).map((e) => Message.fromJson(e)).toList(),
      );
    });
  }
}
