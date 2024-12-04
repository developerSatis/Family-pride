import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';
import 'package:hindustan_food/view/wallet/wallet_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBartitle;
  final String? appBarSubtitle;
  final bool? isFreeDeliveryText;
  final String? deliveryText;
  final bool? isAddbuttonShow;
  final bool? istitle;
  const CustomAppBar(
      {super.key,
      required this.appBarSubtitle,
      required this.appBartitle,
      required this.isFreeDeliveryText,
      required this.isAddbuttonShow,
      this.deliveryText,
      required this.istitle});
  @override
  Size get preferredSize =>
      Size.fromHeight(!istitle! ? Get.height * 0.065 : Get.height * 0.070);
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    CartController cartController = Get.put(CartController());
    SharedPref sharedPref = Get.put(SharedPref());
    UserUtilityController userUtilityController =
        Get.put(UserUtilityController());
    return AppBar(
      backgroundColor: appbackgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // !istitle! ? getheight(context, 0.015) : const SizedBox.shrink(),
          getheight(context, 0.015),
          istitle!
              ? CustomTextSimple(
                  text: appBartitle,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )
              : const SizedBox.shrink(),
          !istitle!
              ? Obx(
                  () => CustomTextSimple(
                    text:
                        "Order by ${cartController.deliveryTime.value} & get it by ${cartController.delDate.value}, ${cartController.deliveryStartTime.value}",
                    // "Order by ${cartController.deliveryTime.value} & get it by ${cartController.deliveryDate.value}, ${cartController.deliveryStartTime.value}",
                    // "Order by 11:00pm & get it by ${cartController.deliveryDate.value}, ${cartController.deliveryTime.value}",
                    fontSize: 10,
                    overflow: TextOverflow.visible,
                    // text: appBartitle,
                    // fontSize: 18,

                    fontWeight: FontWeight.w700,
                  ),
                )
              : const SizedBox.shrink(),
          isFreeDeliveryText!
              ? Obx(
                  () => CustomTextSimple(
                    text:
                        "Free delivery above ${cartController.getPriceMsg.value}",
                    fontSize: 10,
                  ),
                )
              : const SizedBox.shrink(),

          CustomTextSimple(
            text: "",
            // text: appBarSubtitle,
            fontSize: 12,
            color: greyColor,
          ),
        ],
      ),
      actions: [
        isAddbuttonShow!
            ? Bounceable(
                onTap: () async {
                  await categoryController.getProductCategorybyid(
                      categoryController.categoryList[0].id);
                  Get.to(
                      () => CartSelectionPage(
                          categoryId: categoryController.categoryList[0].id),
                      transition: Transition.noTransition);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: appColorBlack.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            color: appColorBlack.withOpacity(0.4),
                            blurRadius: 1)
                      ]),
                  child: CustomTextSimple(
                    text: "Add All Items",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              )
            // IconButton(
            //     onPressed: () async {
            //       await categoryController.getProductCategorybyid(1);
            //       Get.to(() => const CartSelectionPage(),
            //           transition: Transition.noTransition);
            //     },
            //     icon: const Card(child: Icon(Icons.add)))
            : const SizedBox.shrink(),
        Bounceable(
          onTap: () async {
            // await sharedPref.getuserId();
            // sharedPref.userID.isNotEmpty
            //     ?
            userUtilityController.isUsingWallet.value = false;
            Get.offAll(const WalletPage(), transition: Transition.noTransition);

            // : Get.to(
            //     () => const SignInPage(
            //           isGuest: false,
            //         ),
            //     transition: Transition.downToUp);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: appColorBlack.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.account_balance_wallet),
                ),
                Obx(
                  () => userUtilityController.userWalletBalance.isNotEmpty
                      ? Positioned(
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: appbackgroundColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: appColorBlack.withOpacity(0.5),
                                    width: 0.5)),
                            child: Center(
                                child: CustomTextSimple(
                              text:
                                  userUtilityController.userWalletBalance.value,
                              // text: userUtilityController.userWalletBalance.value.length
                              // .toString(),
                              fontSize: userUtilityController
                                          .userWalletBalance.value.length ==
                                      // fontSize: userUtilityController
                                      //             .userWalletBalance.value.length ==
                                      4
                                  ? 6
                                  : userUtilityController
                                              .userWalletBalance.value.length ==
                                          3
                                      ? 8
                                      : userUtilityController.userWalletBalance
                                                  .value.length ==
                                              2
                                          ? 10
                                          : userUtilityController
                                                      .userWalletBalance
                                                      .value
                                                      .length ==
                                                  1
                                              ? 12
                                              : 5,
                              color: redDarkColor,
                              fontWeight: FontWeight.w800,
                            )),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         Get.offAll(const WalletPage(),
        //             transition: Transition.noTransition);
        //       },
        //       icon: const Icon(Icons.account_balance_wallet)),
        // )
      ],
    );
  }
}
