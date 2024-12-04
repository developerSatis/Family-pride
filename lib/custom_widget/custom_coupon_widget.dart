import 'package:flutter/material.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class CustomCouponWidget extends StatelessWidget {
  final String? mainText;
  final String? subText;
  final String? couponText;
  final Color? color;
  final Color? backgroundContainerColor;
  final Color? borderColor;
  const CustomCouponWidget(
      {super.key,
      required this.color,
      required this.couponText,
      required this.mainText,
      required this.subText,
      required this.backgroundContainerColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: 1.5),
          color: backgroundContainerColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 15, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCard(
                  text: mainText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                getheight(context, 0.008),
                CustomTextCard(
                  text: subText,
                  fontSize: 12,
                  color: greyColor.withOpacity(0.8),
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            CustomTextCard(
              text: couponText,
              // fontSize: 18,
              color: color, fontWeight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}
