import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/review_cart_page.dart';
import 'package:hindustan_food/view/confirm_page/order_confirm_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: appbackgroundColor,
      appBar: const CustomAppBar(
        istitle: true,
        appBarSubtitle: "Delivery to",
        appBartitle: "Address",
        isAddbuttonShow: false,
        isFreeDeliveryText: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getheight(context, 0.050),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CustomTextSimple(
                text: "Add Address",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            getheight(context, 0.010),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: whiteColor,
                elevation: 4,
                child: Column(
                  children: [
                    getheight(context, 0.010),
                    Center(
                      child: SizedBox(
                        width: Get.width * 0.80,
                        // height: Get.height * 0.10,
                        child: TextFormField(
                          controller: categoryController.addNameController,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: blueDarkColor,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            labelText: "Name",
                            labelStyle: TextStyle(color: greyColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    getheight(context, 0.010),
                    Center(
                        child: SizedBox(
                      width: Get.width * 0.80,
                      // height: Get.height * 0.10,
                      child: TextFormField(
                        // controller: categoryController.addLandmarkController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.landscape_rounded,
                            color: blueDarkColor,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          labelText: "Landmark",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )),
                    getheight(context, 0.010),
                    Center(
                        child: SizedBox(
                      width: Get.width * 0.80,
                      // height: Get.height * 0.10,
                      child: TextFormField(
                        // controller: categoryController.addStreetController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.roundabout_left,
                            color: blueDarkColor,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          labelText: "Street",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )),
                    getheight(context, 0.010),
                    Center(
                        child: SizedBox(
                      width: Get.width * 0.80,
                      // height: Get.height * 0.10,
                      child: TextFormField(
                        controller: categoryController.addCityController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_city_rounded,
                            color: blueDarkColor,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          labelText: "City",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )),
                    getheight(context, 0.010),
                    Center(
                        child: SizedBox(
                      width: Get.width * 0.80,
                      // height: Get.height * 0.10,
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: categoryController.pincodeController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_city_rounded,
                            color: blueDarkColor,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          labelText: "Pin Code",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )),
                    getheight(context, 0.030),
                  ],
                ),
              ),
            ),
            getheight(context, 0.020),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(3),
                      backgroundColor: MaterialStatePropertyAll(blueDarkColor)),
                  onPressed: () {
                    // if (categoryController.addNameController.text.isEmpty) {
                    //   customeToast("Please Enter Your Name");
                    // } else if (categoryController
                    //     .addLandmarkController.text.isEmpty) {
                    //   customeToast("Please Enter Landmark");
                    // } else if (categoryController
                    //     .addStreetController.text.isEmpty) {
                    //   customeToast("Please Enter Street");
                    // } else if (categoryController
                    //     .addCityController.text.isEmpty) {
                    //   customeToast("Please Enter City");
                    // } else if (categoryController
                    //     .pincodeController.text.isEmpty) {
                    //   customeToast("Please Enter Pin Code");
                    // } else if (categoryController
                    //         .pincodeController.text.length <
                    //     6) {
                    //   customeToast("Please Enter 6 Digit Code");
                    // } else {
                    Get.to(() => const ReviewCartPage());
                    // if (selectedOption == 1) {
                    //   // Get.off(() => const OrderConfirmPage());
                    //   Get.to(() => const ReviewCartPage());
                    // } else if (selectedOption == 2) {
                    //   customeToast("This feature is comming soon.");
                    // } else {
                    //   customeToast("Please Select Payment method ");
                    // }
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: CustomTextSimple(
                      text: "Add",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
