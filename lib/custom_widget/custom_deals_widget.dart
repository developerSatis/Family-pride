import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class CustomDealsWidget extends StatelessWidget {
  final String mainImage;
  final String? productName;
  final void Function()? onTap;
  const CustomDealsWidget(
      {super.key,
      required this.onTap,
      required this.productName,
      required this.mainImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PhysicalModel(
        color: const Color.fromARGB(255, 241, 233, 233),
        elevation: 5,
        shadowColor: Colors.blue[100]!,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Get.width * 0.45,
          height: Get.height * 0.14,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(mainImage),
                  //  AssetImage(
                  //   'assets/images/hd1.jpg',
                  // ),
                  fit: BoxFit.fill),
              color: redColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getheight(context, 0.020),
              CustomTextSimple(
                text: productName,
                fontSize: 12,
                color: appColorBlack,
                fontWeight: FontWeight.w700,
              ),
              getheight(context, 0.020),
              Icon(
                Icons.arrow_forward_rounded,
                color: appColorBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
