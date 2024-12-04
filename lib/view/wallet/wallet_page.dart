import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/custom_utils/custom_bottom_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_text_field.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  UserUtilityController userUtilityController =
      Get.put(UserUtilityController());
  _load() async {
    await userUtilityController.getWallet(true);
  }

  @override
  void initState() {
    Future.microtask(() => _load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UserUtilityController userUtilityController =
    //     Get.put(UserUtilityController());
    // print("this is vale of wallet");
    // print(userUtilityController.userWalletBalance.value);

    return Obx(
      () => Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const CustomTextCard(
            text: "Wallet",
            fontSize: 20,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextCard(
                    text: "Balance",
                    color: greyColor,
                  ),
                  CustomTextCard(
                    text: "₹ ${userUtilityController.userWalletBalance.value}",
                    color: redColor,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomAppBar(index: 2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              getheight(context, 0.020),
              const CustomTextSimple(text: "Balance"),

              CustomTextSimple(
                text: "₹ ${userUtilityController.userWalletBalance.value}",
                color: redColor,
              ),
              getheight(context, 0.020),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextCard(text: "Add Money"),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                      height: 60,
                      child: CustomTextFieldwithoutIcon(
                        // controller: TextEditingController()..text = '₹ 1000',
                        keyboardType: TextInputType.number,
                        label: CustomTextCard(
                          text: "Add Money",
                          color: greyColor,
                        ),
                      )),
                ),
              ),
              getheight(context, 0.050),
              Image.asset('assets/images/wallet.png'),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CustomTextCard(text: "Recommended Offers"),
              //       CustomTextCard(
              //         text: "Apply Coupon",
              //         color: greenColor,
              //       )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Column(
              //     children: [
              //       CustomCouponWidget(
              //           backgroundContainerColor: whiteColor,
              //           borderColor: greyColor.withOpacity(0.5),
              //           color: greenColor,
              //           couponText: "APPLY",
              //           mainText: "AutoPay - ₹100 Cashback offer",
              //           subText: "₹100 CB on first Autopay Registration"),
              //       getheight(context, 0.020),
              //       CustomCouponWidget(
              //           backgroundContainerColor: greenColor.withOpacity(0.1),
              //           borderColor: greenColor,
              //           color: redColor,
              //           couponText: "REMOVE",
              //           mainText: "WELCOME OFFER",
              //           subText: "Get Flat Rs. 20 Cashback"),
              //       getheight(context, 0.020),
              //       CustomCouponWidget(
              //           backgroundContainerColor: whiteColor,
              //           borderColor: greyColor.withOpacity(0.5),
              //           color: greenColor,
              //           couponText: "APPLY",
              //           mainText: "Rs 1000 Cashback",
              //           subText: "Get Flat Rs. 100 Cashback"),
              //       getheight(context, 0.020),
              //       CustomCouponWidget(
              //           backgroundContainerColor: whiteColor,
              //           borderColor: greyColor.withOpacity(0.5),
              //           color: greenColor,
              //           couponText: "APPLY",
              //           mainText: "Rs 1500 offer",
              //           subText: "Cashback Rs. 60"),
              //       getheight(context, 0.020),
              //       CustomCouponWidget(
              //           backgroundContainerColor: whiteColor,
              //           borderColor: greyColor.withOpacity(0.5),
              //           color: greenColor,
              //           couponText: "APPLY",
              //           mainText: "Rs 5000 offer",
              //           subText: "Cashback Rs. 200"),
              //       getheight(context, 0.020),
              //       CustomCouponWidget(
              //           backgroundContainerColor: whiteColor,
              //           borderColor: greyColor.withOpacity(0.5),
              //           color: greenColor,
              //           couponText: "APPLY",
              //           mainText: "Rs 1000 offer",
              //           subText: "Rs. 400 Cashback"),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
