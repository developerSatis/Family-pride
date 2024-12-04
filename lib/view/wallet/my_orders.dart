import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/wallet/order_full_details.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "My Orders",
              fontSize: 20,
            )),
        body: cartController.orderList.isNotEmpty
            ? ListView.builder(
                itemCount: cartController.orderList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Bounceable(
                      onTap: () {
                        cartController.orderDetailsFetch(
                            cartController.orderList[index].id.toString());
                        Get.to(() => const OrderFullDetails());
                      },
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                              .orderList[index].orderId,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  CustomTextSimple(
                                    text:
                                        "Total Amount: ${int.parse(cartController.orderList[index].subtotal) + int.parse(cartController.orderList[index].deliveryCharge) + int.parse(cartController.orderList[index].packingCharge) - (cartController.orderList[index].discountType == 'fix' ? cartController.orderList[index].discount : 0)}",
                                    // "Total Amount: ${cartController.orderList[index].subtotal.toString()}",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              const Divider(),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         const CustomTextSimple(
                              //           text: "Billing details",
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600,
                              //         ),
                              //         getheight(context, 0.003),
                              //         CustomTextSimple(
                              //           text: cartController.orderList[index].name,
                              //           fontSize: 14,
                              //         ),
                              //         CustomTextSimple(
                              //           text: cartController.orderList[index].phone,
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
                              //         image: const DecorationImage(
                              //           image: AssetImage('assets/images/splash.jpg'),
                              //           fit: BoxFit.fill,
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              // Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextSimple(
                                    text:
                                        "${cartController.orderList[index].paymentStatus} (${cartController.orderList[index].paymentMethod.toUpperCase()})",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Column(
                                    children: [
                                      CustomTextSimple(
                                        text:
                                            "Delivered: ${cartController.orderList[index].orderStatus.toString()}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      cartController.orderList[index]
                                                  .currentView !=
                                              DateTime(0)
                                          ? CustomTextSimple(
                                              text: cartController
                                                  .orderList[index].createdAt
                                                  .toString(),
                                              fontSize: 12,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ],
                              ),
                              getheight(context, 00.020),
                              Align(
                                alignment: Alignment.center,
                                child: CustomTextSimple(
                                  text: "View Details",
                                  color: greenColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CustomTextSimple(text: "No Order Found!"),
              ));
  }
}
