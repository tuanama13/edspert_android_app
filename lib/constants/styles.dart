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

  static ButtonStyle primaryButtonRounded = ElevatedButton.styleFrom(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(20),
    // ),
    backgroundColor: ColorThemes.primary,
    foregroundColor: Colors.white,
  );

  static ButtonStyle outlineButton = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    side: BorderSide(color: ColorThemes.primary),
    foregroundColor: ColorThemes.primary,
  );

  static InputDecoration textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusColor: ColorThemes.primary,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorThemes.textFieldBorder),
    ),
    hintText: 'contoh : Joko Susilo',
  );

  static InputDecoration dropdownFieldStyle = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorThemes.textFieldBorder,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ColorThemes.textFieldBorder),
    ),
    filled: true,
    fillColor: Colors.white,
  );
}
