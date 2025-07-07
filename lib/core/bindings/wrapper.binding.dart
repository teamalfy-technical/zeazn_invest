import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/network/network.dart';

class WrapperFxnBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<NetworkInfo>(
    //   () => NetworkInfoImpl(InternetConnectionChecker()),
    //   tag: (NetworkInfo).toString(),
    //   fenix: true,
    // );
    Get.lazyPut<CatchApiErrorWrapper>(
      () => ZCatchApiErrorWrapperImpl(),
      tag: (CatchApiErrorWrapper).toString(),
    );
    Get.lazyPut<AsyncFunctionWrapper>(
      () => ZAsyncFunctionWrapperImpl(),
      tag: (AsyncFunctionWrapper).toString(),
    );

    Get.lazyPut<CustomRepositoryWrapper>(
      () => ZCustomRepositoryWrapperImpl(),
      tag: (CustomRepositoryWrapper).toString(),
    );
  }
}
