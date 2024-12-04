import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_bottom_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_more_card_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/account/legal_page.dart';
import 'package:hindustan_food/view/account/need_help_page.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';
import 'package:hindustan_food/view/refer/refer_page.dart';
import 'package:hindustan_food/view/wallet/my_orders.dart';
import 'package:hindustan_food/view/wallet/transaction_history_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    CartController cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: appbackgroundColor,
      bottomNavigationBar: const CustomBottomAppBar(index: 4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: Get.height * 0.12,
              bottom: Get.height * 0.52,
              left: 0,
              right: 0,
              child: Container(
                // width: Get.width * 0.020,
                // height: Get.height * 0.020,
                decoration: BoxDecoration(
                  color: appColorText.withOpacity(0.8),

                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(200),
                  //     bottomRight: Radius.circular(200))
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.57,
              bottom: Get.height * 0.19,
              left: 0,
              right: 0,
              child: Container(
                // width: Get.width * 0.020,
                // height: Get.height * 0.020,
                decoration: BoxDecoration(
                  color: appColorText.withOpacity(0.8),

                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(200),
                  //     bottomRight: Radius.circular(200))
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getheight(context, 0.050),

                      Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  // offset: Offset(1, 2),
                                  color: appColorBlack.withOpacity(0.5),
                                  blurRadius: 2)
                            ]),
                        child: Column(
                          children: [
                            getheight(context, 0.010),
                            const CustomTextCard(
                              text: "Products and Transactions",
                              fontSize: 16,
                            ),

                            // getheight(context, 0.005),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Bounceable(
                                      scaleFactor: 0.5,
                                      onTap: () async {
                                        await categoryController
                                            .getProductCategorybyid(1);
                                        Get.to(() => const CartSelectionPage(
                                              categoryId: 1,
                                            ));
                                      },
                                      child: Column(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.boxOpen,
                                            color: greenColor,
                                            size: 30,
                                          ),
                                          CustomTextCard(
                                            text: "Products",
                                            fontSize: 12,
                                            color: greyColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    // VerticalDivider(
                                    //   color: greyColor,
                                    //   width: 0,
                                    // ),
                                    // Bounceable(
                                    //   scaleFactor: 0.5,
                                    //   onTap: () {
                                    //     Get.to(
                                    //         () => const TransactionHistory());
                                    //   },
                                    //   child: Column(
                                    //     children: [
                                    //       FaIcon(
                                    //         FontAwesomeIcons.moneyBillWave,
                                    //         color: greenColor,
                                    //         size: 30,
                                    //       ),
                                    //       CustomTextCard(
                                    //         text: "Monthly Bill",
                                    //         fontSize: 12,
                                    //         color: greyColor,
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    VerticalDivider(
                                      color: greyColor,
                                      width: 0,
                                    ),
                                    Bounceable(
                                      scaleFactor: 0.5,
                                      onTap: () {
                                        Get.to(
                                            () => const TransactionHistory());
                                      },
                                      child: Column(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.moneyBillTransfer,
                                            color: greenColor,
                                            size: 30,
                                          ),
                                          CustomTextCard(
                                            text: "Transactions",
                                            fontSize: 12,
                                            color: greyColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]
                                      .animate(interval: 30.ms)
                                      .fade(duration: 500.ms)
                                      .align(duration: 200.ms),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      getheight(context, 0.060),
                      Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  // offset: Offset(1, 2),
                                  color: appColorBlack.withOpacity(0.5),
                                  blurRadius: 2)
                            ]),
                        child: Column(
                          children: [
                            getheight(context, 0.010),
                            const CustomTextCard(
                              text: "Orders and Refer",
                              fontSize: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Bounceable(
                                      scaleFactor: 0.5,
                                      onTap: () async {
                                        await cartController.getOrderById();
                                        Get.to(() => const MyOrders());
                                        // Get.to(() => const MyBills());
                                      },
                                      child: Column(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.clockRotateLeft,
                                            color: greenColor,
                                            size: 30,
                                          ),
                                          CustomTextCard(
                                            text: "Order History",
                                            fontSize: 12,
                                            color: greyColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: greyColor,
                                      width: 0,
                                    ),
                                    Bounceable(
                                      scaleFactor: 0.5,
                                      onTap: () {
                                        Get.offAll(const ReferPage(),
                                            transition:
                                                Transition.noTransition);
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.share,
                                            color: greenColor,
                                            size: 30,
                                          ),
                                          CustomTextCard(
                                            text: "Refer",
                                            fontSize: 12,
                                            color: greyColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        // Icon(
                                        //   Icons.local_offer,
                                        //   color: greenColor,
                                        // ),
                                        CustomTextCard(text: "", fontSize: 16)
                                      ],
                                    ),
                                    // Column(
                                    //   children: [
                                    //     FaIcon(
                                    //       FontAwesomeIcons.moneyBillTransfer,
                                    //       color: greenColor,
                                    //     ),
                                    //     const CustomTextCard(
                                    //         text: "Transactions", fontSize: 16)
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     FaIcon(
                                    //       FontAwesomeIcons.moneyBillWave,
                                    //       color: greenColor,
                                    //     ),
                                    //     const CustomTextCard(
                                    //         text: "Monthly Bill", fontSize: 16)
                                    //   ],
                                    // ),
                                  ]
                                      .animate(interval: 30.ms)
                                      .fade(duration: 500.ms)
                                      .align(duration: 200.ms),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const CustomTextCard(text: "Rewards", fontSize: 16),
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Icon(
                      //             Icons.share,
                      //             color: greenColor,
                      //           ),
                      //           const CustomTextCard(text: "Refer", fontSize: 16)
                      //         ],
                      //       ),
                      //       // Column(
                      //       //   children: [
                      //       //     Icon(
                      //       //       Icons.local_offer,
                      //       //       color: greenColor,
                      //       //     ),
                      //       //     CustomTextCard(text: "Offer Zone", fontSize: 16)
                      //       //   ],
                      //       // ),
                      //       // Column(
                      //       //   children: [
                      //       //     // Icon(
                      //       //     //   Icons.local_offer,
                      //       //     //   color: greenColor,
                      //       //     // ),
                      //       //     CustomTextCard(text: "", fontSize: 16)
                      //       //   ],
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      getheight(context, 0.0550),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMoreAgainWidget(
                              icon: FontAwesomeIcons.gears,
                              onTap: () {
                                // Get.to(() => const AccountDetailsPage());
                              },
                              subtitle: "Edit Address, Delivery Preferences",
                              title: "Account & Preferences"),
                          CustomMoreAgainWidget(
                              icon: FontAwesomeIcons.wallet,
                              onTap: () {
                                // Get.offAll(() => const WalletPage(),
                                //     transition: Transition.noTransition);
                              },
                              title: "Wallet & Payment Modes",
                              subtitle: "Add Money, Add or remove saved Cards"),
                        ],
                      ),
                      getheight(context, 0.010),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMoreAgainWidget(
                              icon: FontAwesomeIcons.circleQuestion,
                              onTap: () {
                                Get.to(() => const NeedHelpPage());
                              },
                              subtitle: "Need Help?",
                              title: "Call or Chat with us"),
                          CustomMoreAgainWidget(
                              icon: FontAwesomeIcons.fileContract,
                              onTap: () {
                                Get.to(() => const LegalPage());
                              },
                              title: "Testimonial",
                              subtitle: "Privacy, Terms & Conditions"),
                        ],
                      ),
                      // Container(
                      //   // height: 20,
                      //   // decoration: BoxDecoration(
                      //   //     color: whiteColor,
                      //   //     borderRadius: BorderRadius.circular(10),
                      //   //     border: Border.all(color: greyColor.withOpacity(0.3))),
                      //   child: Column(
                      //     children: [
                      //       Bounceable(
                      //         scaleFactor: 0.5,
                      //         onTap: () {
                      //           Get.to(() => const AccountDetailsPage());
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               color: appColorText,
                      //               borderRadius: BorderRadius.circular(15),
                      //               border:
                      //                   Border.all(color: whiteColor, width: 3),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     // offset: Offset(3, 3),
                      //                     color: whiteColor,
                      //                     blurRadius: 1)
                      //               ]),
                      //           child: const CustomMoreCardWidget(
                      //             icon: FontAwesomeIcons.gears,
                      //             mainText: "Account & Preferences",
                      //             subText: "Edit Address, Delivery Preferences",
                      //           ),
                      //         ),
                      //       ),
                      //       getheight(context, 0.020),
                      //       // const Divider(),
                      //       Bounceable(
                      //         scaleFactor: 0.5,
                      //         onTap: () {
                      //           Get.offAll(() => const WalletPage(),
                      //               transition: Transition.noTransition);
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               color: appColorText,
                      //               borderRadius: BorderRadius.circular(15),
                      //               border:
                      //                   Border.all(color: whiteColor, width: 3),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     // offset: Offset(3, 3),
                      //                     color: whiteColor,
                      //                     blurRadius: 1)
                      //               ]),
                      //           child: const CustomMoreCardWidget(
                      //             icon: FontAwesomeIcons.wallet,
                      //             mainText: "Wallet & Payment Modes",
                      //             subText:
                      //                 "Add Money, Add or remove saved Cards",
                      //           ),
                      //         ),
                      //       ),
                      //       getheight(context, 0.020),
                      //       // const Divider(),
                      //       Bounceable(
                      //         scaleFactor: 0.5,
                      //         onTap: () {
                      //           Get.to(() => const NeedHelpPage());
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               color: appColorText,
                      //               borderRadius: BorderRadius.circular(15),
                      //               border:
                      //                   Border.all(color: whiteColor, width: 3),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     // offset: Offset(3, 3),
                      //                     color: whiteColor,
                      //                     blurRadius: 1)
                      //               ]),
                      //           child: const CustomMoreCardWidget(
                      //             icon: FontAwesomeIcons.circleQuestion,
                      //             mainText: "Need Help?",
                      //             subText: "Call or Chat with us",
                      //           ),
                      //         ),
                      //       ),
                      //       getheight(context, 0.020),
                      //       // const Divider(),
                      //       Bounceable(
                      //         onTap: () {
                      //           Get.to(() => const LegalPage());
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               color: appColorText,
                      //               borderRadius: BorderRadius.circular(15),
                      //               border:
                      //                   Border.all(color: whiteColor, width: 3),
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     // offset: Offset(3, 3),
                      //                     color: whiteColor,
                      //                     blurRadius: 1)
                      //               ]),
                      //           child: const CustomMoreCardWidget(
                      //             icon: FontAwesomeIcons.fileContract,
                      //             mainText: "Legal",
                      //             subText: "Privacy, Terms & Conditions",
                      //           ),
                      //         ),
                      //       ),
                      //       // getheight(context, 0.020),
                      //       // // Divider(),
                      //       // Bounceable(
                      //       //   onTap: () {
                      //       //     Future.delayed(
                      //       //       const Duration(milliseconds: 150),
                      //       //       () {
                      //       //         Get.dialog(logOutPopUp(context));
                      //       //       },
                      //       //     );
                      //       //   },
                      //       //   child: Container(
                      //       //     padding: const EdgeInsets.only(
                      //       //         top: 5, bottom: 5, left: 20, right: 20),
                      //       //     decoration: BoxDecoration(
                      //       //         color: redDarkColor,
                      //       //         borderRadius: BorderRadius.circular(6)),
                      //       //     child: CustomTextSimple(
                      //       //       text: "Logout!",
                      //       //       fontSize: 15,
                      //       //       fontWeight: FontWeight.w600,
                      //       //       color: whiteColor,
                      //       //     ),
                      //       //   ),
                      //       // ),
                      //       getheight(context, 0.010)
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomTextCard(
                    text: "Version : 1.0.0",
                    color: greyColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
