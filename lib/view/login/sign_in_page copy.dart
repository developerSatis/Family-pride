import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/custom_widget/custom_text_field.dart';
import 'package:hindustan_food/utils/color.dart';
import 'package:hindustan_food/utils/size_helper.dart';
import 'package:hindustan_food/view/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: darkBlueColor,
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: const [
                      // Colors.white
                      Color(0xffF99E43), Color(0xffDA2323)
                    ],
                        begin: _topAlignmentAnimation.value,
                        end: _bottomAlignmentAnimation.value)),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getheight(context, 0.10),
                        Container(
                          decoration: const BoxDecoration(
                            //Here goes the same radius, u can put into a var or function
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(150),
                                topRight: Radius.circular(150),
                                bottomLeft: Radius.circular(150),
                                bottomRight: Radius.circular(150)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x54000000),
                                spreadRadius: 5,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/vegetable.webp',
                              fit: BoxFit.fill,
                              // height: 50,
                              // width: 50,
                              height: Get.height * 0.22,
                              width: Get.width * 0.45,
                              // height: height * 0.12,
                              // width: width * 0.95,
                            ),
                          ),
                        ),
                        getheight(context, 0.05),
                        Hero(
                          tag: 'logo1',
                          child: CustomTextSimple(
                            text: "Login",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: SizedBox(
                            height: Get.height * 0.068,
                            width: Get.width * 0.90,
                            child: CustomTextField(
                              keyboardType: TextInputType.number,
                              icons: Icons.phone,
                              labelText: "Mobile Number",
                              hintText: "Mobile Number",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
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
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => const HomePage());
                            },
                            child: const CustomTextSimple(
                              text: "Login",
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
