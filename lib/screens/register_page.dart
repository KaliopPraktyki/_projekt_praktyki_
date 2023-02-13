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
  final _confirmpasswordController = TextEditingController();


  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp () async {
    if(passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
      return true;
    }else {
      return false;
    }
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
                Text('Join now!',
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
                      //email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your e-mail',
                        ),
                      ),
                      //password
                      Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                      ),
                      //confirm password
                      Padding(padding: EdgeInsets.only(top: 15),),
                      TextFormField(
                        obscureText: true,
                        controller: _confirmpasswordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Confirm password',
                        ),
                      ),
                    ],
                  ),
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 300,
                height: 50,
                child:
                GestureDetector(
                  onTap: signUp,
                  child: ElevatedButton(onPressed: () {
                    signUp();
                  },
                    child: Text('Sign Up',
                      style: TextStyle(
                        fontSize: 25,
                      ),
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