// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/increment_decrement_button_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:shimmer/shimmer.dart';

class CartItemWidget extends StatelessWidget {
  final String? imageUrl;
  final String? offerPrice;
  final String? offerProductQuantity;
  final String? imageUrlNullCheck;
  final String? productName;
  final String? unit;
  final String? oldPrice;
  final String? newPrice;
  final String? quantity;
  final String? productQuantity;
  final void Function()? onTap;
  final void Function()? onTapDecrement;
  final void Function()? onTapIncrement;

  const CartItemWidget(
      {super.key,
      required this.imageUrl,
      required this.offerPrice,
      required this.offerProductQuantity,
      required this.imageUrlNullCheck,
      required this.newPrice,
      required this.oldPrice,
      required this.productName,
      required this.quantity,
      required this.unit,
      required this.onTap,
      required this.onTapDecrement,
      required this.onTapIncrement,
      required this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Bounceable(
          scaleFactor: 0.6,
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.20,
                  height: Get.height * 0.09,
                  child: imageUrlNullCheck != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Image.network(
                            imageUrl!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
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
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                // Container(
                //   // width: Get.width * .30,
                //   // height: 70,
                //   width: Get.width * 0.20,
                //   height: Get.height * 0.10,
                //   decoration: BoxDecoration(
                //     // color: yellowColor,
                //     // boxShadow: [
                //     //   BoxShadow(
                //     //     color: Colors.grey,
                //     //     blurRadius: 5.0,
                //     //   ),
                //     // ],

                //     image: const DecorationImage(
                //         image: AssetImage(
                //           'assets/images/veg-cauliflower.png',
                //         ),
                //         fit: BoxFit.fill),
                //   ),
                // ),
                getwidth(context, 0.020),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextSimple(
                      text: productName,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextSimple(
                      text: unit,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: greyColor,
                    ),
                    getheight(context, 0.010),
                    offerProductQuantity!.isNotEmpty
                        ? Row(
                            children: [
                              CustomTextSimple(
                                text: "₹$offerPrice",
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                              getwidth(context, 0.020),
                              CustomTextSimple(
                                text: "₹$oldPrice",
                                fontSize: 13,
                                color: greyColor,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                              ),
                              Row(
                                children: [
                                  getwidth(context, 0.020),
                                  CustomTextSimple(
                                    text: " ($offerProductQuantity)",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  getwidth(context, 0.020),
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: greenColor.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CustomTextSimple(
                                      text:
                                          "${(100 - ((int.parse(offerPrice!) * 100)) / int.parse(oldPrice!)).toStringAsFixed(2)}% OFF",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    offerProductQuantity!.isNotEmpty
                        ? (int.parse(quantity!) -
                                    int.parse(offerProductQuantity!)) !=
                                0
                            ? const Text("--------------------------")
                            : const SizedBox.shrink()
                        : SizedBox.shrink(),
                    offerProductQuantity!.isEmpty
                        ? Row(
                            children: [
                              CustomTextSimple(
                                text: "₹$newPrice",
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                              getwidth(context, 0.020),
                              CustomTextSimple(
                                text: "₹$oldPrice",
                                fontSize: 13,
                                color: greyColor,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                              ),
                              getwidth(context, 0.020),
                              CustomTextSimple(
                                text: offerProductQuantity!.isNotEmpty
                                    ? " (${int.parse(quantity!) - int.parse(offerProductQuantity!)})"
                                    : " ($quantity)",
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          )
                        : offerProductQuantity!.isNotEmpty
                            ? (int.parse(quantity!) -
                                        int.parse(offerProductQuantity!)) !=
                                    0
                                ? Row(
                                    children: [
                                      CustomTextSimple(
                                        text: "₹$newPrice",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      getwidth(context, 0.020),
                                      CustomTextSimple(
                                        text: "₹$oldPrice",
                                        fontSize: 13,
                                        color: greyColor,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      getwidth(context, 0.020),
                                      CustomTextSimple(
                                        text: offerProductQuantity!.isNotEmpty
                                            ? " (${int.parse(quantity!) - int.parse(offerProductQuantity!)})"
                                            : " ($quantity)",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink()
                            : SizedBox.shrink(),
                    getheight(context, 0.010)
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IncrementDecrementButtonWidget(
              onTapDecrement: onTapDecrement,
              onTapIncrement: onTapIncrement,
              value: productQuantity),
        ),
        // getwidth(context, 0.005)
        // Container(
        //   width: Get.width * 0.25,
        //   height: Get.height * 0.05,
        //   decoration: BoxDecoration(
        //     border: Border.all(color: greenColor, width: 1.5),
        //     // color: yellowColor,
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child:

        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Icon(
        //           Icons.remove,
        //           size: 15,
        //           color: greenColor,
        //           weight: 5,
        //         ),
        //         CustomTextSimple(
        //           text: quantity,
        //           fontSize: 15,
        //           color: greenColor,
        //           fontWeight: FontWeight.w600,
        //         ),
        //         Icon(
        //           Icons.add,
        //           size: 15,
        //           color: greenColor,
        //           weight: 5,
        //         )
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
