import 'package:flutter/material.dart';
import 'package:ProjektPraktyki/screens/login_screen.dart';
import '../screens/register_page.dart';

class AuthPage extends StatefulWidget {

  const AuthPage ({Key? key,}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}



class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return loginscreen(showRegisterPage: toggleScreens);
    }else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}