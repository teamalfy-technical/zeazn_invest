import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/domain/models/plan.model.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/popup.dialog.dart';

class ZCampaignVM extends GetxController {
  static ZCampaignVM get instance => Get.find();

  List<File> files = [];
  List<File> media = [];
  List<File> thumbnailFiles = [];
  var trimming = LoadingState.completed.obs;

  var selectedFilterOption = 'country'.tr.obs;

  onFilterOptionChanged(val) {
    selectedFilterOption.value = val;
    zeaznLogger.e(selectedFilterOption.value);
  }

  var supportAnonymously = false.obs;
  var agree = false.obs;

  onSupportAnonymously(val) => supportAnonymously.value = val;
  onAgreeToTerms(val) => agree.value = val;

  var selectedPMIndex = 0.obs;
  List<String> paymentMethods = ['Credit Card', 'Mobile Money'];

  onSelectedPaymentMethod(int index) => selectedPMIndex.value = index;

  final bPriceTEC = TextEditingController();
  final bDescriptionTEC = TextEditingController();
  final bRewardTEC = TextEditingController();
  final bLocationTEC = TextEditingController();
  final bSlotsTEC = TextEditingController();

  final sPriceTEC = TextEditingController();
  final sDescriptionTEC = TextEditingController();
  final sRewardTEC = TextEditingController();
  final sLocationTEC = TextEditingController();
  final sSlotsTEC = TextEditingController();

  final pPriceTEC = TextEditingController();
  final pDescriptionTEC = TextEditingController();
  final pRewardTEC = TextEditingController();
  final pLocationTEC = TextEditingController();
  final pSlotsTEC = TextEditingController();

  final List<Plan> plans = [
    Plan(title: 'basic'.tr),
    Plan(title: 'standard'.tr),
    Plan(title: 'premium'.tr),
  ];

  var selectedExperienceIndex = 0.obs;

  updateSelectedExperienceIndex(int index) =>
      selectedExperienceIndex.value = index;

  var bDateTime = ''.obs;
  var sDateTime = ''.obs;
  var pDateTime = ''.obs;

  var sliderValue = 1000.0.obs;

  var min = 0.0;
  var max = 20000.00;

  final budgetTEC = TextEditingController();

  final context = Get.context!;

  void gotoMediaUploadPage() {
    if (files.isEmpty) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message: 'Please upload an introductory video',
      );
      return;
    }
    ZHelperFunction.switchScreen(destination: Routes.mediaUploadPage);
  }

  void showDateTimePicker() async {
    final selectedDateTime = await pickDateTime(Get.context!);
    if (selectedDateTime != null) {
      plans[selectedExperienceIndex.value].dateTime = ZFormatter.formatDateTime(
        selectedDateTime,
      );
      zeaznLogger.e(
        '${plans[selectedExperienceIndex.value].title}: ${plans[selectedExperienceIndex.value].dateTime}',
      );
    }
    update();
  }

  void gotoFundingDetailsPage() {
    if (media.isEmpty) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message: 'Please upload videos for your project',
      );
      return;
    }
    ZHelperFunction.switchScreen(destination: Routes.fundingDetailsPage);
  }

  onSliderChanged(val) => sliderValue.value = val;

  Future<void> chooseIntroVideo() async {
    files.clear();
    final file = await ZHelperFunction.chooseFile();
    files.add(file);
    update();
  }

  Future<void> chooseMediaFiles() async {
    media = await ZHelperFunction.chooseMultipleFiles();
    update();
  }

  Future<File> _generateThumbnail(File file) async {
    final thumbnailAsUnint8List = await VideoCompress.getFileThumbnail(
      file.path,
      quality: 100,
    );
    return thumbnailAsUnint8List;
  }

  // depending on file type show particular image
  // Future<ImageProvider<Object>>? imageProvider(File file) async {
  //   if (file.fileType == FileType.video) {
  //     var outputPath = await PVideoCompressor.convertVideoToGif(
  //       videoFile: file,
  //     );
  //     zeaznLogger.d('OutputPath: $outputPath');
  //     final thumnail = await _generateThumbnail(File(outputPath));
  //     // final thumnail = await _generateThumbnail(file);
  //     return MemoryImage(thumnail!);
  //   } else if (file.fileType == FileType.image) {
  //     // var croppedFile = await _cropImage(imagePath: file.path);
  //     // return FileImage(croppedFile!);
  //     return FileImage(file);
  //   } else {
  //     throw Exception('Unsupported media format');
  //   }
  // }
}
