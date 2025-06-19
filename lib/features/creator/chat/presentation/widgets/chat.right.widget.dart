import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';

class ZChatRightWidget extends StatelessWidget {
  final Message message;
  const ZChatRightWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: ZDeviceUtil.getDeviceWidth(context) / 1.5,
            margin: const EdgeInsets.only(
              top: ZAppSize.s15,
              left: ZAppSize.s15,
              right: ZAppSize.s15,
            ),
            padding: const EdgeInsets.all(ZAppSize.s14),
            decoration: BoxDecoration(
              color: ZAppColor.primary.withOpacityExt(ZAppSize.s0_6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ZAppSize.s12),
                topRight: Radius.circular(ZAppSize.s0),
                bottomLeft: Radius.circular(ZAppSize.s12),
                bottomRight: Radius.circular(ZAppSize.s12),
              ),
            ),
            child: Text(
              message.body ?? '',
              style: const TextStyle(color: ZAppColor.lightBlackColor),
            ),
          ),
        ),
        // ZAppSize.s2.verticalSpace,
        // Align(
        //   alignment: Alignment.topRight,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       // TAppAssets.getIconPath(chatReadIcon)

        //       message.readStatus == ReadStatus.read.name
        //           ? Assets.icons.chatReadIcon.svg(color: ZAppColor.primary)
        //           : Assets.icons.chatUnreadIcon
        //               .svg(width: ZAppSize.s10, height: ZAppSize.s10),

        //       ZAppSize.s4.horizontalSpace,
        //       Text(
        //         ZFormatter.formatDate(
        //             dateFormat: DateFormat.yMMMEd().add_jmv(),
        //             date: DateTime.parse(
        //                 message.createdAt ?? DateTime.now().toIso8601String())),
        //         textAlign: TextAlign.start,
        //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //               fontSize: ZAppSize.s9.sp,
        //             ),
        //       ),
        //     ],
        //   ),
        // ).horizontal(ZAppSize.s14),
        ZAppSize.s12.verticalSpace,
      ],
    );
  }
}
