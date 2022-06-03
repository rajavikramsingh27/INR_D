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
  final Widget? iconWidget;
  final Text? hint;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? dropdownColor;

  const DropdownButtonCustom({
    Key? key,
    this.onChanged,
    this.listValue,
    this.selectedValue,
    this.colorBorder = Colors.red,
    this.bgColor = Colors.white,
    this.padding = EdgeInsets.zero,
    this.radiusBorder = 40,
    this.iconWidget = const Icon(Icons.keyboard_arrow_down, color: Colors.black,),
    this.hint = const Text(""),
    this.textStyle = const TextStyle(),
    this.dropdownColor:  Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radiusBorder!)
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedValue,
        icon: iconWidget,
        iconSize: 30,
        hint: hint,
        style: textStyle!.apply(),
        dropdownColor: dropdownColor,
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
              ),
            ))
            .toList(),
      ),
    );
  }
}