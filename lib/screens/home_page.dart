import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/screens/home_screen.dart';
import 'package:loginscreen/screens/profilescreen.dart';
import 'package:loginscreen/screens/schedule.dart';
import 'package:loginscreen/screens/todo_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //current index
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Schedule(),
    to_do(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar:
        BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon : const Icon(Ionicons.home_outline),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon : const Icon(Ionicons.calendar_outline),
              label: AppLocalizations.of(context)!.schedule,
            ),
            BottomNavigationBarItem(
              icon : const Icon(Ionicons.list_outline),
              label: AppLocalizations.of(context)!.alltodos,
            ),
            BottomNavigationBarItem(
              icon : const Icon(Ionicons.person_outline),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        )
    );
  }
  void onTabTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


}

