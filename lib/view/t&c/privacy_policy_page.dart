import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/user_utility_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/size_helper.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  UserUtilityController utilityController = Get.put(UserUtilityController());
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _load());
  }

  _load() async {
    await utilityController.getPrivacy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: utilityController.isPrivacyLoad.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                    getheight(context, 0.020),
                    const CustomTextSimple(
                      text: "Please Wait",
                      fontSize: 18,
                    )
                  ],
                )
              : Scrollbar(
                  radius: const Radius.circular(10),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const Center(
                          child: CustomTextSimple(text: "Privacy Policy")),
                      Html(
                        data: utilityController.privacyPolicy.value,
                        style: {
                          "table": Style(
                            backgroundColor:
                                const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "tr": Style(
                            border: const Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          "th": Style(
                              padding: HtmlPaddings.all(6),
                              backgroundColor: Colors.grey),
                          "td": Style(
                              padding: HtmlPaddings.all(6),
                              alignment: Alignment.topLeft),
                          "h5": Style(
                              maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        },
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
