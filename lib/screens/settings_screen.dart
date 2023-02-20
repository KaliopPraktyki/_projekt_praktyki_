import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/screens/change_password_screen.dart';
import 'package:loginscreen/screens/edit_profile_screen.dart';
import '../widgets/pop_up_settings_tile.dart';
import '../widgets/settings_tile.dart';
import '../widgets/switch_settings_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        AppLocalizations.of(context)!.settings,
        style: const TextStyle(fontSize: 25),),
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

            ],
          ),
        ),
      ),
    );
  }
}
