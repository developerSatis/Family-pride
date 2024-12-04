import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';
import 'package:hindustan_food/view/home_page.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';
import 'package:hindustan_food/view/more_button/more_page.dart';
import 'package:hindustan_food/view/refer/refer_page.dart';
import 'package:hindustan_food/view/wallet/wallet_page.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int index;
  const CustomBottomAppBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    SharedPref sharedPref = Get.put(SharedPref());
    return ConvexAppBar(
        initialActiveIndex: index,
        style: TabStyle.titled,
        color: appColorText,
        shadowColor: appbackgroundColor,
        backgroundColor: appColorText.withOpacity(0.8),
        activeColor: appbackgroundColor,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.pages, title: 'Products'),
          TabItem(icon: Icons.wallet, title: 'Wallet'),
          TabItem(icon: Icons.people, title: 'Refer'),
          TabItem(icon: Icons.more_horiz_rounded, title: 'More'),
          // TabItem(icon: Icons.people, title: 'Wallet'),
        ],
        onTap: (int i) async {
          i == 0
              ? Get.offAll(const HomePage(),
                  transition: Transition.noTransition)
              : i == 1
                  ? {
                      await categoryController.getProductCategorybyid(1),
                      Get.to(
                          () => const CartSelectionPage(
                                categoryId: 1,
                              ),
                          transition: Transition.noTransition)
                    }
                  : i == 2
                      ? {
                          // await userUtilityController.getWallet(),
                          await sharedPref.getuserId(),
                          sharedPref.userID.isNotEmpty
                              ? Get.offAll(() => const WalletPage(),
                                  transition: Transition.noTransition)
                              : Get.to(
                                  () => const SignInPage(
                                        isGuest: false,
                                      ),
                                  transition: Transition.downToUp)
                        }
                      : i == 3
                          ? Get.offAll(() => const ReferPage(),
                              transition: Transition.noTransition)
                          : i == 4
                              ? Get.offAll(() => const MorePage(),
                                  transition: Transition.noTransition)
                              : null;
        });
  }
}
