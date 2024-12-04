import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CustomMoreCardWidget extends StatelessWidget {
  final IconData? icon;
  final String? mainText;
  final String? subText;

  const CustomMoreCardWidget(
      {super.key,
      required this.icon,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.020,
                  child: WidgetAnimator(
                    atRestEffect: WidgetRestingEffects.size(),
                    child: FaIcon(
                      icon,
                      color: whiteColor,
                    ),
                  ),
                ),
                getwidth(context, 0.060),
                VerticalDivider(
                  color: whiteColor,
                  // thickness: 2,
                  // width: 0,
                ),
                getwidth(context, 0.040),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextCard(
                      text: mainText,
                      color: whiteColor,
                      fontSize: 15,
                      // fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                        width: Get.width * 0.60,
                        child: CustomTextCard(
                          text: subText,
                          fontSize: 10,
                          color: whiteColor.withOpacity(0.5),
                        )),
                  ],
                )
              ],
            ),
          ),
          Icon(
            Bootstrap.arrow_right_circle_fill,
            color: whiteColor,
            size: 20,
          )
        ],
      ),
    );
  }
}

class CustomMoreProfileWidget extends StatelessWidget {
  // final IconData? icon;
  final String? mainText;
  final String? subText;

  const CustomMoreProfileWidget(
      {super.key,
      // required this.icon,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // FaIcon(
              //   icon,
              //   color: greyColor,
              // ),
              // getwidth(context, 0.040),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextCard(
                    text: mainText,
                    color: whiteColor,
                    // fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                      width: Get.width * 0.60,
                      child: CustomTextCard(
                        text: subText,
                        fontSize: 12,
                        color: whiteColor.withOpacity(0.5),
                      )),
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: whiteColor.withOpacity(0.7),
            size: 18,
          )
        ],
      ),
    );
  }
}

class CustomMoreAgainWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final void Function()? onTap;
  final IconData? icon;
  const CustomMoreAgainWidget(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      scaleFactor: 0.5,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          Get.height * 0.004,
        ),
        decoration: BoxDecoration(
            color: appColorText,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: whiteColor)),
        child: Column(
          children: [
            getheight(context, 0.020),
            Icon(
              icon,
              color: whiteColor,
            ),
            getheight(context, 0.015),
            SizedBox(
              width: Get.width * 0.42,
              child: CustomTextCard(
                text: title,
                fontSize: 12,
                textAlign: TextAlign.center,
                color: whiteColor,
              ),
            ),
            getheight(context, 0.005),
            SizedBox(
              width: Get.width * 0.40,
              child: CustomTextCard(
                text: subtitle,
                fontSize: 10,
                color: whiteColor.withOpacity(0.5),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ),
            getheight(context, 0.015)
          ]
              .animate(interval: 30.ms)
              .fade(duration: 500.ms)
              .slide(duration: 200.ms),
        ),
      ),
    );
  }
}
