import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
        child: GNav(
          tabBackgroundColor:Theme.of(context).focusColor,
          gap: 8,
          padding: const EdgeInsets.all(16),
          selectedIndex: _selectedIndex,
          onTabChange: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          tabs: [
            GButton(icon:
            Ionicons.home_outline,
              text: AppLocalizations.of(context)!.home,
            ),
            GButton(icon:
            Ionicons.calendar_outline,
              text: AppLocalizations.of(context)!.schedule,
            ),
            GButton(icon:
            Ionicons.list_outline,
              text: AppLocalizations.of(context)!.alltodos,
            ),
            GButton(icon:
            Ionicons.person_outline,
              text: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
      ),

    );
  }

}
  
