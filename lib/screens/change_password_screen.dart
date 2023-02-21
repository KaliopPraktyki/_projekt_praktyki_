import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/screens/login_screen.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final  _formKey = GlobalKey<FormState>();

  String newPassword = "";

  final newPasswordController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose(){
    newPasswordController.dispose();
    super.dispose();
  }

  changePassword() async{
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginscreen(showRegisterPage: () {},)));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Your password has been Changed.. Login again"),

      ));
    }catch(error){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15,top:20),
                    child: Text("Create new password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                      ),
                    ),
                  ),
                ],
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: const [
                 SizedBox(
                   width: 300,
                   child: Padding(
                     padding: EdgeInsets.only(left: 18,top: 10,),
                     child: Text("Your new password must be different from previus used passwords.",
                     style: TextStyle(
                       fontSize: 16
                     ),
                     ),
                   )
                 )
               ],
             ),
                 Row(
                   children: [
                     SizedBox(
                       height: 240,
                       width: 350,
                       child: Form(
                         key: _formKey,
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 10,bottom: 20),
                               child:  TextFormField(
                                 decoration: const InputDecoration(
                                   border: UnderlineInputBorder(),
                                   labelText: "New Password",
                                   hintText: "Enter New Password",
                                 ),
                                 onChanged: (value){
                                   newPassword;
                                 },
                                 obscureText: true,
                                 controller: newPasswordController,
                                 validator: (value){
                                   if(value == null || value.isEmpty){
                                     return "Please enter Password";
                                   }
                                   return null;
                                 },
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 10),
                               child: SizedBox(
                               width: 350,
                               height: 50,
                               child:
                               GestureDetector(
                                 child: ElevatedButton(onPressed: () {
                                   if (_formKey.currentState!.validate()) {
                                     setState(() {
                                       newPassword = newPasswordController.text;
                                     });
                                     changePassword();
                                   }
                                 },
                                   child: const Text("Change Password",
                                     style: TextStyle(
                                       fontSize: 25,
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             )
                           ],
                         ),
                       ),
                     )
                   ],
                 )
            ]
          ),
        ),
    );

  }
}
