import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
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
                Text('Welcome',
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
                onTap: signIn,
                child: ElevatedButton(onPressed: () {
                  signIn();
                },
                  child: Text('Login',
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
                      Padding(padding: EdgeInsets.only(left: 40),),
                      Text('Not a member?'),

                      TextButton(onPressed: () {
                        //code
                      },
                        child: Text('Register now!',
                          style: TextStyle(
                            fontSize: 15,
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


