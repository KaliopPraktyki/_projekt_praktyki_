import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/settings_tile.dart';
import '../widgets/switch_settings_tile.dart';

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
        title: const Text('Settings',
        style: TextStyle(fontFamily: 'Spoof',fontSize: 25),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ThemeChanger(
                color: Colors.black,
                icon: Ionicons.moon,
                title: 'Dark Mode',
                iconColor: Colors.white,
              ),
              SizedBox(height: 25,),
              Text("Profile",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              SizedBox(height: 25,),
              SettingsTile(
                color: Color.fromARGB(200, 12, 167, 137),
                icon: Ionicons.pencil,
                title: 'Edit Profile',
                iconColor: Colors.black54,
              ),
              SizedBox(height: 20,),
              SettingsTile(
                color: Color.fromARGB(200, 45, 155, 240),
                icon: Ionicons.lock_closed,
                title: 'Change Password',
                iconColor: Colors.black54,
              ),
              SizedBox(height: 25,),
              Text("Notifications",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              SizedBox(height: 25,),
               SettingsTile(
                color: Color.fromARGB(200, 95, 99, 251),
                icon: Ionicons.notifications,
                title: 'Notifications',
                iconColor: Colors.black54,
              ),
              SizedBox(height: 25,),
              Text("Regional",
                style: TextStyle(
                    fontFamily: 'Spoof',
                    fontSize: 25,
                    color: Color.fromARGB(255, 128, 128, 128)
                ),),
              SizedBox(height: 25,),
               SettingsTile(
                color: Color.fromARGB(200, 250, 199, 16),
                icon: Ionicons.language,
                title: 'Language',
                iconColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
