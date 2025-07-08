import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/popup.dialog.dart';

class ZCreateProjectVM extends GetxController {
  static ZCreateProjectVM get instance => Get.find();

  var projects = [].obs;

  var createdProject = Project().obs;

  List<File> files = [];
  List<File> media = [];
  List<ProjectCategory> categories = [];
  ProjectCategory? selectedCategory;
  List<File> thumbnailFiles = [];

  var country = ''.obs;
  var trimming = LoadingState.completed.obs;
  var loading = LoadingState.completed.obs;

  final GlobalKey<CountryCodePickerState> countryPickerKey = GlobalKey();

  final CountryCode mySelectedCountry = CountryCode.fromCountryCode('GH'); //

  final projectInfoFormKey = GlobalKey<FormState>();
  final rewardSetupFormKey = GlobalKey<FormState>();

  onProjectCategoryChanged(ProjectCategory? category) {
    selectedCategory = category;
    update();
  }

  void onCountryChange(CountryCode countryCode) {
    country.value = countryCode.name ?? '';
    zeaznLogger.i("New Country selected: ${countryCode.name}");
  }

  final titleTEC = TextEditingController();
  //final descriptionTEC = TextEditingController();

  final selectedDateTime = ''.obs;

  final priceTEC = TextEditingController();
  final descriptionTEC = TextEditingController();
  final shortDescriptionTEC = TextEditingController();
  final rewardTEC = TextEditingController();
  final locationTEC = TextEditingController();
  final slotsTEC = TextEditingController();

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

  var sliderValue = 1000.0.obs;

  var min = 0.0;
  var max = 20000.00;

  final budgetTEC = TextEditingController();

  // var selectedExperienceIndex = 0.obs;
  // updateSelectedExperienceIndex(int index) =>
  //     selectedExperienceIndex.value = index;

  void showDateTimePicker() async {
    final selectedDateTime = await pickDateTime(Get.context!);
    if (selectedDateTime != null) {
      // plans[selectedExperienceIndex.value].dateTime = ZFormatter.formatDateTime(
      //   selectedDateTime,
      // );
      this.selectedDateTime.value = ZFormatter.formatDateTime(selectedDateTime);
      zeaznLogger.e(
        this.selectedDateTime.value,
        // '${plans[selectedExperienceIndex.value].title}: ${plans[selectedExperienceIndex.value].dateTime}',
      );
    }
    update();
  }

  void gotoMediaUploadPage({required BuildContext context}) {
    if (files.isEmpty) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message: 'Please upload an introductory video',
      );
      return;
    }
    ZHelperFunction.switchScreen(destination: Routes.mediaUploadPage);
  }

  void gotoFundingDetailsPage({required BuildContext context}) {
    if (media.isEmpty) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message: 'Please upload media links and videos for your project',
      );
      return;
    }
    // ZHelperFunction.switchScreen(
    //   destination: Routes.fundingDetailsPage,
    //   replace: true,
    // );
    addProjectMedia(context: context);
  }

  onSliderChanged(val) {
    sliderValue.value = val;
    budgetTEC.text = '${sliderValue.value}';
  }

  Future<void> chooseIntroVideo() async {
    files.clear();
    final file = await ZHelperFunction.chooseFile();
    zeaznLogger.i('Size BF: ${ZMediaCompressor.getFileSize(file: file)}');
    final compressedFile = await ZMediaCompressor.compressVideo(file: file);
    zeaznLogger.i(
      'Size AF: ${ZMediaCompressor.getFileSize(file: compressedFile)}',
    );
    files.add(compressedFile);
    update();
  }

  Future<void> chooseMediaFiles() async {
    final files = await ZHelperFunction.chooseMultipleFiles();
    media.clear();
    for (final file in files) {
      late File compressedFile;
      if (file.fileType == FileType.image) {
        compressedFile = await ZMediaCompressor.compressImage(file: file);
      }
      if (file.fileType == FileType.video) {
        compressedFile = await ZMediaCompressor.compressVideo(file: file);
      }
      media.add(compressedFile);
    }
    update();
  }

  Future<File> _generateThumbnail(File file) async {
    final thumbnailAsUint8List = await VideoCompress.getFileThumbnail(
      file.path,
      quality: 100,
    );
    return thumbnailAsUint8List;
  }

  /// [Function] to get project categories
  Future<void> getCategories({required BuildContext context}) async {
    final res = await projectService.getProjectCategories();
    res.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        categories = res.data ?? [];
        update();
      },
    );
  }

  clearFields() {
    titleTEC.clear();
    descriptionTEC.clear();
  }

  /// [Function] to add new project
  Future<void> addProject({required BuildContext context}) async {
    // ZHelperFunction.switchScreen(
    //   destination: Routes.videoUploadPage,
    //   replace: true,
    // );
    loading(LoadingState.loading);

    final res = await projectService.addProject(
      projectCategoryId: selectedCategory?.id ?? 0,
      name: titleTEC.text.trim(),
      description: descriptionTEC.text.trim(),
      shortDescription: shortDescriptionTEC.text.trim(),
      location:
          country.value.isEmpty
              ? mySelectedCountry.name ?? 'Ghana'
              : country.value,
    );
    res.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        loading(LoadingState.completed);
        createdProject.value = res.data ?? Project();
        // zeaznLogger.i(createdProject.value.toJson());
        clearFields();
        ZHelperFunction.switchScreen(
          destination: Routes.videoUploadPage,
          replace: true,
        );
      },
    );
  }

  /// [Function] to add new project
  Future<void> addProjectMedia({required BuildContext context}) async {
    zeaznLogger.e([...files, ...media]);
    loading(LoadingState.loading);
    final res = await projectService.addProjectMedia(
      projectId: createdProject.value.projectId ?? 0,
      media: [...files, ...media],
    );
    res.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        loading(LoadingState.completed);
        ZHelperFunction.switchScreen(
          destination: Routes.fundingDetailsPage,
          replace: true,
        );
      },
    );
  }

  /// [Function] to add project rewards
  Future<void> addProjectRewards({required BuildContext context}) async {
    loading(LoadingState.loading);
    final res = await projectService.addProjectReward(
      projectId: createdProject.value.projectId ?? 0,
      name: titleTEC.text.trim(),
      amount: priceTEC.text.trim(),
      description: descriptionTEC.text.trim(),
      slotsAvailable: slotsTEC.text.trim(),
      dateTime: selectedDateTime.value,
      location:
          country.value.isEmpty
              ? mySelectedCountry.name ?? 'Ghana'
              : country.value,
    );
    res.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        loading(LoadingState.completed);
        Get.delete<ZCreateProjectVM>();
        ZHelperFunction.switchScreen(
          destination: Routes.progressStatePage,
          args: [
            true,
            Routes.creatorDashboardPage,
            'creating_project_msg'.tr,
            null,
          ],
        );
      },
    );
  }

  /// [Function] to add project funding goal
  Future<void> addFundingGoal({required BuildContext context}) async {
    // ZHelperFunction.switchScreen(
    //   destination: Routes.exclusiveExperiencesPage,
    //   replace: true,
    // );
    loading(LoadingState.loading);
    final res = await projectService.addProjectFundingGoal(
      projectId: createdProject.value.projectId ?? 0,
      fundingGoal: '${sliderValue.value}',
    );
    res.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        loading(LoadingState.completed);
        ZHelperFunction.switchScreen(
          destination: Routes.exclusiveExperiencesPage,
          replace: true,
        );
      },
    );
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
