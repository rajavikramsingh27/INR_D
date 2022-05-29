import 'package:flutter/material.dart';

class ColorStyle {
  static final Color scaffold = hex("#004383");

  static final Color primaryColor = hex("#00509D");
  static final Color grey = hex("#AEA4A4");
  static final Color greylow = hex("#666666");
  static final Color greylight = hex("D6D6D6");
  static final Color white = hex("#FFFFFF");



  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

