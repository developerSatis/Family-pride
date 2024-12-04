import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/price_bottom_app_bar.dart';
import 'package:hindustan_food/custom_widget/custom_card_widget.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/view/product/product_page.dart';
import 'package:shimmer/shimmer.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar:
          //  cartController.allCartList.isNotEmpty
          // ?
          const PriceBottomAppBar(),
      // : null,
      backgroundColor: appbackgroundColor,
      appBar: const CustomAppBar(
        istitle: true,
        isAddbuttonShow: true,
        appBarSubtitle: "5am to 7:30am",
        appBartitle: "Popular Products And Popular Veggies",
        isFreeDeliveryText: false,
      ),
      body: Obx(
        () => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: (MediaQuery.of(context).size.width) /
                  (MediaQuery.of(context).size.height / 1.4),
            ),
            scrollDirection: Axis.vertical,
            itemCount: categoryController.productList.isEmpty
                ? 1
                : categoryController.productList.length,
            itemBuilder: (context, index) {
              if (categoryController.productList.isEmpty) {
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
                  child: ViewMorePageWidget(
                      discountPer: categoryController
                          .productList[index].differencePercentage,
                      isactive:
                          !categoryController.productList[index].outOfStock!,
                      // categoryController.productList[index].status ==
                      //         "inactive"
                      //     ? false
                      //     : true,
                      newPrice: categoryController.productList[index].salePrice
                          .toString(),
                      onTapDecrement: () async {
                        categoryController.productList[index].cart[0].quantity -
                                    1 !=
                                0
                            ? await cartController.updateCart(
                                categoryController.productList[index].cart[0].id
                                    .toString(),
                                (categoryController.productList[index].cart[0]
                                            .quantity -
                                        1)
                                    .toString())
                            : await cartController.deleteCartItem(
                                categoryController.productList[index].cart[0].id
                                    .toString(),
                              );
                      },
                      onTapIncrement: () async {
                        await cartController.updateCart(
                            categoryController.productList[index].cart[0].id
                                .toString(),
                            (categoryController
                                        .productList[index].cart[0].quantity +
                                    1)
                                .toString());
                      },
                      isAdd: categoryController.productList[index].cart.isEmpty,
                      productQuantity:
                          categoryController.productList[index].cart.isNotEmpty
                              ? categoryController
                                  .productList[index].cart[0].quantity
                                  .toString()
                              : "0",
                      onTapAddCart: () async {
                        print("this is print");
                        categoryController.productList[index].cart.isEmpty
                            ? await cartController.addProductToCart(
                                categoryController.productList[index].id
                                    .toString(),
                                1.toString())
                            : null;
                        // await categoryController
                        //     .getProducts();
                      },
                      onTap: () async {
                        await categoryController.getProductByID(
                            categoryController.productList[index].id!);

                        Get.to(() => const ProductPage());
                      },
                      imageUrlNullCheck:
                          categoryController.productList[index].mainImage,
                      imageUrl: categoryController.productList[index].mainImage,
                      productName: categoryController.productList[index].name,
                      quantity: categoryController.productList[index].quantity
                          .toString(),
                      unit: categoryController.productList[index].unit,
                      price: categoryController.productList[index].price
                          .toString()),

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
                );
              }
            }),
      ),
    );
  }
}
