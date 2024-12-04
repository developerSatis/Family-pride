import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/cart/review_cart_page.dart';
import 'package:hindustan_food/view/confirm_page/order_confirm_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getheight(context, 0.10),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CustomTextSimple(
                text: "Select Payment Method",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: whiteColor,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomTextSimple(
                          text: 'Cash on Delivery',
                          fontSize: 17,
                          color:
                              selectedOption == 1 ? greenColor : appblueColor,
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
                          },
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: CustomTextSimple(
                          text: 'Online Payment',
                          fontSize: 17,
                          color:
                              selectedOption == 2 ? greenColor : appblueColor,
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
                    // } else {
                    //   Get.to(() => const ReviewCartPage());
                    if (selectedOption == 1) {
                      // Get.off(() => const OrderConfirmPage());
                      Get.offAll(() => const OrderConfirmPage());
                    } else if (selectedOption == 2) {
                      customeToast("This feature is comming soon.");
                    } else {
                      customeToast("Please Select Payment method ");
                    }
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
