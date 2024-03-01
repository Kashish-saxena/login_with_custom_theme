import 'package:flutter/material.dart';
import 'package:login_with_custom_theme/utils/color_constants.dart';
import 'package:login_with_custom_theme/utils/custom_theme/oulined_button_theme.dart';

class AppTheme {
  late ThemeData _currentTheme;

  AppTheme._internal() {
    _currentTheme = light;
  }

  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  void setTheme(ThemeData currentTheme) {
    _currentTheme = currentTheme;
  }

  ThemeData get currentTheme => _currentTheme;

  static void init() {
    _instance._currentTheme = ThemeData.light();
  }

  ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.white,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: ColorConstants.white,
      primary: ColorConstants.black,
      secondary: ColorConstants.black,
      // appBarTheme: AppBarTheme( systemOverlayStyle:SystemUiOverlayStyle( statusBarColor: ColorConstants.black,
      //     statusBarIconBrightness: Brightness.dark,)),
    ),
  );

  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.black,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkTheme,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: ColorConstants.black,
      primary: ColorConstants.white,
      secondary: ColorConstants.black,
    ),
    // appBarTheme: AppBarTheme( systemOverlayStyle:SystemUiOverlayStyle( statusBarColor: ColorConstants.black,
    //     statusBarIconBrightness: Brightness.light,)),
  );
}
