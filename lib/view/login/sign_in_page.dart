import 'package:android_id/android_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_text_field.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/custom_toast.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/login/sign_up_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignInPage extends StatefulWidget {
  final bool? isGuest;
  const SignInPage({super.key, required this.isGuest});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordHide = true;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      // backgroundColor: Color(0xff02A0E3),
      backgroundColor: appColorTextLight,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                getheight(context, 0.050),
                Hero(
                    tag: "image",
                    child: Image.asset('assets/images/vegee.png')),
                // getheight(context, 0.10),

                // Container(
                //   decoration: const BoxDecoration(
                //     //Here goes the same radius, u can put into a var or function
                //     borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(150),
                //         topRight: Radius.circular(150),
                //         bottomLeft: Radius.circular(150),
                //         bottomRight: Radius.circular(150)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color(0x54000000),
                //         spreadRadius: 5,
                //         blurRadius: 5,
                //       ),
                //     ],
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(100),
                //     child: Image.asset(
                //       'assets/images/plat.png',
                //       fit: BoxFit.fill,
                //       // height: 50,
                //       // width: 50,
                //       height: Get.height * 0.22,
                //       width: Get.width * 0.45,
                //       // height: height * 0.12,
                //       // width: width * 0.95,
                //     ),
                //   ),
                // ),
                getheight(context, 0.020),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getheight(context, 0.05),
                      Hero(
                        tag: 'logo1',
                        child: CustomTextSimple(
                          // text: "Login ",
                          text: "Login with OTP",
                          color: whiteColor,
                          // fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      getheight(context, 0.05),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15.0, right: 15),
                      //   child: PhysicalModel(
                      //       borderRadius: BorderRadius.circular(50),
                      //       color: whiteColor,
                      //       elevation: 2.0,
                      //       shadowColor: const Color(0xff44BD32),
                      //       child: const CustomTextField(
                      //         icons: Icons.person,
                      //         hintText: "Mobile Number",
                      //       )),
                      // ),
                      getheight(context, 0.020),
                      // SizedBox(
                      //   // height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.emailAddress,
                      //     icons: Icons.phone,
                      //     labelText: "Email",
                      //     hintText: "Enter Your Email",
                      //     controller:
                      //         categoryController.emailLoginForRegController,
                      //   ),
                      // ),

                      SizedBox(
                        height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          icons: Icons.phone,
                          labelText: "Mobile Number",
                          hintText: "9098789098",
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: categoryController.phoneNumberController,
                        ),
                      ),
                      // getheight(context, 0.010),
                      // SizedBox(
                      //   // height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.name,
                      //     icons: Icons.password_rounded,
                      //     labelText: "Password",
                      //     hintText: "Enter Password",
                      //     obscureText: isPasswordHide,
                      //     suffixIcon: GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             isPasswordHide = !isPasswordHide;
                      //           });
                      //         },
                      //         child: Icon(!isPasswordHide
                      //             ? Icons.remove_red_eye
                      //             : Icons.visibility_off)),

                      //     // inputFormatters: [
                      //     //   LengthLimitingTextInputFormatter(10)
                      //     // ],
                      //     controller:
                      //         categoryController.passwordLoginForRegController,
                      //   ),
                      // ),
                      // Bounceable(
                      //   onTap: () {
                      //     Get.to(() => const SignUpPage(),
                      //         transition: Transition.noTransition);
                      //   },
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(right: 15.0),
                      //       child: CustomTextSimple(
                      //         text: "Create an account",
                      //         fontSize: 15,
                      //         color: whiteColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // getheight(context, 0.02),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15.0, right: 15),
                      //   child: SizedBox(
                      //     height: Get.height * 0.065,
                      //     child: const CustomTextField(
                      //       icons: Icons.lock,
                      //       hintText: "Password",
                      //     ),
                      //   ),
                      // ),

                      getheight(context, 0.02),
                    ],
                  ),
                ),
                getheight(context, 0.020),
                Hero(
                  tag: "button",
                  child: ElevatedButton(
                      onPressed: () async {
                        // Get.to(() => const HomePage());
                        // customeToast("Please Enter Phone Number");
                        if (categoryController
                            .phoneNumberController.text.isEmpty) {
                          customeToast("Please Enter Phone Number");
                        } else if (categoryController
                                .phoneNumberController.text.length <
                            10) {
                          customeToast("Please Enter 10 Digit Number");
                        } else {
                          final signature = await SmsAutoFill().getAppSignature;
                          categoryController.firstOtp.text = "";
                          categoryController.secondOtp.text = "";
                          categoryController.thirdOtp.text = "";
                          categoryController.fourthOtp.text = "";
                          categoryController.fifthOtp.text = "";
                          print("this is sign $signature");
                          await categoryController.loginWithPhone(signature);
                        }
                        // if (categoryController
                        //     .emailLoginForRegController.text.isEmpty) {
                        //   customeToast("Please Enter Email");
                        // } else if (!GetUtils.isEmail(categoryController
                        //     .emailLoginForRegController.text)) {
                        //   customeToast("Please Enter Correct Email");
                        // } else if (categoryController
                        //     .passwordLoginForRegController.text.isEmpty) {
                        //   customeToast("Please Enter Password");
                        // } else if (categoryController
                        //         .passwordLoginForRegController.text.length <=
                        //     5) {
                        //   customeToast(
                        //       "Password should be more than 5 charecter");
                        // } else {
                        //   await categoryController.login();
                        // isGuest!
                        //     ? {
                        //         Get.offAll(() => const HomePage()),
                        //         categoryController.islogin.value = true
                        //       }
                        //     : {
                        //         Get.to(() => const AddressPage()),
                        //         categoryController.islogin.value = false
                        //       };

                        // categoryController.islogin.value == true
                        //     ? {
                        //         Get.offAll(() => const HomePage()),
                        //         categoryController.islogin.value = true
                        //       }
                        //     : {
                        //         Get.to(() => const AddressPage()),
                        //         categoryController.islogin.value = false
                        //       };
                        // categoryController.islogin.value =
                        //     !categoryController.islogin.value;
                        // }
                      },
                      child: const CustomTextSimple(
                        text: "Login",
                        fontSize: 15,
                      )),
                ),

                getheight(context, 0.020),

                // isGuest!
                //     ? ElevatedButton(
                //         onPressed: () {
                //           Get.offAll(() => const HomePage());
                //           categoryController.islogin.value = false;
                //         },
                //         child: const CustomTextSimple(
                //           text: "Login as Guest",
                //           fontSize: 15,
                //         ))
                //     : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
