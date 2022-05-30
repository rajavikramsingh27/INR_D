import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
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
          prefixIcon: (prefix == null) ? null : prefix),
    );
  }
}

class TextFieldCustomSuffix extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final String? title;
  final TextInputType? keyboardType;
  final Color? colorFill;
  final Color? colorBorder;
  final TextStyle? textStyle;
  final double? radiusBorder;
  final Widget? suffix;
  final EdgeInsets? padding;


  TextFieldCustomSuffix({
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
    this.suffix,
    this.padding = EdgeInsets.zero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      style: textStyle,
      decoration: InputDecoration(
          contentPadding: padding,
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
          suffixIcon: (suffix == null) ? null : suffix),
    );
  }
}

class TextFieldOTP extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  TextFieldOTP({
    Key? key,
    this.controller,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);
  @override
  _TextFieldOTPState createState() => _TextFieldOTPState();
}

class _TextFieldOTPState extends State<TextFieldOTP> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStylesProductSans.textStyles_16.apply(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counter: Offstage(),
          filled: true,
          fillColor: widget.controller!.text.isEmpty ? Colors.transparent : ColorStyle.primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: ColorStyle.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: ColorStyle.primaryColor, width: 1),
          ),
        ),
        onChanged: (text) {
          widget.onChanged!(text);

          setState(() {

          });
        });
  }
}

