import 'package:flutter/material.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';


class DropdownButtonCustom extends StatelessWidget {
  final Function(String?)? onChanged;
  final List<String>? listValue;
  final String? selectedValue;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final double? radiusBorder;
  // final double? height;
  final Widget? iconWidget;
  final Text? hint;
  final TextStyle? textStyle;

  const DropdownButtonCustom({
    Key? key,
    this.onChanged,
    this.listValue,
    this.selectedValue,
    this.colorBorder = Colors.red,
    this.padding = EdgeInsets.zero,
    this.radiusBorder = 4,
    // this.height = 30,
    this.iconWidget = const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
    this.hint = const Text(""),
    this.textStyle = const TextStyle()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedValue,
        icon: iconWidget,
        iconSize: 30,
        hint: hint,
        decoration: InputDecoration(
          contentPadding: padding,
          focusedBorder: OutlineInputBorder(
              borderRadius: EffectStyle.radiusCustom(radiusBorder!),
              borderSide: BorderSide(color: colorBorder!, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: EffectStyle.radiusCustom(radiusBorder!),
              borderSide: BorderSide(color: colorBorder!, width: 1)),
          border: OutlineInputBorder(
              borderRadius: EffectStyle.radiusCustom(radiusBorder!),
              borderSide: BorderSide(color: colorBorder!, width: 1)),
        ),
        onChanged: onChanged!,
        items: listValue!
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(
                  value,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: textStyle!.apply(
                      color: (selectedValue! == listValue![0]) ? ColorStyle.grey : ColorStyle.primaryColor
                  )
              ),
            ))
            .toList(),
      ),
    );
  }
}
class DropdownButtonCustomCurrency extends StatelessWidget {
  final Function(String?)? onChanged;
  final List<String>? listValue;
  final String? selectedValue;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final double? radiusBorder;
  // final double? height;
  final Widget? iconWidget;
  final Text? hint;
  final TextStyle? textStyle;

  const DropdownButtonCustomCurrency({
    Key? key,
    this.onChanged,
    this.listValue,
    this.selectedValue,
    this.colorBorder = Colors.red,
    this.padding = EdgeInsets.zero,
    this.radiusBorder = 4,
    // this.height = 30,
    this.iconWidget = const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
    this.hint = const Text(""),
    this.textStyle = const TextStyle()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedValue,
        icon: iconWidget,
        iconSize: 30,
        hint: hint,
        decoration: InputDecoration(
          contentPadding: padding,
          border: InputBorder.none,
        ),
        onChanged: onChanged!,
        items: listValue!
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(
                  value,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: textStyle!.apply(
                      color: (selectedValue! == listValue![0]) ? ColorStyle.grey : ColorStyle.primaryColor
                  )
              ),
            ))
            .toList(),
      ),
    );
  }
}

