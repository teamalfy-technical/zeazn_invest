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

  /// [AddLocation] endpoint
  @EnviedField(defaultValue: '/add-location', obfuscate: true)
  static final String addLocation = _Env.addLocation;

  /// [AddPassword] endpoint
  @EnviedField(defaultValue: '/add-password', obfuscate: true)
  static final String addPassword = _Env.addPassword;

  /// [ResendOTP] endpoint
  @EnviedField(defaultValue: '/resend/otp', obfuscate: true)
  static final String resendOTP = _Env.resendOTP;

  /// [GetProfile] endpoint
  @EnviedField(defaultValue: '/profile', obfuscate: true)
  static final String getProfile = _Env.getProfile;

  /// [GetProfile] endpoint
  @EnviedField(defaultValue: '/user/show-profile', obfuscate: true)
  static final String showUserProfile = _Env.showUserProfile;

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
  ///
  ///
  /// -------------------- Project Endpoints Starts Here ------------------------- ///
  ///
  /// [AddProject] endpoint
  @EnviedField(defaultValue: '/project/creator/store', obfuscate: true)
  static final String addProject = _Env.addProject;

  /// [AddProjectFundingGoal] endpoint
  @EnviedField(defaultValue: '/project/funding-goal', obfuscate: true)
  static final String addProjectFundingGoal = _Env.addProjectFundingGoal;

  /// [GetProjectByCreator] endpoint
  @EnviedField(defaultValue: '/project/by-creator', obfuscate: true)
  static final String getProjectByCreator = _Env.getProjectByCreator;

  /// [GetProjectCountByCreator] endpoint
  @EnviedField(defaultValue: '/project/creator/count', obfuscate: true)
  static final String getProjectCountByCreator = _Env.getProjectCountByCreator;

  /// [UpdateProjectByCreator] endpoint
  @EnviedField(defaultValue: '/project/creator/update', obfuscate: true)
  static final String updateProjectByCreator = _Env.updateProjectByCreator;

  /// [GetAllProjects] endpoint
  @EnviedField(defaultValue: '/all-projects', obfuscate: true)
  static final String getAllProjects = _Env.getAllProjects;

  /// [GetProject] endpoint
  @EnviedField(defaultValue: '/project/show', obfuscate: true)
  static final String getProject = _Env.getProject;

  /// [GetAllProjectsCount] endpoint
  @EnviedField(defaultValue: '/project/count/all', obfuscate: true)
  static final String getAllProjectsCount = _Env.getAllProjectsCount;

  /// [GetProjectSlug] endpoint
  @EnviedField(defaultValue: '/project/show/slug', obfuscate: true)
  static final String getProjectSlug = _Env.getProjectSlug;

  /// [PublishProject] endpoint
  @EnviedField(defaultValue: '/project/publish', obfuscate: true)
  static final String publishProject = _Env.publishProject;

  /// [SaveProjectAsDraft] endpoint
  @EnviedField(defaultValue: '/project/draft', obfuscate: true)
  static final String saveProjectAsDraft = _Env.saveProjectAsDraft;

  /// [ArchiveProject] endpoint
  @EnviedField(defaultValue: '/project/archive', obfuscate: true)
  static final String archiveProject = _Env.archiveProject;

  /// [AddProjectMedia] endpoint
  @EnviedField(defaultValue: '/project/add-media', obfuscate: true)
  static final String addProjectMedia = _Env.addProjectMedia;

  /// [AddProjectRewards] endpoint
  @EnviedField(defaultValue: '/project/add-reward', obfuscate: true)
  static final String addProjectReward = _Env.addProjectReward;

  /// [GetProjectSupporters] endpoint
  @EnviedField(defaultValue: '/project/supporters', obfuscate: true)
  static final String getProjectSupporters = _Env.getProjectSupporters;

  /// [GetProjectComments] endpoint
  @EnviedField(defaultValue: '/project/comments', obfuscate: true)
  static final String getProjectComments = _Env.getProjectComments;

  /// [GetProjectReviews] endpoint
  @EnviedField(defaultValue: '/project/reviews', obfuscate: true)
  static final String getProjectReviews = _Env.getProjectReviews;

  /// [GetProjectFaqs] endpoint
  @EnviedField(defaultValue: '/project/faqs', obfuscate: true)
  static final String getProjectFaqs = _Env.getProjectFaqs;

  /// [DeleteProject] endpoint
  @EnviedField(defaultValue: '/project/creator/del', obfuscate: true)
  static final String deleteProject = _Env.deleteProject;

  /// [GetProjectVideoUploadStatus] endpoint
  @EnviedField(defaultValue: '/project/video-upload/status', obfuscate: true)
  static final String getProjectVideoUploadStatus =
      _Env.getProjectVideoUploadStatus;

  /// [GetProjectCategories] endpoint
  @EnviedField(defaultValue: '/project-categories', obfuscate: true)
  static final String getProjectCategories = _Env.getProjectCategories;

  /// -------------------- Project Endpoints Ends Here ------------------------- ///
}
