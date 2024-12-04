import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:shimmer/shimmer.dart';

class LeftScrollItemWidget extends StatelessWidget {
  final String? productName;
  final String? categoryImage;
  final String? checkNullonImage;
  final VoidCallback? onTap;
  final bool isSelected;

  const LeftScrollItemWidget({
    Key? key,
    required this.productName,
    required this.categoryImage,
    required this.checkNullonImage,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Bounceable(
        scaleFactor: 0.6,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: isSelected ? Border.all() : null,
              boxShadow: [
                isSelected ? BoxShadow(color: greenColor) : BoxShadow()
              ]),
          child: PhysicalModel(
            color: whiteColor,
            elevation: isSelected ? 4 : 1,
            shadowColor: isSelected ? Colors.greenAccent : Colors.green[50]!,
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: Get.width * 0.22,
              height: Get.height * 0.100,
              child: Column(
                children: [
                  Container(
                    width: Get.width * 0.22,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isSelected ? greenColor : appColorWhite,
                      border: isSelected
                          ? Border.all(
                              color: Colors.grey,
                              width: 1,
                            )
                          : null,
                    ),
                    child: checkNullonImage != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(),
                            child: Image.network(
                              categoryImage!,
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
                  ),
                  getheight(context, 0.0040),
                  const Divider(
                    height: 0,
                  ),
                  getheight(context, 0.005),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 8),
                    child: CustomTextSimple(
                      text: productName,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
