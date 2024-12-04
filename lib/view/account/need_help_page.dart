import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class NeedHelpPage extends StatelessWidget {
  const NeedHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "Need Help?",
              fontSize: 20,
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   // height: 20,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       color: appColorText,
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: greyColor.withOpacity(0.3))),
              //   child: Column(
              //     children: [
              //       getheight(context, 0.020),
              //       CustomTextCard(
              //         text: "Recent Orders",
              //         color: whiteColor,
              //       ),
              //       Divider(
              //         color: whiteColor,
              //         indent: Get.height * 0.18,
              //         endIndent: Get.height * 0.18,
              //       ),
              //       getheight(context, 0.030),
              //       FaIcon(
              //         FontAwesomeIcons.faceFrown,
              //         size: 70,
              //         color: whiteColor.withOpacity(0.2),
              //       ),
              //       getheight(context, 0.040),
              //       CustomTextCard(
              //         text: "No Orders Found in Last 3 Days",
              //         color: whiteColor.withOpacity(0.5),
              //       ),
              //       getheight(context, 0.060),
              //     ],
              //   ),
              // ),
              // getheight(context, 0.020),
              // const CustomTextCard(text: "Customer Preference"),
              getheight(context, 0.020),
              // Container(
              //   // height: 20,
              //   decoration: BoxDecoration(
              //       color: appColorText,
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: greyColor.withOpacity(0.3))),
              //   child: Column(
              //     children: [
              //       Bounceable(
              //         scaleFactor: 0.8,
              //         onTap: () {},
              //         child: const CustomMoreProfileWidget(
              //             mainText: "Payments and cashback",
              //             subText:
              //                 "Cashback, payment and referral related issues"),
              //       ),
              //       const Divider(),
              //       Bounceable(
              //         scaleFactor: 0.8,
              //         onTap: () {},
              //         child: const CustomMoreProfileWidget(
              //             mainText: "Membership",
              //             subText:
              //                 "View your membership details and renew your plan"),
              //       ),
              //       const Divider(),
              //       Bounceable(
              //         scaleFactor: 0.8,
              //         onTap: () {},
              //         child: const CustomMoreProfileWidget(
              //             mainText: "Profile and Address",
              //             subText:
              //                 "Update your profile information like address, time-slot etc."),
              //       ),
              //       const Divider(),
              //       Bounceable(
              //         scaleFactor: 0.8,
              //         onTap: () {},
              //         child: const CustomMoreProfileWidget(
              //             mainText: "App Guide", subText: "Troubleshooting"),
              //       ),
              //     ],
              //   ),
              // ),
              // getheight(context, 0.020),
              const Align(
                  alignment: Alignment.center,
                  child: CustomTextCard(text: "Support")),
              getheight(context, 0.020),

              Column(
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: CustomTextCard(
                        text: "+91 8368960398",
                        fontSize: 18,
                      )),
                  getheight(context, 0.030),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounceable(
                        scaleFactor: 0.5,
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: appColorText,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: greyColor.withOpacity(0.3),
                                  width: 1.5)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, bottom: 12, left: 40, right: 40),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.phoneVolume,
                                  color: whiteColor.withOpacity(0.9),
                                  size: 18,
                                ),
                                getwidth(context, 0.030),
                                CustomTextCard(
                                  text: "Call Us / Whatsapp Us",
                                  color: greenColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      getheight(context, 0.20),
                      const CustomTextCard(
                        text: 'praveen.sharma19941008@gmail.com',
                        fontSize: 15,
                      ),
                      getheight(context, 0.020),
                      Bounceable(
                        scaleFactor: 0.5,
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: appColorText,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: greyColor.withOpacity(0.3),
                                  width: 1.5)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, bottom: 12, left: 40, right: 40),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.envelopeCircleCheck,
                                  color: whiteColor.withOpacity(0.9),
                                  size: 18,
                                ),
                                getwidth(context, 0.030),
                                CustomTextCard(
                                  text: "Mail Us",
                                  color: greenColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
