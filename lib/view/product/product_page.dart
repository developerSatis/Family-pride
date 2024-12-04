import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_carousel.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_utils/price_bottom_app_bar.dart';
import 'package:hindustan_food/custom_widget/increment_decrement_button_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';
import 'package:shimmer/shimmer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    CartController cartController = Get.put(CartController());
    SharedPref sharedPref = Get.put(SharedPref());
    return Obx(
      () => Scaffold(
        bottomNavigationBar:
            // cartController.allCartList.isNotEmpty
            // ?
            const PriceBottomAppBar(),
        // : null,
        backgroundColor: appbackgroundColor,
        appBar: const CustomAppBar(
          istitle: true,
          isAddbuttonShow: false,
          appBarSubtitle: "",
          appBartitle: "",
          isFreeDeliveryText: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselForProduct(
                List.generate(
                  categoryController.multiImage.length,
                  (index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          // categoryController.productImage.value,
                          categoryController.multiImage[index].values.first,
                          fit: BoxFit.fill,
                          height: Get.height * 0.12,
                          width: Get.width * 0.95,
                          loadingBuilder: (context, child, loadingProgress) {
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
                      ),
                    );
                  },
                ),
              ),
              // CarouselForProduct([
              //   Container(
              //     // width: Get.width * .30,
              //     // height: 70,
              //     decoration: BoxDecoration(
              //         color: appColorWhite,
              //         borderRadius: const BorderRadius.only(
              //             bottomLeft: Radius.circular(15),
              //             bottomRight: Radius.circular(15))),
              //     child: Image.asset(
              //       'assets/images/veg-potato-removebg-preview.png',
              //       width: double.infinity,
              //     ),
              //   ),
              //   Container(
              //     // width: Get.width * .30,
              //     // height: 70,
              //     decoration: BoxDecoration(
              //         color: appColorWhite,
              //         borderRadius: const BorderRadius.only(
              //             bottomLeft: Radius.circular(15),
              //             bottomRight: Radius.circular(15))),
              //     child: Image.asset(
              //       'assets/images/veg-cauliflower.png',
              //       width: double.infinity,
              //     ),
              //   ),
              //   Container(
              //     // width: Get.width * .30,
              //     // height: 70,
              //     decoration: BoxDecoration(
              //         color: appColorWhite,
              //         borderRadius: const BorderRadius.only(
              //             bottomLeft: Radius.circular(15),
              //             bottomRight: Radius.circular(15))),
              //     child: Image.asset(
              //       'assets/images/veg-tomato.png',
              //       width: double.infinity,
              //     ),
              //   )
              // ]),
              // Container(
              //   // width: Get.width * .30,
              //   // height: 70,
              //   decoration: BoxDecoration(
              //       color: appColorWhite,
              //       borderRadius: const BorderRadius.only(
              //           bottomLeft: Radius.circular(15),
              //           bottomRight: Radius.circular(15))),
              //   child: Image.asset(
              //     'assets/images/veg-cauliflower.png',
              //     width: double.infinity,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextSimple(
                      text: categoryController.productName.value,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomTextSimple(
                      text: categoryController.productUnit.value,
                      // text: "450 gm + 450 gm",
                      // text:
                      //     "${categoryController.productQuantity.value} gm + ${categoryController.productQuantity.value} gm",
                      fontSize: 14,
                      color: greyColor,
                      fontWeight: FontWeight.w700,
                    ),
                    getheight(context, 0.010),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomTextSimple(
                              // text: "₹13.20",
                              text:
                                  "₹${categoryController.productNewPrice.value}",
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                            getwidth(context, 0.020),
                            CustomTextSimple(
                              text: "₹${categoryController.productPrice.value}",
                              fontSize: 14,
                              color: greyColor,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        categoryController.productCart.isNotEmpty
                            ? IncrementDecrementButtonWidget(
                                onTapDecrement: () async {
                                  categoryController.productCart[0]
                                                  ['quantity'] -
                                              1 !=
                                          0
                                      ? await cartController.updateCart(
                                          (categoryController.productCart[0]
                                                  ['id'])
                                              .toString(),
                                          (categoryController.productCart[0]
                                                      ['quantity'] -
                                                  1)
                                              .toString())
                                      : await cartController.deleteCartItem(
                                          (categoryController.productCart[0]
                                                  ['id'])
                                              .toString(),
                                        );
                                  await categoryController.getProductByID(
                                      int.parse(
                                          categoryController.productId.value));
                                },
                                onTapIncrement: () async {
                                  // print(categoryController.productCart[0]
                                  //     ['user_id']);
                                  await cartController.updateCart(
                                      (categoryController.productCart[0]['id'])
                                          .toString(),
                                      (categoryController.productCart[0]
                                                  ['quantity'] +
                                              1)
                                          .toString());
                                  await categoryController.getProductByID(
                                      int.parse(
                                          categoryController.productId.value));
                                },
                                value: (categoryController.productCart[0]
                                        ['quantity'])
                                    .toString())
                            : Bounceable(
                                scaleFactor: 0.5,
                                onTap: () async {
                                  if (sharedPref.userID.isNotEmpty) {
                                    await cartController.addProductToCart(
                                        categoryController.productId.value,
                                        1.toString());
                                    await categoryController.getProductByID(
                                        int.parse(categoryController
                                            .productId.value));
                                  } else {
                                    Get.to(
                                        () => const SignInPage(
                                              isGuest: false,
                                            ),
                                        transition: Transition.downToUp);
                                  }
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
                      ],
                    ),
                    getheight(context, 0.020),
                    Container(
                      decoration: BoxDecoration(
                          color: greenColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      // height: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextRich(
                              text: "You are saving ",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              children: [
                                TextSpan(
                                    text:
                                        " ₹${categoryController.productPrice.value.isNotEmpty && categoryController.productOfferPrice.value.isNotEmpty ? int.parse(categoryController.productPrice.value) - int.parse(categoryController.productOfferPrice.value) : ""}",
                                    // " ₹${categoryController.productPrice.value.isNotEmpty && categoryController.productSalePrice.value.isNotEmpty ? int.parse(categoryController.productPrice.value) - int.parse(categoryController.productSalePrice.value) : ""}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: greenColor)),
                                TextSpan(
                                    text:
                                        " (${categoryController.productDifferencePercentage.value.isNotEmpty ? double.parse(categoryController.productDifferencePercentage.value).round().toString() : ""}% OFF)",
                                    // " (${categoryController.productDiscountPercentage.value.isNotEmpty ? double.parse(categoryController.productDiscountPercentage.value).round().toString() : ""}% OFF)",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ))
                              ],
                            ),
                            // CustomTextSimple(
                            //   text: "(45% OFF)",
                            //   fontSize: 14,
                            //   color: greenColor,
                            //   fontWeight: FontWeight.w700,
                            // ),
                            // CustomTextSimple(
                            //   text: "₹154.62",
                            //   fontSize: 14,
                            //   color: greenColor,
                            //   fontWeight: FontWeight.w700,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    getheight(context, 0.010),
                    const Divider(),
                    getheight(context, 0.020),

                    const CustomTextSimple(
                      text: "Description",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    getheight(context, 0.010),
                    CustomTextSimple(
                      text:
                          "=> ${categoryController.productShortDescription.value}",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: greyColor,
                      overflow: TextOverflow.visible,
                    ),
                    getheight(context, 0.010),
                    CustomTextSimple(
                      text: "=> ${categoryController.productDescription.value}",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: greyColor,
                      overflow: TextOverflow.visible,
                    ),
                    getheight(context, 0.010),
                    CustomTextSimple(
                      text: "=> ${categoryController.productSummary.value}",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: greyColor,
                      overflow: TextOverflow.visible,
                    ),
                    getheight(context, 0.010),
                    // CustomTextSimple(
                    //   text: "=> Cabbage(Patta Gobhi) - 450 gm (Pack of 2)",
                    //   fontSize: 15,
                    //   fontWeight: FontWeight.w600,
                    //   color: greyColor,
                    // ),
                    // getheight(context, 0.010),
                    // CustomTextSimple(
                    //   text: "=> Cabbage(Patta Gobhi) - 450 gm (Pack of 2)",
                    //   fontSize: 15,
                    //   fontWeight: FontWeight.w600,
                    //   color: greyColor,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
