import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
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

  final countryTEC = TextEditingController();
  final locationTEC = TextEditingController();

  // var nameOnId = ''.obs;
  // var numberOnId = ''.obs;
  // var dobOnId = ''.obs;
  // var sexOnId = ''.obs;
  // var expiryDateOnId = ''.obs;
  // var idType = ''.obs;

  var obscure = true.obs;

  var country = ''.obs;

  var position =
      Position(
        latitude: 0,
        longitude: 0,
        timestamp: DateTime.timestamp(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      ).obs;

  var idFrontImage = File('').obs;
  var idBackImage = File('').obs;
  var selfieImage = File('').obs;

  onObscureChanged() => obscure.value = !obscure.value;

  var otpcode = ''.obs;

  void updateOTP(String pin) => otpcode.value = pin;

  void setRole(UserRole selectedRole) {
    role.value = selectedRole;
    zeaznLogger.e(role.value);
  }

  final addPasswordFormKey = GlobalKey<FormState>();

  final nameOnIdTEC = TextEditingController();
  var idName = ''.obs;
  var idNumber = ''.obs;
  var numberOnIdTEC = TextEditingController();
  var dobOnIdTEC = TextEditingController();
  var sexOnIdTEC = TextEditingController();
  var expiryDateOnIdTEC = TextEditingController();
  var idTypeTEC = TextEditingController();

  final nameTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();

  // final context = Get.context!;

  var selectedIndex = 2.obs;
  List<String> verificationMethods = [
    'passport'.tr.toUpperCase(),
    'driver_license'.tr.toUpperCase(),
    'national_id'.tr.toUpperCase(),
  ];

  var selectedIdType = 'Ghana Card'.obs;
  List<String> idTypes = ['Ghana Card', 'Voter ID'];

  onIdTypeChanged(String? value) => selectedIdType.value = value ?? '';
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
    zeaznLogger.i("Selected Country: ${selectedCountry.value}");
  }

  void onCountryChange(CountryCode countryCode) {
    country.value = countryCode.name ?? '';
    zeaznLogger.i("New Country selected: ${countryCode.name}");
  }

  // Take photo with camera
  Future<void> takePhoto({required KycType kycType}) async {
    final XFile? image;
    try {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice:
            kycType == KycType.selfie ? CameraDevice.front : CameraDevice.rear,
      );
      if (image == null) return;
      _cropImage(imagePath: image.path, kycType: kycType);
    } on PlatformException catch (err) {
      debugPrint('Failed to pick image: $err');
    }
  }

  // Pick an image.
  Future<void> chooseFromGallery({required KycType kycType}) async {
    final XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _cropImage(imagePath: image.path, kycType: kycType);
    } on PlatformException catch (err) {
      debugPrint('Failed to pick image: $err');
    }
  }

  Future<void> _cropImage({
    required String imagePath,
    required KycType kycType,
  }) async {
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
      final compressedFile = await ZHelperFunction.compressFile(
        File(croppedFile.path),
      );
      updateSelectedKYC(compressedFile, kycType);
    } on PlatformException catch (err) {
      debugPrint('Failed to crop photo: $err');
    }
  }

  updateSelectedKYC(File croppedFile, KycType kycType) {
    switch (kycType) {
      case KycType.front:
        idFrontImage.value = croppedFile;
        break;
      case KycType.back:
        idBackImage.value = croppedFile;
        break;
      case KycType.selfie:
        selfieImage.value = croppedFile;
        break;
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

  /// [Function] to add creator's location
  /// @params => context
  Future<void> addLocation({required BuildContext context}) async {
    checkIfPasswordMatch(context);
    final result = await signupService.addLocation(
      // country: country.value,
      country: countryTEC.text.trim(),
      city: locationTEC.text.trim(),
      latitude: position.value.latitude,
      longitude: position.value.longitude,
    );
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        ZHelperFunction.switchScreen(
          destination: Routes.signupStep12,
          args: role.value,
        );
      },
    );
  }

  /// [Function] to submit KYC to user account
  /// @params => context
  Future<void> submitKYC({required BuildContext context}) async {
    // zeaznLogger.e(nameOnIdTEC.text.trim());
    // zeaznLogger.e(numberOnIdTEC.text.trim());
    // zeaznLogger.e(sexOnIdTEC.text.trim());
    // zeaznLogger.e(dobOnIdTEC.text.trim());
    // zeaznLogger.e(idTypeTEC.text.trim());
    // zeaznLogger.e(expiryDateOnIdTEC.text.trim());
    // zeaznLogger.e('Selfie: ${selfieImage.value}');
    // zeaznLogger.e('FrontImage: ${idFrontImage.value}');
    // zeaznLogger.e('BackImage: ${idFrontImage.value}');
    checkIfPasswordMatch(context);

    final result = await signupService.submitKYC(
      nameOnId: nameOnIdTEC.text.trim(),
      numberOnId: numberOnIdTEC.text.trim(),
      sexOnId: sexOnIdTEC.text.trim(),
      dobOnId: dobOnIdTEC.text.trim(),
      idType: selectedIdType.value, // idTypeTEC.text.trim(),
      expiryDateOnId: expiryDateOnIdTEC.text.trim(),
      selfieImage: selfieImage.value,
      idFrontImage: idFrontImage.value,
      idBackImage: idBackImage.value,
    );
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        addLocation(context: context);
        // ZHelperFunction.switchScreen(
        //   destination: Routes.signupStep12,
        //   args: role.value,
        // );
      },
    );
  }
}
