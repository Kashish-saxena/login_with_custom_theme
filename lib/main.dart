import 'package:flutter/material.dart';
import 'package:login_with_custom_theme/utils/custom_theme/app_theme.dart';
import 'package:login_with_custom_theme/utils/custom_theme/status_bar_theme.dart';
import 'package:login_with_custom_theme/utils/custom_theme/theme_model.dart';
import 'package:login_with_custom_theme/utils/custom_theme/theme_provider.dart';
import 'package:login_with_custom_theme/view_models/login_screen_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  AppTheme.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())
      ],
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            home: StatusBar.statusBar(themeNotifier),
            theme: Provider.of<ThemeProvider>(context).themeData,
          
          );
        },
      ),
    );
  }
}
