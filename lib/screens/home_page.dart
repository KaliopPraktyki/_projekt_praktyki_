import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

import 'package:loginscreen/screens/home_screen.dart';
import 'package:loginscreen/screens/profilescreen.dart';
import 'package:loginscreen/screens/schedule.dart';
import 'package:loginscreen/screens/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //current index
  int _selectedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    Schedule(),
    to_do(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
        child: GNav(
          tabBackgroundColor: Colors.grey[300]!,
          gap: 8,
          padding: EdgeInsets.all(16),
          selectedIndex: _selectedIndex,
          onTabChange: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          tabs: const [
            GButton(icon:
            Ionicons.home_outline,
              text: 'Home',
            ),
            GButton(icon:
            Ionicons.calendar_outline,
              text: 'Schedule',
            ),
            GButton(icon:
            Ionicons.list_outline,
              text: 'Todos',
            ),
            GButton(icon:
            Ionicons.person_outline,
              text: 'Profile',
            ),
          ],
        ),
      ),

    );
  }

}
  
