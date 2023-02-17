import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
        style: TextStyle(fontFamily: 'Spoof',fontSize: 25),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              ThemeChanger(
                color: Colors.black,
                icon: Ionicons.moon,
                title:AppLocalizations.of(context)!.darkmode,
                iconColor: Colors.white,
              ),
              SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.profile,
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              SizedBox(height: 25,),
              SettingsTile(
                color: Color.fromARGB(200, 12, 167, 137),
                icon: Ionicons.pencil,
                title: AppLocalizations.of(context)!.editprofile,
                iconColor: Colors.black54,
              ),
              SizedBox(height: 20,),
              SettingsTile(
                color: Color.fromARGB(200, 45, 155, 240),
                icon: Ionicons.lock_closed,
                title: AppLocalizations.of(context)!.changepassword,
                iconColor: Colors.black54,
              ),
              SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.notifications,
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              SizedBox(height: 25,),
               SettingsTile(
                color: Color.fromARGB(200, 95, 99, 251),
                icon: Ionicons.notifications,
                title: AppLocalizations.of(context)!.notifications,
                iconColor: Colors.black54,
              ),
              SizedBox(height: 25,),
              Text(AppLocalizations.of(context)!.regional,
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),
              ),
              SizedBox(height: 25,),
              LanguageChanger(
                color: Color.fromARGB(200, 250, 199, 16),
                icon: Ionicons.language,
                title: AppLocalizations.of(context)!.language,
                iconColor: Colors.black54,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
