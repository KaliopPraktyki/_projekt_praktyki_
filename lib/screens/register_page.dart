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
                Text('Welcome There',
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
                child: ElevatedButton(onPressed: () {},
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
                        child: GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text('Register now!',
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