import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_with_custom_theme/screens/login_screen.dart';
import 'package:login_with_custom_theme/utils/color_constants.dart';

class StatusBar {
  static Widget statusBar(themeNotifier) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor:
            themeNotifier.isDark ? ColorConstants.black : ColorConstants.white,
        statusBarIconBrightness:
            themeNotifier.isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            themeNotifier.isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor:
            themeNotifier.isDark ? ColorConstants.black : ColorConstants.white,
        systemNavigationBarIconBrightness:
            themeNotifier.isDark ? Brightness.light : Brightness.dark,
      ),
      child: LoginScreen(),
    );
  }
}
