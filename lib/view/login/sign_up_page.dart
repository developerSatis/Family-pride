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
import 'package:hindustan_food/view/login/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordHide = true;
  bool isConPasswordHide = true;
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
                  child: Image.asset(
                    'assets/images/vegee.png',
                    // height: Get.height * 0.10,
                    width: Get.width * 0.50,
                  ),
                ),
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
                          text: "Create an account and Login",
                          color: whiteColor,
                          // fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // getheight(context, 0.05),
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
                      SizedBox(
                        // height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          icons: Icons.phone,
                          labelText: "Name",
                          hintText: "Enter Your Name",
                          controller: categoryController.nameForRegController,
                        ),
                      ),
                      getheight(context, 0.010),
                      SizedBox(
                        // height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          icons: Icons.phone,
                          labelText: "Phone Number",
                          hintText: "Enter Phone Number",
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: categoryController.phoneForRegController,
                        ),
                      ),
                      getheight(context, 0.010),
                      SizedBox(
                        // height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          icons: Icons.phone,
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          controller: categoryController.emailForRegController,
                        ),
                      ),
                      // getheight(context, 0.010),
                      // SizedBox(
                      //   height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.number,
                      //     icons: Icons.phone,
                      //     labelText: "Password",
                      //     hintText: "Enter Your Password",
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(10)
                      //     ],
                      //     controller:
                      //         categoryController.passwordForRegController,
                      //   ),
                      // ),

                      getheight(context, 0.010),
                      SizedBox(
                        // height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          icons: Icons.password,
                          labelText: "Password",
                          hintText: "Enter Password",
                          obscureText: isPasswordHide,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordHide = !isPasswordHide;
                                });
                              },
                              child: Icon(!isPasswordHide
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          controller:
                              categoryController.passwordSignForRegController,
                        ),
                      ),
                      getheight(context, 0.010),
                      SizedBox(
                        // height: Get.height * 0.068,
                        width: Get.width * 0.90,
                        child: CustomTextField(
                          obscureText: isConPasswordHide,
                          keyboardType: TextInputType.name,
                          icons: Icons.remove_red_eye,
                          labelText: "Confirm Password",
                          hintText: "Enter Confirm Password",
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isConPasswordHide = !isConPasswordHide;
                                });
                              },
                              child: Icon(!isConPasswordHide
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          controller:
                              categoryController.conPasswordForRegController,
                        ),
                      ),
                      // getheight(context, 0.010),
                      // SizedBox(
                      //   height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.name,
                      //     icons: Icons.phone,
                      //     labelText: "City",
                      //     hintText: "Enter Your City",
                      //     // inputFormatters: [
                      //     //   LengthLimitingTextInputFormatter(10)
                      //     // ],
                      //     controller: categoryController.cityForRegController,
                      //   ),
                      // ),
                      // getheight(context, 0.010),
                      // SizedBox(
                      //   height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.name,
                      //     icons: Icons.phone,
                      //     labelText: "State",
                      //     hintText: "Enter Your State",
                      //     // inputFormatters: [
                      //     //   LengthLimitingTextInputFormatter(10)
                      //     // ],
                      //     controller: categoryController.stateForRegController,
                      //   ),
                      // ),

                      // getheight(context, 0.010),
                      // SizedBox(
                      //   height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.number,
                      //     icons: Icons.phone,
                      //     labelText: "Pincode",
                      //     hintText: "Enter Your Pincode",
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(6)
                      //     ],
                      //     controller:
                      //         categoryController.pinCodeForRegController,
                      //   ),
                      // ),
                      Bounceable(
                        onTap: () {
                          Get.off(
                              () => const SignInPage(
                                    isGuest: true,
                                  ),
                              transition: Transition.noTransition);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: CustomTextSimple(
                              text: "Having an account?",
                              fontSize: 15,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
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
                            .nameForRegController.text.isEmpty) {
                          customeToast("Please Enter Name");
                        } else if (categoryController
                            .emailForRegController.text.isEmpty) {
                          customeToast("Please Enter Email");
                        } else if (!GetUtils.isEmail(
                            categoryController.emailForRegController.text)) {
                          customeToast("Please Enter Correct Email");
                        } else if (categoryController
                            .phoneForRegController.text.isEmpty) {
                          customeToast("Please Enter Phone Number");
                        } else if (categoryController
                                .phoneForRegController.text.length <
                            10) {
                          customeToast("Please Enter 10 Digit Number");
                        } else if (categoryController
                            .passwordSignForRegController.text.isEmpty) {
                          customeToast("Please Enter Password");
                        } else if (categoryController
                                .passwordSignForRegController.text.length <=
                            5) {
                          customeToast(
                              "Password should be more than 5 charecter");
                        } else if (categoryController
                            .conPasswordForRegController.text.isEmpty) {
                          customeToast("Please Enter Confirm Password");
                        } else if (categoryController
                                .passwordSignForRegController.text !=
                            categoryController
                                .conPasswordForRegController.text) {
                          customeToast("Password is not matched");
                        }
                        // else if (categoryController
                        //     .stateForRegController.text.isEmpty) {
                        //   customeToast("Please Enter State");
                        // } else if (categoryController
                        //     .cityForRegController.text.isEmpty) {
                        //   customeToast("Please Enter City");
                        // } else if (categoryController
                        //     .pinCodeForRegController.text.isEmpty) {
                        //   customeToast("Please Enter Pincode");
                        // } else if (categoryController
                        //         .pinCodeForRegController.text.length <
                        //     6) {
                        //   customeToast('Please Enter 6 Digit Pincode');
                        // }
                        else {
                          await categoryController.registration();
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
                        }
                      },
                      child: const CustomTextSimple(
                        text: "Continue",
                        fontSize: 15,
                      )),
                ),

                getheight(context, 0.020),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
