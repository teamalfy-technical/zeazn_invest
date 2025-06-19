import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZHelperFunction {
  //HHelperFunction._();

  ///Navigate to page
  ///[replace] determines whether to remove page from stack or to push
  ///[destination] is the route
  ///[args] Passes data to page
  static Future<dynamic>? switchScreen({
    required String destination,
    bool replace = false,
    bool popAndPush = false,
    dynamic args,
  }) {
    return replace
        ? Get.offAllNamed(destination, arguments: args)
        //? Get.until(destination, arguments: args)
        : popAndPush
        ? Get.offAndToNamed(destination, arguments: args)
        : Get.toNamed(destination, arguments: args);
  }

  /// --- Go back
  static void pop<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  // check if device is in dark mode
  static bool isDarkMode(BuildContext context) =>
      // MediaQuery.of(context).platformBrightness == Brightness.dark;
      Theme.of(context).brightness == Brightness.dark;

  // check if device is in light mode
  static isLightMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  static List<T> removeDuplicates<T>(List<T> list) => list.toSet().toList();

  static Map<String, String> appTokenHeader() {
    String? token = ZSecureStorage().getAuthResponse()?.token;
    // zeaznLogger.d('Token: $token');
    return {
      'Authorization': 'Bearer $token',
      //'Content-Type': 'application/json'
    };
  }

  static double findMaxValue({required List<String> values}) {
    // Convert string values to integers
    List<int> intValues = values.map((value) => int.parse(value)).toList();

    // Find the maximum value
    int maxValue = intValues.reduce((a, b) => a > b ? a : b);

    return maxValue.toDouble();
  }

  // open device gallery
  static Future<File> openGallery() async {
    File file = File('');
    try {
      final XFile? image = await ImagePicker().pickMedia();
      //await ImagePicker().pickMedia(source: ImageSource.gallery);
      if (image != null) {
        file = File(image.path);
      } else {
        // User canceled the picker
        ZPopupDialog(
          Get.context!,
        ).errorMessage(title: 'Ooops', message: 'No file selected');
      }
    } catch (err) {
      debugPrint("Failed to pick files: $err");
    }

    return file;
  }

  static Future<File> chooseFile({
    List<String>? allowedExtensions,
    bool? allowMultiple,
  }) async {
    File file = File('');
    try {
      var pickedFiles = await filePicker.FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple ?? false,
        type: filePicker.FileType.video,
        //allowedExtensions: allowedExtensions ?? ['jpg', 'png', 'doc', 'docx', 'pdf'],
      );
      if (pickedFiles != null) {
        file = File(pickedFiles.files.single.path!);
      } else {
        // User canceled the picker
        ZPopupDialog(
          Get.context!,
        ).errorMessage(title: 'Ooops', message: 'No file selected');
        debugPrint('User canceled the picker');
      }
    } catch (err) {
      debugPrint("Failed to pick files: $err");
    }
    return file;
  }

  static Future<List<File>> chooseMultipleFiles() async {
    List<File> files = [];
    try {
      var pickedFiles = await filePicker.FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: filePicker.FileType.video,
      );
      if (pickedFiles != null) {
        files = pickedFiles.paths.map((path) => File(path!)).toList();
      } else {
        // User canceled the picker
        debugPrint('User canceled the picker');
      }
    } catch (e) {
      debugPrint("Failed to pick files: $e");
    }
    return files;
  }

  // encode String to base 64
  static String encodeStringToBase64(String input) =>
      base64Encode(utf8.encode(input));

  static String kmbGenerator(double num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)}K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)}K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)}M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)}B";
    } else {
      return num.toInt().toString();
    }
  }
}
