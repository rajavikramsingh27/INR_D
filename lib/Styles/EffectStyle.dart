import '../Styles/ColorStyle.dart';
import 'package:flutter/material.dart';

class EffectStyle {
  static radiusCustom(double radius) {
    return BorderRadius.circular(radius);
  }

  static curveAuth(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
      ),
    );
  }

  static padding(double left, double right, double top, double bottom) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static paddingAuthWhite() {
    return EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30);
  }

  static decorationTransferSummary() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorStyle.hex('#16429D').withOpacity(0.6)
        // image: DecorationImage(
        //   image: AssetImage(ImageStyle.Rectangle1958),
        //   fit: BoxFit.cover,
        // ),
        );
  }
}
