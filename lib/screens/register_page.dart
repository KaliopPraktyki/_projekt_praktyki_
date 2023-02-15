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

  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  String _password = '';
  String _confirmPassword = '';

  final _formKey = GlobalKey<FormState>();

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
                Text('Join now',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),

              ],
            ),
            Stack(
              children: [
                Container(
                  height: 260,
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
                      Form(
                        key: _formKey,
                        child: Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                          TextFormField(
                            onChanged: (value){
                              _password = value;
                            },
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Password is required please enter';
                              }

                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(

                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {

                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          //confirm password

                          Padding(padding: EdgeInsets.only(top: 15),),
                          TextFormField(
                            onChanged: (value){
                              _confirmPassword = value;
                            },
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Conform password is required please enter';
                              }
                              if(value != _password){
                                return 'Confirm password not matching';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: _confirmpasswordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Enter your password',
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(

                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {

                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 300,
                height: 50,
                child:
                GestureDetector(
                  onTap: signUp,
                  child: ElevatedButton(onPressed: () => {
                  if (_formKey.currentState!.validate()) {
                      signUp(),
                  }
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
              height: 80,
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