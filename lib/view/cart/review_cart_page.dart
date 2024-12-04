import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_cart_item_widget.dart';
import 'package:hindustan_food/custom_widget/custom_coupon_card_widget.dart';
import 'package:hindustan_food/models/pin_code_model.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/map_view_screen.dart';
import 'package:hindustan_food/view/cart/wallet_applied_logic.dart';
import 'package:hindustan_food/view/home_page.dart';
import 'package:hindustan_food/view/product/product_page.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class ReviewCartPage extends StatefulWidget {
  const ReviewCartPage({super.key});

  @override
  State<ReviewCartPage> createState() => _ReviewCartPageState();
}

class _ReviewCartPageState extends State<ReviewCartPage> {
  int selectedOption = 0;
  bool isAddresAdd = true;
  int addressIndex = 0;


  bool isPincodeCorrect = false;
  bool isGowithPin = false;

  @override
  void initState() {
    _load();

    super.initState();
  }

  CartController cartController = Get.put(CartController());
  CategoryController categoryController = Get.put(CategoryController());
  _load() async {
    await cartController.getAddress();
    await cartController.getPinCode();
    await userUtilityController.getWallet(false);
  }
  double totalPrice = 0;
  double deliveryPrice = 0;
  double totalAndDelivery = 0;


  void update() {
    setState(() {
      double totalPrice = double.tryParse(cartController.cartNewPrice.value) ?? 0;
      double deliveryPrice = double.tryParse(cartController.deliveryCharge.value) ?? 0;
      totalAndDelivery = totalPrice + deliveryPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserUtilityController userUtilityController =
        Get.put(UserUtilityController());

    return Obx(
      () => Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: const CustomAppBar(
          istitle: true,
          isFreeDeliveryText: true,
          isAddbuttonShow: false,
          appBartitle: "Review Cart",
          appBarSubtitle: "Delivery on Wed, 6th December",
        ),
        body: PopScope(
          onPopInvoked: (didPop) {
            userUtilityController.isUsingWallet.value = false;
            categoryController.walletTotalCut.value = '';
            categoryController.havingTotalWallet.value = '';
            categoryController.userToPay.value = '';
          },
          child: cartController.allCartList.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextSimple(
                          text: "All Items for the day",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          // width: 100,
                          padding: const EdgeInsets.all(5),
                          // height: 100,
                          decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: List.generate(
                                cartController.allCartList.length, (index) {
                              return Column(
                                children: [
                                  Card(
                                    color: appColorWhite,
                                    // color: whiteDarkColor,
                                    elevation: 3,
                                    child: CartItemWidget(
                                      offerPrice: cartController
                                          .allCartList[index].offerPrice,
                                      offerProductQuantity: cartController
                                          .allCartList[index].offerQuantity,
                                      onTapDecrement: () async {
                                        cartController.allCartList[index]
                                                        .quantity -
                                                    1 !=
                                                0
                                            ? await cartController.updateCart(
                                                cartController
                                                    .allCartList[index].id
                                                    .toString(),
                                                (cartController
                                                            .allCartList[index]
                                                            .quantity -
                                                        1)
                                                    .toString())
                                            : await cartController
                                                .deleteCartItem(
                                                cartController
                                                    .allCartList[index].id
                                                    .toString(),
                                              );
                                      },
                                      onTapIncrement: () async {
                                        await cartController.updateCart(
                                            cartController.allCartList[index].id
                                                .toString(),
                                            (cartController.allCartList[index]
                                                        .quantity +
                                                    1)
                                                .toString());
                                      },
                                      productQuantity: cartController
                                          .allCartList[index].quantity
                                          .toString(),
                                      onTap: () async {
                                        await categoryController.getProductByID(
                                            cartController
                                                .allCartList[index].productId);

                                        Get.to(() => const ProductPage());
                                      },
                                      imageUrl: cartController
                                          .allCartList[index].product.mainImage,
                                      imageUrlNullCheck: cartController
                                          .allCartList[index].product.mainImage,
                                      productName: cartController
                                          .allCartList[index].product.name,
                                      newPrice: cartController
                                          .allCartList[index].product.newPrice
                                          .toString(),
                                      oldPrice: cartController
                                          .allCartList[index].product.price
                                          .toString(),
                                      quantity: cartController
                                          .allCartList[index].quantity
                                          .toString(),
                                      unit: cartController
                                          .allCartList[index].product.unit,
                                    ),
                                  ),
                                  // Divider(
                                  //   color: greenColor,
                                  // )
                                  getheight(context, 0.005),
                                ],
                              );

                              // CartItemWidget();
                            }),
                            // children: [
                            //   CartItemWidget(),
                            //   Divider(),
                            //   CartItemWidget(),
                            //   Divider(),
                            //   CartItemWidget(),
                            // ],
                          ),
                        ),
                        // CustomCouponWidget(
                        //     color: greenColor,
                        //     couponText: "hello",
                        //     mainText: "hel",
                        //     subText: "yo",
                        //     backgroundContainerColor: redColor,
                        //     borderColor: yellowColor),
                        cartController.getCouponList.isNotEmpty
                            ? const CustomTextSimple(
                                text: "Offer Applied",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )
                            : const SizedBox.shrink(),

                        cartController.getCouponList.isNotEmpty
                            ? getheight(context, 0.010)
                            : const SizedBox.shrink(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => Row(
                                  children: List.generate(
                                      cartController.getCouponList.length,
                                      (index) => Row(
                                            children: [
                                              CouponCardCustomWidget(
                                                imageUrl: cartController
                                                    .getCouponList[index]
                                                    .imageUrl,
                                                discountType: cartController
                                                    .getCouponList[index]
                                                    .discountType,
                                                isSelected: cartController
                                                        .couponIndex.value ==
                                                    index,
                                                onTap: () async {
                                                  // print(cartController
                                                  //     .cartNewPrice.value);

                                                  print(cartController
                                                      .getCouponList[index]
                                                      .minimumSpend);
                                                  print(cartController
                                                      .getCouponList[index]
                                                      .maximumSpend);
                                                  if (double.parse(cartController
                                                                  .actualTotal
                                                                  .value)
                                                              .toInt() >=
                                                          cartController
                                                              .getCouponList[
                                                                  index]
                                                              .minimumSpend &&
                                                      double.parse(cartController
                                                                  .actualTotal
                                                                  .value)
                                                              .toInt() <=
                                                          cartController
                                                              .getCouponList[
                                                                  index]
                                                              .maximumSpend) {
                                                    cartController.couponIndex
                                                        .value = index;
                                                    cartController.couponAmount
                                                            .value =
                                                        cartController
                                                            .getCouponList[
                                                                index]
                                                            .couponAmount
                                                            .toString();
                                                    cartController.disCountType
                                                            .value =
                                                        cartController
                                                            .getCouponList[
                                                                index]
                                                            .discountType;
                                                    cartController
                                                            .couponName.value =
                                                        cartController
                                                            .getCouponList[
                                                                index]
                                                            .couponName;
                                                    print(
                                                        "this is distype ${cartController.disCountType.value}");
                                                    await cartController
                                                        .applyCoupon(
                                                            cartController
                                                                .getCouponList[
                                                                    index]
                                                                .discountType,
                                                            cartController
                                                                .getCouponList[
                                                                    index]
                                                                .couponAmount
                                                                .toString(),
                                                            cartController
                                                                .getCouponList[
                                                                    index]
                                                                .couponCode
                                                                .toString());
                                                    print(
                                                        "this is index$index");
                                                    print(
                                                        "this is conteroller index ${cartController.couponIndex.value}");
                                                  } else {
                                                    print("this is wrong");
                                                  }
                                                  // cartController
                                                  //     .couponIndex.value = index;
                                                  // cartController
                                                  //         .couponAmount.value =
                                                  //     cartController
                                                  //         .getCouponList[index]
                                                  //         .couponAmount
                                                  //         .toString();
                                                  // cartController
                                                  //         .disCountType.value =
                                                  //     cartController
                                                  //         .getCouponList[index]
                                                  //         .discountType;
                                                  // await cartController
                                                  //     .applyCoupon(
                                                  //         cartController
                                                  //             .getCouponList[
                                                  //                 index]
                                                  //             .discountType,
                                                  //         cartController
                                                  //             .getCouponList[
                                                  //                 index]
                                                  //             .couponAmount
                                                  //             .toString());
                                                },
                                                isSelectable: double.parse(
                                                                cartController
                                                                    .actualTotal
                                                                    .value)
                                                            .toInt() >=
                                                        cartController
                                                            .getCouponList[
                                                                index]
                                                            .minimumSpend &&
                                                    double.parse(cartController
                                                                .actualTotal
                                                                .value)
                                                            .toInt() <=
                                                        cartController
                                                            .getCouponList[
                                                                index]
                                                            .maximumSpend,
                                                couponAmount: cartController
                                                    .getCouponList[index]
                                                    .couponAmount
                                                    .toString(),
                                                couponName: cartController
                                                    .getCouponList[index]
                                                    .couponName
                                                    .toUpperCase(),
                                                minimumSpend: cartController
                                                    .getCouponList[index]
                                                    .minimumSpend
                                                    .toString(),
                                              ),
                                              getwidth(context, 0.030),
                                            ],
                                          ))
                                  // [
                                  //   CouponCardCustomWidget(),
                                  //   getwidth(context, 0.030),
                                  //   CouponCardCustomWidget(),
                                  //   getwidth(context, 0.030),
                                  //   CouponCardCustomWidget(),
                                  //   getwidth(context, 0.030),
                                  //   CouponCardCustomWidget(),
                                  // ],
                                  ),
                            ),
                          ),
                        ),
                        getheight(context, 0.020),
                        const CustomTextSimple(
                          text: "Order Details",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        getheight(context, 0.010),
                        Container(
                          // width: Get.width * 0.80,
                          // height: 60,
                          decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomTextSimple(
                                          text: "Items Total",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        // cartController.isCouponApplied.value
                                        //     ? const SizedBox(
                                        //         width: 20,
                                        //         height: 20,
                                        //         child: CircularProgressIndicator(
                                        //           strokeWidth: 1,
                                        //         ))
                                        //     :
                                        CustomTextSimple(
                                          text:
                                              "₹${double.parse(cartController.cartSubTotal.value).toInt()}",
                                          // "₹${double.parse(cartController.cartNewPrice.value).toInt()}",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    // getheight(context, 0.010),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     const CustomTextSimple(
                                    //       text: "Tax",
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //     ),
                                    //     // cartController.isCouponApplied.value
                                    //     //     ? const SizedBox(
                                    //     //         width: 20,
                                    //     //         height: 20,
                                    //     //         child: CircularProgressIndicator(
                                    //     //           strokeWidth: 1,
                                    //     //         ))
                                    //     //     :
                                    //     CustomTextSimple(
                                    //       text:
                                    //           "₹${double.parse(cartController.cartTotalTax.value).toInt()}",
                                    //       // "₹${double.parse(cartController.cartNewPrice.value).toInt()}",
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //     ),
                                    //   ],
                                    // ),
                                    // getheight(context, 0.010),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     CustomTextSimple(
                                    //       text: "Price",
                                    //       color: greyColor,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //     ),
                                    //     CustomTextSimple(
                                    //       text:
                                    //           "₹${cartController.cartSubTotal.value}",
                                    //       color: greyColor,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //       decoration: TextDecoration.lineThrough,
                                    //     ),
                                    //   ],
                                    // ),
                                    getheight(context, 0.010),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextSimple(
                                          text: "Delivery Charges",
                                          color: greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        Row(
                                          children: [
                                            cartController.deliveryChargeStatus
                                                        .value !=
                                                    "Yes"
                                                ? CustomTextSimple(
                                                    text: "Free",
                                                    color: greenColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : const SizedBox.shrink(),
                                            getwidth(context, 0.020),
                                            CustomTextSimple(
                                              text:
                                                  "₹${cartController.deliveryCharge.value}",
                                              color: greyColor,
                                              decoration: cartController
                                                          .deliveryChargeStatus
                                                          .value !=
                                                      "Yes"
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    getheight(context, 0.010),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextSimple(
                                          text: "Packing Charges",
                                          color: greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        Row(
                                          children: [
                                            cartController.packingChargeStatus
                                                        .value ==
                                                    "Yes"
                                                ? CustomTextSimple(
                                                    text: "Free",
                                                    color: greenColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : const SizedBox.shrink(),
                                            getwidth(context, 0.020),
                                            CustomTextSimple(
                                              text:
                                                  "₹${cartController.packingCharge.value}",
                                              color: greyColor,
                                              decoration: cartController
                                                          .packingChargeStatus
                                                          .value ==
                                                      "Yes"
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // getheight(context, 0.020),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     CustomTextSimple(
                                    //       text: "GST(18%)",
                                    //       color: appColorBlack,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //     ),
                                    //     CustomTextSimple(
                                    //       text:
                                    //           "₹ ${((int.parse(cartController.cartNewPrice.value)) * 18) / 100}",
                                    //       color: appColorBlack,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w700,
                                    //     ),
                                    //   ],
                                    // )
                                    getheight(context, 0.020),

                                    ///this is Dele charge
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextSimple(
                                          text: "Coupon",
                                          color: appColorBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        cartController.couponAmount.isNotEmpty
                                            ? CustomTextSimple(
                                                text: cartController
                                                            .disCountType
                                                            .value ==
                                                        "item"
                                                    ? cartController
                                                        .couponName.value
                                                    : "₹ ${cartController.couponAmount.value} off",
                                                color: appColorBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              )
                                            : CustomTextSimple(
                                                text: "No Coupon Applied",
                                                color: appColorBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                      ],
                                    ),
                                    userUtilityController
                                                .userWalletBalance.value !=
                                            "0"
                                        ? getheight(context, 0.020)
                                        : const SizedBox.shrink(),
                                    userUtilityController
                                                .userWalletBalance.value !=
                                            "0"
                                        ? !userUtilityController
                                                .isUsingWallet.value
                                            ? ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            greenColor)),
                                                onPressed: () {
                                                  userUtilityController
                                                      .isUsingWallet
                                                      .value = true;

                                                  print(cartController
                                                      .totalAfterCoupon.value);
                                                  print(cartController
                                                      .cartNewPrice.value);
                                                  print(userUtilityController
                                                      .userWalletBalance.value);
                                                  walletApplied();
                                                  print(
                                                      "this is wallet total cut ${categoryController.walletTotalCut.value}");
                                                  print(
                                                      "this is wallet having ${categoryController.havingTotalWallet.value}");
                                                  print(
                                                      "this is user to pay ${categoryController.userToPay.value}");
                                                  // if (cartController
                                                  //     .couponAmount.isNotEmpty) {
                                                  //   print("coupon applied");
                                                  // } else {
                                                  //   if (int.parse(
                                                  //           userUtilityController
                                                  //               .userWalletBalance
                                                  //               .value) <
                                                  //       int.parse(cartController
                                                  //           .cartNewPrice
                                                  //           .value)) {
                                                  //     print("wallet cut");
                                                  //     categoryController
                                                  //             .walletTotalCut
                                                  //             .value =
                                                  //         userUtilityController
                                                  //             .userWalletBalance
                                                  //             .value;
                                                  //     print("having in wallet");
                                                  //     categoryController
                                                  //         .havingTotalWallet
                                                  //         .value = "0";
                                                  //     print("to pay");
                                                  //     categoryController.userToPay
                                                  //         .value = (int.parse(
                                                  //                 cartController
                                                  //                     .cartNewPrice
                                                  //                     .value) -
                                                  //             int.parse(
                                                  //                 userUtilityController
                                                  //                     .userWalletBalance
                                                  //                     .value))
                                                  //         .toString();
                                                  //   } else {
                                                  //     print("wallet cut");
                                                  //     categoryController
                                                  //             .walletTotalCut
                                                  //             .value =
                                                  //         cartController
                                                  //             .cartNewPrice.value;
                                                  //     print("having in wallet");
                                                  //     categoryController
                                                  //         .havingTotalWallet
                                                  //         .value = (int.parse(
                                                  //                 userUtilityController
                                                  //                     .userWalletBalance
                                                  //                     .value) -
                                                  //             int.parse(
                                                  //                 cartController
                                                  //                     .cartNewPrice
                                                  //                     .value))
                                                  //         .toString();
                                                  //     print("to pay ");
                                                  //     categoryController
                                                  //         .userToPay.value = "0";
                                                  //   }
                                                  // }
                                                },
                                                child: CustomTextCard(
                                                  text: "Wanaa use wallet?",
                                                  color: whiteColor,
                                                ),
                                              )
                                            // ? InkWell(
                                            //     onTap: () {},
                                            //     child: Container(
                                            //       padding: const EdgeInsets.all(10),
                                            //       margin: const EdgeInsets.all(10),
                                            //       decoration: BoxDecoration(
                                            //           color: purpleDarkColor
                                            //               .withOpacity(0.2),
                                            //           borderRadius:
                                            //               BorderRadius.circular(20)),
                                            //       child: CustomTextCard(
                                            //         text: "Wanaa use wallet?",
                                            //         color: purpleDarkColor,
                                            //       ),
                                            //     ),
                                            //   )
                                            // TextButton(
                                            //     onPressed: () {},
                                            //     child: )

                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      // userUtilityController
                                                      //     .isUsingWallet
                                                      //     .value = false;
                                                    },
                                                    child: CustomTextSimple(
                                                      text: "Wallet Applied",
                                                      color: appColorBlack,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  // cartController.couponAmount
                                                  //         .isNotEmpty
                                                  //     ? CustomTextSimple(
                                                  //         text: cartController
                                                  //                     .disCountType
                                                  //                     .value ==
                                                  //                 "item"
                                                  //             ? cartController
                                                  //                 .couponName
                                                  //                 .value
                                                  //             : "₹ ${cartController.couponAmount.value} off",
                                                  //         color: appColorBlack,
                                                  //         fontSize: 14,
                                                  //         fontWeight:
                                                  //             FontWeight.w700,
                                                  //       )
                                                  //     :
                                                  CustomTextSimple(
                                                    text:
                                                        "- ₹ ${categoryController.walletTotalCut.value}",
                                                    color: appColorBlack,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ],
                                              )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomTextSimple(
                                      text: "To Pay",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    cartController.isCouponApplied.value
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 1,
                                            ))
                                        : CustomTextSimple(
                                            text: userUtilityController.isUsingWallet.value
                                                ? "₹${double.parse(categoryController.userToPay.value).toInt()}"
                                                : cartController.couponAmount.isNotEmpty
                                                ? "₹${double.parse(cartController.totalAfterCoupon.value).toInt()}"
                                            : cartController.deliveryChargeStatus.value == "No"?
                                            "₹${double.parse(cartController.cartSubTotal.value).toInt()}"

                                                : "₹${(double.parse(cartController.cartNewPrice.value) + double.parse(cartController.deliveryCharge.value)).toInt()}",
                                                // : "₹${cartController.addDelevry.value}",
                                            // text:
                                            //     "₹${int.parse(cartController.cartNewPrice.value) + (((int.parse(cartController.cartNewPrice.value)) * 18) / 100)}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: greyColor.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          // height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 8, bottom: 8),
                            child: CustomTextSimple(
                              text: categoryController.note.value,
                              overflow: TextOverflow.visible,
                              fontSize: 14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        getheight(context, 0.020),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cartController.isCouponApplied.value
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ))
                                  : CustomTextRich(
                                      text: "Product saving ",
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                      children: [
                                        TextSpan(
                                          text:
                                              "₹${cartController.totalSavedAmount.value}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: greenColor),
                                        )
                                      ],
                                    ),
                              getheight(context, 0.002),
                              cartController.couponAmount.isNotEmpty
                                  ? cartController.isCouponApplied.value
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                          ))
                                      : CustomTextRich(
                                          text:
                                              // cartController.disCountType.value ==
                                              //         "cashback"
                                              //     ? "CashBack Saving "
                                              //     : "Rupee Save ",
                                              cartController
                                                          .disCountType.value ==
                                                      "fix"
                                                  ? "Coupon cashback "
                                                  : cartController.disCountType
                                                              .value ==
                                                          "item"
                                                      ? "Coupon ${cartController.couponName.value} saving "
                                                      : "Rupee Save ",
                                          textAlign: TextAlign.center,
                                          fontSize: 15,
                                          children: [
                                            TextSpan(
                                                text:
                                                    "₹${cartController.couponPrice.value}",
                                                // "₹${double.parse(cartController.cartNewPrice.value).toInt() - double.parse(cartController.totalAfterCoupon.value).toInt()}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: greenColor))
                                          ],
                                        )
                                  : const SizedBox.shrink(),
                              getheight(context, 0.002),
                              cartController.deliveryChargeStatus.value != "Yes"
                                  ? CustomTextRich(
                                      text: "Free delivery Saving ",
                                      fontSize: 15,
                                      children: [
                                        TextSpan(
                                            text:
                                                "₹${cartController.deliveryCharge.value}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: greenColor))
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              // const CustomTextSimple(
                              //   text: "Disclaimer",
                              //   fontSize: 15,
                              //   fontWeight: FontWeight.w600,
                              // ),
                              // getheight(context, 0.005),
                              // CustomTextSimple(
                              //   text:
                              //       "Weights shown are indicative. You will be billed as per actual weight delivered.",
                              //   fontSize: 12,
                              //   fontWeight: FontWeight.w500,
                              //   color: appColorBlack.withOpacity(0.6),
                              //   overflow: TextOverflow.visible,
                              // )
                            ],
                          ),
                        ),
                        // getheight(context, 0.020),
                        // Container(
                        //   padding: const EdgeInsets.all(12),
                        //   decoration: BoxDecoration(
                        //       color: greenColor.withOpacity(0.2),
                        //       borderRadius: BorderRadius.circular(15)),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const CustomTextSimple(
                        //         text: "Disclaimer",
                        //         fontSize: 15,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //       getheight(context, 0.005),
                        //       CustomTextSimple(
                        //         text: categoryController.disclaimer.value,
                        //         fontSize: 13,
                        //         fontWeight: FontWeight.w600,
                        //         color: appColorBlack.withOpacity(0.6),
                        //         overflow: TextOverflow.visible,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        getheight(context, 0.020),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        // Row(
                        //   children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: CustomTextSimple(
                            text: "Billing Address",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Bounceable(
                        //     onTap: () async {
                        //       await cartController.getAddress();
                        //     },
                        //     //     child: const Icon(Icons.refresh))
                        //   ],
                        // ),
                        // Bounceable(
                        //   onTap: () {
                        //     Future.delayed(const Duration(microseconds: 150),
                        //         () {
                        //       setState(() {
                        //         isAddresAdd = !isAddresAdd;
                        //       });
                        //     });
                        //   },
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.only(left: 15.0, right: 15),
                        //     child: Container(
                        //       padding:
                        //           const EdgeInsets.only(left: 8, right: 8),
                        //       decoration: BoxDecoration(
                        //           color: blueColor,
                        //           borderRadius: BorderRadius.circular(15),
                        //           boxShadow: [
                        //             BoxShadow(
                        //                 offset: const Offset(0.5, 0.5),
                        //                 color: appColorBlack,
                        //                 blurRadius: 0.5)
                        //           ]),
                        //       child: CustomTextRich(
                        //         text: "+",
                        //         fontSize: 16,
                        //         color: whiteColor,
                        //         fontWeight: FontWeight.w600,
                        //         children: const [
                        //           TextSpan(
                        //               text: " Add Addresss",
                        //               style: TextStyle())
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //   ],
                        // ),
                        getheight(context, 0.010),

                        // !cartController.addressList.isNotEmpty
                        //     ? Center(
                        //         child: Column(
                        //           children: [
                        //             getheight(context, 0.020),
                        //             const CustomTextSimple(
                        //               text: "No Address Found",
                        //               fontSize: 15,
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     : Obx(
                        //         () => SizedBox(
                        //           height: Get.height * 0.18,
                        //           child: ListView.builder(
                        //               scrollDirection: Axis.horizontal,
                        //               itemCount:
                        //                   cartController.addressList.length,
                        //               itemBuilder: (context, index) => Bounceable(
                        //                     onTap: () {
                        //                       print(
                        //                           "this is address before ${cartController.selectedAddressIndex.value}");
                        //                       cartController.selectedAddressIndex
                        //                           .value = index;

                        //                       setState(() {
                        //                         addressIndex = index;
                        //                       });
                        //                       print(
                        //                           "this is after before ${cartController.selectedAddressIndex.value}");
                        //                     },
                        //                     child: Container(
                        //                       margin: const EdgeInsets.all(8),
                        //                       padding: const EdgeInsets.all(
                        //                         8,
                        //                       ),
                        //                       decoration: BoxDecoration(
                        //                           color: whiteColor,
                        //                           borderRadius:
                        //                               BorderRadius.circular(15),
                        //                           border: addressIndex == index
                        //                               ? Border.all(
                        //                                   width: 0.8,
                        //                                   color: greenColor)
                        //                               : null),
                        //                       width: Get.width * 0.40,
                        //                       height: Get.height * 0.15,
                        //                       child: Column(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           CustomTextSimple(
                        //                             text: cartController
                        //                                 .addressList[index].name
                        //                                 .toUpperCase(),
                        //                             fontSize: 15,
                        //                             fontWeight: FontWeight.w700,
                        //                           ),
                        //                           getheight(context, 0.005),
                        //                           CustomTextSimple(
                        //                             text:
                        //                                 "${cartController.addressList[index].address}, ${cartController.addressList[index].state}, ${cartController.addressList[index].city}, ${cartController.addressList[index].pincode}",
                        //                             fontSize: 12,
                        //                             overflow:
                        //                                 TextOverflow.ellipsis,
                        //                             maxLines: 3,
                        //                           ),
                        //                           getheight(context, 0.010),
                        //                           CustomTextSimple(
                        //                             text: cartController
                        //                                 .addressList[index].phone,
                        //                             fontSize: 12,
                        //                             fontWeight: FontWeight.w600,
                        //                           )
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   )),
                        //         ),
                        //       ),
                        // isAddresAdd
                        //     ?
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            // elevation: 4,
                            child: Column(
                              children: [
                                getheight(context, 0.010),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addNameController,
                                  categoryController: categoryController,
                                  fieldName: "Name :",
                                  hint: "Enter Name",
                                ),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addHouseNumController,
                                  categoryController: categoryController,
                                  fieldName: "House No. :",
                                  hint: "Enter House Number",
                                  keyboardType: TextInputType.text,
                                ),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addAddressController,
                                  categoryController: categoryController,
                                  fieldName: "Address :",
                                  hint: "Enter Address",
                                ),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.pincodeController,
                                  categoryController: categoryController,
                                  fieldName: "Pin Code :",
                                  hint: "Enter Pin Code",
                                  onChanged: (p0) {
                                    if (p0.isNotEmpty && p0.length < 6) {
                                      setState(() {
                                        isPincodeCorrect = true;
                                        isGowithPin = false;
                                        categoryController
                                            .addCityController.text = "";
                                        categoryController
                                            .addStateController.text = "";
                                      });
                                    } else {
                                      setState(() {
                                        isPincodeCorrect = false;
                                        categoryController
                                            .addCityController.text = "";
                                        categoryController
                                            .addStateController.text = "";
                                      });
                                    }
                                    if (p0.isEmpty) {
                                      isGowithPin = false;
                                      categoryController
                                          .addCityController.text = "";
                                      categoryController
                                          .addStateController.text = "";
                                    }
                                    if (p0.length == 6) {
                                      if (!cartController.pinCodes
                                          .contains(p0)) {
                                        setState(() {
                                          isGowithPin = true;
                                          categoryController
                                              .addCityController.text = "";
                                          categoryController
                                              .addStateController.text = "";
                                        });
                                      } else {
                                        print("correct");
                                        for (PinCodeModel pincode
                                            in cartController.pinCodeList) {
                                          if (pincode.pincode ==
                                              categoryController
                                                  .pincodeController.text) {
                                            categoryController.addCityController
                                                .text = pincode.city!;
                                            categoryController
                                                .addStateController
                                                .text = pincode.state!;
                                          }
                                        }
                                      }
                                      // for (int i = 0;
                                      //     i <= cartController.pinCodeList.length;
                                      //     i++) {
                                      //   if (int.parse(cartController
                                      //               .pinCodeList[i].pincode)
                                      //           .toInt() ==
                                      //       int.parse(p0)) {
                                      //     print("thishdf");
                                      //   } else {
                                      //     print("object");
                                      //   }
                                      // }
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                ),
                                isPincodeCorrect
                                    ? CustomTextSimple(
                                        text: "Please Enter 6 Digit PinCode",
                                        fontSize: 12,
                                        color: redDarkColor,
                                      )
                                    : const SizedBox.shrink(),
                                isGowithPin
                                    ? CustomTextSimple(
                                        text:
                                            "We have not delivery partner at given pincode",
                                        fontSize: 12,
                                        color: redDarkColor,
                                      )
                                    : const SizedBox.shrink(),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addCityController,
                                  categoryController: categoryController,
                                  fieldName: "City :",
                                  hint: "Enter City",
                                ),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addStateController,
                                  categoryController: categoryController,
                                  fieldName: "State :",
                                  hint: "Enter State",
                                ),
                                // categoryController.pincodeController.text.isNotEmpty
                                //              ||
                                //         categoryController
                                //                 .pincodeController.text.length <
                                //             6
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addPhoneController,
                                  categoryController: categoryController,
                                  fieldName: "Phone No. :",
                                  hint: "Enter Phone Number",
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                ),
                                CustomBillingTextFormField(
                                  controller:
                                      categoryController.addEmailController,
                                  categoryController: categoryController,
                                  fieldName: "Email :",
                                  hint: "Enter Email address",
                                  // inputFormatters: [
                                  //   LengthLimitingTextInputFormatter(10),
                                  //   FilteringTextInputFormatter.digitsOnly
                                  // ],
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                cartController.isUserNew.value
                                    ? CustomBillingTextFormField(
                                        controller: categoryController
                                            .addReferCodeController,
                                        categoryController: categoryController,
                                        fieldName: "Referral :",
                                        hint: "Enter Referral Code",
                                        // inputFormatters: [
                                        //   LengthLimitingTextInputFormatter(10),
                                        //   FilteringTextInputFormatter.digitsOnly
                                        // ],
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      )
                                    : const SizedBox.shrink(),
                                // getheight(context, 0.010),
                                // Center(
                                //     child: SizedBox(
                                //   width: Get.width * 0.80,
                                //   height: Get.height * 0.045,
                                //   child: TextFormField(
                                //     style: const TextStyle(
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500),
                                //     textCapitalization: TextCapitalization.words,
                                //     keyboardType: TextInputType.number,
                                //     controller:
                                //         categoryController.addHouseNumController,
                                //     decoration: InputDecoration(
                                //       icon: Icon(
                                //         Icons.numbers,
                                //         color: blueDarkColor,
                                //       ),
                                //       contentPadding: const EdgeInsets.symmetric(
                                //           vertical: 8, horizontal: 10),
                                //       labelText: "House No. / Flat No.",
                                //       labelStyle: TextStyle(color: greyColor),
                                //       focusedBorder: const OutlineInputBorder(
                                //         borderSide: BorderSide(),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(10.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )),
                                // getheight(context, 0.010),
                                // Center(
                                //     child: SizedBox(
                                //   width: Get.width * 0.80,
                                //   height: Get.height * 0.055,
                                //   child: TextFormField(
                                //     style: const TextStyle(
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500),
                                //     textCapitalization: TextCapitalization.words,
                                //     controller:
                                //         categoryController.addAddressController,
                                //     decoration: InputDecoration(
                                //       icon: Icon(
                                //         Icons.roundabout_left,
                                //         color: blueDarkColor,
                                //       ),
                                //       contentPadding: const EdgeInsets.symmetric(
                                //           vertical: 8, horizontal: 10),
                                //       labelText: "Address",
                                //       labelStyle: TextStyle(color: greyColor),
                                //       focusedBorder: const OutlineInputBorder(
                                //         borderSide: BorderSide(),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(10.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )),
                                // getheight(context, 0.010),
                                // Center(
                                //     child: SizedBox(
                                //   width: Get.width * 0.80,
                                //   height: Get.height * 0.055,
                                //   child: TextFormField(
                                //     style: const TextStyle(
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500),
                                //     textCapitalization: TextCapitalization.words,
                                //     controller:
                                //         categoryController.addCityController,
                                //     decoration: InputDecoration(
                                //       icon: Icon(
                                //         Icons.location_city_rounded,
                                //         color: blueDarkColor,
                                //       ),
                                //       contentPadding: const EdgeInsets.symmetric(
                                //           vertical: 8, horizontal: 10),
                                //       labelText: "City",
                                //       labelStyle: TextStyle(color: greyColor),
                                //       focusedBorder: const OutlineInputBorder(
                                //         borderSide: BorderSide(),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(10.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )),
                                // getheight(context, 0.010),
                                // Center(
                                //     child: SizedBox(
                                //   width: Get.width * 0.80,
                                //   height: Get.height * 0.055,
                                //   child: TextFormField(
                                //     style: const TextStyle(
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500),
                                //     textCapitalization: TextCapitalization.words,
                                //     controller:
                                //         categoryController.addStateController,
                                //     decoration: InputDecoration(
                                //       icon: Icon(
                                //         Icons.roller_shades_rounded,
                                //         color: blueDarkColor,
                                //       ),
                                //       contentPadding: const EdgeInsets.symmetric(
                                //           vertical: 8, horizontal: 10),
                                //       labelText: "State",
                                //       labelStyle: TextStyle(color: greyColor),
                                //       focusedBorder: const OutlineInputBorder(
                                //         borderSide: BorderSide(),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(10.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )),
                                // getheight(context, 0.010),
                                // Center(
                                //     child: SizedBox(
                                //   width: Get.width * 0.80,
                                //   height: Get.height * 0.055,
                                //   child: TextFormField(
                                //     style: const TextStyle(
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500),
                                //     inputFormatters: [
                                //       LengthLimitingTextInputFormatter(6),
                                //       FilteringTextInputFormatter.digitsOnly
                                //     ],
                                //     keyboardType: TextInputType.number,
                                //     controller:
                                //         categoryController.pincodeController,
                                //     decoration: InputDecoration(
                                //       icon: Icon(
                                //         Icons.code_rounded,
                                //         color: blueDarkColor,
                                //       ),
                                //       contentPadding: const EdgeInsets.symmetric(
                                //           vertical: 8, horizontal: 10),
                                //       labelText: "Pin Code",
                                //       labelStyle: TextStyle(color: greyColor),
                                //       focusedBorder: const OutlineInputBorder(
                                //         borderSide: BorderSide(),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(10.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )),
                                // getheight(context, 0.010),
                                // Center(
                                //   child: SizedBox(
                                //     width: Get.width * 0.80,
                                //     height: Get.height * 0.055,
                                //     child: TextFormField(
                                //       style: const TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.w500),
                                //       inputFormatters: [
                                //         LengthLimitingTextInputFormatter(10),
                                //         FilteringTextInputFormatter.digitsOnly
                                //       ],
                                //       keyboardType: TextInputType.number,
                                //       controller:
                                //           categoryController.addPhoneController,
                                //       decoration: InputDecoration(
                                //         icon: Icon(
                                //           Icons.phone,
                                //           color: blueDarkColor,
                                //         ),
                                //         contentPadding:
                                //             const EdgeInsets.symmetric(
                                //                 vertical: 8, horizontal: 10),
                                //         labelText: "Phone Number",
                                //         labelStyle: TextStyle(color: greyColor),
                                //         focusedBorder: OutlineInputBorder(
                                //           borderSide:
                                //               BorderSide(color: greyColor),
                                //           borderRadius: const BorderRadius.all(
                                //             Radius.circular(10.0),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                getheight(context, 0.010),
                                Stack(
                                  children: [
                                    // Align(
                                    //   alignment: Alignment.center,
                                    //   child: ElevatedButton(
                                    //       style: ButtonStyle(
                                    //           elevation:
                                    //               const MaterialStatePropertyAll(
                                    //                   3),
                                    //           backgroundColor:
                                    //               MaterialStatePropertyAll(
                                    //                   blueDarkColor)),
                                    //       onPressed: () async {
                                    //         if (categoryController
                                    //             .addNameController.text.isEmpty) {
                                    //           customeToast("Please Enter Name");
                                    //         }
                                    //         // else if (categoryController
                                    //         //         .addPhoneController
                                    //         //         .text
                                    //         //         .length >=
                                    //         //     10) {
                                    //         //   customeToast(
                                    //         //       "Please Enter 10 digit Phone Number");
                                    //         // }
                                    //         else if (categoryController
                                    //             .addHouseNumController
                                    //             .text
                                    //             .isEmpty) {
                                    //           customeToast(
                                    //               "Please Enter House No. / Flat No.");
                                    //         } else if (categoryController
                                    //             .addAddressController
                                    //             .text
                                    //             .isEmpty) {
                                    //           customeToast(
                                    //               "Please Enter Address");
                                    //         } else if (categoryController
                                    //             .addCityController.text.isEmpty) {
                                    //           customeToast("Please Enter City");
                                    //         } else if (categoryController
                                    //             .addStateController
                                    //             .text
                                    //             .isEmpty) {
                                    //           customeToast("Please Enter State");
                                    //         } else if (categoryController
                                    //             .pincodeController.text.isEmpty) {
                                    //           customeToast(
                                    //               "Please Enter Pincode");
                                    //         } else if (categoryController
                                    //             .addPhoneController
                                    //             .text
                                    //             .isEmpty) {
                                    //           customeToast(
                                    //               "Please Enter Phone Number");
                                    //         } else {
                                    //           await categoryController
                                    //               .addAddresses();
                                    //           setState(() {
                                    //             isAddresAdd = !isAddresAdd;
                                    //           });
                                    //         }
                                    //       },
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 12.0, right: 12),
                                    //         child: CustomTextSimple(
                                    //           text: "Add",
                                    //           fontSize: 18,
                                    //           fontWeight: FontWeight.w600,
                                    //           color: whiteColor,
                                    //         ),
                                    //       )),
                                    // ),
                                    Obx(
                                      () => Align(
                                          alignment: Alignment.center,
                                          child: cartController
                                                  .realTimeAddress.isNotEmpty
                                              ? Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              right: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomTextSimple(
                                                            text:
                                                                "Current address: ",
                                                            fontSize: 13,
                                                            color:
                                                                appColorTextLight,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.52,
                                                            child:
                                                                CustomTextSimple(
                                                              text: cartController
                                                                  .realTimeAddress
                                                                  .value,
                                                              fontSize: 12,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    getheight(context, 0.010),
                                                    cartController
                                                            .isLookingForLocation
                                                            .value
                                                        ? const CircularProgressIndicator()
                                                        : GetLocation(
                                                            cartController:
                                                                cartController)
                                                  ],
                                                )
                                              : cartController
                                                      .isLookingForLocation
                                                      .value
                                                  ? const CircularProgressIndicator()
                                                  : GetLocation(
                                                      cartController:
                                                          cartController)),
                                    ),
                                    const Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 20.0),
                                          child: Column(
                                            children: [
                                              // Bounceable(
                                              //   onTap: () {},
                                              //   child: Icon(
                                              //     Bootstrap.geo_alt_fill,
                                              //     color: redColor,
                                              //     // color: greenDarkColor,
                                              //     shadows: [
                                              //       Shadow(
                                              //           blurRadius: 2,
                                              //           color: appColorBlack
                                              //               .withOpacity(0.2),
                                              //           offset:
                                              //               const Offset(1, 1))
                                              //     ],
                                              //   ),
                                              // ),
                                              // CustomTextSimple(
                                              //   text: "Change",
                                              //   fontSize: 12,
                                              //   fontWeight: FontWeight.w800,
                                              //   color: redColor,
                                              //   // color: greenColor,
                                              // )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                getheight(context, 0.020)
                              ],
                            ),
                          ),
                        ),
                        // : const SizedBox.shrink(),
                        getheight(context, 0.020),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: CustomTextSimple(
                            text: "Select Payment Method",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: greenColor.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: CustomTextSimple(
                                      text: 'Cash on Delivery',
                                      fontSize: 17,
                                      color: selectedOption == 1
                                          ? greenColor
                                          : appblueColor,
                                      fontWeight: selectedOption == 1
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    ),
                                    leading: Radio(
                                      activeColor: greenColor,
                                      value: 1,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                          print("Button value: $value");
                                        });
                                        categoryController.paymentMethod.value =
                                            "COD";
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: CustomTextSimple(
                                      text: 'Online Payment',
                                      fontSize: 17,
                                      color: selectedOption == 2
                                          ? greenColor
                                          : appblueColor,
                                      fontWeight: selectedOption == 2
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    ),
                                    leading: Radio(
                                      activeColor: greenColor,
                                      value: 2,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                          print("Button value: $value");
                                        });
                                        categoryController.paymentMethod.value =
                                            "";
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: const WidgetStatePropertyAll(3),
                                  backgroundColor:
                                      WidgetStatePropertyAll(blueDarkColor)),
                              onPressed: () async {
                                if (categoryController
                                    .addNameController.text.isEmpty) {
                                  customeToast("Please Enter Name");
                                }
                                // else if (categoryController
                                //         .addPhoneController
                                //         .text
                                //         .length >=
                                //     10) {
                                //   customeToast(
                                //       "Please Enter 10 digit Phone Number");
                                // }
                                else if (categoryController
                                    .addHouseNumController.text.isEmpty) {
                                  customeToast(
                                      "Please Enter House No. / Flat No.");
                                } else if (categoryController
                                    .addAddressController.text.isEmpty) {
                                  customeToast("Please Enter Address");
                                } else if (categoryController
                                    .addCityController.text.isEmpty) {
                                  customeToast("Please Enter City");
                                } else if (categoryController
                                    .addStateController.text.isEmpty) {
                                  customeToast("Please Enter State");
                                } else if (categoryController
                                    .pincodeController.text.isEmpty) {
                                  customeToast("Please Enter Pincode");
                                } else if (categoryController
                                    .addPhoneController.text.isEmpty) {
                                  customeToast("Please Enter Phone Number");
                                } else if (categoryController
                                        .addPhoneController.text.length <
                                    10) {
                                  customeToast(
                                      "Please Enter 10 digit Phone Number");
                                } else if (categoryController
                                    .addEmailController.text.isEmpty) {
                                  customeToast("Please Enter Email Address");
                                } else if (isGowithPin == true) {
                                  customeToast(
                                      "Our delivery partner is not available at this pin code");
                                } else if (selectedOption == 1) {
                                  // Get.off(() => const OrderConfirmPage());
                                  if (cartController
                                      .cartNewPrice.value.isNotEmpty) {
                                    if (double.parse(cartController
                                                .cartNewPrice.value)
                                            .toInt() <=
                                        double.parse(categoryController
                                                .minimumCartValue.value)
                                            .toInt()) {
                                      customeToast(
                                          "Minimum ₹${categoryController.minimumCartValue.value} required to procced");
                                    } else {
                                      await categoryController.confirmOrder();
                                      userUtilityController
                                          .isUsingWallet.value = false;
                                      categoryController.walletTotalCut.value =
                                          '';
                                      categoryController
                                          .havingTotalWallet.value = '';
                                      categoryController.userToPay.value = '';
                                    }
                                  }
                                } else if (selectedOption == 2) {
                                  customeToast("This feature is comming soon.");
                                } else {
                                  customeToast("Please Select Payment method ");
                                }
                                //  {
                                //               await categoryController
                                //                   .addAddresses();
                                //               setState(() {
                                //                 isAddresAdd = !isAddresAdd;
                                //               });
                                //             }

                                // if (selectedOption == 1) {
                                //   // Get.off(() => const OrderConfirmPage());
                                //   if (cartController
                                //       .cartNewPrice.value.isNotEmpty) {
                                //     if (int.parse(
                                //             cartController.cartNewPrice.value) <=
                                //         149) {
                                //       customeToast(
                                //           "Minimum ₹149 required to procced");
                                //     } else {
                                //       Get.offAll(() => const OrderConfirmPage());
                                //     }
                                //   }
                                // } else if (selectedOption == 2) {
                                //   customeToast("This feature is comming soon.");
                                // } else {
                                //   customeToast("Please Select Payment method ");
                                // }
                                // }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12),
                                child: CustomTextSimple(
                                  text: "Continue",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor,
                                ),
                              )),
                        ),
                        getheight(context, 0.010),
                        // Center(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       // ElevatedButton(
                        //       //     onPressed: () {
                        //       //       Get.off(() => const AddressPage());
                        //       //     },
                        //       //     child: const CustomTextSimple(
                        //       //       text: "Add address",
                        //       //       fontSize: 15,
                        //       //     )),
                        //       ElevatedButton(
                        //           style: ButtonStyle(
                        //               elevation:
                        //                   const MaterialStatePropertyAll(3),
                        //               backgroundColor: MaterialStatePropertyAll(
                        //                   blueDarkColor)),
                        //           onPressed: () {
                        //             // categoryController.isAddressSave.value == true
                        //             //     ? Get.off(() => const OrderConfirmPage())
                        //             // :

                        //             // categoryController.islogin.value == true
                        //             //     ? Get.to(() => const AddressPage())
                        //             //     : Get.to(() => const SignInPage(
                        //             //           isGuest: false,
                        //             //         ));

                        //             Get.offAll(() => const PaymentPage());
                        //           },
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(
                        //                 left: 12.0, right: 12),
                        //             child: CustomTextSimple(
                        //               text: "Continue Order",
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w600,
                        //               color: whiteColor,
                        //             ),
                        //           )),
                        //     ],
                        //   ),
                        // ),
                        // const CustomTextSimple(
                        //   text: "Saving ₹154.62",
                        //   fontSize: 15,
                        //   fontWeight: FontWeight.w600,
                        // ),
                        // getheight(context, 0.010),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: greenColor.withOpacity(0.2),
                        //       borderRadius: BorderRadius.circular(15)),
                        //   // height: 20,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 20.0, right: 20, top: 8, bottom: 8),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         CustomTextSimple(
                        //           text: "VIP Discount",
                        //           fontSize: 14,
                        //           color: greenColor,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //         CustomTextSimple(
                        //           text: "₹154.62",
                        //           fontSize: 14,
                        //           color: greenColor,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        getheight(context, 0.010),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                          'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      const CustomTextSimple(
                        text: "Your cart is Empty",
                        fontSize: 20,
                      ),
                      const CustomTextSimple(
                        text: "Select Products",
                        // fontSize: 15,
                      ),
                      getheight(context, 0.020),
                      ElevatedButton(
                          style: ButtonStyle(
                              elevation: const WidgetStatePropertyAll(3),
                              backgroundColor:
                                  WidgetStatePropertyAll(blueDarkColor)),
                          onPressed: () {
                            Get.offAll(const HomePage());
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: CustomTextSimple(
                              text: "Chooose Products",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            ),
                          ))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class GetLocation extends StatelessWidget {
  const GetLocation({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bounceable(
          onTap: () async {
            // log('object');
            await cartController.getLocation();
            Get.to(() => const MapSample());
          },
          child: Icon(
            Bootstrap.globe_asia_australia,
            color: blueDarkColor,
            // color: greenDarkColor,
            shadows: [
              Shadow(
                  blurRadius: 2,
                  color: appColorBlack.withOpacity(0.2),
                  offset: const Offset(1, 1))
            ],
          ),
        ),
        CustomTextSimple(
          text: "Map",
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: blueDarkColor,
          // color: greenColor,
        )
      ],
    );
  }
}

class CustomBillingTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? fieldName;
  final String? hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  const CustomBillingTextFormField(
      {super.key,
      required this.categoryController,
      required this.controller,
      required this.fieldName,
      required this.hint,
      this.keyboardType,
      this.inputFormatters,
      this.onChanged});

  final CategoryController categoryController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.80,
        height: Get.height * 0.045,
        child: TextFormField(
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.words,
          keyboardType: keyboardType ?? TextInputType.streetAddress,
          controller: controller,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: SizedBox(
              width: Get.width * 0.20,
              child: CustomTextSimple(
                text: fieldName,
                fontSize: 14,
                color: blueDarkColor,
              ),
            ),
            // Icon(
            //   Icons.person,
            //   color: blueDarkColor,
            // ),
            hintText: hint,

            contentPadding:
                const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
            // label: Text("data"),
            // labelText: "Name",
            // labelStyle: TextStyle(
            //   color: greyColor,
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
