import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZChooseCardPage extends StatelessWidget {
  //final Project project;
  ZChooseCardPage({super.key});

  final ctrl = Get.put(ZSExploreVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZAppSize.s20.verticalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'total_cost'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(
                          color: ZAppColor.text700,
                          letterSpacing: ZAppSize.s2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ': \$${ctrl.sliderValue.value}',
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(
                          color: ZAppColor.text300,
                          letterSpacing: ZAppSize.s2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  // ZAppSize.s30.verticalSpace,
                  Image.asset(Assets.images.creditCard.path),

                  ZAppSize.s10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: ZCustomCheckbox(
                          value: true,
                          onChanged: (val) {},
                          child: Text(
                            'save_this_card'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontSize: ZAppSize.s14,
                              color: ZAppColor.text300,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ZCustomCheckbox(
                          checkboxDirection: Direction.right,
                          value: true,
                          onChanged: (val) {},
                          child: Text(
                            'use_adress_for_billing'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontSize: ZAppSize.s14,
                              color: ZAppColor.text300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ZAppSize.s10.verticalSpace,
                  // order summary
                  ZPageTagWidget(
                    tag: 'order_summary'.tr,
                    width: ZDeviceUtil.getDeviceWidth(context) * 0.60,
                  ),

                  ZAppSize.s18.verticalSpace,
                  RichText(
                    text: TextSpan(
                      text: '${'item'.tr}: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: ZAppSize.s16,
                        color: ZAppColor.text700,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'investment_options'.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontSize: ZAppSize.s16,
                            color: ZAppColor.text500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ZAppSize.s10.verticalSpace,
                  RichText(
                    text: TextSpan(
                      text: '${'total_price'.tr}: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: ZAppSize.s16,
                        color: ZAppColor.text700,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: '\$${ctrl.sliderValue.value}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontSize: ZAppSize.s16,
                            color: ZAppColor.text500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ZAppSize.s10.verticalSpace,

            SwipeToPayButton(
              maxDrag: ZDeviceUtil.getDeviceWidth(context) * 0.90,
              onSwipeComplete: () {
                zeaznLogger.e("Payment Triggered");
                // Trigger payment logic here
                ZHelperFunction.switchScreen(
                  destination: Routes.paymentProcessingPage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeToPayButton extends StatefulWidget {
  final double maxDrag;
  final VoidCallback onSwipeComplete;

  const SwipeToPayButton({
    super.key,
    required this.onSwipeComplete,
    required this.maxDrag,
  });

  @override
  State<SwipeToPayButton> createState() => _SwipeToPayButtonState();
}

class _SwipeToPayButtonState extends State<SwipeToPayButton> {
  double _dragPosition = 0.0;
  bool _isCompleted = false;

  double _maxDrag = 240; // Width of the swipe track

  @override
  void initState() {
    _maxDrag = widget.maxDrag;
    super.initState();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0.0, _maxDrag);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragPosition >= _maxDrag * 0.9) {
      setState(() {
        _isCompleted = true;
        _dragPosition = _maxDrag;
      });
      widget.onSwipeComplete();
    } else {
      setState(() {
        _dragPosition = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxDrag + 60,
      height: 70,
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s12),
      ),
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Center(
            child: Text(
              _isCompleted ? "Paid" : "Swipe to Pay",
              style: TextStyle(
                color: ZAppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: ZAppSize.s0,
            child: Assets.icons.arrowRightIcon.svg(),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 0),
            left: _dragPosition,
            // right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ZAppSize.s8,
                  horizontal: ZAppSize.s10,
                ),
                decoration: BoxDecoration(
                  color: ZAppColor.primary,
                  borderRadius: BorderRadius.circular(ZAppSize.s8),
                ),
                child: Icon(Icons.attach_money, size: ZAppSize.s36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
