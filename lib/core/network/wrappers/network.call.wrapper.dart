import 'package:get/get.dart';

final AsyncFunctionWrapper asyncFunctionWrapper = Get.put(
  ZAsyncFunctionWrapperImpl(),
);

abstract class AsyncFunctionWrapper {
  Future handleAsyncNetworkCall(Function() asyncMethod);
}

class ZAsyncFunctionWrapperImpl implements AsyncFunctionWrapper {
  @override
  Future handleAsyncNetworkCall(Function() asyncMethod) async {
    return await asyncMethod();
    // final isConnected = await networkInfo.isConnected;
    // hubchatLogger.e(isConnected);
    // if (networkInfo.isConnected) {
    //   return await asyncMethod();
    // } else {
    //   return NoInternetException();
    // }
  }
}
