import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/supporter/explore/explore.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZRewardTierWidget extends StatelessWidget {
  final Function()? onTap;
  final ZSExploreVM ctrl;
  const ZRewardTierWidget({super.key, this.onTap, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ZAppSize.s18),
      padding: EdgeInsets.all(ZAppSize.s18),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s10),
      ),
      child: Column(
        children: [
          // view profile section
          Text(
            'Reward Tier 2 : Shoutout on Stage by Ella Harmony',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          ZAppSize.s6.verticalSpace,
          Text(
            'Get a special on-stage shoutout from Ella Harmony during her exclusive jazz night performance. A unique and unforgettable experience for true jazz lovers!',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
          ),

          //  Project description
          ZAppSize.s10.verticalSpace,

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '📍 Blue Note Jazz Club, New York City',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: ZAppSize.s12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

          ZAppSize.s20.verticalSpace,

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Slots Available: 8/20',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: ZAppSize.s14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ZAppSize.s8.verticalSpace,

          LinearProgressIndicator(
            minHeight: ZAppSize.s15,
            borderRadius: BorderRadius.circular(ZAppSize.s12),
            value: 0.4,
            backgroundColor: ZAppColor.primary.withOpacityExt(ZAppSize.s0_2),
            valueColor: AlwaysStoppedAnimation(ZAppColor.primary),
          ),

          ZAppSize.s10.verticalSpace,

          RichText(
            // textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'Verification & Delivery: Confirmation will be sent via email at',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: ZAppSize.s11,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: ' @ellajazz.com',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: ZAppSize.s11,
                    fontWeight: FontWeight.w300,
                    color: ZAppColor.primary,
                  ),
                ),
              ],
            ),
          ),

          ZAppSize.s18.verticalSpace,

          Align(
            alignment: Alignment.topLeft,
            child: Text('enter_number_of_tickets'.tr),
          ),
          ZAppSize.s4.verticalSpace,
          ZCustomTextField(
            labelText: '',
            hintText: 'e,g 5'.tr,
            fillColor: ZAppColor.blackColor,
            filled: true,
            prefixIcon: null,
            textInputType: TextInputType.text,
            onChanged: (val) {},
          ),

          ZAppSize.s14.verticalSpace,

          Align(alignment: Alignment.topLeft, child: Text('email_address'.tr)),
          ZAppSize.s4.verticalSpace,
          ZCustomTextField(
            labelText: '',
            hintText: 'hint_email_address'.tr,
            fillColor: ZAppColor.blackColor,
            filled: true,
            prefixIcon: null,
            textInputType: TextInputType.text,
            // contentPadding: EdgeInsets.symmetric(vertical: 8),
            onChanged: (val) {},
          ),

          ZAppSize.s18.verticalSpace,

          Row(
            children: [
              Expanded(child: Container()),
              KCustomToggleButton(
                label: 'continue'.tr,
                value: '',
                onTap: () {
                  // ZHelperFunction.pop();
                  showCalendarPickerDialog(context: context, ctrl: ctrl);
                },
              ),
            ],
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
