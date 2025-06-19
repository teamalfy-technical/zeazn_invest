import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/insights/presentation/vm/insights.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZPerformanceOverviewPage extends StatelessWidget {
  ZPerformanceOverviewPage({super.key});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZAppSize.s8.verticalSpace,
              Icon(
                Icons.arrow_back_ios,
                color: ZAppColor.blackColor,
              ).onPressed(onTap: () => ZHelperFunction.pop()),
              ZAppSize.s8.verticalSpace,
              // Analysis container widget
              Container(
                padding: EdgeInsets.all(ZAppSize.s20),
                decoration: BoxDecoration(
                  color: ZAppColor.blackColor,
                  borderRadius: BorderRadius.circular(ZAppSize.s20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: ZAppSize.s25,
                      backgroundImage: AssetImage(Assets.images.slideTwo.path),
                    ),
                    ZAppSize.s8.horizontalSpace,
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'performing_overview'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          ZAppSize.s8.verticalSpace,
                          Text(
                            'analysis_hint_1'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontSize: ZAppSize.s10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ZAppSize.s16.verticalSpace,

              // Creator ID Tag widget
              ZPageTagWidget(
                tag: '${'supporter_id'.tr}: 3884748',
                width: ZDeviceUtil.getDeviceWidth(context) * 0.70,
              ),

              ZAppSize.s16.verticalSpace,

              // Performing campaigns widget
              Text(
                'Here’s \nthe performance \nreview of your support',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: ZAppSize.s32,
                  fontWeight: FontWeight.w300,
                  color: ZAppColor.text300,
                ),
              ),
              ZAppSize.s16.verticalSpace,

              SizedBox(
                width: ZDeviceUtil.getDeviceWidth(context),
                height: ZDeviceUtil.getDeviceHeight(context) * 0.20,
                child: PCustomBarChart(
                  data: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 4,
                          color: ZAppColor.transparentColor,
                          width: ZAppSize.s70,
                          borderSide: BorderSide(
                            width: ZAppSize.s3,
                            color: ZAppColor.blackColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZAppSize.s12),
                            topRight: Radius.circular(ZAppSize.s12),
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 8,
                          color: ZAppColor.transparentColor,
                          width: ZAppSize.s70,
                          borderSide: BorderSide(
                            width: ZAppSize.s3,
                            color: ZAppColor.blackColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZAppSize.s12),
                            topRight: Radius.circular(ZAppSize.s12),
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 4,
                          color: ZAppColor.transparentColor,
                          width: ZAppSize.s70,
                          borderSide: BorderSide(
                            width: ZAppSize.s3,
                            color: ZAppColor.blackColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZAppSize.s12),
                            topRight: Radius.circular(ZAppSize.s12),
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 10,
                          color: ZAppColor.transparentColor,
                          width: ZAppSize.s70,
                          borderSide: BorderSide(
                            width: ZAppSize.s3,
                            color: ZAppColor.blackColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZAppSize.s12),
                            topRight: Radius.circular(ZAppSize.s12),
                          ),
                        ),
                      ],
                    ),
                    // BarChartGroupData(
                    //   x: 4,
                    //   barRods: [
                    //     BarChartRodData(
                    //       toY: 5,
                    //       color: ZAppColor.transparentColor,
                    //       width: ZAppSize.s70,
                    //       borderSide: BorderSide(
                    //         width: ZAppSize.s3,
                    //         color: ZAppColor.blackColor,
                    //       ),
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(ZAppSize.s12),
                    //         topRight: Radius.circular(ZAppSize.s12),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                  showBottomTitles: true,
                  showLeftTitles: false,
                  showGridData: false,
                ),
              ),

              ZAppSize.s8.verticalSpace,

              // bar chart
              Text(
                'This month the Creators you have supported have achieved great milestones',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // fontSize: ZAppSize.s32,
                  fontWeight: FontWeight.w300,
                  color: ZAppColor.blackColor,
                ),
              ),

              ZAppSize.s16.verticalSpace,

              // Chart Value
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$331,224.34',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // fontSize: ZAppSize.s32,
                      fontWeight: FontWeight.w600,
                      color: ZAppColor.blackColor,
                    ),
                  ),
                  ZAppSize.s16.horizontalSpace,
                  Expanded(
                    child: Text(
                      'That\'s \$132,569.46 more than this time last year',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        // fontSize: ZAppSize.s32,
                        fontWeight: FontWeight.w300,
                        color: ZAppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),

              ZAppSize.s16.verticalSpace,

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
                      max: 20000,
                      value: ctrl.sliderValue.value + 9000,
                      divisions: ZAppSize.s10.toInt(),
                      label: ZFormatter.formatCurrency(
                        amount: ctrl.sliderValue.value,
                      ),
                      onChanged: ctrl.onSliderChanged,
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
            ],
          ).scrollable(),
    );
  }
}
