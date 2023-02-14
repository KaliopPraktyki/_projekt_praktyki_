import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/provider/theme_provider.dart';
import 'l10n/l10n.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'LoginScreen',
  //     theme: ThemeData(
  //
  //     ),
  //     debugShowCheckedModeBanner: false,
  //     home: MainPage(),
  //   );
  Widget build(BuildContext context) => ChangeNotifierProvider(

      create: (context) => ThemeProvider(),
      builder: (context, _){
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Project Praktyki",
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          supportedLocales: L10n.all,
          home: const MainPage(),

        );
      }
  );
  }


