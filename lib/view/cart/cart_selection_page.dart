import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_bottom_bar.dart';
import 'package:hindustan_food/custom_utils/price_bottom_app_bar.dart';
import 'package:hindustan_food/custom_widget/custom_full_item_card_widget.dart';
import 'package:hindustan_food/custom_widget/custom_left_scroll_item_widget.dart';
import 'package:hindustan_food/models/product_by_category_model.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/product/product_page.dart';
import 'package:shimmer/shimmer.dart';

class CartSelectionPage extends StatefulWidget {
  final int categoryId;
  const CartSelectionPage({super.key, required this.categoryId});

  @override
  State<CartSelectionPage> createState() => _CartSelectionPageState();
}

class _CartSelectionPageState extends State<CartSelectionPage> {
  // Scroll controller
  final ScrollController _scrollController = ScrollController();

  CategoryController categoryController = Get.put(CategoryController());
// Add this code outside of your build method to listen to scroll events
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Future.microtask(
      () {
        scrollTocategory();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();

    super.dispose();
  }

  void scrollTocategory() async {
    int totalItem = 0;
    // calculateResult(categoryController.categoryTotal, widget.categoryId);
    // print(
    //     "this is id ${categoryController.categoryList[index].id} and result: $totalItem");
    double scrollPosition =
        totalItem * _itemHeight; // Replace itemHeight with your item's height
    print("this is scroll position $scrollPosition");
    await _scrollController.animateTo(scrollPosition,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void _scrollListener() {
    print("this is pixels ${_scrollController.position.pixels}");
    final double firstVisibleItemIndex =
        _scrollController.position.pixels / _itemHeight;

    final double lastVisibleItemIndex =
        (_scrollController.position.pixels + _viewportHeight) / _itemHeight;

    print('this is height ${Get.height}');
    print("this is last index $lastVisibleItemIndex");

    print("this is last index ceil ${lastVisibleItemIndex.ceil()}");
    print("this is last index floor ${lastVisibleItemIndex.floor()}");
    final int visibleItemsCount =
        lastVisibleItemIndex.ceil() - firstVisibleItemIndex.floor();
    final int firstItemIndex = firstVisibleItemIndex.floor();
    print("this is first index $firstItemIndex");
    categoryController.selectedIndex.value =
        categoryController.productByCategoryList[firstItemIndex].categoryId!;

    // print("object");
    // print(
    //     "thsi is selected index value ${categoryController.selectedIndex.value}");
    print("Visible items: $visibleItemsCount");
    // print("Index of first visible item: $firstItemIndex");
    // print(
    //     "This is name of ${categoryController.productByCategoryList[firstItemIndex].name}");
    setState(() {});
  }

  // final double _itemHeight = 139.0; // Set your item height here
  final double _itemHeight = Get.height * 0.1888; // Set your item height here
  final double _viewportHeight = Get.height * 0.5034;
  // final double _itemHeight1 = Get.height * 0.1888; // Set your item height here
  // final double _viewportHeight1 = Get.height * 0.5034;
  // final double _itemHeight = 150.0; // Set your item height here
  // final double _viewportHeight = 400.0;

  int countItemsInCategory(int categoryId) {
    // Filter the list based on the category ID
    List<ProductByCategoryModel> categoryProducts = categoryController
        .productByCategoryList
        .where((product) => product.categoryId == categoryId)
        .toList();

    // Count the number of items in the filtered list
    return categoryProducts.length;
  }

  // int calculateResult(Map<int, int> data, int selectedKey, List<int> keys) {
  //   int sum = 0;
  //   for (var key in keys) {
  //     sum += data[key]!;
  //     if (key == selectedKey) {
  //       break;
  //     }
  //   }
  //   return sum + 1;
  // }
  int calculateResult(Map<int, int> data, int selectedKey) {
    int cumulativeSum = 0;
    int result = 1; // Default result for the first key

    for (var key in data.keys.toList()) {
      if (key == selectedKey) {
        result = cumulativeSum + 1;
        break;
      }
      cumulativeSum += data[key]!;
      result = cumulativeSum + 1;
    }

    if (!data.containsKey(selectedKey)) {
      throw ArgumentError('Key $selectedKey not found in the data.');
    }
    print("this is result $result");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    print(categoryController.selectedIndex.value);

    return WillPopScope(
      onWillPop: () async {
        const CustomBottomAppBar(index: 4);
        return true;
      },
      child: Obx(
        () => Scaffold(
          bottomNavigationBar:
              // cartController.allCartList.isNotEmpty
              //     ?
              const PriceBottomAppBar(),
          // : null,
          appBar: const CustomAppBar(
            istitle: true,
            isFreeDeliveryText: true,
            isAddbuttonShow: false,
            appBarSubtitle: "5am to 7:30am",
            appBartitle: "Morning Delivery",
          ),
          body: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: Get.width * 0.20,
                child: categoryController.categoryList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListView.builder(
                          itemCount:
                              5, // Adjust the itemCount based on how many shimmer items you want
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    80, // Set the height based on your design

                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10)), // Adjust the color as needed
                              ),
                            );
                          },
                        ),
                      )
                    : Obx(
                        () => ListView.builder(
                          itemCount: categoryController.categoryList.length,
                          itemBuilder: (context, index) {
                            // print(
                            //     "value is ${categoryController.selectedIndex.value}");
                            return LeftScrollItemWidget(
                              onTap: () async {
                                print("this is index $index");
                                // print(
                                //     "this is item of sub category ${countItemsInCategory(categoryController.categoryList[index].id)} and ${categoryController.categoryList[index].id}");
                                // int result = calculateResult(
                                //     categoryController.categoryTotal,
                                //     categoryController.categoryList[index].id,
                                //     categoryController.catagoryIdList);
                                // print(
                                //     'Result for key ${categoryController.categoryList[index].id}: $result');

                                int totalItem = index == 0
                                    ? 0
                                    : calculateResult(
                                        categoryController.categoryTotal,
                                        categoryController
                                            .categoryList[index].id);

                                print("this is inside total $totalItem");
                                print(
                                    "this is inside id ${categoryController.categoryList[index].id}");
                                // print(
                                //     "this is id ${categoryController.categoryList[index].id} and result: $totalItem");
                                double scrollPosition = (totalItem - 1)
                                    //  (index == 0
                                    //         ? index
                                    //         : index == 1
                                    //             ? 21
                                    //             : countItemsInCategory(
                                    //                 categoryController
                                    //                     .categoryList[index].id))
                                    *
                                    // double scrollPosition = index *
                                    _itemHeight; // Replace itemHeight with your item's height
                                print(
                                    "this is scroll position $scrollPosition");
                                _scrollController.animateTo(scrollPosition,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                                // _scrollController.animateTo(30,
                                //     duration: Duration(seconds: 1),
                                //     curve: Curves.bounceIn);
                                // print("this is selected index");
                                // print(index);
                                // print("this is index i found");
                                // print(categoryController.selectedIndex.value);
                                // print("this is id of select inded");
                                // print(categoryController.categoryList[index].id);
                                categoryController.categoryId.value =
                                    categoryController.categoryList[index].id
                                        .toString();
                                categoryController.selectedIndex.value =
                                    categoryController.categoryList[index].id;
                                // await categoryController.getProductCategorybyid(
                                //   categoryController.categoryList[index].id,
                                // );
                              },
                              isSelected:
                                  categoryController.selectedIndex.value ==
                                      categoryController.categoryList[index].id,
                              categoryImage:
                                  categoryController.categoryList[index].image,
                              checkNullonImage:
                                  categoryController.categoryList[index].image,
                              productName:
                                  categoryController.categoryList[index].name,
                            );
                          },
                        ),
                      ),
              ),
              // const SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget(),
              //       LeftScrollItemWidget()
              //     ],
              //   ),
              // ),

              categoryController.productByCategoryList.isEmpty
                  ? getwidth(context, 0.020)
                  : const SizedBox.shrink(),
              SizedBox(
                width: Get.width * 0.78,
                height: 50,
                child: categoryController.productByCategoryList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListView.builder(
                          itemCount:
                              5, // Adjust the itemCount based on how many shimmer items you want
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                getheight(context, 0.0115),
                                Container(
                                  width: double.infinity,
                                  height:
                                      50, // Set the height based on your design
                                  color: Colors
                                      .white, // Adjust the color as needed
                                ),
                                getheight(context, 0.0230),
                              ],
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            categoryController.productByCategoryList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              getheight(context, 0.0015),
                              CartFullItemWidget(
                                isactive:
                                    //  !categoryController
                                    //     .productByCategoryList[index].outOfStock!,
                                    categoryController
                                            .productByCategoryList[index]
                                            .quantityLeft !=
                                        0,
                                //  categoryController
                                //             .productByCategoryList[index]
                                //             .status ==
                                //         "inactive"
                                //     ? false
                                //     : true,
                                discountPrice: categoryController
                                                .productByCategoryList[index]
                                                .price !=
                                            null &&
                                        categoryController
                                                .productByCategoryList[index]
                                                .offerPrice !=
                                            null
                                    ? (categoryController
                                                .productByCategoryList[index]
                                                .price!
                                                .toInt() -
                                            int.parse(categoryController
                                                .productByCategoryList[index]
                                                .offerPrice!))
                                        .toString()
                                    : "",
                                discountPercentage: categoryController
                                            .productByCategoryList[index]
                                            .differencePercentage !=
                                        null
                                    ? double.parse(categoryController
                                            .productByCategoryList[index]
                                            .differencePercentage!)
                                        .round()
                                        .toString()
                                    : "",
                                // discountPercentage: categoryController
                                //             .productByCategoryList[index]
                                //             .discountPercentage !=
                                //         null
                                //     ? double.parse(categoryController
                                //             .productByCategoryList[index]
                                //             .discountPercentage!)
                                //         .round()
                                //         .toString()
                                //     : "",
                                subPrice: categoryController
                                            .productByCategoryList[index]
                                            .price !=
                                        null
                                    ? categoryController
                                        .productByCategoryList[index].price
                                        .toString()
                                    : "",
                                onTapDecrement: () async {
                                  categoryController
                                                  .productByCategoryList[index]
                                                  .cart[0]
                                                  .quantity -
                                              1 !=
                                          0
                                      ? await cartController.updateCart(
                                          categoryController
                                              .productByCategoryList[index]
                                              .cart[0]
                                              .id
                                              .toString(),
                                          (categoryController
                                                      .productByCategoryList[
                                                          index]
                                                      .cart[0]
                                                      .quantity -
                                                  1)
                                              .toString())
                                      : await cartController.deleteCartItem(
                                          categoryController
                                              .productByCategoryList[index]
                                              .cart[0]
                                              .id
                                              .toString(),
                                        );
                                  await categoryController
                                      .getProductCategorybyid(
                                    categoryController
                                        .productByCategoryList[index]
                                        .categoryId!,
                                  );
                                },
                                onTapIncrement: () async {
                                  await cartController.updateCart(
                                      categoryController
                                          .productByCategoryList[index]
                                          .cart[0]
                                          .id
                                          .toString(),
                                      (categoryController
                                                  .productByCategoryList[index]
                                                  .cart[0]
                                                  .quantity +
                                              1)
                                          .toString());
                                  await categoryController
                                      .getProductCategorybyid(
                                    categoryController
                                        .productByCategoryList[index]
                                        .categoryId!,
                                  );
                                },
                                onTapAddCart: () async {
                                  print("this is print");
                                  categoryController
                                          .productByCategoryList[index]
                                          .cart
                                          .isEmpty
                                      ? await cartController.addProductToCart(
                                          categoryController
                                              .productByCategoryList[index].id
                                              .toString(),
                                          1.toString())
                                      : null;
                                  await categoryController
                                      .getProductCategorybyid(
                                    categoryController
                                        .productByCategoryList[index]
                                        .categoryId!,
                                  );
                                  // await categoryController
                                  //     .getProducts();
                                },
                                productQuantity: categoryController
                                        .productByCategoryList[index]
                                        .cart
                                        .isNotEmpty
                                    ? categoryController
                                        .productByCategoryList[index]
                                        .cart[0]
                                        .quantity
                                        .toString()
                                    : "0",
                                onTap: () async {
                                  print("fghh");
                                  await categoryController.getProductByID(
                                    categoryController
                                        .productByCategoryList[index].id!,
                                  );
                                  Get.to(const ProductPage());
                                },
                                isAdd: categoryController
                                    .productByCategoryList[index].cart.isEmpty,
                                imageUrl: categoryController
                                    .productByCategoryList[index].mainImage,
                                // "https://prfreetech.com/development/hindustan_food/public/uploads/products/${categoryController.productByCategoryList[index].mainImage}",
                                urlforCheckNull: categoryController
                                    .productByCategoryList[index].mainImage,
                                quantity: categoryController
                                    .productByCategoryList[index].unit
                                    .toString(),
                                price: categoryController
                                        .productByCategoryList[index]
                                        .offerPrice!
                                        .isNotEmpty
                                    ? categoryController
                                        .productByCategoryList[index].offerPrice
                                    : categoryController
                                        .productByCategoryList[index].salePrice
                                        .toString(),
                                productName: categoryController
                                    .productByCategoryList[index].name,
                                unit: categoryController
                                    .productByCategoryList[index].unit,
                              ),
                              // getheight(context, 0.0230),
                            ],
                          );
                        },
                      ),
              )

              // SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //       CartFullItemWidget(
              //         onTap: () {},
              //       ),
              //       getheight(context, 0.020),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
