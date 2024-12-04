import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';

class IncrementDecrementButtonWidget extends StatelessWidget {
  final void Function()? onTapDecrement;
  final void Function()? onTapIncrement;
  final String? value;
  const IncrementDecrementButtonWidget(
      {super.key,
      required this.onTapDecrement,
      required this.onTapIncrement,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.22,
      height: Get.height * 0.030,
      decoration: BoxDecoration(
        border: Border.all(color: greenColor, width: 1.5),
        // color: yellowColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bounceable(
            scaleFactor: 0.5,
            onTap: onTapDecrement,
            child: Container(
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              width: Get.width * 0.08,
              height: double.infinity,
              child: Icon(
                Icons.remove,
                size: 20,
                color: whiteColor,
                // weight: 15,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: onTapDecrement,
          //   child: Icon(
          //     Icons.remove,
          //     size: 15,
          //     color: greenColor,
          //     weight: 5,
          //   ),
          // ),
          CustomTextSimple(
            text: value,
            fontSize: 15,
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
          Bounceable(
            scaleFactor: 0.5,
            onTap: onTapIncrement,
            child: Container(
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              width: Get.width * 0.08,
              height: double.infinity,
              child: Icon(
                Icons.add,
                size: 20,
                color: whiteColor,
                // weight: 5,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: onTapIncrement,
          //   child: Icon(
          //     Icons.add,
          //     size: 15,
          //     color: greenColor,
          //     weight: 5,
          //   ),
          // )
        ],
      ),
    );
  }
}
