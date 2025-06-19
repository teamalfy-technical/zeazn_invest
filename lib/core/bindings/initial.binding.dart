import 'package:get/get.dart';
import 'package:zeazn_invest_app/features/auth/login/presentation/vm/login.vm.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';
import 'package:zeazn_invest_app/features/creator/dashboard/presentation/vm/dashboard.vm.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/vm/explore.vm.dart';
import 'package:zeazn_invest_app/features/creator/insights/presentation/vm/insights.vm.dart';
import 'package:zeazn_invest_app/features/creator/profile/presentation/vm/profile.vm.dart';
import 'package:zeazn_invest_app/features/onboarding/presentation/vm/onboarding.vm.dart';
import 'package:zeazn_invest_app/features/supporter/explore/explore.dart';
import 'package:zeazn_invest_app/features/supporter/report/presentation/vm/report.vm.dart';

import '../../features/welcome/presentation/vm/splash.vm.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ZSplashVm());
    Get.lazyPut(() => ZOnboardingVm());
    Get.lazyPut(() => ZLoginVm());
    Get.put(ZSignupVm(), permanent: true);
    Get.lazyPut(() => ZDashboardVm());
    Get.lazyPut(() => ZExploreVM());
    Get.lazyPut(() => ZSExploreVM());
    Get.lazyPut(() => ZProfileVM());
    Get.lazyPut(() => ZInsightsVM());
    Get.lazyPut(() => ZChatVM());
    Get.lazyPut(() => ZReportVM());
    // Get.lazyPut(() => PTimerVm());
    // Get.lazyPut(() => PHomeVm());
    // Get.lazyPut(() => PContributionHistoryVm());
    // Get.lazyPut(() => PFutureValueCalcVm());
    // Get.lazyPut(() => TLoginVm());
    // Get.lazyPut(() => TSignupVm());
    // Get.lazyPut(() => TDashboardVm());
    // Get.lazyPut(() => THomeVm(), fenix: true);
    // Get.lazyPut(() => TGymVm());
    // Get.lazyPut(() => TPostVm(), fenix: true);
    // Get.lazyPut(() => TSearchVm());
    // Get.lazyPut(() => TChatVm());
    // Get.lazyPut(() => TProfileVm());
    // Get.lazyPut(() => TBlockedUserVm());
    // Get.lazyPut(() => TSettingsVm());
    // Get.lazyPut(() => TNotificationVm());

    // /// [DataSource] injection
    // DataSourceBinding().dependencies();

    // /// [Repository] injection
    // RepoBinding().dependencies();

    // /// [Service] injection
    // ServiceBinding().dependencies();

    // // [Data Wrapper Functions] injection
    // WrapperFxnBinding().dependencies();
  }
}
