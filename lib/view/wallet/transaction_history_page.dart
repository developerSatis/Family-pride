import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';
import 'package:hindustan_food/view/wallet/wallet_page.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  CartController cartController = Get.put(CartController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load() async {
    await cartController.allTransation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "Transaction History",
              fontSize: 20,
            )),
        body: Column(
          children: [
            Container(
              // height: 20,
              decoration: BoxDecoration(color: whiteColor),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextCard(text: "Current Wallet Balance"),
                        CustomTextSimple(text: "₹0.0"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(const WalletPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextCard(
                            text: "ADD MONEY",
                            color: whiteColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => cartController.isTransationLoading.value
                  ? Column(
                      children: [
                        getheight(context, 0.20),
                        const CircularProgressIndicator(),
                        getheight(context, 0.040),
                        CustomTextSimple(
                          text: "Looking for Transactions",
                          fontSize: 15,
                          color: greyColor,
                        )
                      ],
                    )
                  : cartController.transationList.isNotEmpty
                      ? SizedBox(
                          height: Get.height * 0.78,
                          child: ListView.builder(
                            itemCount: cartController.transationList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Bounceable(
                                  onTap: () {},
                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getheight(context, 0.020),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomTextRich(
                                                text: "Order ID: ",
                                                fontSize: 12,
                                                color: greyColor,
                                                fontWeight: FontWeight.w600,
                                                children: [
                                                  TextSpan(
                                                      text: cartController
                                                          .transationList[index]
                                                          .orderId,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              ),
                                              CustomTextRich(
                                                text:
                                                    "${cartController.transationList[index].status} ",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "(${cartController.transationList[index].paymentMethod.toUpperCase()})",
                                                  )
                                                ],
                                              ),
                                              // CustomTextSimple(
                                              //   text:
                                              //       "Total Amount: ${cartController.orderList[index].gtotal.toString()}",
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              // ),
                                            ],
                                          ),
                                          // const Divider(),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Column(
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.start,
                                          //       mainAxisAlignment: MainAxisAlignment.start,
                                          //       children: [
                                          //         const CustomTextSimple(
                                          //           text: "Billing details",
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w600,
                                          //         ),
                                          //         getheight(context, 0.003),
                                          //         CustomTextSimple(
                                          //           text: cartController
                                          //               .orderList[index].name,
                                          //           fontSize: 14,
                                          //         ),
                                          //         CustomTextSimple(
                                          //           text: cartController
                                          //               .orderList[index].phone,
                                          //           fontSize: 14,
                                          //         ),
                                          //         CustomTextSimple(
                                          //           text:
                                          //               "${cartController.orderList[index].address}, ${cartController.orderList[index].city}, ${cartController.orderList[index].state}, (${cartController.orderList[index].zip})",
                                          //           fontSize: 14,
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     Container(
                                          //       width: 80,
                                          //       height: 80,
                                          //       decoration: BoxDecoration(
                                          //         color: redColor,
                                          //         image: DecorationImage(
                                          //           image: AssetImage(
                                          //               'assets/images/splash.jpg'),
                                          //           fit: BoxFit.fill,
                                          //         ),
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomTextSimple(
                                                text:
                                                    "Total Amount: ₹${int.parse(cartController.transationList[index].order.subtotal) + int.parse(cartController.transationList[index].order.deliveryCharge) + int.parse(cartController.transationList[index].order.packingCharge) - (cartController.transationList[index].order.couponType == 'fix' ? cartController.transationList[index].order.discount : 0)}",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              // CustomTextSimple(
                                              //   text:
                                              //       "${cartController.orderList[index].paymentStatus} (${cartController.orderList[index].paymentMethod!.toUpperCase()})",
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              // ),
                                              CustomTextRich(
                                                text: "Payment: ",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                children: [
                                                  TextSpan(
                                                      text: cartController
                                                          .transationList[index]
                                                          .status
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: cartController
                                                                      .transationList[
                                                                          index]
                                                                      .status ==
                                                                  "Completed"
                                                              ? greenColor
                                                              : yellowColor))
                                                ],
                                              ),
                                            ],
                                          ),

                                          CustomTextSimple(
                                            text:
                                                // "Date: ${cartController.transationList[index].date.toString()}",
                                                "Date: ${DateFormat('d MMM yyyy HH:mm').format(DateTime.parse(cartController.transationList[index].date.toString()))}",
                                            // "Date: ${DateFormat('dd-MM-yyyy (hh:mm a)').format(DateTime.parse(cartController.transationList[index].date.toString()))}",
                                            // text:
                                            //     "Date: ${cartController.orderList[index].createdAt.toString()}",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: greyColor,
                                          ),
                                          getheight(context, 0.010),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Column(
                          children: [
                            getheight(context, 0.020),
                            const CustomTextCard(
                              text: "No Transaction",
                              fontWeight: FontWeight.w800,
                            ),
                            getheight(context, 0.020),
                            SizedBox(
                              width: Get.width * 0.90,
                              child: const CustomTextCard(
                                text:
                                    "You haven't made any transactions, please explore our healthy products.",
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            getheight(context, 0.020),
                            GestureDetector(
                              onTap: () {
                                Get.off(const CartSelectionPage(
                                  categoryId: 1,
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CustomTextCard(
                                    text: "EXPLORE PRODUCTS",
                                    color: whiteColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            getheight(context, 0.050),
                            Image.asset('assets/images/payments.png'),
                          ],
                        ),
            ),
          ],
        ));
  }
}
