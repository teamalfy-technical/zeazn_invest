import 'package:zeazn_invest_app/core/utils/utils.dart';

class User {
  String? token;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? country;
  UserRole? role;
  String? kycVerifyStatus;
  String? kycVerifiedAt;
  String? emailVerifiedAt;
  String? dateJoined;
  String? lastLoginAt;
  String? lastLoginIp;
  String? lastLoginDevice;
  String? lastLoginBrowser;

  User({
    this.token,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.country,
    this.role,
    this.kycVerifyStatus,
    this.kycVerifiedAt,
    this.emailVerifiedAt,
    this.dateJoined,
    this.lastLoginAt,
    this.lastLoginIp,
    this.lastLoginDevice,
    this.lastLoginBrowser,
  });

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    country = json['country'];
    role = userRoleFromString(json['role']);
    //json['role'] == 'Creator' ? UserRole.creator : UserRole.investor;
    kycVerifyStatus = json['kyc_verify_status'];
    kycVerifiedAt = json['kyc_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    dateJoined = json['date_joined'];
    lastLoginAt = json['last_login_at'];
    lastLoginIp = json['last_login_ip'];
    lastLoginDevice = json['last_login_device'];
    lastLoginBrowser = json['last_login_browser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['country'] = country;
    data['role'] = role?.value;
    data['kyc_verify_status'] = kycVerifyStatus;
    data['kyc_verified_at'] = kycVerifiedAt;
    data['email_verified_at'] = emailVerifiedAt;
    data['date_joined'] = dateJoined;
    data['last_login_at'] = lastLoginAt;
    data['last_login_ip'] = lastLoginIp;
    data['last_login_device'] = lastLoginDevice;
    data['last_login_browser'] = lastLoginBrowser;
    return data;
  }

  UserRole userRoleFromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'creator':
        return UserRole.creator;
      case 'investor':
        return UserRole.investor;
      default:
        return UserRole.other;
    }
  }
}
