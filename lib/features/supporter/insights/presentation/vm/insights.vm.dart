import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZSInsightsVM extends GetxController {
  static ZSInsightsVM get instance => Get.find();

  var profileFile = File('').obs;

  var loading = LoadingState.completed.obs;

  var sliderValue = 1000.0.obs;

  var min = 0.0;
  var max = 20000.00;

  final context = Get.context!;

  onSliderChanged(val) => sliderValue.value = val;

  updateLoadingState(LoadingState loadingState) => loading.value = loadingState;
  final bPriceTEC = TextEditingController();
  final bDescriptionTEC = TextEditingController();
  final bRewardTEC = TextEditingController();
  final bLocationTEC = TextEditingController();
  final bSlotsTEC = TextEditingController();

  // Pick an image.
  Future<void> chooseFromGallery() async {
    final XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _cropImage(imagePath: image.path);
    } on PlatformException catch (err) {
      debugPrint('Failed to pick image: $err');
    }
  }

  Future<void> _cropImage({required String imagePath}) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'crop_photo'.tr,
            // toolbarColor: TAppColor.transparentColor,
            // toolbarWidgetColor: TAppColor.whiteColor,
            // cropFrameColor: TAppColor.primary,
            activeControlsWidgetColor: ZAppColor.primary,
            showCropGrid: false,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'crop_photo'.tr),
        ],
      );
      if (croppedFile == null) return;
      profileFile.value = File(croppedFile.path);
    } on PlatformException catch (err) {
      debugPrint('Failed to crop photo: $err');
    }
  }
}
