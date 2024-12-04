import 'package:flutter/material.dart';
import 'package:hindustan_food/custom_utils/custom_text.dart';

class ShopClosedPage extends StatelessWidget {
  const ShopClosedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const CustomTextSimple(
          text: "We are closed this time.\nPlease visit again after some time.",
          overflow: TextOverflow.visible,
          fontSize: 15,
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}
