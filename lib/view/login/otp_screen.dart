import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/controller/cart_controller.dart';
import 'package:hindustan_food/controller/catageory_controller.dart';
import 'package:hindustan_food/controller/shared_prefrence_controller.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 10;

  bool isTimeStart = false;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isTimeStart = false;
          });
        } else {
          setState(() {
            _start--;
            isTimeStart = true;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _listenOtp();

    super.initState();
  }

  Future<void> _listenOtp() async {
    await SmsAutoFill().listenForCode();
  }

  bool isTimerInitialized() {
    return _timer != null;
  }

  @override
  void dispose() {
    if (isTimerInitialized()) {
      _timer!.cancel();
    }
    super.dispose();
    SmsAutoFill().unregisterListener();
  }

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    SharedPref sharedPref = Get.put(SharedPref());
    CartController cartController = Get.put(CartController());
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
                        child: CustomTextRich(
                          text: "Varify Otp",
                          color: whiteColor,
                          // fontSize: 15,
                          fontWeight: FontWeight.w600,
                          // children: [
                          //   TextSpan(
                          //       text:
                          //           " (Otp is ${categoryController.otpData.value})",
                          //       style: const TextStyle(fontSize: 12))
                          // ],
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
                      PinFieldAutoFill(
                          keyboardType: TextInputType.none,
                          enableInteractiveSelection: false,
                          enabled: false,
                          decoration: UnderlineDecoration(
                            colorBuilder: FixedColorBuilder(
                              Colors.black.withOpacity(0.2),
                            ),
                          ),
                          //   OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          // borderSide: BorderSide(color: appColorBlack.withOpacity(0.4))),// UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
                          currentCode: "", // prefill with a code
                          onCodeSubmitted: (code) {}, //code submitted callback
                          onCodeChanged: (code) {
                            print("This is code $code");
                            if (code!.length == 5) {
                              FocusScope.of(context).requestFocus(FocusNode());

                              categoryController.isValidOtp.value = false;
                              categoryController.otp.value = code;
                              categoryController.verifyOtp(int.parse(code));
                            } else {
                              categoryController.isValidOtp.value = true;
                            }
                          }, //code changed callback
                          codeLength: 5 //code length, default 6
                          ),
                      getheight(context, 0.020),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SizedBox(
                      //         height: Get.height * 0.070,
                      //         width: Get.width * 0.12,
                      //         child: CustomTextFormFieldAddressWithController(
                      //           // textColor: whiteColor,
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               FocusScope.of(context).nextFocus();
                      //             }
                      //             if (p0.isEmpty) {
                      //               FocusScope.of(context).previousFocus();
                      //             }
                      //           },
                      //           textAlign: TextAlign.center,
                      //           formatter: [
                      //             LengthLimitingTextInputFormatter(1),
                      //           ],
                      //           textInputType: TextInputType.number,
                      //           hintText: "",
                      //           controller: categoryController.firstOtp,
                      //         )),
                      //     getwidth(context, 0.035),
                      //     SizedBox(
                      //         height: Get.height * 0.070,
                      //         width: Get.width * 0.12,
                      //         child: CustomTextFormFieldAddressWithController(
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               FocusScope.of(context).nextFocus();
                      //             }
                      //             if (p0.isEmpty) {
                      //               FocusScope.of(context).previousFocus();
                      //             }
                      //           },
                      //           textAlign: TextAlign.center,
                      //           textAlignVertical: TextAlignVertical.center,
                      //           textInputType: TextInputType.number,
                      //           formatter: [
                      //             LengthLimitingTextInputFormatter(1),
                      //           ],
                      //           hintText: "",
                      //           controller: categoryController.secondOtp,
                      //         )),
                      //     getwidth(context, 0.035),
                      //     SizedBox(
                      //         height: Get.height * 0.070,
                      //         width: Get.width * 0.12,
                      //         child: CustomTextFormFieldAddressWithController(
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               FocusScope.of(context).nextFocus();
                      //             }
                      //             if (p0.isEmpty) {
                      //               FocusScope.of(context).previousFocus();
                      //             }
                      //           },
                      //           textAlign: TextAlign.center,
                      //           textInputType: TextInputType.number,
                      //           formatter: [
                      //             LengthLimitingTextInputFormatter(1),
                      //           ],
                      //           hintText: "",
                      //           controller: categoryController.thirdOtp,
                      //         )),
                      //     getwidth(context, 0.035),
                      //     SizedBox(
                      //         height: Get.height * 0.070,
                      //         width: Get.width * 0.12,
                      //         child: CustomTextFormFieldAddressWithController(
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               FocusScope.of(context).nextFocus();
                      //             }
                      //             if (p0.isEmpty) {
                      //               FocusScope.of(context).previousFocus();
                      //             }
                      //           },
                      //           textAlign: TextAlign.center,
                      //           textInputType: TextInputType.number,
                      //           formatter: [
                      //             LengthLimitingTextInputFormatter(1),
                      //           ],
                      //           hintText: "",
                      //           controller: categoryController.fourthOtp,
                      //         )),
                      //     getwidth(context, 0.035),
                      //     SizedBox(
                      //         height: Get.height * 0.070,
                      //         width: Get.width * 0.12,
                      //         child: CustomTextFormFieldAddressWithController(
                      //           onChanged: (p0) {
                      //             if (p0.length == 1) {
                      //               FocusScope.of(context).nextFocus();
                      //             }
                      //             if (p0.isEmpty) {
                      //               FocusScope.of(context).previousFocus();
                      //             }
                      //           },
                      //           textAlign: TextAlign.center,
                      //           textInputType: TextInputType.number,
                      //           formatter: [
                      //             LengthLimitingTextInputFormatter(1),
                      //           ],
                      //           hintText: "",
                      //           controller: categoryController.fifthOtp,
                      //         )),
                      //     // getwidth(context, 0.035),
                      //     // SizedBox(
                      //     //     height: Get.height * 0.070,
                      //     //     width: Get.width * 0.12,
                      //     //     child: CustomTextFormFieldAddressWithController(
                      //     //       onChanged: (p0) {
                      //     //         if (p0.length == 1) {
                      //     //           FocusScope.of(context).nextFocus();
                      //     //         }
                      //     //         if (p0.isEmpty) {
                      //     //           FocusScope.of(context).previousFocus();
                      //     //         }
                      //     //       },
                      //     //       textAlign: TextAlign.center,
                      //     //       textInputType: TextInputType.number,
                      //     //       formatter: [
                      //     //         LengthLimitingTextInputFormatter(1),
                      //     //       ],
                      //     //       hintText: "",
                      //     //       controller: categoryController.sixOtp,
                      //     //     ))
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: Get.height * 0.068,
                      //   width: Get.width * 0.90,
                      //   child: CustomTextField(
                      //     keyboardType: TextInputType.number,
                      //     icons: Icons.phone,
                      //     labelText: "Mobile Number",
                      //     hintText: "9098789098",
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(10)
                      //     ],
                      //     controller: categoryController.phoneNumberController,
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
                      getheight(context, 0.010),
                      Bounceable(
                        onTap: () {
                          startTimer();
                          setState(() {
                            _start = 30;
                            isTimeStart = true;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: !isTimeStart
                                ? const CustomTextSimple(
                                    text: "Resend Otp",
                                    fontSize: 15,
                                  )
                                : CustomTextSimple(
                                    text: "Wait : $_start",
                                    fontSize: 15,
                                  ),
                          ),
                        ),
                      ),
                      getheight(context, 0.02),
                    ],
                  ),
                ),
                // getheight(context, 0.020),
                // Hero(
                //   tag: "button",
                //   child: ElevatedButton(
                //       onPressed: () async {
                //         int otp = int.parse(categoryController.firstOtp.text +
                //                 categoryController.secondOtp.text +
                //                 categoryController.thirdOtp.text +
                //                 categoryController.fourthOtp.text +
                //                 categoryController.fifthOtp.text
                //             // +
                //             // categoryController.sixOtp.text
                //             );
                //         if (otp ==
                //             int.parse(categoryController.otpData.value)) {
                //           Get.dialog(AlertDialog(
                //             backgroundColor: whiteColor,
                //             title: CustomTextSimple(
                //               text: "OTP Verfiy Successfully",
                //               color: greenColor,
                //               fontSize: 20,
                //               fontWeight: FontWeight.w600,
                //             ),
                //             content: const CustomTextSimple(
                //               text: "Proceed for Login",
                //               fontSize: 16,
                //             ),
                //             actions: [
                //               ElevatedButton(
                //                   style: ButtonStyle(
                //                       backgroundColor: WidgetStateProperty.all(
                //                           Colors.green)),
                //                   child: CustomTextSimple(
                //                     text: "Proceed",
                //                     fontSize: 15,
                //                     color: whiteColor,
                //                     fontWeight: FontWeight.w600,
                //                   ),
                //                   onPressed: () async {
                //                     // await sharedPref.setUserId(
                //                     //     categoryController.userID.value);
                //                     // await sharedPref.getuserId();
                //                     // categoryController.getProducts();
                //                     // categoryController.getHomeProduct();
                //                     // categoryController.getHomeProductTwo();
                //                     // cartController.getCardDetails();
                //                     // Get.offAll(() => const HomePage());
                //                     categoryController.verifyOtp(otp);
                //                   })
                //             ],
                //           ));
                //         } else {
                //           customeToast("Please Enter Correct OTP");
                //         }
                //         // Get.to(() => const HomePage());
                //         // customeToast("Please Enter Phone Number");
                //         // if (categoryController
                //         //     .phoneNumberController.text.isEmpty) {
                //         //   customeToast("Please Enter 9098789098 phone number");
                //         // } else if (categoryController
                //         //         .phoneNumberController.text.length <
                //         //     10) {
                //         //   customeToast("Please Enter 10 Digit Number");
                //         // } else if (categoryController
                //         //         .phoneNumberController.text !=
                //         //     "9098789098") {
                //         //   customeToast("Please Enter 9098789098 phone number");
                //         // } else {
                //         //   await categoryController.login();
                //         //   // isGuest!
                //         //   //     ? {
                //         //   //         Get.offAll(() => const HomePage()),
                //         //   //         categoryController.islogin.value = true
                //         //   //       }
                //         //   //     : {
                //         //   //         Get.to(() => const AddressPage()),
                //         //   //         categoryController.islogin.value = false
                //         //   //       };

                //         //   // categoryController.islogin.value == true
                //         //   //     ? {
                //         //   //         Get.offAll(() => const HomePage()),
                //         //   //         categoryController.islogin.value = true
                //         //   //       }
                //         //   //     : {
                //         //   //         Get.to(() => const AddressPage()),
                //         //   //         categoryController.islogin.value = false
                //         //   //       };
                //         //   // categoryController.islogin.value =
                //         //   //     !categoryController.islogin.value;
                //         // }
                //       },
                //       child: const CustomTextSimple(
                //         text: "Confirm",
                //         fontSize: 15,
                //       )),
                // ),

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
