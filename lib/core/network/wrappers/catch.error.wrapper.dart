import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/errors.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

final CatchApiErrorWrapper catchApiErrorWrapper = Get.put(
  ZCatchApiErrorWrapperImpl(),
);

abstract class CatchApiErrorWrapper {
  dynamic handleError({dynamic err, dynamic stackTrace});
}

// @LazySingleton(as: CatchApiErrorWrapper)
class ZCatchApiErrorWrapperImpl implements CatchApiErrorWrapper {
  @override
  dynamic handleError({err, stackTrace}) {
    // zeaznLogger.e('Error: ${err.toString()}');

    String? errorMessage = '';
    // if (err.runtimeType != NoInternetException) {
    //   unawaited(FirebaseCrashlytics.instance.recordError(err, stackTrace));
    // }
    if (err is DioException) {
      debugPrint('DioException caught-----------');
      if (err.response != null) {
        if (err.response!.statusCode != 500) {
          if (err.response?.data['status'] == 'error' &&
              err.response?.statusCode == 200) {
            errorMessage = err.response!.data['data'];
          } else if (err.response?.statusCode == 400) {
            errorMessage =
                err.response?.data['message'] ??
                err.response?.data['errors']['message'][0] ??
                'Bad request';
            //errorMessage = err.response?.data['error'];
          } else if (err.response?.statusCode == 401) {
            errorMessage =
                err.response?.data['message'] ?? 'Unauthorized request';
            zeaznLogger.e(err.response?.data);
          } else if (err.response?.statusCode == 403) {
            errorMessage = err.response?.data['message'] ?? 'Forbidden Access';
            zeaznLogger.e(err.response?.data);
          } else if (err.response?.statusCode == 404) {
            zeaznLogger.e(err.response?.data['data']);
            errorMessage = extractError(err.response?.data);
            // errorMessage = err.response!.data['data'].toString();
            // errorMessage = err.message ?? 'Requested resource is not found';
          } else if (err.response?.statusCode == 422) {
            // ApiErrorResponse error =
            //     ApiErrorResponse.fromJson(err.response?.data);

            zeaznLogger.e(err.response?.data);

            errorMessage = err.response?.data['message'] ?? 'Bad request';
          } else if (err.response?.data is Map &&
              err.response!.data.containsKey('data')) {
            final error = err.response!.data['data'];

            // final error = errorMessageFromJson(e.response!.data.toString()).message;
            // Check the type of message and handle accordingly
            if (error is List) {
              List<String> messages = error.cast<String>();
              errorMessage = messages.first.toString();
              // Handle list of messages
            } else if (error is String) {
              // Handle single string message
              errorMessage = error;
            } else if (error is int) {
              // Handle integer message
            } else {
              // Handle other types of messages
            }
          } else if (err.response?.statusCode == 412) {
            errorMessage = err.message;
          }
        } else {
          errorMessage =
              ServerException.getErrorMessage(err) ?? 'internal_error_msg'.tr;
        }
      } else {
        errorMessage =
            ServerException.getErrorMessage(err) ?? 'internal_error_msg'.tr;
      }
      return ZFailure(message: errorMessage ?? err.toString());
    } else {
      return ZUnknownFailure();
    }
  }

  String extractError(Map<String, dynamic> response) {
    zeaznLogger.e(response);
    if (response.containsKey("data")) {
      for (var entry in response["data"].entries) {
        if (entry.value is List && entry.value.isNotEmpty) {
          return entry.value.first; // Return the first error message found
        }
        if (entry.value is String && entry.value.isNotEmpty) {
          return entry.value; // Return the error message found
        }
      }
    } else {
      for (var entry in response.entries) {
        if (entry.value is List && entry.value.isNotEmpty) {
          return entry.value.first; // Return the first error message found
        }
      }
    }
    return "Bad Request"; // Return an empty string if no error is found
  }
}
