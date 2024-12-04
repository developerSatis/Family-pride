// import 'package:coupon_uikit/coupon_uikit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bounceable/flutter_bounceable.dart';
// import 'package:hindustan_food/custom_utils/custom_text.dart';
// import 'package:hindustan_food/utils/color.dart';

// class CouponCardCustomWidget extends StatelessWidget {
//   final void Function()? onTap;
//   final String couponAmount;
//   final String minimumSpend;
//   final String couponName;
//   final bool isSelected;
//   final bool isSelectable;
//   final String? discountType;
//   final String? imageUrl;
//   const CouponCardCustomWidget(
//       {super.key,
//       required this.onTap,
//       required this.isSelected,
//       required this.couponAmount,
//       required this.minimumSpend,
//       required this.couponName,
//       required this.discountType,
//       required this.isSelectable,
//       required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Bounceable(
//       scaleFactor: 0.8,
//       onTap: isSelectable ? onTap : null,
//       child: CouponCard(
//           shadow: BoxShadow(
//               blurRadius: isSelected ? 4 : 2,
//               color: isSelected ? greenColor : whiteColor),
//           backgroundColor: whiteDarkColor,
//           width: 150,
//           border: BorderSide(color: greenColor.withOpacity(0.5)),
//           firstChild: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // getheight(context, 0.020),
//               Row(
//                 children: [
//                   // CircleAvatar(
//                   //   maxRadius: 20,
//                   //   child: Image.network(imageUrl!),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.all(1.5),
//                     child: CircleAvatar(
//                       maxRadius: 20,
//                       backgroundColor:
//                           Colors.grey, // Color to show while image is loading
//                       child: ClipOval(
//                         child: SizedBox(
//                           width: 40,
//                           height: 40,
//                           child: Stack(
//                             children: [
//                               Image.network(
//                                 imageUrl!,
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 height: double.infinity,
//                                 loadingBuilder: (BuildContext context,
//                                     Widget child,
//                                     ImageChunkEvent? loadingProgress) {
//                                   if (loadingProgress == null) {
//                                     return child;
//                                   } else {
//                                     return Center(
//                                       child: CircularProgressIndicator(
//                                         value: loadingProgress
//                                                     .expectedTotalBytes !=
//                                                 null
//                                             ? loadingProgress
//                                                     .cumulativeBytesLoaded /
//                                                 loadingProgress
//                                                     .expectedTotalBytes!
//                                             : null,
//                                       ),
//                                     );
//                                   }
//                                 },
//                               ),
//                               Positioned.fill(
//                                 child: Image.network(
//                                   imageUrl!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//                     child: CustomTextSimple(
//                       text: discountType == "percent"
//                           ? "$couponAmount % off"
//                           : discountType == "fix"
//                               ? "₹$couponAmount off"
//                               : "₹$couponAmount Cashback",
//                       fontWeight: FontWeight.w700,
//                       color: isSelectable
//                           ? greenColor
//                           : greenColor.withOpacity(0.2),
//                       fontSize: 25,
//                       // fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),

