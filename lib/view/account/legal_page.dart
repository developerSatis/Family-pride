import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/view/t&c/privacy_policy_page.dart';
import 'package:hindustan_food/view/t&c/t&c_page.dart';
import 'package:hindustan_food/view/t&c/retrun_policy.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appbackgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: const CustomTextCard(
              text: "Testimonial",
              fontSize: 20,
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bounceable(
              scaleFactor: 0.8,
              onTap: () {
                Get.to(() => const PrivacyPolicy());
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextCard(
                  text: "Privacy Policy",
                  color: appblueColor.withAlpha(220),
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(),
            Bounceable(
              scaleFactor: 0.8,
              onTap: () {
                Get.to(() => const TermsAndConditions());
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextCard(
                  text: "Terms and Conditions",
                  color: appblueColor.withAlpha(220),
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(),
            Bounceable(
              scaleFactor: 0.8,
              onTap: () {
                Get.to(() => const ReturnPolicy());
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextCard(
                  text: "Return Policy",
                  color: appblueColor.withAlpha(220),
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
