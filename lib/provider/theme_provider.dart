import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes{
  static final darkTheme = FlexThemeData.dark(
    appBarBackground: Colors.black,
    scheme: FlexScheme.blue,
    scaffoldBackground: Colors.black
  );

  static final lightTheme = FlexThemeData.light(
    scheme: FlexScheme.blue,
    appBarBackground: Colors.white,

  );

}