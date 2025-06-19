import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';

class ZChatPage extends StatelessWidget {
  final bool isPop;
  ZChatPage({super.key, required this.isPop});

  final ctrl = Get.put(ZChatVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      body: SafeArea(
        top: isPop ? true : false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPop == false) ZAppSize.s16.verticalSpace,

            if (isPop)
              Icon(
                Icons.arrow_back_ios,
                color: ZAppColor.blackColor,
              ).onPressed(onTap: () => ZHelperFunction.pop()),

            isPop ? ZAppSize.s16.verticalSpace : ZAppSize.s0.verticalSpace,

            // Performing campaigns widget
            Container(
              padding: EdgeInsets.only(
                top: ZAppSize.s16,
                bottom: ZAppSize.s16,
                left: ZAppSize.s16,
                right: ZAppSize.s32,
              ),
              decoration: BoxDecoration(
                color: ZAppColor.blackColor,
                borderRadius: BorderRadius.circular(ZAppSize.s12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   radius: ZAppSize.s25,
                  //   backgroundImage: AssetImage(Assets.images.slideTwo.path),
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZAppSize.s10),
                    child: Image.asset(
                      Assets.images.slideOne.path,
                      fit: BoxFit.cover,
                      width: ZAppSize.s60,
                      height: ZAppSize.s60,
                    ),
                  ),
                  // ZAppSize.s50.horizontalSpace,
                  Assets.icons.usersIcon.svg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'all'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ZAppSize.s8.horizontalSpace,
                      Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.primary,
                        ),
                      ),
                      // Assets.icons.arrowForwardIos.svg(
                      //   color: ZAppColor.whiteColor,
                      // ),
                    ],
                  ),
                  // ZAppSize.s50.horizontalSpace,
                ],
              ),
            ),

            ZAppSize.s16.verticalSpace,

            // search field
            TextField(
              decoration: InputDecoration(
                fillColor: ZAppColor.transparentColor,
                filled: true,
                hintText: 'search_here'.tr,
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: ZAppColor.text100),
                contentPadding: EdgeInsets.zero,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Assets.icons.searchIcon.svg(
                    height: ZAppSize.s20,
                    color: ZAppColor.primary,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: ZAppSize.s1,
                    color: ZAppColor.dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(ZAppSize.s12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: ZAppSize.s1,
                    color: ZAppColor.dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(ZAppSize.s12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: ZAppSize.s1,
                    color: ZAppColor.dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(ZAppSize.s12),
                ),
              ),
            ),

            ZAppSize.s16.verticalSpace,

            // list of chats
            Expanded(
              child: ListView.builder(
                itemCount: ctrl.chats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = ctrl.chats[index];
                  return ChatWidget(
                    chat: chat,
                    onTap:
                        () => ZHelperFunction.switchScreen(
                          destination: Routes.messagingPage,
                          args: chat,
                        ),
                  ).only(bottom: ZAppSize.s24);
                },
              ),
            ),

            // write here text field and record button
            Row(children: []),
          ],
        ).symmetric(
          horizontal: isPop ? ZAppSize.s18 : ZAppSize.s0,
          vertical: isPop ? ZAppSize.s18 : ZAppSize.s0,
        ),
      ),
    );
  }
}
