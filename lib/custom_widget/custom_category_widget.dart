import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoryWidget extends StatelessWidget {
  final String? imageUrl;
  final String? urlforCheckNull;
  final String? categoryName;
  final void Function()? onTap;
  const CustomCategoryWidget(
      {super.key,
      required this.onTap,
      required this.categoryName,
      required this.imageUrl,
      required this.urlforCheckNull});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      scaleFactor: 0.6,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhysicalModel(
            color: const Color.fromARGB(255, 241, 233, 233),
            elevation: 2,
            shadowColor: Colors.blue[100]!,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: Get.height * 0.10,
              width: Get.width * 0.28,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(10),
              //     topRight: Radius.circular(10),
              //   ),
              // ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      urlforCheckNull != null
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                imageUrl!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                },
                              ),
                            )
                          : Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                      // Add other widgets on top of the image if needed
                    ],
                  )),
              //  Container(
              //   width: Get.width * 0.35,
              //   height: Get.height * 0.160,
              //   decoration: BoxDecoration(
              //       // border: Border.all(),
              //       image: DecorationImage(
              //           image: AssetImage(
              //             'assets/images/bread.png',
              //           ),
              //           fit: BoxFit.fill),
              //       // color: redColor,
              //       borderRadius: BorderRadius.circular(Get.height * 0.20)),
              // ),
            ),
          ),
          getheight(context, 0.010),
          SizedBox(
            width: Get.width * 0.28,
            child: Center(
              child: CustomTextRich(
                // text: "Milk & Coconut Water",
                text: categoryName,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomStaplesWidget extends StatelessWidget {
  final void Function()? onTap;
  const CustomStaplesWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          PhysicalModel(
            color: Color.fromARGB(255, 241, 233, 233),
            elevation: 5,
            shadowColor: Colors.blue[100]!,
            borderRadius: BorderRadius.circular(80),
            child: Container(
              width: Get.width * 0.35,
              height: Get.height * 0.160,
              decoration: BoxDecoration(
                  // border: Border.all(),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/product-banner.png',
                      ),
                      fit: BoxFit.fill),
                  // color: redColor,
                  borderRadius: BorderRadius.circular(Get.height * 0.20)),
            ),
          ),
          getheight(context, 0.020),
          SizedBox(
            width: Get.width * 0.40,
            child: const Center(
              child: CustomTextRich(
                text: "Pulses",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
