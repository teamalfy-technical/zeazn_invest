import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';
import 'package:zeazn_invest_app/features/supporter/report/presentation/vm/report.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSendReportPage extends StatelessWidget {
  ZSendReportPage({super.key});

  final ctrl = Get.put(ZReportVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        children: [
          ZAppSize.s8.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.arrow_back_ios,
              color: ZAppColor.blackColor,
            ).onPressed(onTap: () => ZHelperFunction.pop()),
          ),

          ZAppSize.s8.verticalSpace,
          Text(
            'chat_with_support'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: ZAppSize.s20,
              color: ZAppColor.blackColor,
              letterSpacing: ZAppSize.s2,
              fontWeight: FontWeight.w500,
            ),
          ),

          ZAppSize.s14.verticalSpace,

          // Time & day widget
          Column(
            children: [
              Text(
                'Today',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: ZAppSize.s17,
                  color: ZAppColor.blackColor,
                  letterSpacing: ZAppSize.s3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '10:39 am',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: ZAppSize.s11,
                  color: ZAppColor.text300,
                  letterSpacing: ZAppSize.s2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          ZAppSize.s8.verticalSpace,

          Expanded(
            child: ListView.builder(
              itemCount: ctrl.messages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final message = ctrl.messages[index];
                return message.fromNumber == '2'
                    ? ZChatRightWidget(message: message)
                    : ZChatLeftWidget(
                      message: message,
                      showActionButtons: true,
                      onReportTap: () {},
                      onFeedbackTap: () {},
                    );
              },
            ),
          ),
          ChatInputWidget(controller: ctrl.messageTEC, onSendTap: () {}),
        ],
      ),
    );
  }
}
