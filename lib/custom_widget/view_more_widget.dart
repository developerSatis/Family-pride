import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/view/cart/cart_selection_page.dart';

class ViewMoreWidget extends StatelessWidget {
  final String? title;
  final bool? isViewShow;
  const ViewMoreWidget(
      {super.key, required this.title, required this.isViewShow});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextSimple(
            // text: "Popular Fruits And Veggies",
            text: title!,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          isViewShow!
              ? Bounceable(
                  onTap: () async {
                    // Get.to(() => const ViewMorePage());
                    await categoryController.getProductCategorybyid(
                        categoryController.categoryList[0].id);
                    // categoryController
                    //     .homeProductListTwo[
                    //         index]
                    //     .categoryId!);
                    Get.to(
                        () => CartSelectionPage(
                              categoryId: categoryController.categoryList[0].id,
                            ),
                        transition: Transition.noTransition);
                  },
                  child: Row(
                    children: [
                      CustomTextSimple(
                        text: "View More",
                        fontSize: 12,
                        color: appColorText,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: appColorText,
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
