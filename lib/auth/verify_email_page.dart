import 'dart:async';
import 'package:ionicons/ionicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/screens/home_page.dart';


class VerifyEmailPage extends StatefulWidget {

  @override
  State<VerifyEmailPage > createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified){
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
   await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    }catch (e) {
      print(e.toString());
    }
    }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ?HomePage()
      :Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:75,
              width: 75,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Transform.scale(
                scale:2,
                child: Icon(Ionicons.mail_unread,color: Colors.white,),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Text('A verification email has been sent to your email',
            style: TextStyle(
              fontSize: 20,
            ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 24,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: (){
                  canResendEmail ? sendVerificationEmail() : null;
                },
                child: Text('Resent Email'),),

            SizedBox(height: 12,),
            TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('Cancel'),),
          ],
        ),
    ),
  );
}
