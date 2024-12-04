import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/custom_utils/custom_bottom_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:share_plus/share_plus.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  UserUtilityController userUtilityController =
      Get.put(UserUtilityController());
  @override
  void initState() {
    userUtilityController.getReferCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomTextCard(
          text: "Recommend Better Living",
          fontSize: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextCard(
              text: "T&C",
              color: greenColor,
              // fontSize: 20,
            ),
          ),
        ],
      ),
      backgroundColor: appbackgroundColor,
      bottomNavigationBar: const CustomBottomAppBar(index: 3),
      //  Container(
      //   // height: 20,
      //   decoration: BoxDecoration(color: whiteColor),
      //   child: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             CustomTextRich(
      //               text: "Your friends and family are ",
      //               fontSize: 15,
      //               fontWeight: FontWeight.w500,
      //               children: [
      //                 TextSpan(
      //                     text: "waiting for an invite",
      //                     style: TextStyle(color: redColor))
      //               ],
      //             ),
      //             const Icon(
      //               Icons.arrow_forward_ios,
      //               size: 12,
      //             )
      //           ],
      //         ),
      //         getheight(context, 0.020),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               decoration: BoxDecoration(
      //                   color: greenColor,
      //                   borderRadius: BorderRadius.circular(8)),
      //               child: Padding(
      //                 padding: const EdgeInsets.only(
      //                     top: 12.0, left: 80, right: 80, bottom: 12),
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Icon(
      //                       Icons.wechat_sharp,
      //                       color: whiteColor,
      //                     ),
      //                     getwidth(context, 0.020),
      //                     CustomTextSimple(
      //                       text: "Refer Now",
      //                       fontSize: 20,
      //                       color: whiteColor,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               decoration: BoxDecoration(
      //                   color: whiteColor,
      //                   borderRadius: BorderRadius.circular(8),
      //                   border: Border.all(color: greyColor, width: 0.5)),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(13.0),
      //                 child: Icon(
      //                   Icons.share,
      //                   color: greyColor,
      //                 ),
      //               ),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          getheight(context, 0.010),
          Image.asset('assets/images/share.png'),
          getheight(context, 0.050),
          CustomTextCard(
            text: "Earn Money By Refer",
            color: appblueColor,
            fontSize: 30,
          ),
          getheight(context, 0.030),
          Obx(
            () => !userUtilityController.isreferLoad.value
                ? CustomTextRich(
                    text: "Refer to friends and Earn Flat",
                    color: appblueColor,
                    fontSize: 15,
                    children: [
                      TextSpan(
                          text: " ₹${userUtilityController.referAmount.value}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18))
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          getheight(context, 0.030),
          Obx(
            () => userUtilityController.isreferLoad.value
                ? CircularProgressIndicator(
                    color: appColorText,
                    strokeWidth: 1.5,
                  )
                : Bounceable(
                    onTap: () {
                      // Share.shareXFiles(
                      //   [XFile('assets/images/share.png')]
                      //   // [XFile('assets/images/product-banner.png')],
                      //   ,
                      //   text:
                      //       "Hi! I'm inviting you to use Family Pride.\nUse my referral code ${userUtilityController.userRefferCode.value} or tap the link below to make any payment on Paytm hassle-free.\nSwitch to India's highest-rated UPI App and Win up to ₹${userUtilityController.referAmount.value} cashback:\n ${userUtilityController.referingingUrl.value}",
                      //   subject: 'Hindustan Food',
                      //   // sharePositionOrigin:
                      //   //     Rect.fromCircle(center: Offset(1, 2), radius: 0.2)
                      // );

                      Share.share(
                        "Hi! I'm inviting you to use Family Pride.\nUse my referral code (${userUtilityController.userRefferCode.value}) to make Your first valid Order only.\nSwitch to India's Coolest Grocery App and Win up to ₹${userUtilityController.referAmount.value} cashback:\n ${userUtilityController.referingingUrl.value}",
                        subject: 'Family Pride',
                        // sharePositionOrigin:
                        //     Rect.fromCircle(center: Offset(1, 2), radius: 0.2)
                      );
                    },
                    scaleFactor: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, left: 80, right: 80, bottom: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.wechat_sharp,
                              color: whiteColor,
                            ),
                            getwidth(context, 0.020),
                            CustomTextSimple(
                              text: "Share Now",
                              fontSize: 20,
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
