import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/application/service/login.service.impl.dart';
import 'package:zeazn_invest_app/features/auth/login/domain/models/user.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProfileVM extends GetxController {
  static ZProfileVM get instance => Get.find();

  var profileFile = File('').obs;
  var userProfile = User().obs;
  var legalDocs = <File>[].obs;

  var loading = LoadingState.completed.obs;

  final context = Get.context!;

  updateLoadingState(LoadingState loadingState) => loading.value = loadingState;
  final bPriceTEC = TextEditingController();
  final bDescriptionTEC = TextEditingController();
  final bRewardTEC = TextEditingController();
  final bLocationTEC = TextEditingController();
  final bSlotsTEC = TextEditingController();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

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

  // Choose files
  Future<void> chooseFiles() async {
    legalDocs.value = await chooseMultipleFiles();
  }

  // Future<Image?> generatePdfThumbnail(String filePath) async {
  //   final document = await PdfDocument.openFile(filePath);
  //   final page = await document.getPage(1);
  //   final pageImage = await page.render(
  //     width: 200,
  //     height: 200,
  //     format: PdfPageImageFormat.png,
  //   );
  //   await page.close();
  //   await document.close();

  //   return Image.memory(pageImage.bytes);
  // }

  // Get user profile information
  Future<void> getProfile() async {
    loading(LoadingState.loading);
    final result = await profileService.getProfile();
    result.fold(
      (err) {
        loading(LoadingState.error);
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        loading(LoadingState.completed);
        userProfile.value = res.data ?? User();
      },
    );
  }

  // Get other user profile information
  Future<void> getOtherUserProfile({required String userId}) async {
    final result = await profileService.showUserProfile(userId: userId);
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        userProfile.value = res.data ?? User();
      },
    );
  }

  // Clear user data, token, etc.
  // Then navigate to login screen
  Future<void> signout() async {
    final result = await loginService.logout();
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        clearCache();
        // navigate to next screen
        ZHelperFunction.switchScreen(
          destination: Routes.loginPage,
          replace: true,
        );
      },
    );
  }

  /// [Function] to delete user account from system.
  Future<void> deleteAccount() async {
    final result = await loginService.logout();
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        clearCache();
        // navigate to next screen
        ZHelperFunction.switchScreen(
          destination: Routes.loginPage,
          replace: true,
        );
      },
    );
  }

  // Erase data from login cache
  void clearCache() {
    ZSecureStorage().removeData(ZSecureStorage().authResKey);
  }

  // Future<void> deleteAccount() async {
  //   showLoadingDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     content: Text(
  //       'deleting_account'.tr,
  //       style: Theme.of(context).textTheme.bodyMedium,
  //     ),
  //   );
  //   final result = await profileService.deleteAccount();
  //   result.fold(
  //     (err) {
  //       PHelperFunction.pop();
  //       PPopupDialog(
  //         context,
  //       ).errorMessage(title: 'error'.tr, message: err.message);
  //     },
  //     (res) {
  //       PHelperFunction.pop();
  //       showSucccessdialog(context: context, title: res.message ?? '');
  //       Future.delayed(Duration(seconds: 2), () {
  //         PHelperFunction.pop();
  //         // navigate to next screen
  //         PHelperFunction.switchScreen(
  //           destination: Routes.loginPage,
  //           replace: true,
  //         );
  //       });
  //     },
  //   );
  // }
}
