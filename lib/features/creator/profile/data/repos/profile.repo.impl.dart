import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';

final ProfileRepo profileRepo = Get.put(ProfileRepoImpl());

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<ZFailure, ApiResponse<User>>> getProfile() async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await profileDs.getProfile(),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<User>>> showUserProfile({
    required String userId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await profileDs.showUserProfile(userId: userId),
    );
  }
}
