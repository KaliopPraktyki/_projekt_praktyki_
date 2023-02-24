import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/auth/main_screen.dart';
import 'package:loginscreen/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../auth/auth_page.dart';


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

  bool _passwordVisible = false;

  void initState() {
    _passwordVisible;
  }

  @override
  void dispose(){
    newPasswordController.dispose();
    super.dispose();
  }

  changePassword() async{
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MainPage()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Your password has been Changed.. Login again"),

      ));
    }catch(error){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text(AppLocalizations.of(context)!.changepassword),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen() ));
          },
          child: Icon(Ionicons.arrow_back),
        ),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15,top:20),
                    child: Text(AppLocalizations.of(context)!.create,
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
               children: [
                 SizedBox(
                   width: 300,
                   child: Padding(
                     padding: EdgeInsets.only(left: 18,top: 10,),
                     child: Text(AppLocalizations.of(context)!.yournewpassword,
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
                               child: TextFormField(
                                 decoration: InputDecoration(
                                   border: UnderlineInputBorder(),
                                   labelText: AppLocalizations.of(context)!.newpassword,
                                   hintText: "Enter New Password",
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
                                 onChanged: (value){
                                   newPassword;
                                 },
                                 obscureText: !_passwordVisible,
                                 controller: newPasswordController,
                                 validator: (value){
                                   if(value == null || value.isEmpty){
                                     return "Please enter Password";
                                   }else if(newPassword.length <6){
                                     return "Min. length password is 6";
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
                                   child: Text(AppLocalizations.of(context)!.changepassword,
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
