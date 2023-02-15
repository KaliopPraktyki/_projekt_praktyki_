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

    colors: const FlexSchemeColor(
      primary: Color(0xffbbcae5),
      primaryContainer: Color(0xff577cbf),
      secondary: Color(0xffe9bfbf),
      secondaryContainer: Color(0xffcb6060),
      tertiary: Color(0xffdde5f5),
      tertiaryContainer: Color(0xff7297d9),
      appBarColor: Color(0xffdde5f5),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 15,
      inputDecoratorSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorFocusedBorderWidth: 2.0,
      appBarBackgroundSchemeColor: SchemeColor.background,
      bottomNavigationBarElevation: 8.5,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationBarIndicatorSchemeColor: SchemeColor.outline,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static final lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff1145a4),
      primaryContainer: Color(0xff9fb4da),
      secondary: Color(0xffb61d1d),
      secondaryContainer: Color(0xffe1a4a4),
      tertiary: Color(0xff376bca),
      tertiaryContainer: Color(0xffcfdbf2),
      appBarColor: Color(0xffcfdbf2),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorFocusedBorderWidth: 2.0,
      bottomNavigationBarElevation: 8.5,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationBarIndicatorSchemeColor: SchemeColor.outline,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,

  );

}