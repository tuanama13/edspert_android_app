import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorThemes {
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color primary = hexToColor('#3A7FD5');
  static Color appBarTitleColor = Colors.white;
  static Color textSubtitle1 = hexToColor('#979797');
  static Color border = hexToColor('#C9C9C9');
}
