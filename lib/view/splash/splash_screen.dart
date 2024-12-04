import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/view/home_page.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';
import 'package:hindustan_food/view/shop_closed_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // String tag = 'logo';
  // SharedPref sharedPref = Get.put(SharedPref());
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  SharedPref sharedPref = Get.put(SharedPref());
  CategoryController categoryController = Get.put(CategoryController());


  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.3, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
    navigateAfterDelay();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void navigateAfterDelay() {
    Future.microtask(() async => await categoryController.getBottamBanner());

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        await categoryController.shopOffOn();
        if (categoryController.shopOnOff.value == "shop on") {
          CartController cartController = Get.put(CartController());
          UserUtilityController userUtilityController =
              Get.put(UserUtilityController());
          categoryController.loadCategoryFun();
          cartController.loadCartFun();
          userUtilityController.loadUserUtilityFun();
          if (sharedPref.userID.isNotEmpty) {
            Get.offAll(() => const HomePage(),
                transition: Transition.noTransition);
          } else {
            Get.offAll(() => const SignInPage(
                  isGuest: true,
                ));
            // Get.offAll(() => const OtpScreen(
            //     // isGuest: true,
            //     ));
            // Get.offAll(() => const SignUpPage(
            //     // isGuest: true,
            //     ));
          }
        } else {
          Get.offAll(() => const ShopClosedPage());
        }

        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const SignInPage()));
        // Get.offAll(() => const SignInPage(
        //       isGuest: true,
        //     ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appColorTextLight,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.jpeg'),
                // colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
                fit: BoxFit.fill,
              ),
              // Box decoration takes a gradient
              // gradient: LinearGradient(
              //   // Where the linear gradient begins and ends
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   // Add one stop for each color. Stops should increase from 0 to 1
              //   stops: const [0.1, 0.5, 0.7, 0.9],
              //   colors: [
              //     // Colors are easy thanks to Flutter's Colors class.\

              //     Colors.indigo[800]!,
              //     Colors.indigo[600]!,
              //     Colors.indigo[400]!,
              //     Colors.indigo[300]!,
              //   ],
              // ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(color: appColorBlack.withOpacity(0.5)),
          // ),
          FadeTransition(
            opacity: _fadeInFadeOut,
            child: const Center(
              child: Hero(
                  tag: 'logo1',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CustomTextSimple(
                      //   text: "Welcome to,",
                      //   fontSize: 25,
                      //   color: whiteColor,
                      //   fontWeight: FontWeight.w800,
                      // ),
                      // getheight(context, 0.020),
                      // CustomTextSimple(
                      //   text: "Hindustan Foods",
                      //   fontSize: 40,
                      //   fontWeight: FontWeight.w900,
                      //   // decoration: TextDecoration.overline,
                      //   color: orangeDarkColor,
                      // ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}


// Positioned(
          //   top: 20,
          //   right: 0,
          //   child: Container(
          //     width: 90,
          //     height: 150,
          //     decoration: BoxDecoration(
          //         borderRadius: const BorderRadius.only(
          //             topLeft: Radius.circular(100),
          //             bottomLeft: Radius.circular(100)),
          //         color: redColor.withOpacity(0.4),
          //         border: Border.all(color: whiteColor.withOpacity(0.1))),
          //   ),
          // ),