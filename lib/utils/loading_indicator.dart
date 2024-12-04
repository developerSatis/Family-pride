import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/utils/color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Get.back();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(
                              0,
                              10,
                            ))
                      ]),
                  child: Center(
                    child: SpinKitSpinningLines(
                      color: appColorTextLight,
                      size: 100,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

showloadingIndicator() {
  Get.dialog(AnimatedContainer(
    duration: const Duration(milliseconds: 800),
    curve: Curves.fastLinearToSlowEaseIn,
    child: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(children: [
        Center(
          child: GestureDetector(
            onTap: () {
              // Get.back();
            },
            child: Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(
                          0,
                          10,
                        ))
                  ]),
              // child: Column(
              //   children: [
              //     ShakeWidget(
              //       duration: Duration(seconds: 10),
              //       shakeConstant: ShakeHardConstant1(),
              //       autoPlay: true,
              //       enableWebMouseHover: true,
              //       child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Image.asset(
              //           'assets/images/icon.png',
              //           // fit: BoxFit.fill,
              //           // height: 70,
              //           // width: Get.width * 0.80,
              //         ),
              //       ),
              //     ),
              //     CustomTextWithOutfont(
              //       text: "Please wait...",
              //     )
              //   ],
              // ),
              child: Center(
                child: SpinKitWaveSpinner(
                  color: blueDarkColor,
                  trackColor: blueColor,
                  waveColor: blueDarkColor,
                  size: 80,
                ),
              ),
            ),
          ),
        )
      ]),
    ),
  ));
}

hideLoading() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}
