import 'package:flutter/material.dart';

import '../utils/color.dart';

class CustomTextRich extends StatelessWidget {
  final String? text;
  final List<InlineSpan>? children;
  final double? fontSize;
  final double? letterSpacing;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const CustomTextRich(
      {super.key,
      required this.text,
      this.children,
      this.color,
      this.fontSize,
      this.letterSpacing,
      this.textAlign,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        children: children,
      ),
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize ?? 25,
          // letterSpacing: letterSpacing ?? 2,
          color: color ?? appColorBlack,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class CustomTextSimple extends StatelessWidget {
  final String? text;
  final List<InlineSpan>? children;
  final double? fontSize;
  final double? letterSpacing;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  const CustomTextSimple(
      {super.key,
      required this.text,
      this.children,
      this.color,
      this.fontSize,
      this.letterSpacing,
      this.fontWeight,
      this.textAlign,
      this.decoration,
      this.overflow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: fontSize ?? 25,
          // letterSpacing: letterSpacing ?? 1,
          color: color ?? appColorBlack,
          fontWeight: fontWeight ?? FontWeight.w500,
          overflow: overflow ?? TextOverflow.ellipsis),
    );
  }
}

class CustomTextCard extends StatelessWidget {
  final String? text;
  final List<InlineSpan>? children;
  final double? fontSize;
  final double? letterSpacing;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  const CustomTextCard(
      {super.key,
      required this.text,
      this.children,
      this.color,
      this.fontSize,
      this.letterSpacing,
      this.fontWeight,
      this.textAlign,
      this.decoration,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: fontSize ?? 14,
          // letterSpacing: letterSpacing ?? 1,
          color: color ?? appColorBlack,
          fontWeight: fontWeight ?? FontWeight.w700,
          overflow: overflow ?? TextOverflow.ellipsis),
    );
  }
}
