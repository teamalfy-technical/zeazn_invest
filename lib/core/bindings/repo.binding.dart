import 'package:get/get.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';

class RepoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepo>(() => LoginRepoImpl(), tag: (LoginRepo).toString());

    Get.lazyPut<SignupRepo>(
      () => SignupRepoImpl(),
      tag: (SignupRepo).toString(),
    );

    Get.lazyPut<ProfileRepo>(
      () => ProfileRepoImpl(),
      tag: (ProfileRepo).toString(),
    );

    // Get.lazyPut<PostRepo>(
    //   () => PostRepoImpl(),
    //   tag: (PostRepo).toString(),
    // );

    // Get.lazyPut<SearchRepo>(
    //   () => SearchRepoImpl(),
    //   tag: (SearchRepo).toString(),
    // );

    // Get.lazyPut<NotificationRepo>(
    //   () => NotificationRepoImpl(),
    //   tag: (NotificationRepo).toString(),
    // );

    // Get.lazyPut<ChatRepo>(
    //   () => ChatRepoImpl(),
    //   tag: (ChatRepo).toString(),
    // );

    /// [Data Source] injection
    //TDataSourceBindings().dependencies();

    /// [Data Repository] injection
    //TDataRepositoryBindings().dependencies();

    /// [Data Service] injection
    //TDataServiceBindings().dependencies();

    /// [Data Wrapper Functions] injection
    //TWrapperBindings().dependencies();
  }
}
