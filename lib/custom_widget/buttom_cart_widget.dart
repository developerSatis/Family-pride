import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/address/address.dart';
import 'package:hindustan_food/view/cart/review_cart_page.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';

class ButtomCartWidget extends StatelessWidget {
  const ButtomCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    CategoryController categoryController = Get.put(CategoryController());
    SharedPref sharedPref = Get.put(SharedPref());
    return Obx(
      () => Positioned(
          top: Get.height * 0.765,
          bottom: Get.height * 0.033,
          left: 5,
          right: 5,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: greenColor, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomTextCard(
                        text: "₹${cartController.cartSubTotal.value}",
                        color: whiteColor,
                      ),
                      getwidth(context, 0.020),
                      CustomTextCard(
                        // text: "₹${cartController.cartNewPrice.value}",
                        text: "₹${cartController.actualTotal.value}",
                        color: whiteColor.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ],
                  ),
                  Bounceable(
                    scaleFactor: 0.5,
                    onTap: () async {
                      await sharedPref.getuserId();
                      if (cartController.cartNewPrice.value.isNotEmpty) {
                        if (double.parse(cartController.cartNewPrice.value)
                                .toInt() <=
                            double.parse(
                                    categoryController.minimumCartValue.value)
                                .toInt()) {
                          customeToast(
                              "Minimum ₹${categoryController.minimumCartValue.value} required to procced");
                        } else {
                          sharedPref.userID.isNotEmpty
                              ? Get.to(() => const ReviewCartPage())
                              : Get.to(
                                  () => const SignInPage(
                                        isGuest: false,
                                      ),
                                  transition: Transition.downToUp);
                        }
                      }

                      // categoryController.islogin.value == true
                      //     ? Get.to(() => const AddressPage())
                      //     : Get.to(() => const SignInPage(
                      //           isGuest: false,
                      //         ));
                    },
                    child: CustomTextCard(
                      text: "Place Order",
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
