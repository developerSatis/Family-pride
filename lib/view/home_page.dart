import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_bottom_bar.dart';
import 'package:hindustan_food/custom_utils/custom_carousel.dart';
import 'package:hindustan_food/custom_widget/buttom_cart_widget.dart';
import 'package:hindustan_food/custom_widget/custom_card_widget.dart';
import 'package:hindustan_food/custom_widget/custom_category_widget.dart';
import 'package:hindustan_food/custom_widget/custom_deals_widget.dart';
import 'package:hindustan_food/custom_widget/view_more_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';
import 'package:hindustan_food/view/product/product_page.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    CartController cartController = Get.put(CartController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
          backgroundColor: appbackgroundColor,
          bottomNavigationBar: const CustomBottomAppBar(index: 0),
          appBar: const CustomAppBar(
            istitle: false,
            isAddbuttonShow: true,
            appBarSubtitle: "5am to 7:30am",
            appBartitle: "Morning Delivery",
            isFreeDeliveryText: true,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Get.to(() => MyHomePage(title: "title"));
                      //     },
                      //     child: const Text("data")),
                      CarouselDemo(
                        List.generate(
                          categoryController.sliderList.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.network(
                                      categoryController
                                          .sliderList[index].image,
                                      // "https://prfreetech.com/development/hindustan_food/public/uploads/slider/${categoryController.sliderList[index].image}",
                                      fit: BoxFit.fill,
                                      height: height * 0.20,
                                      width: width * 0.95,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
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
                              ),
                            );
                          },
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Image.asset(
                      //       'assets/images/hd3.jpg',
                      //       fit: BoxFit.cover,
                      //       height: height * 0.12,
                      //       width: width * 0.95,
                      //       // height: Get.height * 0.12,
                      //       // width: Get.width * 0.95,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Image.asset(
                      //       'assets/images/hd2.webp',
                      //       fit: BoxFit.cover,
                      //       // height: Get.height * 0.12,
                      //       // width: Get.width * 0.95,
                      //       height: height * 0.12,
                      //       width: width * 0.95,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Image.asset(
                      //       'assets/images/hd1.jpg',
                      //       fit: BoxFit.cover,
                      //       // height: Get.height * 0.12,
                      //       // width: Get.width * 0.95,
                      //       height: height * 0.12,
                      //       width: width * 0.95,
                      //     ),
                      //   ),
                      // )
                      // ]),
                      // getheight(context, 0.020),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.discount,
                      //             size: 15,
                      //             color: redColor,
                      //           ),
                      //           getwidth(context, 0.010),
                      //           CustomTextRich(
                      //             text: "Flash Deal :",
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w900,
                      //             color: purpleDarkColor,
                      //             children: [
                      //               TextSpan(
                      //                 text: " Avail any 4 deals",
                      //                 style: TextStyle(
                      //                     color: purpleDarkColor,
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.w600),
                      //               )
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       // CustomTextSimple(
                      //       //   // text: "Popular Fruits And Veggies",
                      //       //   text: "Flush Deals : Avail any 4 deals",
                      //       //   fontSize: 15,
                      //       //   fontWeight: FontWeight.w800,
                      //       // ),
                      //       Container(
                      //         height: Get.height * 0.030,
                      //         width: Get.width * 0.32,
                      //         decoration: BoxDecoration(
                      //             color: purpleDarkColor,
                      //             borderRadius: BorderRadius.circular(5)),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             categoryController.endTime.value.isNotEmpty
                      //                 ? CountDownText(
                      //                     due: DateTime.parse(
                      //                         categoryController.endTime.value),
                      //                     finishedText: "Done",
                      //                     showLabel: true,
                      //                     longDateName: true,
                      //                     daysTextLong: " : ",
                      //                     hoursTextLong: " : ",
                      //                     minutesTextLong: " : ",
                      //                     secondsTextLong: "",
                      //                     style: TextStyle(
                      //                         color: whiteColor,
                      //                         fontSize: 10,
                      //                         fontWeight: FontWeight.w600),
                      //                   )
                      //                 : const SizedBox.shrink(),
                      //             getwidth(context, 0.010),
                      //             CustomTextSimple(
                      //               text: "Time Left",
                      //               fontSize: 8,
                      //               color: whiteColor,
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),

                      // getheight(context, 0.020),
                      // Container(
                      //   width: double.infinity,
                      //   height: Get.height * 0.25,
                      //   decoration: BoxDecoration(
                      //       color: blueDarkColor.withOpacity(0.2)),
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount:
                      //           categoryController.flashDealProductList.isEmpty
                      //               ? 1
                      //               : categoryController
                      //                   .flashDealProductList.length,
                      //       itemBuilder: (context, index) {
                      //         if (categoryController
                      //             .flashDealProductList.isEmpty) {
                      //           // Show shimmer loading effect when the product list is empty
                      //           return Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Shimmer.fromColors(
                      //               baseColor: Colors.grey[300]!,
                      //               highlightColor: Colors.grey[100]!,
                      //               child: Container(
                      //                 width: Get.width * 0.42,
                      //                 height: Get.height * 0.33,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           );
                      //         } else {
                      //           // Render the actual product card
                      //           return Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Row(
                      //               children: [
                      //                 getwidth(context, 0.010),
                      //                 Container(
                      //                   width: Get.width * 0.35,
                      //                   height: Get.height * 0.60,
                      //                   decoration: BoxDecoration(
                      //                       image: DecorationImage(
                      //                         fit: BoxFit.fill,
                      //                         image: NetworkImage(
                      //                             categoryController
                      //                                     .flashDealProductList
                      //                                     .isNotEmpty
                      //                                 ? categoryController
                      //                                     .flashDealProductList[
                      //                                         index]
                      //                                     .mainImageUrl
                      //                                 : ""),
                      //                       ),
                      //                       color: redColor,
                      //                       borderRadius:
                      //                           BorderRadius.circular(20)),
                      //                   child: Bounceable(
                      //                     scaleFactor: 0.5,
                      //                     onTap: () async {
                      //                       await cartController
                      //                           .addProductToCart(
                      //                               categoryController
                      //                                   .flashDealProductList[
                      //                                       index]
                      //                                   .id
                      //                                   .toString(),
                      //                               1.toString());
                      //                     },
                      //                     child: Stack(
                      //                       children: [
                      //                         // Container(
                      //                         //   decoration: BoxDecoration(
                      //                         //       color: whiteColor),
                      //                         // ),
                      //                         // Image.network(
                      //                         //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s",
                      //                         //   fit: BoxFit.cover,
                      //                         // ),
                      //                         Positioned(
                      //                           right: 1,
                      //                           bottom: 5,
                      //                           child: Card(
                      //                             color: greenColor,
                      //                             child: Padding(
                      //                               padding: EdgeInsets.only(
                      //                                 top: Get.height * 0.010,
                      //                                 bottom:
                      //                                     Get.height * 0.010,
                      //                                 left: Get.height * 0.0345,
                      //                                 right:
                      //                                     Get.height * 0.0345,
                      //                               ),
                      //                               child: CustomTextSimple(
                      //                                 text: "ADD",
                      //                                 fontSize: 10,
                      //                                 fontWeight:
                      //                                     FontWeight.w600,
                      //                                 color: whiteColor,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 getwidth(context, 0.010),
                      //                 // CustomCardWidget(
                      //                 //   onTap: () {
                      //                 //     // Get.to(() => const CartSelectionPage());
                      //                 //     Get.to(() => const ProductPage());
                      //                 //   },
                      //                 // ),
                      //                 // getwidth(context, 0.040),
                      //                 // CustomCardWidget(
                      //                 //   onTap: () {
                      //                 //     // Get.to(() => const CartSelectionPage());
                      //                 //     Get.to(() => const ProductPage());
                      //                 //   },
                      //                 // ),
                      //                 // getwidth(context, 0.040),
                      //                 // CustomCardWidget(
                      //                 //   onTap: () {
                      //                 //     // Get.to(() => const CartSelectionPage());
                      //                 //     Get.to(() => const ProductPage());
                      //                 //   },
                      //                 // )
                      //               ],
                      //             ),
                      //           );
                      //         }
                      //       }),
                      //   //  Padding(
                      //   //   padding: const EdgeInsets.all(8.0),
                      //   //   child: Row(
                      //   //     children: [
                      //   //       CustomCardWidget(
                      //   //         onTap: () {
                      //   //           // Get.to(() => const CartSelectionPage());
                      //   //           Get.to(() => const ProductPage());
                      //   //         },
                      //   //       ),
                      //   //       getwidth(context, 0.040),
                      //   //       CustomCardWidget(
                      //   //         onTap: () {
                      //   //           // Get.to(() => const CartSelectionPage());
                      //   //           Get.to(() => const ProductPage());
                      //   //         },
                      //   //       ),
                      //   //       getwidth(context, 0.040),
                      //   //       CustomCardWidget(
                      //   //         onTap: () {
                      //   //           // Get.to(() => const CartSelectionPage());
                      //   //           Get.to(() => const ProductPage());
                      //   //         },
                      //   //       ),
                      //   //       getwidth(context, 0.040),
                      //   //       CustomCardWidget(
                      //   //         onTap: () {
                      //   //           // Get.to(() => const CartSelectionPage());
                      //   //           Get.to(() => const ProductPage());
                      //   //         },
                      //   //       )
                      //   //     ],
                      //   //   ),
                      //   // ),
                      // ),
                      categoryController.bottomBanner[0].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[0].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[0].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),

                      getheight(context, 0.020),
                      const ViewMoreWidget(
                        isViewShow: true,
                        title: "Popular Products And Popular Veggies",
                      ),
                      getheight(context, 0.020),
                      Container(
                        width: double.infinity,
                        height: Get.height * 0.38,
                        decoration: BoxDecoration(
                            color: blueDarkColor.withOpacity(0.2)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                categoryController.homeProductList.isEmpty
                                    ? 1
                                    : categoryController.homeProductList.length,
                            itemBuilder: (context, index) {
                              if (categoryController.homeProductList.isEmpty) {
                                // Show shimmer loading effect when the product list is empty
                                // print(
                                //     categoryController.homeProductList.length);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: Get.width * 0.42,
                                      height: Get.height * 0.33,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                // Render the actual product card
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      getwidth(context, 0.010),
                                      CustomCardWidget(
                                          discountPer: categoryController
                                              .homeProductList[index]
                                              .differencePercentage,
                                          isactive:
                                              // !categoryController
                                              //         .homeProductList[index]
                                              //         .outOfStock! ||
                                              categoryController
                                                      .homeProductList[index]
                                                      .quantityLeft !=
                                                  0,
                                          // categoryController
                                          //             .homeProductList[index]
                                          //     .status ==
                                          // "inactive"
                                          //     ? false
                                          //     : true,
                                          newPrice: categoryController
                                                  .homeProductList[index]
                                                  .offerPrice!
                                                  .isNotEmpty
                                              ? categoryController
                                                  .homeProductList[index]
                                                  .offerPrice
                                              : categoryController
                                                  .homeProductList[index]
                                                  .salePrice
                                                  .toString(),
                                          onTapDecrement: () async {
                                            categoryController
                                                            .homeProductList[
                                                                index]
                                                            .cart[0]
                                                            .quantity -
                                                        1 !=
                                                    0
                                                ? await cartController.updateCart(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .cart[0]
                                                        .id
                                                        .toString(),
                                                    (categoryController
                                                                .homeProductList[
                                                                    index]
                                                                .cart[0]
                                                                .quantity -
                                                            1)
                                                        .toString())
                                                : await cartController
                                                    .deleteCartItem(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .cart[0]
                                                        .id
                                                        .toString(),
                                                  );
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductList[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                          },
                                          onTapIncrement: () async {
                                            await cartController.updateCart(
                                                categoryController
                                                    .homeProductList[index]
                                                    .cart[0]
                                                    .id
                                                    .toString(),
                                                (categoryController
                                                            .homeProductList[
                                                                index]
                                                            .cart[0]
                                                            .quantity +
                                                        1)
                                                    .toString());
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductList[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                          },
                                          isAdd: categoryController
                                              .homeProductList[index]
                                              .cart
                                              .isEmpty,
                                          productQuantity: categoryController
                                                  .homeProductList[index]
                                                  .cart
                                                  .isNotEmpty
                                              ? categoryController
                                                  .homeProductList[index]
                                                  .cart[0]
                                                  .quantity
                                                  .toString()
                                              : "0",
                                          onTapAddCart: () async {
                                            print("this is print");
                                            categoryController
                                                    .homeProductList[index]
                                                    .cart
                                                    .isEmpty
                                                ? await cartController
                                                    .addProductToCart(
                                                        categoryController
                                                            .homeProductList[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        1.toString())
                                                : null;
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductList[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                            // await categoryController
                                            //     .getProducts();
                                          },
                                          onTap: () async {
                                            await categoryController
                                                .getProductByID(
                                                    categoryController
                                                        .homeProductList[index]
                                                        .id!);

                                            Get.to(() => const ProductPage());
                                          },
                                          imageUrlNullCheck: categoryController
                                              .homeProductList[index].mainImage,
                                          imageUrl: categoryController
                                              .homeProductList[index].mainImage,
                                          productName:
                                              categoryController.homeProductList[index].name,
                                          quantity: categoryController.homeProductList[index].quantity.toString(),
                                          unit: categoryController.homeProductList[index].unit,
                                          price: categoryController.homeProductList[index].price.toString()),
                                      getwidth(context, 0.010),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // ),
                                      // getwidth(context, 0.040),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // ),
                                      // getwidth(context, 0.040),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // )
                                    ],
                                  ),
                                );
                              }
                            }),
                        //  Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                      categoryController.bottomBanner[1].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[1].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[1].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[2].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      // categoryController.bottomBanner.length >= 3
                      categoryController.bottomBanner[2].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[2].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),

                      getheight(context, 0.020),
                      const ViewMoreWidget(
                        isViewShow: true,
                        title: "Popular Fruits And Veggies",
                      ),
                      getheight(context, 0.020),
                      Container(
                        width: double.infinity,
                        height: Get.height * 0.38,
                        decoration: BoxDecoration(
                            color: blueDarkColor.withOpacity(0.2)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryController
                                    .homeProductListTwo.isEmpty
                                ? 1
                                : categoryController.homeProductListTwo.length,
                            itemBuilder: (context, index) {
                              if (categoryController
                                  .homeProductListTwo.isEmpty) {
                                // Show shimmer loading effect when the product list is empty
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: Get.width * 0.42,
                                      height: Get.height * 0.33,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                // Render the actual product card
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      getwidth(context, 0.010),
                                      CustomCardWidget(
                                          discountPer: categoryController
                                              .homeProductListTwo[index]
                                              .differencePercentage,
                                          isactive:
                                              // !categoryController
                                              //     .homeProductListTwo[index]
                                              //     .outOfStock!,
                                              categoryController
                                                      .homeProductListTwo[index]
                                                      .quantityLeft !=
                                                  0,
                                          // categoryController
                                          //             .homeProductListTwo[index]
                                          //             .status ==
                                          //         "inactive"
                                          //     ? false
                                          //     : true,
                                          newPrice: categoryController
                                                  .homeProductListTwo[index]
                                                  .offerPrice!
                                                  .isNotEmpty
                                              ? categoryController
                                                  .homeProductListTwo[index]
                                                  .offerPrice
                                              : categoryController
                                                  .homeProductListTwo[index]
                                                  .salePrice
                                                  .toString(),
                                          onTapDecrement: () async {
                                            categoryController
                                                            .homeProductListTwo[
                                                                index]
                                                            .cart[0]
                                                            .quantity -
                                                        1 !=
                                                    0
                                                ? await cartController.updateCart(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .cart[0]
                                                        .id
                                                        .toString(),
                                                    (categoryController
                                                                .homeProductListTwo[
                                                                    index]
                                                                .cart[0]
                                                                .quantity -
                                                            1)
                                                        .toString())
                                                : await cartController
                                                    .deleteCartItem(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .cart[0]
                                                        .id
                                                        .toString(),
                                                  );
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductListTwo[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                          },
                                          onTapIncrement: () async {
                                            await cartController.updateCart(
                                                categoryController
                                                    .homeProductListTwo[index]
                                                    .cart[0]
                                                    .id
                                                    .toString(),
                                                (categoryController
                                                            .homeProductListTwo[
                                                                index]
                                                            .cart[0]
                                                            .quantity +
                                                        1)
                                                    .toString());
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductListTwo[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                          },
                                          isAdd: categoryController
                                              .homeProductListTwo[index]
                                              .cart
                                              .isEmpty,
                                          productQuantity: categoryController
                                                  .homeProductListTwo[index]
                                                  .cart
                                                  .isNotEmpty
                                              ? categoryController
                                                  .homeProductListTwo[index]
                                                  .cart[0]
                                                  .quantity
                                                  .toString()
                                              : "0",
                                          onTapAddCart: () async {
                                            print("this is print");
                                            categoryController
                                                    .homeProductListTwo[index]
                                                    .cart
                                                    .isEmpty
                                                ? await cartController
                                                    .addProductToCart(
                                                        categoryController
                                                            .homeProductListTwo[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        1.toString())
                                                : null;
                                            // Get.to(() => const ViewMorePage());
                                            await categoryController
                                                .getProductCategorybyid(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .categoryId!);
                                            Get.to(
                                                () => CartSelectionPage(
                                                      categoryId:
                                                          categoryController
                                                              .homeProductListTwo[
                                                                  index]
                                                              .categoryId!,
                                                    ),
                                                transition:
                                                    Transition.noTransition);
                                            // await categoryController
                                            //     .getProducts();
                                          },
                                          onTap: () async {
                                            await categoryController
                                                .getProductByID(
                                                    categoryController
                                                        .homeProductListTwo[
                                                            index]
                                                        .id!);

                                            Get.to(() => const ProductPage());
                                          },
                                          imageUrlNullCheck: categoryController
                                              .homeProductListTwo[index]
                                              .mainImage,
                                          imageUrl: categoryController
                                              .homeProductListTwo[index]
                                              .mainImage,
                                          productName:
                                              categoryController.homeProductListTwo[index].name,
                                          quantity: categoryController.homeProductListTwo[index].quantity.toString(),
                                          unit: categoryController.homeProductListTwo[index].unit,
                                          price: categoryController.homeProductListTwo[index].price.toString()),
                                      getwidth(context, 0.010),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // ),
                                      // getwidth(context, 0.040),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // ),
                                      // getwidth(context, 0.040),
                                      // CustomCardWidget(
                                      //   onTap: () {
                                      //     // Get.to(() => const CartSelectionPage());
                                      //     Get.to(() => const ProductPage());
                                      //   },
                                      // )
                                    ],
                                  ),
                                );
                              }
                            }),
                        //  Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       ),
                        //       getwidth(context, 0.040),
                        //       CustomCardWidget(
                        //         onTap: () {
                        //           // Get.to(() => const CartSelectionPage());
                        //           Get.to(() => const ProductPage());
                        //         },
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                      categoryController.bottomBanner[3].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[3].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[3].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),

                      getheight(context, 0.020),
                      const ViewMoreWidget(
                        isViewShow: false,
                        title: "Shop By Category",
                      ),
                      // getheight(context, 0.020),
                      // SizedBox(
                      //   height: Get.height *
                      //       0.22 *
                      //       (categoryController.categoryList.length / 2.8),
                      //   child:
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of elements in a row
                          crossAxisSpacing:
                              5.0, // Spacing between elements horizontally
                          mainAxisSpacing:
                              5.0, // Spacing between elements vertically
                        ),
                        itemCount: categoryController.categoryList.length,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                            onTap: () async {
                              categoryController.categoryId.value =
                                  categoryController.categoryList[index].id
                                      .toString();
                              await categoryController.getProductCategorybyid(
                                  categoryController.categoryList[index].id);
                              Get.to(() => CartSelectionPage(
                                    categoryId: categoryController
                                        .categoryList[index].id,
                                  ));
                            },
                            urlforCheckNull:
                                categoryController.categoryList[index].image,
                            categoryName:
                                categoryController.categoryList[index].name,
                            imageUrl:
                                categoryController.categoryList[index].image ??
                                    "",
                          );
                        },
                      ),
                      // ),

                      // SizedBox(
                      //   height: Get.height * 0.19,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: categoryController.categoryList.length,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Row(
                      //           children: [
                      //             getwidth(context, 0.015),
                      //             CustomCategoryWidget(
                      //                 onTap: () async {
                      //                   categoryController.categoryId.value =
                      //                       categoryController
                      //                           .categoryList[index].id
                      //                           .toString();
                      //                   await categoryController
                      //                       .getProductCategorybyid(
                      //                           categoryController
                      //                               .categoryList[index].id);
                      //                   Get.to(() => const CartSelectionPage());
                      //                 },
                      //                 urlforCheckNull: categoryController
                      //                     .categoryList[index].image,
                      //                 categoryName: categoryController
                      //                     .categoryList[index].name,
                      //                 imageUrl: categoryController
                      //                         .categoryList[index].image ??
                      //                     ""),
                      //             getwidth(context, 0.015),
                      //             // CustomCategoryWidget(
                      //             //   onTap: () {
                      //             //     Get.to(() => const CartSelectionPage());
                      //             //   },
                      //             // ),
                      //             // getwidth(context, 0.030),
                      //             // CustomCategoryWidget(
                      //             //   onTap: () {
                      //             //     Get.to(() => const CartSelectionPage());
                      //             //   },
                      //             // ),
                      //             // getwidth(context, 0.030),
                      //             // CustomCategoryWidget(
                      //             //   onTap: () {
                      //             //     Get.to(() => const CartSelectionPage());
                      //             //   },
                      //             // ),
                      //             // getwidth(context, 0.030),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       CustomCategoryWidget(
                      //         onTap: () {
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //       CustomCategoryWidget(
                      //         onTap: () {
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //       CustomCategoryWidget(
                      //         onTap: () {
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //       CustomCategoryWidget(
                      //         onTap: () {
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //     ],
                      //   ),
                      // ),
                      categoryController.bottomBanner[4].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[4].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[4].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      getheight(context, 0.020),
                      const ViewMoreWidget(
                        isViewShow: false,
                        title: "Fruits & Vegetables",
                      ),
                      getheight(context, 0.020),
                      !categoryController.isLatestLoading.value
                          ?
                          //  SizedBox(
                          //     height:
                          //         categoryController.latestProductList.length >=
                          //                 2
                          //             ? Get.height * 0.35
                          //             : Get.height * 0.18,
                          //     child:
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    categoryController.latestProductList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.6,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0),
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomDealsWidget(
                                    mainImage: categoryController
                                        .latestProductList[index].mainImage,
                                    productName: categoryController
                                        .latestProductList[index].name,
                                    onTap: () async {
                                      await categoryController
                                          .getProductCategorybyid(
                                              categoryController
                                                  .latestProductList[index]
                                                  .categoryId);
                                      Get.to(() => CartSelectionPage(
                                            categoryId: categoryController
                                                .latestProductList[index]
                                                .categoryId,
                                          ));
                                    },
                                  );
                                  // Image.network(categoryController
                                  //     .latestProductList[index].mainImage);
                                },
                              ),
                              // ),
                            )
                          : SizedBox(
                              height: Get.height * 0.35,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categoryController
                                      .latestProductList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.6,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: Get.width * 0.42,
                                        height: Get.height * 0.33,
                                        color: Colors.white,
                                      ),
                                    );
                                    // Image.network(categoryController
                                    //     .latestProductList[index].mainImage);
                                  },
                                ),
                              ),
                            ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       CustomDealsWidget(
                      //         onTap: () async {
                      //           // print(categoryController
                      //           //     .latestProductList.length);
                      //           await categoryController
                      //               .getProductCategorybyid(1);
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //       CustomDealsWidget(
                      //         onTap: () async {
                      //           await categoryController
                      //               .getProductCategorybyid(1);
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       CustomDealsWidget(
                      //         onTap: () async {
                      //           await categoryController
                      //               .getProductCategorybyid(1);
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //       getwidth(context, 0.030),
                      //       CustomDealsWidget(
                      //         onTap: () async {
                      //           await categoryController
                      //               .getProductCategorybyid(1);
                      //           Get.to(() => const CartSelectionPage());
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      categoryController.bottomBanner[5].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[5].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[5].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),

                      categoryController.bottomBanner[6].status == "active"
                          ? getheight(context, 0.020)
                          : const SizedBox.shrink(),
                      categoryController.bottomBanner[6].status == "active"
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: greyColor)
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    categoryController.bottomBanner[6].image,

                                    // 'assets/images/hd3.jpg',
                                    fit: BoxFit.cover,
                                    height: height * 0.28,
                                    width: width * 0.95,

                                    // height: Get.height * 0.12,
                                    // width: Get.width * 0.95,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      // getheight(context, 0.020),
                      // const ViewMoreWidget(
                      //   title: "Staples",
                      // ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Container(
                      //     decoration:
                      //         BoxDecoration(color: greenColor.withOpacity(0.3)),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         children: [
                      //           CustomStaplesWidget(
                      //             onTap: () async {
                      //               await categoryController
                      //                   .getProductCategorybyid(1);
                      //               Get.to(() => const CartSelectionPage());
                      //             },
                      //           ),
                      //           getwidth(context, 0.020),
                      //           CustomStaplesWidget(
                      //             onTap: () async {
                      //               await categoryController
                      //                   .getProductCategorybyid(1);
                      //               Get.to(() => const CartSelectionPage());
                      //             },
                      //           ),
                      //           getwidth(context, 0.020),
                      //           CustomStaplesWidget(
                      //             onTap: () async {
                      //               await categoryController
                      //                   .getProductCategorybyid(1);
                      //               Get.to(() => const CartSelectionPage());
                      //             },
                      //           ),
                      //           getwidth(context, 0.020),
                      //           CustomStaplesWidget(
                      //             onTap: () async {
                      //               await categoryController
                      //                   .getProductCategorybyid(1);
                      //               Get.to(() => const CartSelectionPage());
                      //             },
                      //           ),
                      //           getwidth(context, 0.020),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // getheight(context, 0.030),
                      // cartController.allCartList.isNotEmpty
                      //     ?
                      getheight(context, 0.080)
                      // : const SizedBox.shrink()
                    ],
                  ),
                ),
                // cartController.allCartList.isNotEmpty
                //     ?
                const ButtomCartWidget()
                // : const SizedBox.shrink()
              ],
            ),
          )),
    );
  }
}
