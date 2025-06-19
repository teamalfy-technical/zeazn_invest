import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chat, this.onTap});

  final Map<String, dynamic> chat;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: ZAppSize.s36,
          backgroundImage: AssetImage(Assets.images.slideTwo.path),
        ),
        ZAppSize.s14.horizontalSpace,
        Expanded(
          child: Column(
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
              ZAppSize.s2.verticalSpace,
              Text(
                chat['last_message'],
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZAppColor.blackColor,
                  fontSize: ZAppSize.s12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        ZAppSize.s14.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ZFormatter.formatTime12Hour(DateTime.parse(chat['created_at'])),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZAppColor.text200,
                fontWeight: FontWeight.w400,
              ),
            ),
            ZAppSize.s2.verticalSpace,
            CircleAvatar(
              radius: 10,
              backgroundColor: ZAppColor.primary,
              child: Text(
                '${chat['count']}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: ZAppSize.s10,
                ),
              ),
            ),
          ],
        ),
      ],
    ).onPressed(onTap: onTap);
  }
}
