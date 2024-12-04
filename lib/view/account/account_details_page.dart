import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_more_card_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "Account & Preferences",
              fontSize: 20,
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 20,
                decoration: BoxDecoration(
                    color: appColorText,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyColor.withOpacity(0.3))),
                child: Column(
                  children: [
                    getheight(context, 0.020),
                    CustomTextCard(
                      text: "Customer Account",
                      color: whiteColor,
                    ),
                    Divider(
                      color: whiteColor,
                      indent: Get.height * 0.16,
                      endIndent: Get.height * 0.16,
                    ),
                    getheight(context, 0.020),
                    Bounceable(
                      scaleFactor: 0.8,
                      onTap: () {},
                      child: const CustomMoreProfileWidget(
                          mainText: "My Profile", subText: "1234567890"),
                    ),
                    const Divider(),
                    Bounceable(
                      scaleFactor: 0.8,
                      onTap: () {},
                      child: const CustomMoreProfileWidget(
                          mainText: "Address",
                          subText: "Noida Sector 16, Noida"),
                    ),
                  ],
                ),
              ),
              getheight(context, 0.020),
              Container(
                // height: 20,
                decoration: BoxDecoration(
                    color: appColorText,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyColor.withOpacity(0.3))),
                child: Column(
                  children: [
                    getheight(context, 0.020),
                    CustomTextCard(
                      text: "Customer Preference",
                      color: whiteColor,
                    ),
                    Divider(
                      color: whiteColor,
                      indent: Get.height * 0.15,
                      endIndent: Get.height * 0.15,
                    ),
                    getheight(context, 0.020),
                    Bounceable(
                      scaleFactor: 0.8,
                      onTap: () {},
                      child: const CustomMoreProfileWidget(
                          mainText: "Delivery time slot",
                          subText: "Morning (5:00 AM - 7:30 AM)"),
                    ),
                    const Divider(),
                    Bounceable(
                      scaleFactor: 0.8,
                      onTap: () {},
                      child: const CustomMoreProfileWidget(
                          mainText: "Ring the bell", subText: "No"),
                    ),
                    const Divider(),
                    Bounceable(
                      scaleFactor: 0.8,
                      onTap: () {},
                      child: const CustomMoreProfileWidget(
                          mainText: "Record voice instructions", subText: "No"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
