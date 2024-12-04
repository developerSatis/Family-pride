import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/color.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? icons;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {Key? key,
      this.hintText,
      required this.icons,
      this.keyboardType,
      this.obscureText,
      this.controller,
      this.labelText,
      this.inputFormatters,
      this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        maxLines: 1,
        focusNode: _focusNode,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText ?? false,
        style: TextStyle(
          color: Colors.grey[800], // Change as needed
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: _isFocused
              ? Colors.green[50]
              : Colors.white, // Fill color changes based on focus
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              color: _isFocused
                  ? Colors.black
                  : Colors.grey[700], // Change label color based on focus
              fontWeight: _isFocused ? FontWeight.w700 : null),
          prefixIcon: Icon(
            widget.icons!,
            color: Colors.black,
            // You can add shadow if needed
          ),
          suffixIcon: widget.suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green[50]!),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
        ),
      ),
    );
  }
}

class CustomTextFieldwithoutIcon extends StatelessWidget {
  final String? hintText;
  final IconData? icons;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFieldwithoutIcon(
      {super.key,
      this.hintText,
      this.icons,
      this.keyboardType,
      this.obscureText,
      this.inputFormatters,
      this.label,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        style: TextStyle(color: appColorBlack),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            label: label,

            // prefixIcon: Icon(
            //   icons!,
            //   color: iconColor,
            // ),
            // contentPadding: ,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: hintColor),
              // borderRadius: const BorderRadius.only(
              //   bottomLeft: Radius.circular(35.0),
              // ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColorYellow),
              borderRadius: const BorderRadius.all(
                Radius.circular(35.0),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: redColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(35.0),
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: hintColor)),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
    return newValue;
  }
}

class CustomTextFormFieldAddressWithController extends StatelessWidget {
  // TextEditingController controllers = TextEditingController();
  final TextInputType? textInputType;
  final Widget? icon;
  final Color? iconColor;
  final String? labelText;
  final double? hintFontSize;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool? isHidden;
  final List<TextInputFormatter>? formatter;
  final int? maxLength;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final VoidCallback? onEditingComplete;
  final String? hintText;
  final int? minLines;
  final String? initialValue;
  final double? textFormheight;
  final Color? textColor;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;

  const CustomTextFormFieldAddressWithController(
      {super.key,
      this.textInputType,
      this.icon,
      this.iconColor,
      this.controller,
      this.hintFontSize,
      this.labelText,
      this.onTap,
      this.onChanged,
      this.isHidden,
      this.formatter,
      this.maxLength,
      this.maxLines,
      this.textAlign,
      this.validator,
      this.readOnly,
      this.onEditingComplete,
      this.minLines,
      this.onTapOutside,
      this.hintText,
      this.initialValue,
      this.textAlignVertical,
      this.contentPadding,
      this.textFormheight,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.90,
      height: textFormheight ?? Get.height * 0.080,
      child: TextFormField(
        style: TextStyle(color: textColor ?? whiteColor),
        initialValue: initialValue,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        onTapOutside: onTapOutside,
        onEditingComplete: onEditingComplete,
        readOnly: readOnly ?? false,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        inputFormatters: formatter,
        obscureText: isHidden ?? false,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.top,
        keyboardType: textInputType,
        decoration: InputDecoration(
          // error: Text('g'),
          contentPadding: contentPadding,
          hintText: hintText,
          isDense: true,
          suffixIcon: icon,

          suffixIconColor: iconColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: appColorBlack.withOpacity(0.4))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: activeColor)),
          labelText: labelText,
          // labelStyle: GoogleFonts.poppins(fontSize: hintFontSize)
        ),
      ),
    );
  }
}
