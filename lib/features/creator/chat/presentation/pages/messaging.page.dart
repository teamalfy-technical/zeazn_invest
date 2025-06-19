import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZMessagingPage extends StatelessWidget {
  final Map<String, dynamic> chat;
  ZMessagingPage({super.key, required this.chat});

  final ctrl = Get.put(ZChatVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: ZAppColor.blackColor,
              ).onPressed(onTap: () => ZHelperFunction.pop()),
              ZAppSize.s8.horizontalSpace,
              CircleAvatar(
                radius: ZAppSize.s32,
                backgroundImage: AssetImage(Assets.images.slideTwo.path),
              ),
              ZAppSize.s10.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat['user'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ZAppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ZAppSize.s3.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: ZAppSize.s3,
                          backgroundColor: ZAppColor.success700,
                        ),
                        ZAppSize.s2.horizontalSpace,
                        Text(
                          'Online',
                          textAlign: TextAlign.start,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color: ZAppColor.text200,
                            fontSize: ZAppSize.s12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          ZAppSize.s14.verticalSpace,

          Expanded(
            child: ListView.builder(
              itemCount: ctrl.messages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final message = ctrl.messages[index];
                return message.fromNumber == '2'
                    ? ZChatRightWidget(message: message)
                    : ZChatLeftWidget(message: message);
              },
            ),
          ),
          ChatInputWidget(controller: ctrl.messageTEC, onSendTap: () {}),
        ],
      ),
    );
  }
}
