import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/provider/theme_provider.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loginscreen/provider/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return MultiProvider(
       providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (context) => LocaleProvider(),),
        ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
       ],
     builder: (context,child){
       final provider = Provider.of<LocaleProvider>(context);
       final notifier = Provider.of<ThemeNotifier>(context);
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         locale: provider.locale,
         supportedLocales: L10n.all,
         localizationsDelegates: const [
         AppLocalizations.delegate,
         GlobalMaterialLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate
         ],
         title: 'Project Praktyki',
         theme: notifier.darkTheme ? dark : light,
         home: const MainPage(),
       );
     },


   );
  }
}