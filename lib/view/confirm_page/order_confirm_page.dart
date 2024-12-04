import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_app_bar.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  CategoryController categoryController = Get.put(CategoryController());
  late Future<String> _lottieUrl;
  @override
  void initState() {
    super.initState();
    // Replace the URL with your Lottie animation URL
    _lottieUrl = fetchLottieUrl(
        'https://lottie.host/2bfb797f-7aad-42f0-a927-db37890a15dd/aDzhDmOPZY.json');
  }

  Future<String> fetchLottieUrl(String url) async {
    // Simulate fetching the Lottie animation URL
    await Future.delayed(const Duration(seconds: 2));
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // onWillPop: () async {
      //   Get.offAll(() => const HomePage());
      //   return true;
      // },
      child: Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: const CustomAppBar(
            istitle: true,
            isAddbuttonShow: false,
            isFreeDeliveryText: false,
            appBarSubtitle: "Delivery to",
            appBartitle: "Order Details"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextRich(
                text: "Order ID: ",
                children: [
                  TextSpan(
                      text: categoryController.orderId.value,
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ],
              ),
              FutureBuilder(
                future: _lottieUrl,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while fetching the Lottie file
                    return Column(
                      children: [
                        const CircularProgressIndicator(),
                        getheight(context, 0.020)
                      ],
                    );
                  } else if (snapshot.hasError) {
                    // Handle error state
                    return const Text('Error loading animation');
                  } else {
                    // Show Lottie animation once the URL is fetched
                    return Lottie.network(snapshot.data.toString());
                  }
                },
              ),
              // Lottie.network(
              //     'https://lottie.host/2bfb797f-7aad-42f0-a927-db37890a15dd/aDzhDmOPZY.json'),
              const CustomTextSimple(
                text: "Your Order has Been Placed",
                fontSize: 20,
              ),
              const CustomTextSimple(
                text: "Successfully!",
                // fontSize: 15,
              ),
              getheight(context, 0.020),
              // ElevatedButton(
              //     style: ButtonStyle(
              //         elevation: const WidgetStatePropertyAll(3),
              //         backgroundColor: WidgetStatePropertyAll(blueDarkColor)),
              //     onPressed: () {
              //       Get.offAll(const HomePage());
              //       categoryController.isAddressSave.value = true;
              //       categoryController.islogin.value = true;
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 12.0, right: 12),
              //       child: CustomTextSimple(
              //         text: "Continue Shopping",
              //         fontSize: 18,
              //         fontWeight: FontWeight.w600,
              //         color: whiteColor,
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
