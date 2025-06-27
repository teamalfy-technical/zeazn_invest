import 'dart:io';

import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

var zeaznLogger = Logger(printer: PrettyPrinter(lineLength: 500));

Future showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  bool enableDrag = false,
  bool useSafeArea = true,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet(
    enableDrag: enableDrag,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    // shape: customRectShape,
    context: context,
    builder: (context) => child,
  );
}

// show option popup menu
void showOptionsMenu(
  BuildContext context,
  TapDownDetails details,
  List<PopupMenuEntry<String>> items,
  Function(String?) onItemSelected,
) {
  showMenu<String>(
    context: context,
    color:
        ZHelperFunction.isDarkMode(context)
            ? ZAppColor.lightBlackColor
            : ZAppColor.whiteColor,
    shadowColor: ZAppColor.shadowColor,
    surfaceTintColor:
        ZHelperFunction.isDarkMode(context)
            ? ZAppColor.lightBlackColor
            : ZAppColor.whiteColor,
    elevation: ZAppSize.s3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZAppSize.s8),
    ),
    position: RelativeRect.fromLTRB(
      details.globalPosition.dx,
      details.globalPosition.dy,
      details.globalPosition.dx,
      details.globalPosition.dy,
    ), //position where you want to show the menu on screen
    items: items,
  ).then<void>(onItemSelected);
}

// 0597191559
Future showConfirmDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  bool hideNegBtn = false,
  String? negativeText,
  required Function() onPostiveTap,
  Function()? onNegativeTap,
}) {
  // final l10n = AppLocalizations.of(context)!;
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: hideNegBtn ? false : true,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor:
            ZHelperFunction.isDarkMode(context)
                ? ZAppColor.lightBlackColor
                : ZAppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ZAppSize.s10),
        ),
        title: Text(title),
        content: content,
        actions: [
          TextButton(
            onPressed: onPostiveTap,
            child: Text(
              negativeText ?? 'contnue'.tr,
              style: const TextStyle(color: ZAppColor.primaryDark),
            ),
          ),
          hideNegBtn
              ? const SizedBox.shrink()
              : TextButton(
                onPressed: onNegativeTap ?? () => ZHelperFunction.pop(),
                child: Text(
                  negativeText ?? 'cancel'.tr,
                  style: const TextStyle(color: ZAppColor.errorColor),
                ),
              ),
        ],
      );
    },
  );
}

Future showLoadingdialog({
  required BuildContext context,
  required Widget content,
}) {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor:
            ZHelperFunction.isDarkMode(context)
                ? ZAppColor.lightBlackColor
                : ZAppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ZAppSize.s10),
        ),

        content: SizedBox(
          height: ZDeviceUtil.getDeviceHeight(context) * 0.25,
          child: content.centered(),
        ),
      );
    },
  );
}

Future showSucccessdialog({
  required BuildContext context,
  required String title,
}) {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor:
            ZHelperFunction.isDarkMode(context)
                ? ZAppColor.lightBlackColor
                : ZAppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ZAppSize.s10),
        ),
        content: SizedBox(
          height: ZDeviceUtil.getDeviceHeight(context) * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              Assets.icons.successIcon.svg(),
            ],
          ),
        ),
      );
    },
  );
}

