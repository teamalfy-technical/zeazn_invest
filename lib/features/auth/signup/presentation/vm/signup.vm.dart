import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSignupVm extends GetxController {
  static ZSignupVm get instance => Get.find();

  var role = UserRole.creator.obs;

  var obscure = true.obs;

  onObscureChanged() => obscure.value = !obscure.value;

  var otpcode = ''.obs;

  void updateOTP(String pin) => otpcode.value = pin;

  void setRole(UserRole selectedRole) {
    role.value = selectedRole;
    zeaznLogger.e(role.value);
  }

  var profileFile = File('').obs;

  final addPasswordFormKey = GlobalKey<FormState>();

  final nameTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();

  // final context = Get.context!;

  var selectedIndex = 0.obs;
  List<String> verificationMethods = [
    'passport'.tr.toUpperCase(),
    'driver_license'.tr.toUpperCase(),
    'national_id'.tr.toUpperCase(),
  ];

  onSelectedVerificationMethod(int index) => selectedIndex.value = index;

  final GlobalKey<CountryCodePickerState> countryPickerKey = GlobalKey();
  final CountryCode mySelectedCountry = CountryCode.fromCountryCode(
    'GH',
  ); // Default

  var selectedCountry =
      Country(
        phoneCode: '233',
        e164Sc: 1,
        countryCode: 'GH',
        level: 1,
        geographic: true,
        name: 'Ghana',
        example: '2012345678',
        displayName: 'Ghana (GH) [+233]',
        displayNameNoCountryCode: 'Ghana (GH)',
        e164Key: '1-GH-0',
      ).obs;

  void setSelectedCountry(Country country) {
    selectedCountry.value = country;
    selectedCountry.value.flagEmoji;
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

  void onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: $countryCode");
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

  void checkIfPasswordMatch(BuildContext context) {
    if (passwordTEC.text.trim() != confirmPasswordTEC.text.trim()) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message: 'Passwords do not match',
      );
    }
    return;
  }

  /// [Function] to register new user
  /// @params => context
  Future<void> signup({required BuildContext context}) async {
    String phone = ZFormatter.formatPhone(
      code: selectedCountry.value.phoneCode,
      phone: phoneTEC.text.trim(),
    );

    final result = await signupService.registerUser(
      name: nameTEC.text.trim(),
      email: emailTEC.text.trim(),
      role: role.value,
      phone: phone,
    );
    result.fold(
      (err) {
        // ZHelperFunction.pop();
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        setRole(role.value);
        ZHelperFunction.switchScreen(destination: Routes.signupStep2);
        // ZHelperFunction.pop();
        // ZHelperFunction.switchScreen(
        //   destination: Routes.verifyOTPPage,
        //   args: true,
        // );
      },
    );
  }

  /// Function to verify OTP code sent to device
  /// @params => pin
  /// @params => isSignup
  Future<void> verifyOTP({
    required String pin,
    required BuildContext context,
    required bool isSignup,
  }) async {
    String email = emailTEC.text.trim();

    if (otpcode.isEmpty) {
      ZPopupDialog(context).errorMessage(
        title: 'action_required'.tr,
        message:
            'You need to enter the 6 digit code sent to your phone or email.',
      );
      return;
    }

    // // Navigate to processing page
    // ZHelperFunction.switchScreen(
    //   destination: Routes.progressStatePage,
    //   args: [
    //     false,
    //     role.value == UserRole.creator
    //         ? Routes.signupStep4
    //         : Routes.signupStep12,
    //     'code_verified'.tr,
    //     role.value,
    //   ],
    // );

    final result =
        isSignup
            ? await signupService.verifyOTPOnRegister(otp: pin, email: email)
            : await signupService.verifyOTPOnForgotPassword(
              otp: pin,
              email: email,
            );
    result.fold(
      (err) {
        // PHelperFunction.pop();
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        // Navigate to processing page
        ZHelperFunction.switchScreen(
          destination: Routes.progressStatePage,
          args: [
            true,
            role.value == UserRole.creator
                ? Routes.signupStep4
                : Routes.signupStep12,
            'code_verified'.tr,
          ],
        );
      },
    );
  }

  /// [Function] to add password to user account
  /// @params => context
  Future<void> addPassword({required BuildContext context}) async {
    checkIfPasswordMatch(context);
    final result = await signupService.addPassword(
      password: passwordTEC.text.trim(),
      confirmPassword: confirmPasswordTEC.text.trim(),
    );
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        ZSecureStorage().removeData(ZSecureStorage().authResKey);
        ZHelperFunction.switchScreen(
          destination: Routes.progressStatePage,
          args: [true, Routes.loginPage, 'signing_up_msg'.tr],
        );
      },
    );
  }
}
