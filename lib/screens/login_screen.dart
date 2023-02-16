import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class loginscreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const loginscreen({Key? key, required this.showRegisterPage}) : super(key: key);

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

    late bool _passwordVisible;

    void initState() {
      _passwordVisible = false;
    }

    String _password = '';


    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Form(

          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 150),),
                  Text('Welcome',
                    style: TextStyle(
                      fontFamily: 'Spoof',
                      fontSize: 40,
                    ),
                  ),

                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 240,
                    width: 300,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {

                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Please enter a valid email address"),)
                                );
                              }
                              return null;
                            },

                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your e-mail',
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 20),),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            obscureText: !_passwordVisible,//This will obscure text dynamically
                            onChanged: (value){
                              _password = value;
                            },
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Password is required please enter';
                              } if (_password.length <= 6) {
                                return 'Min. lenght password is 6';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
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
                    if (_formKey.currentState!.validate()) {
                      signIn();
                  }
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
                        Padding(padding: EdgeInsets.only(left: 30),),
                        Text('Not a member?'),

                        TextButton(onPressed: () {
                          //code
                        },
                          child: GestureDetector(
                            onTap: widget.showRegisterPage,
                            child: Text('Register now.',
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
        )

      ),
    );
  }



}


