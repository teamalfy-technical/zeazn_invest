import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZDashboardVm extends GetxController {
  static ZDashboardVm get instance => Get.find();

  var currentIndex = 0.obs;

  onPageChanged(int val) {
    currentIndex.value = val;
  }

  var role = UserRole.creator.obs;
  late TabController tabController;

  // init tab controller
  initTabController({required TickerProvider vsync, required int length}) {
    tabController = TabController(length: length, vsync: vsync);
  }

  // Programmatically switch to desired tab
  void switchTab(int index) {
    tabController.animateTo(index);
  }

  void setRole(UserRole selectedRole) {
    role.value = selectedRole;
    zeaznLogger.e(role.value);
  }
}
