import 'package:flutter/material.dart';

class TextFieldCustomOutline extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? title;
  final TextInputType? keyboardType;
  final Color? colorFill;
  final Color? colorBoder;
  final Color? colorText;
  final Color? colorHint;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final int? maxLines;
  final EdgeInsets? padding;

  TextFieldCustomOutline({
    Key? key,
    this.controller,
    this.title,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.colorFill = Colors.white,
    this.colorBoder = Colors.black,
    this.colorHint = Colors.grey,
    this.colorText = Colors.black,
    this.textStyle,
    this.radiusBorder = 8.0,
    this.maxLines = 1,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: textStyle?.apply(color: colorText),
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: padding,
        filled: true,
        fillColor: colorFill,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBoder!, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBoder!, width: 1)),
        hintText: hintText,
        hintStyle: textStyle?.apply(color: colorHint),
      ),
    );
  }
}