import 'package:get/get.dart';
import 'package:zeazn_invest_app/features/auth/login/presentation/pages/login.page.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/pages/progress.state.page.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/features/creator/chat/presentation/pages/chat.page.dart';
import 'package:zeazn_invest_app/features/creator/chat/presentation/pages/messaging.page.dart';
import 'package:zeazn_invest_app/features/creator/dashboard/presentation/pages/dashboard.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/exclusive.experiences.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/funding.details.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/media.upload.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/project.detail.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/project.faq.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/project.info.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/project.reviews.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/project.updates.page.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/video.upload.page.dart';
import 'package:zeazn_invest_app/features/creator/insights/presentation/pages/insights.detail.page.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/features/onboarding/onboarding.dart';
import 'package:zeazn_invest_app/features/onboarding/presentation/pages/supporter.onboarding.page.dart';
import 'package:zeazn_invest_app/features/supporter/dashboard/dashboard.dart';
import 'package:zeazn_invest_app/features/supporter/explore/explore.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/pages/project.supporters.page.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/pages/upload.legal.doc.page.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/pages/video.profile.page.dart';
import 'package:zeazn_invest_app/features/supporter/insights/presentation/pages/performance.overview.page.dart';
import 'package:zeazn_invest_app/features/supporter/insights/presentation/pages/top.performing.campaign.page.dart';
import 'package:zeazn_invest_app/features/supporter/report/report.dart';
import 'package:zeazn_invest_app/features/welcome/welcome.dart';

import '../features/supporter/insights/presentation/pages/rate.project.page.dart';

part 'app.routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashPage;

  static final routes = [
    GetPage(name: _Paths.splashPage, page: () => ZSplashPage()),

    GetPage(
      name: _Paths.creatorOnboardingPage,
      page: () => ZCreatorOnboardingPage(),
    ),
    GetPage(
      name: _Paths.supporterOnboardingPage,
      page: () => ZSupporterOnboardingPage(),
    ),
    GetPage(name: _Paths.loginPage, page: () => ZLoginPage()),
    GetPage(name: _Paths.signupStep1, page: () => ZSignupStep1()),
    GetPage(name: _Paths.signupStep2, page: () => ZSignupStep2()),
    GetPage(name: _Paths.signupStep3, page: () => ZSignupStep3()),
    GetPage(name: _Paths.signupStep4, page: () => ZSignupStep4()),
    GetPage(name: _Paths.signupStep5, page: () => ZSignupStep5()),
    GetPage(name: _Paths.signupStep6, page: () => ZSignupStep6()),
    GetPage(name: _Paths.signupStep7, page: () => ZSignupStep7()),
    GetPage(name: _Paths.signupStep8, page: () => ZSignupStep8()),
    GetPage(name: _Paths.signupStep9, page: () => ZSignupStep9()),
    GetPage(name: _Paths.signupStep10, page: () => ZSignupStep10()),
    GetPage(name: _Paths.signupStep11, page: () => ZSignupStep11()),
    GetPage(
      name: _Paths.signupStep12,
      page: () => ZSignupStep12(role: Get.arguments),
    ),
    GetPage(name: _Paths.creatorDashboardPage, page: () => ZDashboardPage()),
    GetPage(
      name: _Paths.supporterDashboardPage,
      page: () => ZSupporterDashboardPage(),
    ),
    GetPage(name: _Paths.projectInfoPage, page: () => ZProjectInfoPage()),
    GetPage(
      name: _Paths.projectDetailPage,
      page: () => ZProjectDetailPage(project: Get.arguments),
    ),
    GetPage(
      name: _Paths.projectUpdatesPage,
      page: () => ZProjectUpdatesPage(project: Get.arguments),
    ),
    GetPage(
      name: _Paths.projectReviewsPage,
      page: () => ZProjectReviewsPage(project: Get.arguments),
    ),
    GetPage(
      name: _Paths.projectFaqPage,
      page: () => ZProjectFaqPage(project: Get.arguments),
    ),
    GetPage(name: _Paths.videoUploadPage, page: () => ZVideoUploadPage()),
    GetPage(name: _Paths.mediaUploadPage, page: () => ZMediaUploadPage()),
    GetPage(name: _Paths.fundingDetailsPage, page: () => ZFundingDetailsPage()),
    GetPage(name: _Paths.insightsDetailPage, page: () => ZInsightsDetailPage()),
    GetPage(name: _Paths.chatPage, page: () => ZChatPage(isPop: Get.arguments)),
    GetPage(
      name: _Paths.profilePage,
      page: () => ZProfilePage(role: Get.arguments),
    ),
    GetPage(
      name: _Paths.messagingPage,
      page: () => ZMessagingPage(chat: Get.arguments),
    ),
    GetPage(name: _Paths.paymentMethodPage, page: () => ZPaymentMethodPage()),
    GetPage(
      name: _Paths.chooseSupportTypePage,
      page: () => ZChooseSupportTypePage(project: Get.arguments),
    ),
    GetPage(name: _Paths.chooseCardPage, page: () => ZChooseCardPage()),
    GetPage(
      name: _Paths.topPerformingCampaignPage,
      page: () => ZTopPerformingCampaignsPage(),
    ),
    GetPage(
      name: _Paths.performanceOverviewPage,
      page: () => ZPerformanceOverviewPage(),
    ),
    GetPage(
      name: _Paths.paymentProcessingPage,
      page: () => ZPaymentProcessingPage(),
    ),
    GetPage(name: _Paths.paymentSuccessPage, page: () => ZPaymentSuccessPage()),
    GetPage(name: _Paths.reportPage, page: () => ZReportPage()),
    GetPage(name: _Paths.sendReportPage, page: () => ZSendReportPage()),
    GetPage(name: _Paths.uploadLegalDocPage, page: () => ZUploadLegalDocPage()),
    GetPage(name: _Paths.videoProfilePage, page: () => ZVideoProfilePage()),
    GetPage(
      name: _Paths.projectSupportersPage,
      page: () => ZProjectSupportersPage(),
    ),
    GetPage(
      name: _Paths.rateProjectPage,
      page: () => ZRateProjectPage(project: Get.arguments),
    ),
    GetPage(
      name: _Paths.exclusiveExperiencesPage,
      page: () => ZExclusiveExperiencesPage(),
    ),

    GetPage(
      name: _Paths.progressStatePage,
      page:
          () => ZProgressStatePage(
            replace: Get.arguments[0],
            nextRoute: Get.arguments[1],
            message: Get.arguments[2],
          ),
    ),
    GetPage(
      name: _Paths.completeStatePage,
      page:
          () => ZCompleteStatePage(
            replace: Get.arguments[0],
            nextRoute: Get.arguments[1],
            message: Get.arguments[2],
          ),
    ),
  ];
}
