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
import 'package:hindustan_food/view/product/product_page.dart';
import 'package:shimmer/shimmer.dart';

class CartFullItemWidget extends StatelessWidget {
  final String? urlforCheckNull;
  final String? imageUrl;
  final String? productName;
  final String? quantity;
  final String? unit;
  final String? price;
  final bool? isAdd;
  final String? discountPercentage;
  final String? subPrice;
  final bool? isactive;
  final String? discountPrice;
  final String? productQuantity;
  final void Function()? onTap;
  final void Function()? onTapDecrement;
  final void Function()? onTapAddCart;
  final void Function()? onTapIncrement;
  const CartFullItemWidget(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.urlforCheckNull,
      required this.quantity,
      required this.price,
      required this.productName,
      required this.isactive,
      required this.unit,
      required this.isAdd,
      required this.discountPercentage,
      required this.subPrice,
      required this.discountPrice,
      required this.onTapDecrement,
      required this.onTapIncrement,
      required this.productQuantity,
      required this.onTapAddCart});

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = Get.put(SharedPref());
    return AnimatedOpacity(
      opacity: isactive! ? 1 : 0.3, // Use a variable to control visibility
      duration: const Duration(milliseconds: 500),
      child: PhysicalModel(
        color: const Color.fromARGB(255, 241, 233, 233),
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhysicalModel(
              color: const Color.fromARGB(255, 241, 233, 233),
              elevation: 4,
              shadowColor: Colors.blue[100]!,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: Get.width * 0.79,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                    // color: redColor,
                    // border: Border.all(),
                    // color: redColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    // PhysicalModel(
                    //   color: Color.fromARGB(255, 241, 233, 233),
                    //   elevation: 5,
                    //   shadowColor: Colors.blue[100]!,
                    //   borderRadius: BorderRadius.circular(20),
                    //   child: SizedBox(
                    //     // height: Get.height * 0.16,
                    //     width: Get.width * 0.13,
                    //     // decoration: BoxDecoration(
                    //     //   borderRadius: BorderRadius.only(
                    //     //     topLeft: Radius.circular(10),
                    //     //     topRight: Radius.circular(10),
                    //     //   ),
                    //     // ),
                    //     child: ClipRRect(
                    //       borderRadius: const BorderRadius.only(
                    //         topLeft: Radius.circular(10),
                    //         topRight: Radius.circular(10),
                    //       ),
                    //       child: Stack(
                    //         alignment: Alignment.center,
                    //         children: [
                    //           urlforCheckNull != null
                    //               ? ClipRRect(
                    //                   borderRadius: const BorderRadius.only(
                    //                       topLeft: Radius.circular(10),
                    //                       topRight: Radius.circular(10),
                    //                       bottomLeft: Radius.circular(10),
                    //                       bottomRight: Radius.circular(10)),
                    //                   child: Image.network(
                    //                     imageUrl!,
                    //                     // scale: 2,
                    //                     fit: BoxFit.fill,
                    //                     loadingBuilder: (BuildContext context,
                    //                         Widget child,
                    //                         ImageChunkEvent? loadingProgress) {
                    //                       if (loadingProgress == null) {
                    //                         return child;
                    //                       } else {
                    //                         return Center(
                    //                           child: CircularProgressIndicator(
                    //                             value: loadingProgress
                    //                                         .expectedTotalBytes !=
                    //                                     null
                    //                                 ? loadingProgress
                    //                                         .cumulativeBytesLoaded /
                    //                                     (loadingProgress
                    //                                             .expectedTotalBytes ??
                    //                                         1)
                    //                                 : null,
                    //                           ),
                    //                         );
                    //                       }
                    //                     },
                    //                   ),
                    //                 )
                    //               : Icon(
                    //                   Icons.photo,
                    //                   size: 100,
                    //                 ),
                    //           // Add other widgets on top of the image if needed
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Bounceable(
                      scaleFactor: 0.5,
                      onTap: isactive! ? onTap : null,
                      child: Container(
                        width: Get.width * .30,
                        // height: 70,
                        decoration: const BoxDecoration(
                            // color: yellowColor,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     blurRadius: 5.0,
                            //   ),
                            // ],
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       'assets/images/veg-img-carrot.png',
                            //     ),
                            //     fit: BoxFit.fill),

                            ),
                        child: urlforCheckNull != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                child: Image.network(
                                  imageUrl!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
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
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Get.height * 0.008),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Bounceable(
                            scaleFactor: 0.8,
                            onTap: isactive! ? onTap : null,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 241, 233, 233)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.46,
                                    child: CustomTextSimple(
                                      text: productName,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // getwidth(context, 0.010),
                                  CustomTextSimple(
                                    text: "($quantity)",
                                    fontSize: 13,
                                    color: greyDarkColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  getheight(context, 0.010),
                                  Row(
                                    children: [
                                      CustomTextSimple(
                                        text: "₹$price",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      getwidth(context, 0.010),
                                      CustomTextSimple(
                                        text: "₹$subPrice",
                                        fontSize: 15,
                                        // fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough,
                                        color: greyDarkColor,
                                      ),
                                      getwidth(context, 0.018),
                                      CustomTextSimple(
                                        text: "($discountPercentage% OFF)",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                  getheight(context, 0.008),
                                ],
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //     onPressed: () {},
                          //     child: CustomTextSimple(
                          //       text: "ADD",
                          //       fontSize: 10,
                          //     ))
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
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Bounceable(
                                        scaleFactor: 0.5,
                                        onTap: sharedPref
                                                .userID.value.isNotEmpty
                                            ? onTapAddCart
                                            : () {
                                                Get.to(
                                                    () => const SignInPage(
                                                          isGuest: false,
                                                        ),
                                                    transition:
                                                        Transition.downToUp);
                                              },
                                        // () {
                                        //   Get.to(() => const ReviewCartPage());
                                        // },
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
                                      ),
                                    )
                                  : IncrementDecrementButtonWidget(
                                      onTapDecrement: onTapDecrement,
                                      onTapIncrement: onTapIncrement,
                                      value: productQuantity)
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     // Card(
                    //     //   child: Padding(
                    //     //     padding: EdgeInsets.only(
                    //     //       top: Get.height * 0.010,
                    //     //       bottom: Get.height * 0.010,
                    //     //       left: Get.height * 0.005,
                    //     //       right: Get.height * 0.005,
                    //     //     ),
                    //     //     child: const CustomTextSimple(
                    //     //       text: "SUBSCRIBE",
                    //     //       fontSize: 10,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     Card(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(
                    //           top: Get.height * 0.010,
                    //           bottom: Get.height * 0.010,
                    //           left: Get.height * 0.0345,
                    //           right: Get.height * 0.0345,
                    //         ),
                    //         child: const CustomTextSimple(
                    //           text: "ADD",
                    //           fontSize: 10,
                    //         ),
                    //       ),
                    //     ),
                    //     getheight(context, 0.030)
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomTextRich(
                  text: "Smart saving ",
                  // text: "Buy this at ",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  children: [
                    TextSpan(
                        text: "₹$discountPrice ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: greenColor)),
                    // TextSpan(text: "($discountPercentage% OFF)")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
