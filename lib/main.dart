import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
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
  @override
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
          home: const MainPage(),
        );
      }
  );
  }