Future showSupportViaCrowdfundingDialog({
  required BuildContext context,
  required ZSExploreVM ctrl,
  required Projects project,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZDeviceUtil.getDeviceHeight(context) * 0.43,
          padding: EdgeInsets.symmetric(vertical: ZAppSize.s22),
          decoration: BoxDecoration(
            color: ZAppColor.text200,
            border: Border.all(width: 1, color: ZAppColor.primary),
            borderRadius: BorderRadius.circular(ZAppSize.s20),
          ),
          child: Obx(
            () => Column(
              children: [
                Text(
                  '${'support_title'.tr}?',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: ZAppSize.s20),
                ).symmetric(horizontal: ZAppSize.s20),
                ZAppSize.s20.verticalSpace,
                // slider
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        tickMarkShape: VerticalTickMarkShape(),
                        thumbShape: BorderedThumbShape(),
                        activeTrackColor: ZAppColor.text300,
                        inactiveTrackColor: ZAppColor.text700,
                      ),
                      child: Slider(
                        min: ctrl.min,
                        max: project.targetAmount ?? 0,
                        value: ctrl.sliderValue.value,
                        divisions: ZAppSize.s10.toInt(),
                        label: ZFormatter.formatCurrency(
                          amount: ctrl.sliderValue.value,
                        ),
                        onChanged: (val) => ctrl.onSliderChanged(val),
                      ),
                    ),

                    Positioned(
                      left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                      child: Text(
                        ZFormatter.formatCurrency(amount: 1000),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
                      ),
                    ),
                    Positioned(
                      right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                      child: Text(
                        ZFormatter.formatCurrency(amount: 20000),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      // left: 0,
                      // right: 0,
                      child: Text(
                        ZFormatter.formatCurrency(amount: 10000),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
                      ),
                    ),
                  ],
                ),
                ZAppSize.s20.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('input_support'.tr),
                ).symmetric(horizontal: ZAppSize.s20),
                ZAppSize.s2.verticalSpace,
                ZCustomTextField(
                  labelText: '',
                  controller: ctrl.supportAmountTEC,
                  hintText: 'input_budget_hint'.tr,
                  fillColor: ZAppColor.blackColor,
                  filled: true,
                  prefixIcon: null,
                  textInputType: TextInputType.text,
                  onChanged: (val) {
                    ctrl.sliderValue.value = double.parse(val);
                    // ctrl.onSliderChanged(val);
                  },
                ).symmetric(horizontal: ZAppSize.s20),

                ZAppSize.s14.verticalSpace,

                Row(
                  children: [
                    Expanded(child: Container()),
                    KCustomToggleButton(
                      label: 'support'.tr,
                      value: '\$${ctrl.sliderValue.value}',
                      onTap: () {
                        ZHelperFunction.pop();
                        // show review payment dialog
                        showReviewPaymentModal(
                          context,
                          project,
                          ctrl,
                          ctrl.sliderValue.value,
                        );
                      },
                    ).symmetric(horizontal: ZAppSize.s20),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future showSupportViaExperiencesDialog({
  required BuildContext context,
  required ZSExploreVM ctrl,
  required Projects project,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZDeviceUtil.getDeviceHeight(context) * 0.42,
          padding: EdgeInsets.symmetric(vertical: ZAppSize.s22),
          decoration: BoxDecoration(
            color: ZAppColor.text200,
            border: Border.all(width: 1, color: ZAppColor.primary),
            borderRadius: BorderRadius.circular(ZAppSize.s20),
          ),
          child: Column(
            children: [
              Text(
                'exclusive_experience_support'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: ZAppSize.s20),
              ).symmetric(horizontal: ZAppSize.s20),
              ZAppSize.s20.verticalSpace,
              // slider
              Expanded(
                child: ListView.builder(
                  itemCount: ctrl.exclusiveDeals.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final deal = ctrl.exclusiveDeals[index];
                    return Obx(
                      () => ExclusiveDealWidget(
                        deal: deal,
                        width: ZDeviceUtil.getDeviceWidth(context) / 3.5,
                        fontSize: ZAppSize.s11,
                        borderRadius: ZAppSize.s12,
                        isSelected: ctrl.selectedDealIndex.value == index,
                        padding: EdgeInsets.symmetric(
                          vertical: ZAppSize.s16,
                          horizontal: ZAppSize.s10,
                        ),
                        onTap: () {
                          ctrl.onSelectedDealIndex(index);
                          ctrl.selectedDeal(deal);
                        },
                      ),
                    );
                  },
                ).only(left: ZAppSize.s32),
              ),

              ZAppSize.s16.verticalSpace,

              Row(
                children: [
                  Expanded(child: Container()),
                  KCustomToggleButton(
                    label: 'continue'.tr,
                    value: '',
                    onTap: () {
                      ctrl.setSupportType(SupportType.two);
                      ZHelperFunction.pop();
                      // // show review payment dialog
                    },
                  ).symmetric(horizontal: ZAppSize.s20),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future showCalendarPickerDialog({
  required BuildContext context,
  required ZSExploreVM ctrl,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZDeviceUtil.getDeviceHeight(context) * 0.78,
          color: ZAppColor.transparentColor,
          // padding: EdgeInsets.symmetric(vertical: ZAppSize.s22),
          // decoration: BoxDecoration(
          //   color: ZAppColor.text200,
          //   border: Border.all(width: 1, color: ZAppColor.primary),
          //   borderRadius: BorderRadius.circular(ZAppSize.s20),
          // ),
          child:
              Column(
                children: [
                  Container(
                    height: ZDeviceUtil.getDeviceHeight(context) * 0.14,
                    padding: EdgeInsets.all(ZAppSize.s12),
                    decoration: BoxDecoration(
                      color: ZAppColor.whiteColor,
                      borderRadius: BorderRadius.circular(ZAppSize.s12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Date and Time to participate in this Experience. ',
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: ZAppSize.s13,
                            color: ZAppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Spacer(),
                        Text(
                          'Available Dates/Time on this calendar are based on schedules provided by the Creator',
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: ZAppSize.s13,
                            color: ZAppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ).scrollable(physics: NeverScrollableScrollPhysics()),
                  ),
                  // Text(
                  //   'exclusive_experience_support'.tr,
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(
                  //     context,
                  //   ).textTheme.titleMedium?.copyWith(fontSize: ZAppSize.s20),
                  // ).symmetric(horizontal: ZAppSize.s20),
                  ZAppSize.s16.verticalSpace,
                  // Calenedar picker
                  Container(
                    height: ZDeviceUtil.getDeviceHeight(context) * 0.41,
                    // padding: EdgeInsets.all(ZAppSize.s16),
                    decoration: BoxDecoration(
                      color: ZAppColor.whiteColor,

                      borderRadius: BorderRadius.circular(ZAppSize.s12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'date'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: ZAppSize.s14,
                                color: ZAppColor.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Assets.icons.cancelSquare.svg().onPressed(
                              onTap: ZHelperFunction.pop,
                            ),
                          ],
                        ).only(
                          top: ZAppSize.s16,
                          left: ZAppSize.s20,
                          right: ZAppSize.s20,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  ZAppColor.primary, // Header background color
                              onPrimary: ZAppColor.primary, // Header text color
                              onSurface:
                                  ZAppColor.blackColor, // Body text color
                            ),
                          ),
                          child: CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            onDateChanged: (value) {},
                            // onDateChanged: controller.setSelectedDate,
                          ),
                        ),
                      ],
                    ).scrollable(physics: NeverScrollableScrollPhysics()),
                  ),

                  ZAppSize.s16.verticalSpace,

                  Container(
                    height: ZDeviceUtil.getDeviceHeight(context) * 0.12,
                    padding: EdgeInsets.all(ZAppSize.s16),
                    decoration: BoxDecoration(
                      color: ZAppColor.whiteColor,
                      borderRadius: BorderRadius.circular(ZAppSize.s12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'available_time'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: ZAppSize.s14,
                                color: ZAppColor.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '4th,April 2025',
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: ZAppSize.s14,
                                color: ZAppColor.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        ZAppSize.s8.verticalSpace,

                        // available time
                        Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            runSpacing: ZAppSize.s8,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 2.5,
                            children: List.generate(
                              ctrl.availableTimes.length,
                              (index) {
                                return Obx(
                                  () => Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: ZAppSize.s8,
                                      horizontal: ZAppSize.s20,
                                    ),
                                    margin: EdgeInsets.only(
                                      right: ZAppSize.s20,
                                    ),
                                    // height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          ctrl.selectedTime.value ==
                                                  ctrl.availableTimes[index]
                                              ? ZAppColor.primary
                                              : ZAppColor.fillColor,
                                      borderRadius: BorderRadius.circular(
                                        ZAppSize.s6,
                                      ),
                                    ),
                                    child: Text(
                                      ctrl.availableTimes[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
                                        fontSize: ZAppSize.s13,
                                        color: ZAppColor.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ).onPressed(
                                    onTap:
                                        () => ctrl.onSelectedTimeChanged(
                                          ctrl.availableTimes[index],
                                        ),
                                  ),
                                );
                              },
                            ),
                          ).scrollable(physics: NeverScrollableScrollPhysics()),
                        ),
                      ],
                    ),
                  ),

                  ZAppSize.s16.verticalSpace,

                  Row(
                    children: [
                      Expanded(child: Container()),
                      KCustomToggleButton(
                        label: 'continue'.tr,
                        value: '',
                        onTap: () {
                          ctrl.setSupportType(SupportType.one);
                          ZHelperFunction.pop();
                          // show review payment dialog
                          showReviewPaymentModal(
                            context,
                            projects[0],
                            ctrl,
                            ctrl.sliderValue.value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ).scrollable(),
        ),
      );
    },
  );
}

Future showReviewPaymentModal(
  BuildContext context,
  Projects project,
  ZSExploreVM ctrl,
  double supportPrice,
) {
  return showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Color(0xFF302F2F).withOpacityExt(ZAppSize.s0_8),
        child: Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZDeviceUtil.getDeviceHeight(context) * 0.38,
          padding: EdgeInsets.symmetric(
            horizontal: ZAppSize.s24,
            vertical: ZAppSize.s20,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 1, color: ZAppColor.primary),
            borderRadius: BorderRadius.circular(ZAppSize.s20),
          ),
          child: Obx(
            () =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${'review_payment_details'.tr}?',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: ZAppSize.s20),
                    ),

                    ZAppSize.s14.verticalSpace,

                    Text(
                      '${'exclusive_deal_price'.tr} \$$supportPrice',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(fontSize: ZAppSize.s18),
                    ),

                    ZAppSize.s3.verticalSpace,

                    Text(
                      '${'number_of_purchase'.tr} : 5',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(fontSize: ZAppSize.s16),
                    ),

                    ZAppSize.s16.verticalSpace,
                    ZCustomCheckbox(
                      value: ctrl.supportAnonymously.value,
                      onChanged: ctrl.onSupportAnonymously,
                      child: Text('support_anonymously'.tr),
                    ).centered(),

                    // ZAppSize.s5.verticalSpace,
                    ZCustomCheckbox(
                      value: ctrl.agree.value,
                      onChanged: ctrl.onAgreeToTerms,
                      child: RichText(
                        text: TextSpan(
                          text: 'agree_to'.tr,
                          children: [
                            TextSpan(
                              text: ' ${'terms'.tr}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                fontSize: ZAppSize.s16,
                                color: ZAppColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).centered(),

                    ZAppSize.s16.verticalSpace,

                    Row(
                      children: [
                        Expanded(child: Container()),
                        KCustomToggleButton(
                          label: 'pay'.tr.toUpperCase(),
                          value: '\$${ctrl.sliderValue.value}',
                          onTap: () {
                            ZHelperFunction.switchScreen(
                              destination: Routes.paymentMethodPage,
                              replace: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ).scrollable(),
          ),
        ),
      );
    },
  );
}

Future<File> chooseFile({
  List<String>? allowedExtensions,
  bool? allowMultiple,
}) async {
  File file = File('');
  try {
    var pickedFiles = await filePicker.FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple ?? false,
      type: filePicker.FileType.any,
      //allowedExtensions: allowedExtensions ?? ['jpg', 'png', 'doc', 'docx', 'pdf'],
    );
    if (pickedFiles != null) {
      file = File(pickedFiles.files.single.path!);
    } else {
      // User canceled the picker
      ZPopupDialog(
        Get.context!,
      ).errorMessage(title: 'error'.tr, message: 'No file selected');
      debugPrint('User canceled the picker');
    }
  } catch (err) {
    debugPrint("Failed to pick files: $err");
  }
  return file;
}

Future<List<File>> chooseMultipleFiles() async {
  List<File> files = [];
  try {
    final pickedFiles = await filePicker.FilePicker.platform.pickFiles(
      type: filePicker.FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );
    zeaznLogger.e('PickedFiles: $pickedFiles');
    if (pickedFiles != null) {
      files = pickedFiles.paths.map((path) => File(path!)).toList();
    } else {
      ZPopupDialog(
        Get.context!,
      ).errorMessage(title: 'error'.tr, message: 'Selection cancelled');
    }
  } catch (e) {
    ZPopupDialog(
      Get.context!,
    ).errorMessage(title: 'error'.tr, message: 'Failed to pick files: $e');
  }
  return files;
}

Future<DateTime?> pickDateTime(BuildContext context) async {
  // Pick date first
  final DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (date == null) return null; // User cancelled date picker

  // Then pick time
  final TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (time == null) return null; // User cancelled time picker

  // Combine date and time
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

Future<DateTime?> showDatePickerModal(
  BuildContext context, {
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) async {
  DateTime? dateTime;
  ZDeviceUtil.isIOS()
      ? await showCupertinoModalPopup<void>(
        context: context,
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color:
                  ZHelperFunction.isDarkMode(context)
                      ? ZAppColor.text500
                      : ZAppColor.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(ZAppSize.s12),
                topRight: Radius.circular(ZAppSize.s12),
              ),
            ),
            height: ZDeviceUtil.getDeviceHeight(context) * 0.27,
            child: Stack(
              children: [
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime:
                      initialDateTime ??
                      DateTime.now().subtract(const Duration(days: 4751)),
                  minimumDate: minimumDate ?? DateTime(1950),
                  maximumDate:
                      maximumDate ??
                      DateTime.now().subtract(const Duration(days: 4751)),
                  onDateTimeChanged: (value) {
                    dateTime = value;
                  },
                ),
                Positioned(
                  right: 0,
                  child: TextButton(
                    onPressed: () => ZHelperFunction.pop(),
                    child: Text(
                      'ok'.tr,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: ZAppSize.s16,
                        color: ZAppColor.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
      : dateTime = await showDatePicker(
        context: context,
        initialDate:
            initialDateTime ??
            DateTime.now().subtract(const Duration(days: 4751)),
        firstDate: minimumDate ?? DateTime(1950),
        lastDate:
            maximumDate ?? DateTime.now().subtract(const Duration(days: 4751)),
        //helpText: 'Select Date of birth',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
      );
  return dateTime;
}

Future<TimeOfDay?> showTimePickerModal(BuildContext context) async {
  return await showTimePicker(context: context, initialTime: TimeOfDay.now());
}
