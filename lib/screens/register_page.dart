import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage ({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp () async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
  );
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 150),),
                Text('Register Now !',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),

              ],
            ),
            Stack(
              children: [
                Container(
                  height: 230,
                  width: 300,

                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your e-mail',
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 20),),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                      ),
                    ],
                  ),
                ),

              ],

            ),
            SizedBox(
              width: 300,
              height: 50,
              child:
              GestureDetector(
                onTap: signUp,
                child: ElevatedButton(onPressed: () {
                  signUp();
                },
                  child: Text('SignUp',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 280,
              height: 50,
              child:
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 8),),
                      Text('Are you already a member?'),

                      TextButton(onPressed: () {
                        //code
                      },
                        child: GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text('Login now!',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}