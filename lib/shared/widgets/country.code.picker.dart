import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCountryCodePicker extends StatelessWidget {
  final dynamic ctrl;
  final String label;
  final Alignment alignment;
  const ZCountryCodePicker({
    super.key,
    required this.label,
    this.alignment = Alignment.centerLeft,
    this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty
            ? SizedBox.shrink()
            : Text(
              label,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        label.isEmpty ? ZAppSize.s0.verticalSpace : ZAppSize.s4.verticalSpace,
        Container(
          alignment: alignment,
          width: double.infinity,
          height: ZAppSize.s48,
          padding: EdgeInsets.only(left: ZAppSize.s0, right: ZAppSize.s6),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s5),
            border: Border.all(width: ZAppSize.s1, color: ZAppColor.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CountryCodePicker(
                  key: ctrl.countryPickerKey,
                  onChanged: ctrl.onCountryChange,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: ctrl.mySelectedCountry.code,
                  favorite: ['+233', 'GH'],
                  // optional. Shows only country name and flag
                  showCountryOnly: true,

                  showFlag: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: true,
                  // headerAlignment: MainAxisAlignment.spaceBetween,
                  // optional. aligns the flag and the Text left
                  alignLeft: true,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  showDropDownButton: false,
                  dialogBackgroundColor: ZAppColor.darkFillColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  boxDecoration: BoxDecoration(
                    color: ZAppColor.darkFillColor,
                    borderRadius: BorderRadius.circular(ZAppSize.s8),
                  ),
                ),
              ),
              Assets.icons.arrowDownIos
                  .svg(
                    fit: BoxFit.contain,
                    width: ZAppSize.s24,
                    height: ZAppSize.s24,
                  )
                  .onPressed(
                    onTap:
                        () =>
                            ctrl.countryPickerKey.currentState
                                ?.showCountryCodePickerDialog(),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
