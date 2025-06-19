import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

abstract class Failure extends Equatable {
  const Failure();

  String getMessage();

  @override
  List<Object?> get props => [];
}

class ZFailure extends Failure {
  const ZFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class ZNoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'no_internet_msg'.tr;

  @override
  String getMessage() => 'no_internet_msg'.tr;
}

class ZTimeoutFailure extends Failure {
  const ZTimeoutFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [];

  @override
  String toString() => message;

  @override
  String getMessage() => message;
}

class ZBadRequestFailure extends Failure {
  const ZBadRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class ZUnauthorisedFailure extends Failure {
  const ZUnauthorisedFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class ZServerFailure extends Failure {
  const ZServerFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class ZSessionTimeOut extends Failure {
  const ZSessionTimeOut({required this.message});
  final String message;

  @override
  List<Object> get props => [message];

  @override
  String getMessage() => message;
}

class ZUnknownFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'unexpected_error'.tr;

  @override
  String getMessage() => 'unexpected_error'.tr;
}
