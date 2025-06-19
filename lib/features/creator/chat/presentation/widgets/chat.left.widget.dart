import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';

class ZChatLeftWidget extends StatelessWidget {
  final Message message;
  final bool showActionButtons;
  final Function()? onReportTap;
  final Function()? onFeedbackTap;
  const ZChatLeftWidget({
    super.key,
    required this.message,
    this.showActionButtons = false,
    this.onReportTap,
    this.onFeedbackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            alignment: Alignment.topLeft,
            width: ZDeviceUtil.getDeviceWidth(context) / 1.5,
            margin: const EdgeInsets.only(
              top: ZAppSize.s15,
              left: ZAppSize.s15,
              right: ZAppSize.s15,
            ),
            padding: const EdgeInsets.all(ZAppSize.s14),
            decoration: BoxDecoration(
              color:
                  // ZHelperFunction.isDarkMode(context)
                  //     ? ZAppColor.lightBlackColor
                  //     : ZAppColor.whiteColor,
                  ZAppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ZAppSize.s12),
                topRight: Radius.circular(ZAppSize.s0),
                bottomLeft: Radius.circular(ZAppSize.s12),
                bottomRight: Radius.circular(ZAppSize.s12),
              ),
            ),
            child: Text(
              message.body ?? '',
              style: TextStyle(color: ZAppColor.lightBlackColor),
            ),
          ),
        ),

        if (showActionButtons)
          Column(
            children: [
              ZAppSize.s12.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: ZDeviceUtil.getDeviceWidth(context) / 1.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: ZAppColor.whiteColor,
                            minimumSize: Size.fromHeight(ZAppSize.s38),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: ZAppSize.s16,
                            ),
                            elevation: ZAppSize.s0,
                            padding: EdgeInsets.all(ZAppSize.s8),
                          ),
                          onPressed: () {},
                          child: Text('report'.tr),
                        ),
                      ),
                      ZAppSize.s15.horizontalSpace,
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: ZAppSize.s0,
                            foregroundColor: ZAppColor.blackColor,
                            minimumSize: Size.fromHeight(ZAppSize.s38),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s16,
                            ),
                            backgroundColor: ZAppColor.whiteColor,
                            side: BorderSide.none,
                            padding: EdgeInsets.all(ZAppSize.s8),
                          ),
                          onPressed: () {},
                          child: Text('feedback'.tr),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).only(left: ZAppSize.s15),

        // ZAppSize.s2.verticalSpace,
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       message.readStatus == ReadStatus.read.name
        //           ? Assets.icons.chatReadIcon.svg(color: HAppColor.primary)
        //           : Assets.icons.chatUnreadIcon
        //               .svg(width: ZAppSize.s10, height: ZAppSize.s10),
        //       ZAppSize.s4.horizontalSpace,
        //       Text(
        //         ZFormatter.formatDate(
        //             dateFormat: DateFormat.yMMMEd().add_jmv(),
        //             date: DateTime.parse(
        //                 message.createdAt ?? DateTime.now().toIso8601String())),
        //         textAlign: TextAlign.start,
        //         style: Theme.of(context)
        //             .textTheme
        //             .bodyMedium
        //             ?.copyWith(fontSize: ZAppSize.s9.sp),
        //       ),
        //     ],
        //   ),
        // ).horizontal(ZAppSize.s14),
        ZAppSize.s12.verticalSpace,
      ],
    );
  }
}
