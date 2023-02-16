import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/provider/theme_provider.dart';
import 'l10n/l10n.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,
            title: 'Project Praktyki',
            theme: notifier.darkTheme ? dark : light,
            supportedLocales: L10n.all,
            home: const MainPage(),
          );
        } ,
      ),
    );
  }
}