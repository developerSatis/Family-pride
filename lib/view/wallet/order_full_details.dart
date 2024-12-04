import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:shimmer/shimmer.dart';

class OrderFullDetails extends StatefulWidget {
  const OrderFullDetails({super.key});

  @override
  State<OrderFullDetails> createState() => _OrderFullDetailsState();
}

class _OrderFullDetailsState extends State<OrderFullDetails> {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    // bool isDownloadProgress = false;
    // double downloadProgress = 0.0;

    return Obx(
      () => Scaffold(
          backgroundColor: appbackgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: CustomTextCard(
              text: cartController.isOrderLoad.value
                  ? ""
                  : cartController.orderDate.value,
              fontSize: 20,
            ),
            actions: [
              !cartController.isOrderLoad.value
                  ? !cartController.isDownloadProgress.value
                      ? Bounceable(
                          onTap: () {
                            cartController.pdfLink.value.isNotEmpty
                                ? FileDownloader.downloadFile(
                                    url: cartController.pdfLink.value,
                                    // "https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-320-80.jpg",
                                    // name: "THE FILE NAME AFTER DOWNLOADING",//(optional)
                                    onProgress:
                                        (String? fileName, double? progress) {
                                      // customeToast("Invoice downloadin start");
                                      // setState(() {
                                      cartController.isDownloadProgress.value =
                                          true;
                                      cartController.downloadProgress.value =
                                          progress!;
                                      // });
                                      print(
                                          'FILE fileName HAS PROGRESS $progress');
                                    },
                                    onDownloadCompleted: (String path) {
                                      setState(() {
                                        cartController
                                            .isDownloadProgress.value = false;
                                      });
                                      customeToast("Invoice saved");
                                      print('FILE DOWNLOADED TO PATH: $path');
                                    },
                                    onDownloadError: (String error) {
                                      print('DOWNLOAD ERROR: $error');
                                    })
                                : customeToast("No Invoice Found");
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.download_for_offline),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )),
                        )
                  : const SizedBox.shrink()
            ],
          ),
          body: Stack(
            children: [
              !cartController.isOrderLoad.value
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextRich(
                              text: "Order ID: ",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: greyColor,
                              children: [
                                TextSpan(
                                    text: cartController.orderNumber.value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800))
                              ],
                            ),
                            getheight(context, 0.010),
                            // const Padding(
                            //   padding:
                            //       EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       CustomTextSimple(
                            //         text: "Morning Orders",
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w800,
                            //       ),
                            //       CustomTextSimple(
                            //         text: "Partiallly delivered at 06:33",
                            //         fontSize: 14,
                            //       )
                            //     ],
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                  color: greyColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: List.generate(
                                        cartController
                                            .productOrderDetails.length,
                                        (index) => FullOrderDetailsWidget(
                                              totalUnit: cartController
                                                  .productOrderDetails[index]
                                                  .totalUnit,
                                              total: cartController
                                                  .productOrderDetails[index]
                                                  .total
                                                  .toString(),
                                              quantity: cartController
                                                  .productOrderDetails[index]
                                                  .quantity
                                                  .toString(),
                                              imageUrl: cartController
                                                  .productOrderDetails[index]
                                                  .productImage,
                                              productName: cartController
                                                  .productOrderDetails[index]
                                                  .productName,
                                              purchagePrice: cartController
                                                  .productOrderDetails[index]
                                                  .purchasePrice
                                                  .toString(),
                                              salePrice: cartController
                                                  .productOrderDetails[index]
                                                  .salePrice
                                                  .toString(),
                                              unit: cartController
                                                  .productOrderDetails[index]
                                                  .unit,
                                            )),
                                  ),
                                  OrderTotalWidget(
                                    totalSaving:
                                        cartController.totalOrderSaving.value,
                                    coupon: cartController.couponOrder.value,
                                    couponAmount:
                                        cartController.couponAmountOrder.value,
                                    deliveryCharge: cartController
                                                .orderDeliveryCharge.value ==
                                            "free"
                                        ? cartController
                                            .orderDeliveryCharge.value
                                            .toUpperCase()
                                        : cartController
                                            .orderDeliveryCharge.value,
                                    grandTotal: (int.parse(cartController
                                                .orderGrandTotal.value) +
                                            (cartController.orderDeliveryCharge
                                                        .value !=
                                                    "free"
                                                ? int.parse(cartController
                                                    .orderDeliveryCharge.value)
                                                : 0) +
                                            (cartController.orderPackCharge
                                                        .value !=
                                                    "free"
                                                ? int.parse(cartController
                                                    .orderPackCharge.value)
                                                : 0))
                                        .toString(),
                                    packingCharge: cartController
                                                .orderPackCharge.value ==
                                            "free"
                                        ? cartController.orderPackCharge.value
                                            .toUpperCase()
                                        : cartController.orderPackCharge.value,
                                    subTotal:
                                        cartController.subTotalOrder.value,
                                  )
                                ],
                              ),
                            ),
                            getheight(context, 0.020),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: whiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTextSimple(
                                    text: "Disclaimer",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  getheight(context, 0.010),
                                  CustomTextSimple(
                                    text:
                                        "The billed amount is as per the actual weight delivered.",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: greyColor,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              cartController.isDownloadProgress.value
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: appColorBlack.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: CustomTextSimple(
                              text:
                                  "Invoice start downloading ${cartController.downloadProgress.value}",
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              color: whiteColor,
                            ),
                          )),
                    )
                  : const SizedBox.shrink()
            ],
          )),
    );
  }
}

