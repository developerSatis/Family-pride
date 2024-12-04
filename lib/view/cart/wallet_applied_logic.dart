import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';

CategoryController categoryController = Get.put(CategoryController());
UserUtilityController userUtilityController = Get.put(UserUtilityController());
CartController cartController = Get.put(CartController());

void walletApplied() {
  if (cartController.couponAmount.isNotEmpty) {
    if (int.parse(userUtilityController.userWalletBalance.value) <
        int.parse(cartController.totalAfterCoupon.value)) {
      print("wallet cut");
      categoryController.walletTotalCut.value =
          userUtilityController.userWalletBalance.value;
      print("having in wallet");
      categoryController.havingTotalWallet.value = "0";
      print("to pay");
      categoryController.userToPay.value =
          (int.parse(cartController.totalAfterCoupon.value) -
                  int.parse(userUtilityController.userWalletBalance.value))
              .toString();
    } else {
      print("wallet cut");
      categoryController.walletTotalCut.value =
          cartController.totalAfterCoupon.value;
      print("having in wallet");
      categoryController.havingTotalWallet.value =
          (int.parse(userUtilityController.userWalletBalance.value) -
                  int.parse(cartController.totalAfterCoupon.value))
              .toString();
      print("to pay ");
      categoryController.userToPay.value = "0";
    }
  } else {
    if (int.parse(userUtilityController.userWalletBalance.value) <
        int.parse(cartController.cartNewPrice.value)) {
      print("wallet cut");
      categoryController.walletTotalCut.value =
          userUtilityController.userWalletBalance.value;
      print("having in wallet");
      categoryController.havingTotalWallet.value = "0";
      print("to pay");
      categoryController.userToPay.value =
          (int.parse(cartController.cartNewPrice.value) -
                  int.parse(userUtilityController.userWalletBalance.value))
              .toString();
    } else {
      print("wallet cut");
      categoryController.walletTotalCut.value =
          cartController.cartNewPrice.value;
      print("having in wallet");
      categoryController.havingTotalWallet.value =
          (int.parse(userUtilityController.userWalletBalance.value) -
                  int.parse(cartController.cartNewPrice.value))
              .toString();
      print("to pay ");
      categoryController.userToPay.value = "0";
    }
  }
}