//               CustomTextSimple(
//                 text: "On Order above ₹$minimumSpend",
//                 fontSize: 16,
//                 overflow: TextOverflow.visible,
//                 textAlign: TextAlign.center,
//                 color: isSelectable ? greyColor : greyColor.withOpacity(0.2),
//                 fontWeight: FontWeight.w600,
//               ),
//               // CustomTextSimple(
//               //   text: "CART10",
//               //   fontSize: 15,
//               //   fontWeight: FontWeight.w600,
//               //   color: greenColor,
//               // ),
//             ],
//           ),
//           secondChild: Center(
//             child: CustomTextSimple(
//               text: couponName,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: isSelectable ? greenColor : greenColor.withOpacity(0.2),
//             ),
//           )
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: CustomTextSimple(
//           //     text: "APPLY",
//           //     fontSize: 15,
//           //     color: greenColor,
//           //     fontWeight: FontWeight.w600,
//           //   ),
//           // )
//           ),
//     );
//   }
// }

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';
import 'package:hindustan_food/utils/color.dart';

class CouponCardCustomWidget extends StatelessWidget {
  final void Function()? onTap;
  final String couponAmount;
  final String minimumSpend;
  final String couponName;
  final bool isSelected;
  final bool isSelectable;
  final String? discountType;
  final String? imageUrl;
  const CouponCardCustomWidget(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.couponAmount,
      required this.minimumSpend,
      required this.couponName,
      required this.discountType,
      required this.isSelectable,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      scaleFactor: 0.8,
      onTap: isSelectable ? onTap : null,
      child: CouponCard(
          curvePosition: Get.height * 0.12,
          borderRadius: 5,
          shadow: BoxShadow(
              blurRadius: isSelected ? 4 : 2,
              color: isSelected ? greenColor : whiteColor),
          backgroundColor: whiteDarkColor,
          width: 150,
          height: Get.height * 0.26,
          border: BorderSide(color: greenColor.withOpacity(0.5)),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // getheight(context, 0.020),
              CustomTextSimple(
                text: "On Order above ₹$minimumSpend",
                fontSize: 13,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                color: isSelectable ? greyColor : greyColor.withOpacity(0.2),
                fontWeight: FontWeight.w800,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: CustomTextSimple(
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    text: couponName,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color:
                        isSelectable ? greenColor : greenColor.withOpacity(0.2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: CustomTextSimple(
                  text: discountType == "percent"
                      ? "$couponAmount % off"
                      : discountType == "fix"
                          ? "₹$couponAmount off"
                          : "Save ₹$couponAmount",
                  // : "Save ₹$couponAmount Cashback",
                  fontWeight: FontWeight.w800,
                  color:
                      isSelectable ? greenColor : greenColor.withOpacity(0.2),
                  fontSize: 20,
                  // fontSize: 12,
                ),
              ),
              // Row(
              //   children: [
              //     // CircleAvatar(
              //     //   maxRadius: 20,
              //     //   child: Image.network(imageUrl!),
              //     // ),
              //     // Padding(
              //     //   padding: const EdgeInsets.all(1.5),
              //     //   child: CircleAvatar(
              //     //     maxRadius: 20,
              //     //     backgroundColor:
              //     //         Colors.grey, // Color to show while image is loading
              //     //     child: ClipOval(
              //     //       child: SizedBox(
              //     //         width: 40,
              //     //         height: 40,
              //     //         child: Stack(
              //     //           children: [
              //     //             Image.network(
              //     //               imageUrl!,
              //     //               fit: BoxFit.cover,
              //     //               width: double.infinity,
              //     //               height: double.infinity,
              //     //               loadingBuilder: (BuildContext context,
              //     //                   Widget child,
              //     //                   ImageChunkEvent? loadingProgress) {
              //     //                 if (loadingProgress == null) {
              //     //                   return child;
              //     //                 } else {
              //     //                   return Center(
              //     //                     child: CircularProgressIndicator(
              //     //                       value: loadingProgress
              //     //                                   .expectedTotalBytes !=
              //     //                               null
              //     //                           ? loadingProgress
              //     //                                   .cumulativeBytesLoaded /
              //     //                               loadingProgress
              //     //                                   .expectedTotalBytes!
              //     //                           : null,
              //     //                     ),
              //     //                   );
              //     //                 }
              //     //               },
              //     //             ),
              //     //             Positioned.fill(
              //     //               child: Image.network(
              //     //                 imageUrl!,
              //     //                 fit: BoxFit.cover,
              //     //               ),
              //     //             ),
              //     //           ],
              //     //         ),
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),

              //     Padding(
              //       padding: const EdgeInsets.only(left: 8.0, right: 8),
              //       child: CustomTextSimple(
              //         text: discountType == "percent"
              //             ? "$couponAmount % off"
              //             : discountType == "fix"
              //                 ? "₹$couponAmount off"
              //                 : "₹$couponAmount Cashback",
              //         fontWeight: FontWeight.w700,
              //         color: isSelectable
              //             ? greenColor
              //             : greenColor.withOpacity(0.2),
              //         fontSize: 25,
              //         // fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),

              // CustomTextSimple(
              //   text: "CART10",
              //   fontSize: 15,
              //   fontWeight: FontWeight.w600,
              //   color: greenColor,
              // ),
            ],
          ),
          firstChild: Stack(
            children: [
              Image.network(
                imageUrl!,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                },
              ),
              Positioned.fill(
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
          // Center(
          //   child: CustomTextSimple(
          //     text: couponName,
          //     fontSize: 18,
          //     fontWeight: FontWeight.w700,
          //     color: isSelectable ? greenColor : greenColor.withOpacity(0.2),
          //   ),
          // )
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CustomTextSimple(
          //     text: "APPLY",
          //     fontSize: 15,
          //     color: greenColor,
          //     fontWeight: FontWeight.w600,
          //   ),
          // )
          ),
    );
  }
}
