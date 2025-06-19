// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
//@Envied(path: '.env.dev')
abstract class Env {
  /// App Base url for [Zeazn Invest]
  @EnviedField(
    defaultValue: 'https://zeazn-dev-server.up.railway.app/api',
    obfuscate: true,
  )
  static final String baseUrl = _Env.baseUrl;

  ///              All endpoints for [Zeazn Invest]
  /// ------------------------------------------------------------
  /// ============================================================
  ///

  /// -------------------- Auth Endpoints Starts Here ------------------------- ///

  /// [Login] user endpoint
  @EnviedField(defaultValue: '/login', obfuscate: true)
  static final String login = _Env.login;

  /// [Register] endpoint
  @EnviedField(defaultValue: '/register', obfuscate: true)
  static final String register = _Env.register;

  /// [Verify-otp for register] endpoint
  @EnviedField(defaultValue: '/verify-otp', obfuscate: true)
  static final String verifyOTPOnRegister = _Env.verifyOTPOnRegister;

  /// [Verify-otp-for-forgot-password] endpoint
  @EnviedField(defaultValue: 'verify-otp/forgot-password', obfuscate: true)
  static final String verifyOTPOnForgotPassword =
      _Env.verifyOTPOnForgotPassword;

  /// [ForgotPassword] endpoint
  @EnviedField(defaultValue: '/forgot-password', obfuscate: true)
  static final String forgotPassword = _Env.forgotPassword;

  /// [ResetPassword] endpoint
  @EnviedField(defaultValue: '/reset-password', obfuscate: true)
  static final String resetPassword = _Env.resetPassword;

  /// [AddPassword] endpoint
  @EnviedField(defaultValue: '/add-password', obfuscate: true)
  static final String addPassword = _Env.addPassword;

  /// [ResendOTP] endpoint
  @EnviedField(defaultValue: '/resend/otp', obfuscate: true)
  static final String resendOTP = _Env.resendOTP;

  /// [GetProfile] endpoint
  @EnviedField(defaultValue: '/profile', obfuscate: true)
  static final String getProfile = _Env.getProfile;

  /// [Logout] endpoint
  @EnviedField(defaultValue: '/logout', obfuscate: true)
  static final String logout = _Env.logout;

  /// -------------------- Auth Endpoints Ends Here ------------------------- ///
  ///
  ///
  /// -------------------- KYC Endpoints Starts Here ------------------------- ///
  ///
  /// [StoreKYC] endpoint
  @EnviedField(defaultValue: '/kyc/store', obfuscate: true)
  static final String storeKYC = _Env.storeKYC;

  /// [UpdateKYC] endpoint
  @EnviedField(defaultValue: '/kyc/update', obfuscate: true)
  static final String updateKYC = _Env.updateKYC;

  /// [GetKYC] endpoint
  @EnviedField(defaultValue: '/kyc', obfuscate: true)
  static final String getKYC = _Env.getKYC;

  /// -------------------- KYC Endpoints Ends Here ------------------------- ///
}
