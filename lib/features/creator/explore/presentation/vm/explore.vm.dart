import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/application/service/project.service.impl.dart';
import 'package:zeazn_invest_app/features/creator/explore/domain/models/plan.model.dart';
import 'package:zeazn_invest_app/features/creator/explore/domain/models/project.model.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/popup.dialog.dart';

class ZExploreVM extends GetxController {
  static ZExploreVM get instance => Get.find();

  var projects = <Project>[].obs;

  int page = 1;

  var hasMore = true.obs;

  var loading = LoadingState.completed.obs;
  var loadingMore = LoadingState.completed.obs;

  late ScrollController projectScrollController = ScrollController()
    ..addListener(_loadMoreProjectsByCreator);

  late ScrollController trendingScrollController = ScrollController()
    ..addListener(_loadMoreProjectsByCreator);

  List<File> files = [];
  List<File> media = [];
  List<ProjectCategory> categories = [];
  ProjectCategory? selectedCategory;
  List<File> thumbnailFiles = [];
  var country = ''.obs;
  var trimming = LoadingState.completed.obs;

  final GlobalKey<CountryCodePickerState> countryPickerKey = GlobalKey();

  final CountryCode mySelectedCountry = CountryCode.fromCountryCode('GH'); //

  final projectInfoFormKey = GlobalKey<FormState>();

  var selectedExperience = <String, dynamic>{
    'title': 'Basic',
    'sub_title': 'Mobile Phone',
    'description': 'Support with GHS 6,000 and receive an iPhone 12 ProMax',
  }.obs;

  var selectedExperienceIndex = 0.obs;
  onSelectedDealIndex(int index) => selectedExperienceIndex.value = index;
  onProjectCategoryChanged(ProjectCategory? category) {
    selectedCategory = category;
    update();
  }

  void onCountryChange(CountryCode countryCode) {
    country.value = countryCode.name ?? '';
    zeaznLogger.i("New Country selected: ${countryCode.name}");
  }

  List<Map<String, dynamic>> exclusiveExperiences = [
    {
      'title': 'Basic',
      'sub_title': 'Mobile Phone',
      'description': 'Support with GHS 6,000 and receive an iPhone 12 ProMax',
    },
    {
      'title': 'Standard',
      'sub_title': 'Shout Out',
      'description':
          'Support with GHS 4,000 and receive A Thank you note and shoutout on social media',
    },
    {
      'title': 'Premium',
      'sub_title': 'VIP Ticket',
      'description':
          'Support with GHS 8,000 and receive A Thank you note and shoutout on social media',
    },
  ];

  var selectedFilterOption = 'country'.tr.obs;

  onFilterOptionChanged(val) {
    selectedFilterOption.value = val;
    zeaznLogger.e(selectedFilterOption.value);
  }

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

  @override
  void onInit() {
    getAllProjectsByCreator(context: context);
    super.onInit();
  }

  // var selectedExperienceIndex = 0.obs;

  updateSelectedExperienceIndex(int index) =>
      selectedExperienceIndex.value = index;

  var bDateTime = ''.obs;
  var sDateTime = ''.obs;
  var pDateTime = ''.obs;

  var sliderValue = 0.0.obs;

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
    if (media.isNotEmpty) {
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

  Future<void> getCategories() async {
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

  /// [Function] to get all projects by creator
  Future<void> getAllProjectsByCreator({required BuildContext context}) async {
    page = 1;
    loading(LoadingState.loading);
    final res = await projectService.getProjectByCreator(page: page);
    res.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.getMessage());
      },
      (res) {
        loading(LoadingState.completed);
        hasMore(res.data?.pagination?.hasMore ?? false);
        projects.value = res.data?.projects ?? [];
      },
    );
  }

  /// Function to load more project by creator
  /// [_loadMoreProjectsByCreator]
  Future<void> _loadMoreProjectsByCreator() async {
    if (hasMore.value &&
        (projectScrollController.position.pixels ==
            projectScrollController.position.maxScrollExtent)) {
      loadingMore.value = LoadingState.loading;
      page += 1; // increase page by 1
      final result = await projectService.getProjectByCreator(page: page);
      result.fold(
        (err) {
          loadingMore.value = LoadingState.error;
          ZPopupDialog(
            context,
          ).errorMessage(title: 'error'.tr, message: err.getMessage());
        },
        (res) {
          loadingMore.value = LoadingState.completed;
          hasMore(res.data?.pagination?.hasMore ?? false);
          if (res.data?.projects != null || res.data!.projects!.isNotEmpty) {
            projects.addAll(res.data?.projects ?? []);
          } else {
            hasMore(false);
          }
        },
      );
    }
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
