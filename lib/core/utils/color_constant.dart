import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color defaultBlue = fromHex('#9900cc');

  static Color gray60066 = fromHex('#66797979');
  static Color pink = fromHex('#cc0098');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
