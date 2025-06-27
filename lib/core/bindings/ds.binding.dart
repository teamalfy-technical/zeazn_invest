import 'package:get/get.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';

class DataSourceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginDs>(() => LoginDsImpl(), tag: (LoginDs).toString());

    Get.lazyPut<SignupDs>(() => SignupDsImpl(), tag: (SignupDs).toString());

    Get.lazyPut<ProfileDs>(() => ProfileDsImpl(), tag: (ProfileDs).toString());

    // Get.lazyPut<PostDs>(
    //   () => PostDsImpl(),
    //   tag: (PostDs).toString(),
    // );

    // Get.lazyPut<SearchDs>(
    //   () => SearchDsImpl(),
    //   tag: (SearchDs).toString(),
    // );

    // Get.lazyPut<NotificationDs>(
    //   () => NotificationDsImpl(),
    //   tag: (NotificationDs).toString(),
    // );

    // Get.lazyPut<ChatDs>(
    //   () => ChatDsImpl(),
    //   tag: (ChatDs).toString(),
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
