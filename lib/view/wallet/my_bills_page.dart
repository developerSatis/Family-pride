import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class MyBills extends StatelessWidget {
  const MyBills({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "My Bills",
              fontSize: 20,
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: whiteColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      // height: 20,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: greyColor.withOpacity(0.5), width: 1.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: greyColor,
                            ),
                            CustomTextCard(
                              text: "December",
                              fontSize: 18,
                              color: appColorBlack.withOpacity(0.7),
                            ),
                            const CustomTextCard(text: "")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appColorYellow.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: greyColor.withOpacity(0.5), width: 1.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getheight(context, 0.020),
                            CustomTextCard(text: "Total bill for the month"),
                            getheight(context, 0.020),
                            CustomTextCard(
                              text: "₹0",
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                            getheight(context, 0.020),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            getheight(context, 0.050),
            Image.asset('assets/images/bills.png'),
          ],
        ));
  }
}