class OrderTotalWidget extends StatelessWidget {
  final String? subTotal;
  final String? packingCharge;
  final String? grandTotal;
  final String? deliveryCharge;
  final String? coupon;
  final String? totalSaving;
  final String? couponAmount;
  const OrderTotalWidget(
      {super.key,
      required this.subTotal,
      required this.packingCharge,
      required this.grandTotal,
      required this.deliveryCharge,
      required this.coupon,
      required this.totalSaving,
      required this.couponAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextSimple(
                text: "Items Total",
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              Row(
                children: [
                  // CustomTextSimple(
                  //   text: "₹ 17.4",
                  //   fontSize: 14,
                  //   decoration: TextDecoration.lineThrough,
                  //   color: greyColor,
                  //   fontWeight: FontWeight.w800,
                  // ),
                  getwidth(context, 0.020),
                  CustomTextSimple(
                    text: "₹ $subTotal",
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              )
            ],
          ),
          getheight(context, 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextSimple(
                text: "Packaging Charges",
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              CustomTextSimple(
                text: packingCharge,
                color: greenColor,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextSimple(
                text: "Delivery Charges",
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              CustomTextSimple(
                text: deliveryCharge,
                color: greenColor,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextSimple(
                text: "Product Saving",
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              CustomTextSimple(
                text: "₹ $totalSaving",
                // decoration: TextDecoration.lineThrough,
                color: greenColor,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              )
            ],
          ),
          coupon!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextSimple(
                      text: "Coupon Applied",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomTextSimple(
                      text: "$coupon - ₹$couponAmount",
                      color: greenColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    )
                  ],
                )
              : const SizedBox.shrink(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextSimple(
                text: "Order Total",
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
              CustomTextSimple(
                text: "₹ $grandTotal",
                fontSize: 14,
                fontWeight: FontWeight.w800,
              )
            ],
          )
        ],
      ),
    );
  }
}

class FullOrderDetailsWidget extends StatelessWidget {
  final String? productName;
  final String? unit;
  final String? purchagePrice;
  final String? salePrice;
  final String? imageUrl;
  final String? quantity;
  final String? total;
  final String? totalUnit;
  const FullOrderDetailsWidget(
      {super.key,
      required this.productName,
      required this.unit,
      required this.purchagePrice,
      required this.salePrice,
      required this.imageUrl,
      required this.quantity,
      required this.total,
      required this.totalUnit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      // decoration: BoxDecoration(
      // // border: Border.all()
      // // symmetric(
      // //     horizontal: BorderSide(color: greyColor, width: 0.5))
      //     ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.10,
                      height: Get.height * 0.05,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Image.network(
                          imageUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    getwidth(context, 0.020),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * 0.38,
                          child: CustomTextRich(
                            text: productName,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            // children: [
                            //   TextSpan(
                            //       text: "($totalUnit)",
                            //       style: TextStyle(
                            //           color: greyColor,
                            //           fontWeight: FontWeight.w600,
                            //           fontSize: 14))
                            // ],
                          ),
                        ),
                        CustomTextRich(
                          text: "$unit × $quantity  ",
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          children: [
                            TextSpan(
                                text: "  ($totalUnit)",
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    // CustomTextSimple(
                    //   text: "₹ $purchagePrice",
                    //   fontSize: 14,
                    //   decoration: TextDecoration.lineThrough,
                    //   color: greyColor,
                    //   fontWeight: FontWeight.w800,
                    // ),
                    CustomTextSimple(
                      text:
                          "₹ ${(int.parse(purchagePrice!) * int.parse(quantity!))}",
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: greyColor,
                      fontWeight: FontWeight.w800,
                    ),
                    // getwidth(context, 0.020),
                    // CustomTextSimple(
                    //   text: "₹ $salePrice",
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.w800,
                    // ),
                    getwidth(context, 0.020),
                    CustomTextSimple(
                      text: "₹ $total",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 0.1,
          )
        ],
      ),
    );
  }
}
