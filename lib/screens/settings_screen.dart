import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:loginscreen/provider/theme_provider.dart';
import 'package:loginscreen/l10n/l10n.dart';
import '../widgets/settings_tile.dart';
import '../widgets/switch_settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const keyDarkMode = 'key-dark-mode';
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
        ? 'Dark Mode'
        : 'Light Mode';
    final icon = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
        ? Ionicons.moon
        : Ionicons.sunny;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
        ? Colors.black54
        : Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Ionicons.chevron_back),
              const SizedBox(height: 20,),
              const Text(
                "Settings",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
              ThemeChanger(
                color: Colors.black,
                icon: icon,
                title: text,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 20,),
              const Text("Profile",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              const SizedBox(height: 20,),
              SettingsTile(
                color: const Color.fromARGB(200, 12, 167, 137),
                icon: Ionicons.pencil,
                title: 'Edit Profile',
                iconColor: color,
              ),
              const SizedBox(height: 20,),
              SettingsTile(
                color: const Color.fromARGB(200, 45, 155, 240),
                icon: Ionicons.lock_closed,
                title: 'Change Password',
                iconColor: color,
              ),
              const SizedBox(height: 20,),
              const Text("Notifications",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              const SizedBox(height: 20,),
               SettingsTile(
                color: const Color.fromARGB(200, 95, 99, 251),
                icon: Ionicons.notifications,
                title: 'Notifications',
                iconColor: color,
              ),
              const SizedBox(height: 20,),
              const Text("Regional",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              const SizedBox(height: 20,),
               SettingsTile(
                color: const Color.fromARGB(200, 250, 199, 16),
                icon: Ionicons.language,
                title: 'Language',
                iconColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
