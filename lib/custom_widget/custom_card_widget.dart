import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/increment_decrement_button_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/review_cart_page.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';
import 'package:shimmer/shimmer.dart';

class CustomCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? quantity;
  final String? unit;
  final String? productName;
  final String? price;
  final bool? isAdd;
  final bool? isactive;
  final String? newPrice;
  final String? imageUrlNullCheck;
  final String? productQuantity;
  final String? discountPer;
  final void Function()? onTap;
  final void Function()? onTapAddCart;
  final void Function()? onTapDecrement;
  final void Function()? onTapIncrement;
  const CustomCardWidget(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.productName,
      required this.quantity,
      required this.unit,
      required this.price,
      required this.isactive,
      required this.newPrice,
      required this.isAdd,
      required this.productQuantity,
      required this.imageUrlNullCheck,
      required this.onTapAddCart,
      required this.onTapDecrement,
      required this.onTapIncrement,
      required this.discountPer});

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = Get.put(SharedPref());
    return AnimatedOpacity(
      opacity: isactive! ? 1 : 0.3, // Use a variable to control visibility
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        // onTap: onTap,
        child: PhysicalModel(
          color: const Color.fromARGB(255, 241, 233, 233),
          elevation: 4,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: Get.width * 0.44,
            height: Get.height * 0.33,
            decoration: BoxDecoration(
                // color: redColor,
                // boxShadow: [BoxShadow(color: hintColor.withOpacity(0.2))],
                // boxShadow: [
                //   BoxShadow(
                //     color: const Color(0xFF000000).withAlpha(60),
                //     blurRadius: 6.0,
                //     spreadRadius: 0.0,
                //     offset: const Offset(
                //       0.0,
                //       3.0,
                //     ),
                //   ),
                // // ],
                // border: Border.all(
                // color: greyColor, strokeAlign: BorderSide.strokeAlignCenter),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Bounceable(
                  scaleFactor: 0.8,
                  onTap: isactive! ? onTap : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.16,
                        width: double.infinity,
                        child: imageUrlNullCheck != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
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
                      //   decoration: BoxDecoration(
                      //       // border: Border.all(),
                      //       image: DecorationImage(
                      //           image: NetworkImage(
                      //             imageUrl!,
                      //             // 'assets/images/veg-onion-removebg-preview.png',
                      //           ),
                      //           scale: 2
                      //           // fit: BoxFit.fill
                      //           ),
                      //       // color: blueColor,
                      //       borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(10),
                      //           topRight: Radius.circular(10))),
                      //   // width: Get.width * 0.20,
                      //   height: Get.height * 0.17,
                      //   // child: Ink.image(
                      //   //     image: AssetImage(
                      //   //   'assets/images/veg-onion-removebg-preview.png',
                      //   // )),
                      // ),
                      getheight(context, 0.0020),
                      const Divider(
                        height: 3,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 233, 233)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // getheight(context, 0.020),
                              CustomTextSimple(
                                // text: "Onion - 450 gm",
                                text: "$productName",
                                //  - $unit",
                                // $quantity $unit",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              getheight(context, 0.001),
                              CustomTextSimple(
                                text: "$unit",
                                // "$quantity $unit",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: greyDarkColor,
                              ),
                              getheight(context, 0.010),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextSimple(
                                        text: "₹$newPrice",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      getwidth(context, 0.010),
                                      CustomTextSimple(
                                        text: "₹$price",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                        color: greyDarkColor,
                                      ),
                                      getwidth(context, 0.020),
                                      CustomTextSimple(
                                        text:
                                            "(${double.parse(discountPer!).toInt()}% OFF)",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: greyDarkColor,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  getheight(context, 0.010),

                                  // ElevatedButton(
                                  //     style: ButtonStyle(
                                  //         backgroundColor:
                                  //             MaterialStatePropertyAll(greenColor)),
                                  //     onPressed: () {},
                                  //     child: CustomTextSimple(
                                  //       text: "ADD",
                                  //       color: whiteColor,
                                  //       fontSize: 10,
                                  //       fontWeight: FontWeight.w600,
                                  //     ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                !isactive!
                    ? CustomTextSimple(
                        text: "Out of Stock",
                        color: appColorBlack,
                        // color: redDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )
                    : const SizedBox.shrink(),
                isactive!
                    ? isAdd!
                        ? Bounceable(
                            scaleFactor: 0.5,
                            onTap: sharedPref.userID.isNotEmpty
                                ? onTapAddCart
                                : () {
                                    Get.to(
                                        () => const SignInPage(
                                              isGuest: false,
                                            ),
                                        transition: Transition.downToUp);
                                  },
                            child: Card(
                              color: greenColor,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.010,
                                  bottom: Get.height * 0.010,
                                  left: Get.height * 0.0345,
                                  right: Get.height * 0.0345,
                                ),
                                child: CustomTextSimple(
                                  text: "ADD",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          )
                        : IncrementDecrementButtonWidget(
                            onTapDecrement: onTapDecrement,
                            onTapIncrement: onTapIncrement,
                            value: productQuantity)
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ViewMorePageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? quantity;
  final String? unit;
  final String? productName;
  final String? price;
  final bool? isAdd;
  final bool? isactive;
  final String? newPrice;
  final String? imageUrlNullCheck;
  final String? productQuantity;
  final String? discountPer;
  final void Function()? onTap;
  final void Function()? onTapAddCart;
  final void Function()? onTapDecrement;
  final void Function()? onTapIncrement;
  const ViewMorePageWidget(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.productName,
      required this.quantity,
      required this.unit,
      required this.price,
      required this.isactive,
      required this.newPrice,
      required this.isAdd,
      required this.productQuantity,
      required this.imageUrlNullCheck,
      required this.onTapAddCart,
      required this.onTapDecrement,
      required this.onTapIncrement,
      required this.discountPer});

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = Get.put(SharedPref());
    return AnimatedOpacity(
      opacity: isactive! ? 1 : 0.3, // Use a variable to control visibility
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        // onTap: onTap,
        child: PhysicalModel(
          color: const Color.fromARGB(255, 241, 233, 233),
          elevation: 4,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: Get.width * 0.42,
            height: Get.height * 0.40,
            decoration: BoxDecoration(
                // color: redColor,
                // boxShadow: [BoxShadow(color: hintColor.withOpacity(0.2))],
                // boxShadow: [
                //   BoxShadow(
                //     color: const Color(0xFF000000).withAlpha(60),
                //     blurRadius: 6.0,
                //     spreadRadius: 0.0,
                //     offset: const Offset(
                //       0.0,
                //       3.0,
                //     ),
                //   ),
                // // ],
                // border: Border.all(
                // color: greyColor, strokeAlign: BorderSide.strokeAlignCenter),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Bounceable(
                  scaleFactor: 0.8,
                  onTap: isactive! ? onTap : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.16,
                        width: double.infinity,
                        child: imageUrlNullCheck != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
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
                      //   decoration: BoxDecoration(
                      //       // border: Border.all(),
                      //       image: DecorationImage(
                      //           image: NetworkImage(
                      //             imageUrl!,
                      //             // 'assets/images/veg-onion-removebg-preview.png',
                      //           ),
                      //           scale: 2
                      //           // fit: BoxFit.fill
                      //           ),
                      //       // color: blueColor,
                      //       borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(10),
                      //           topRight: Radius.circular(10))),
                      //   // width: Get.width * 0.20,
                      //   height: Get.height * 0.17,
                      //   // child: Ink.image(
                      //   //     image: AssetImage(
                      //   //   'assets/images/veg-onion-removebg-preview.png',
                      //   // )),
                      // ),
                      getheight(context, 0.0020),
                      const Divider(
                        height: 3,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 233, 233)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // getheight(context, 0.020),
                              CustomTextSimple(
                                // text: "Onion - 450 gm",
                                text: "$productName",
                                //  - $unit",
                                // $quantity $unit",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              getheight(context, 0.001),
                              CustomTextSimple(
                                text: "$unit",
                                // "$quantity $unit",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: greyDarkColor,
                              ),
                              getheight(context, 0.010),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextSimple(
                                            text: "₹$newPrice",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          getwidth(context, 0.010),
                                          CustomTextSimple(
                                            text: "₹$price",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: greyDarkColor,
                                          ),
                                          getwidth(context, 0.020),
                                          CustomTextSimple(
                                            text:
                                                "(${double.parse(discountPer!).toInt()}% OFF)",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: greyDarkColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  getheight(context, 0.010),

                                  // ElevatedButton(
                                  //     style: ButtonStyle(
                                  //         backgroundColor:
                                  //             MaterialStatePropertyAll(greenColor)),
                                  //     onPressed: () {},
                                  //     child: CustomTextSimple(
                                  //       text: "ADD",
                                  //       color: whiteColor,
                                  //       fontSize: 10,
                                  //       fontWeight: FontWeight.w600,
                                  //     ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                !isactive!
                    ? CustomTextSimple(
                        text: "Out of Stock",
                        color: appColorBlack,
                        // color: redDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )
                    : const SizedBox.shrink(),
                isactive!
                    ? isAdd!
                        ? Bounceable(
                            scaleFactor: 0.5,
                            onTap: sharedPref.userID.isNotEmpty
                                ? onTapAddCart
                                : () {
                                    Get.to(
                                        () => const SignInPage(
                                              isGuest: false,
                                            ),
                                        transition: Transition.downToUp);
                                  },
                            child: Card(
                              color: greenColor,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.010,
                                  bottom: Get.height * 0.010,
                                  left: Get.height * 0.0345,
                                  right: Get.height * 0.0345,
                                ),
                                child: CustomTextSimple(
                                  text: "ADD",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          )
                        : IncrementDecrementButtonWidget(
                            onTapDecrement: onTapDecrement,
                            onTapIncrement: onTapIncrement,
                            value: productQuantity)
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
