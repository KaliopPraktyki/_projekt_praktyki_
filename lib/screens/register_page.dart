import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future signUp () async {

    if(passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add user details
      addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim()
      );
    }
  }

    Future addUserDetails(
        String firstName, String lastName, String email,) async {
      await FirebaseFirestore.instance.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profilePicture': null,
        'birthday': null,
      });
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 180),),
                  Text(AppLocalizations.of(context)!.joinnow,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),

                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 420,
                    width: 300,

                    child: Column(
                      children: [

                        //first name
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.firstname,
                          ),
                        ),

                        //last name
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.lastname,
                          ),
                        ),

                        //email
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.email,
                          ),
                        ),


                        //form
                        Form(
                          key: _formKey,
                          child: Column(
                          children: [

                            //password

                            const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                            TextFormField(
                              onChanged: (value){
                                _password = value;
                              },
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'Password is required please enter';
                                }else if(_password.length < 6){
                                  return 'Min. lenght password is 6';
                                }
                                  else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.password,
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

                            const Padding(padding: EdgeInsets.only(top: 15),),
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
                                labelText: AppLocalizations.of(context)!.confirm,
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
                padding: const EdgeInsets.only(top: 2),
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
                      child: Text(AppLocalizations.of(context)!.signup,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 300,
                height: 80,
                child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 12),),
                        Text(AppLocalizations.of(context)!.member),

                        TextButton(onPressed: () {
                          //code
                        },
                          child: GestureDetector(
                            onTap: widget.showLoginPage,
                            child: Text(AppLocalizations.of(context)!.loginnow,
                              style: const TextStyle(
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
      ),
    );
  }
}