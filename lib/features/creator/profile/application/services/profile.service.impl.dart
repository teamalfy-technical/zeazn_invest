import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';

final ProfileService profileService = Get.put(ProfileServiceImpl());

class ProfileServiceImpl implements ProfileService {
  @override
  Future<Either<ZFailure, ApiResponse<User>>> getProfile() async {
    return profileRepo.getProfile();
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> showUserProfile({
    required String userId,
  }) async {
    return profileRepo.showUserProfile(userId: userId);
  }
}
