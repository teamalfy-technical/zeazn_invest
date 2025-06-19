import 'package:country_picker/country_picker.dart';
import 'package:country_picker/src/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomPhoneTextfield extends StatefulWidget {
  final String labelText;
  final bool enabled;
  final dynamic ctrl;
  const ZCustomPhoneTextfield({
    super.key,
    required this.ctrl,
    required this.labelText,
    this.enabled = true,
  });

  @override
  State<ZCustomPhoneTextfield> createState() => _ZCustomPhoneTextfieldState();
}

class _ZCustomPhoneTextfieldState extends State<ZCustomPhoneTextfield> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            textAlign: TextAlign.start,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: ZAppSize.s16),
          ),
          ZAppSize.s3.verticalSpace,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ZAppSize.s5),
              border: Border.all(width: ZAppSize.s1, color: ZAppColor.primary),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Utils.countryCodeToEmoji(
                          widget.ctrl.selectedCountry.value.countryCode,
                        ),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: ZAppSize.s24,
                        ),
                      ),
                      ZAppSize.s2.horizontalSpace,
                      Text('+${widget.ctrl.selectedCountry.value.phoneCode}'),
                      ZAppSize.s2.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_down),
                      const VerticalDivider(
                        color: ZAppColor.text500,
                      ).symmetric(vertical: ZAppSize.s6),
                    ],
                  ),
                ).only(left: ZAppSize.s16),
                Expanded(
                  child: TextFormField(
                    enabled: widget.enabled,
                    textAlignVertical: TextAlignVertical.center,
                    controller: widget.ctrl!.phoneTEC,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (val) {
                      if (focused) {
                        setState(() {
                          focused = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'hint_phone_number'.tr,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor:
                          ZDeviceUtil.isKeyboardVisible(context)
                              ? ZAppColor.primary
                              : ZAppColor.text100,
                    ),
                    validator: ZValidator.validatePhoneNumber,
                  ),
                ),
              ],
            ),
          ).onPressed(
            onTap: () {
              setState(() {
                focused = true;
              });

              showCountryPicker(
                context: context,
                showPhoneCode:
                    true, // optional. Shows phone code before the country name.
                countryListTheme: CountryListThemeData(
                  bottomSheetHeight:
                      ZDeviceUtil.getDeviceHeight(context) /
                      2, // Optional. Country list modal height
                  //Optional. Sets the border radius for the bottomsheet.
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(ZAppSize.s8),
                    topRight: Radius.circular(ZAppSize.s8),
                  ),
                  //Optional. Styles the search field.
                  inputDecoration: InputDecoration(
                    labelText: 'Search a country',
                    hintText: 'Start typing to search',
                    labelStyle: const TextStyle().copyWith(fontSize: 14),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: ZAppColor.text500,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: ZAppColor.text500),
                    ),
                  ),
                ),
                onSelect: (Country country) {
                  widget.ctrl.setSelectedCountry(country);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
