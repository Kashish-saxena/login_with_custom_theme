import 'package:flutter/material.dart';
import 'package:login_with_custom_theme/utils/color_constants.dart';

class CustomOutlinedButtonTheme {
  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      side: const MaterialStatePropertyAll(
        BorderSide(color: ColorConstants.pink),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsetsDirectional.symmetric(vertical: 15),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(ColorConstants.pink),
    ),
  );

  static OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      side: const MaterialStatePropertyAll(
        BorderSide(color: ColorConstants.red),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsetsDirectional.symmetric(vertical: 15),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(ColorConstants.red),
    ),
  );
}
