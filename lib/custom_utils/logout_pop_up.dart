import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/login/sign_in_page.dart';

Widget logOutPopUp(BuildContext context) {
  SharedPref sharedPref = Get.put(SharedPref());
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getheight(context, 0.010),
        const CustomTextSimple(
          text: "Are You Sure Logout!",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        getheight(context, 0.020),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bounceable(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(6)),
                child: CustomTextSimple(
                  text: "Cancel",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            ),
            getwidth(context, 0.050),
            Bounceable(
              onTap: () async {
                sharedPref.removeValues();
                await sharedPref.getuserId();
                Get.offAll(() => const SignInPage(
                      isGuest: true,
                    ));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: redDarkColor,
                    borderRadius: BorderRadius.circular(6)),
                child: CustomTextSimple(
                  text: "Logout",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
        getheight(context, 0.010),
      ],
    ),
  );
}
