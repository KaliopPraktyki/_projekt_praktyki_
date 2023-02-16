import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData dark = FlexThemeData.dark(
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
      textButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonRadius: 3.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.surfaceTint,
      outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      toggleButtonsSchemeColor: SchemeColor.onPrimaryContainer,
      inputDecoratorSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorFocusedBorderWidth: 2.0,
      fabUseShape: true,
      fabAlwaysCircular: true,
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

ThemeData light = FlexThemeData.light(
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
      textButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonRadius: 3.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.surfaceTint,
      outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      toggleButtonsSchemeColor: SchemeColor.onPrimaryContainer,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorFocusedBorderWidth: 2.0,
      fabUseShape: true,
      fabAlwaysCircular: true,
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

class ThemeNotifier extends ChangeNotifier {
  String key = "theme";
  late SharedPreferences _prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ThemeNotifier() {
    if(_loadFromPrefs() == true){
      _darkTheme = true;
    }else{
      _darkTheme = false;
    }
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }


  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }

}