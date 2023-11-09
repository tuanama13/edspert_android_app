import 'package:edspert_app/constants/colors.dart';
import 'package:flutter/material.dart';

class StyleTheme {
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: ColorThemes.primary,
    foregroundColor: Colors.white,
  );

  static ButtonStyle outlineButton = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: BorderSide(color: ColorThemes.primary),
      foregroundColor: ColorThemes.primary);
}
