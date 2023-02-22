import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/screens/change_password_screen.dart';
import 'package:loginscreen/screens/edit_profile_screen.dart';
import 'package:loginscreen/screens/home_page.dart';
import '../auth/auth_page.dart';
import '../widgets/pop_up_settings_tile.dart';
import '../widgets/settings_tile.dart';
import '../widgets/switch_settings_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        AppLocalizations.of(context)!.settings,
        style: const TextStyle(fontSize: 25),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Icon(Ionicons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              ThemeChanger(
                color: Colors.grey[900]!,
                icon: Ionicons.moon,
                title:AppLocalizations.of(context)!.darkmode,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.profile,
                style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              const SizedBox(height: 25,),
              SettingsTile(
                color: const Color.fromARGB(200, 12, 167, 137),
                icon: Ionicons.pencil,
                title: AppLocalizations.of(context)!.editprofile,
                page: MaterialPageRoute(builder: (context) => const EditProfile()),
              ),
              const SizedBox(height: 20,),
              SettingsTile(
                color: const Color.fromARGB(200, 45, 155, 240),
                icon: Ionicons.lock_closed,
                title: AppLocalizations.of(context)!.changepassword,
                page: MaterialPageRoute(builder: (context) => const ChangePassword()),
              ),
              const SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.notifications,
                style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              const SizedBox(height: 25,),
               SettingsTile(
                 color: const Color.fromARGB(200, 95, 99, 251),
                 icon: Ionicons.notifications,
                 title: AppLocalizations.of(context)!.notifications,
                 page: MaterialPageRoute(builder: (context) => const SettingsScreen()),
              ),
              const SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.regional,
                style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),
              ),
              const SizedBox(height: 25,),
              LanguageChanger(
                color: const Color.fromARGB(200, 250, 199, 16),
                icon: Ionicons.language,
                title: AppLocalizations.of(context)!.languageregion,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 200,
                    child:
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 90,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Theme.of(context).errorColor,),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(onPressed: (){
                          user.delete();
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MainPage()));
                        },
                          child: Text("delete acc", style: TextStyle(color: Theme.of(context).errorColor, fontSize: 20,),),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
