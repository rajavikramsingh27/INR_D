
import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class TextButtonCustom extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? colorBG;
  final double? width;
  final double? height;
  final double? radiusBorder;
  final Color? colorBorder;
  final TextStyle? textStyle;

  TextButtonCustom({Key? key,
    this.onTap,
    this.text = "Text Button",
    this.colorBG = Colors.red,
    this.width = 200,
    this.height = 50,
    this.radiusBorder = 4,
    this.colorBorder = Colors.transparent,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colorBG,
        fixedSize: Size(width!, height!),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            side: BorderSide(color: colorBorder!)),
      ),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        style: textStyle!,
      ),
      onPressed: onTap,
    );
  }
}
class TextButtonAddCustom extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? colorBG;
  final double? width;
  final double? height;
  final double? radiusBorder;
  final Color? colorBorder;
  final TextStyle? textStyle;

  TextButtonAddCustom({Key? key,
    this.onTap,
    this.text = "Text Button",
    this.colorBG = Colors.white,
    this.width = 200,
    this.height = 50,
    this.radiusBorder = 4,
    this.colorBorder = Colors.blue,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colorBG,
        fixedSize: Size(width!, height!),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusBorder!),
            side: BorderSide(color: Colors.blue.shade100)),
      ),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        style: textStyle!,
      ),
      onPressed: onTap,
    );
  }
}

