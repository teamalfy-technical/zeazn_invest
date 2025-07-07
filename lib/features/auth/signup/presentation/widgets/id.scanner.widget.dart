import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class IDScannerWidget extends StatefulWidget {
  final File identificationCard;
  const IDScannerWidget({super.key, required this.identificationCard});

  @override
  _IDScannerWidgetState createState() => _IDScannerWidgetState();
}

class _IDScannerWidgetState extends State<IDScannerWidget> {
  final ctrl = Get.find<ZSignupVm>();

  @override
  void initState() {
    super.initState();
    scanIDCard();
  }

  Future<void> scanIDCard() async {
    final inputImage = InputImage.fromFilePath(widget.identificationCard.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognizedText = await textRecognizer.processImage(inputImage);

    final fullText = recognizedText.text;

    setState(() {
      ctrl.nameOnIdTEC.text = _parseName(fullText);
      ctrl.numberOnIdTEC.text = _parseIDNumber(fullText);
      ctrl.dobOnIdTEC.text = _parseDOB(fullText);
      ctrl.expiryDateOnIdTEC.text = _parseExpiryDate(fullText);
      ctrl.sexOnIdTEC.text = _parseSex(fullText);
      ctrl.idTypeTEC.text = ctrl.verificationMethods[ctrl.selectedIndex.value];
    });

    textRecognizer.close();
  }

  String _parseName(String text) {
    final nameRegex = RegExp(r'Name[:\s]*([A-Z][a-z]+(?: [A-Z][a-z]+)+)');
    final match = nameRegex.firstMatch(text);
    return match?.group(1) ?? '';
  }

  String _parseIDNumber(String text) {
    final idRegex = RegExp(r'(ID No\.?|ID Number)[:\s]*([A-Z0-9\-]+)');
    final match = idRegex.firstMatch(text);
    return match?.group(2) ?? '';
  }

  String _parseDOB(String text) {
    final dobRegex = RegExp(
      r'(DOB|Date of Birth)[:\s]*([0-9]{2}/[0-9]{2}/[0-9]{4})',
    );
    final match = dobRegex.firstMatch(text);
    return match?.group(2) ?? '';
  }

  String _parseExpiryDate(String text) {
    final expRegex = RegExp(
      r'(Expiry|Expires)[:\s]*([0-9]{2}/[0-9]{2}/[0-9]{4})',
    );
    final match = expRegex.firstMatch(text);
    return match?.group(2) ?? '';
  }

  String _parseSex(String text) {
    final sexRegex = RegExp(r'(Sex|Gender)[:\s]*([A-Za-z]+)');
    final match = sexRegex.firstMatch(text);
    return match?.group(2) ?? '';
  }

  // String _parseIDType(String text) {
  //   final idTypeRegex = RegExp(
  //     r'(ID Type|Card Type|Document Type)[:\s]*([\w\s]+)',
  //   );
  //   final match = idTypeRegex.firstMatch(text);
  //   var result = match?.group(2) ?? '';

  //   // Normalize common terms
  //   result = result.toLowerCase();
  //   if (result.contains('passport')) return 'Passport';
  //   if (result.contains('voter')) return 'Voter ID';
  //   if (result.contains('ghana')) return 'Ghana Card';
  //   if (result.contains('national')) return 'National ID';
  //   return result[0].toUpperCase() + result.substring(1); // Capitalize
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZCustomTextField(
          controller: ctrl.nameOnIdTEC,
          labelText: '',
          hintText: 'name_on_id'.tr,
          prefixIcon: null,
          textInputType: TextInputType.name,
          fillColor: ZAppColor.darkFillColor,
          filled: true,

          borderColor: ZAppColor.darkFillColor,
          onChanged: (val) => ctrl.idName(val),
        ),

        ZAppSize.s13.verticalSpace,

        ZCustomTextField(
          controller: ctrl.numberOnIdTEC,
          labelText: '',
          hintText: 'number_on_id'.tr,
          prefixIcon: null,
          textInputType: TextInputType.text,
          fillColor: ZAppColor.darkFillColor,
          filled: true,

          borderColor: ZAppColor.darkFillColor,
          onChanged: (val) => ctrl.idNumber(val),
        ),

        ZAppSize.s13.verticalSpace,

        ZCustomTextField(
          controller: ctrl.dobOnIdTEC,
          labelText: '',
          hintText: 'DOB (DD/MM/YYYY)',
          prefixIcon: null,
          textInputType: TextInputType.datetime,
          fillColor: ZAppColor.darkFillColor,
          filled: true,

          borderColor: ZAppColor.darkFillColor,
        ),

        ZAppSize.s13.verticalSpace,

        ZCustomTextField(
          controller: ctrl.sexOnIdTEC,
          labelText: '',
          hintText: 'Sex',
          prefixIcon: null,
          textInputType: TextInputType.text,
          fillColor: ZAppColor.darkFillColor,
          filled: true,

          borderColor: ZAppColor.darkFillColor,
        ),

        ZAppSize.s13.verticalSpace,

        ZCustomTextField(
          controller: ctrl.expiryDateOnIdTEC,
          labelText: '',
          hintText: 'Expiry Date (DD/MM/YYYY)',
          prefixIcon: null,
          textInputType: TextInputType.text,
          fillColor: ZAppColor.darkFillColor,
          filled: true,

          borderColor: ZAppColor.darkFillColor,
        ),

        ZAppSize.s13.verticalSpace,

        Obx(
          () => ZCustomDropdown<String>(
            value: ctrl.selectedIdType.value,
            hintText: '',
            label: '',
            fillColor: ZAppColor.darkFillColor,
            borderColor: ZAppColor.darkFillColor,
            filled: true,
            onChanged: ctrl.onIdTypeChanged,
            items:
                ctrl.idTypes
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),

        // ZCustomTextField(
        //   controller: ctrl.idTypeTEC,
        //   labelText: '',
        //   hintText: 'ID Type',
        //   prefixIcon: null,
        //   textInputType: TextInputType.text,
        //   fillColor: ZAppColor.darkFillColor,
        //   filled: true,
        //   enabled: ctrl.idTypeTEC.text.isEmpty ? true : false,
        //   inputBorder: InputBorder.none,
        // ),
        ZAppSize.s13.verticalSpace,

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            alignment: Alignment.centerLeft,
            width: ZDeviceUtil.getDeviceWidth(context) / 2,
            height: ZAppSize.s45,
            padding: EdgeInsets.symmetric(horizontal: ZAppSize.s15),
            decoration: BoxDecoration(
              color: ZAppColor.darkFillColor,
              borderRadius: BorderRadius.circular(ZAppSize.s5),
            ),
            child: Text('pictures'.tr),
          ),
        ),
      ],
    );
  }
}
