import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 10,bottom: 20),
                               child:  TextFormField(
                                 decoration: const InputDecoration(
                                   border: UnderlineInputBorder(),
                                   labelText: "Password",
                                 ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 20,top: 10),
                             child: SizedBox(
                               width: 350,
                               height: 50,
                               child:
                               GestureDetector(
                                 child: ElevatedButton(onPressed: () {},
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
