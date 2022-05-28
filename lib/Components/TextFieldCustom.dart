import 'package:flutter/material.dart';
import '../Styles/TextStyles.dart';



class TextFieldCustomPrefix extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final String? title;
  final TextInputType? keyboardType;
  final Color? colorFill;
  final Color? colorBorder;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final Widget? prefix;

  TextFieldCustomPrefix({
    Key? key,
    this.controller,
    this.title,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.colorFill,
    this.colorBorder = Colors.red,
    this.textStyle = const TextStyle(),
    this.radiusBorder = 4,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      style: textStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 6,
            bottom: 6,
          ),
          filled: true,
          fillColor: colorFill,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBorder!, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBorder!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            borderSide: BorderSide(color: colorBorder!, width: 1),
          ),
          hintText: hintText,
          hintStyle: textStyle!.apply(color: Colors.grey),
          prefixIcon: (prefix == null) ? null : prefix
      ),
    );
  }
}