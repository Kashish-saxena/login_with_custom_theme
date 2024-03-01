import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_with_custom_theme/utils/custom_theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme themes = AppTheme();
  late ThemeData _themeData;
  late SystemUiOverlayStyle _overlayStyle;

  ThemeProvider() {
    _themeData = themes.light;
  }
  ThemeData get themeData => _themeData;
  
  set themeData(ThemeData themeDatas) {
    _themeData = themeDatas;
    notifyListeners();
  }

  SystemUiOverlayStyle get overlayStyle => _overlayStyle;
  set overlayStyle(SystemUiOverlayStyle overlayStyle) {
    _overlayStyle = overlayStyle;
    notifyListeners();
  }

  bool isDark = false;

  toogleTheme() {
    // if (_overlayStyle == ) {
    //   overlayStyle = StatusBar.statusBar(themes.light);
    // } else {
    //   overlayStyle = themes.light;
    // }

    if (isDark == true) {
      isDark = false;
    } else {
      isDark = true;
    }
    if (_themeData == themes.light) {
      themeData = themes.darkTheme;
    } else {
      themeData = themes.light;
    }
  }
}