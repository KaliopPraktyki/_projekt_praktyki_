import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/auth/auth_page.dart';
import 'package:loginscreen/screens/profilescreen.dart';
import 'package:loginscreen/screens/todo_page.dart';
import '../screens/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return to_do();
          }else {
            return AuthPage();
          }
        },
      ),
    );
  }
}