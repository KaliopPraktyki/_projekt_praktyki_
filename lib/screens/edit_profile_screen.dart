import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/screens/settings_screen.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {

  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text('Edit Profile'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen() ));
          },
          child: Icon(Ionicons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Ionicons.camera,
                          size: 45,
                        ),
                        Text(
                            "Change Profile Photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 360,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10,),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "First name",
                        ),
                        validator: (input){
                          if(input == null){
                            return "Please enter name";
                          }else if(input.length <2 ){
                            return "Please enter valid name";
                          }
                        },
                        onSaved: (value){
                        },
                        onChanged: (value){},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Last  name",
                        ),
                        validator: (input){
                         if(input == null){
                           return "Please enter last name";
                         }else if(input.length <2 ){
                           return "Please enter valid last name";
                         }
                        },
                        onSaved: (value){
                        },
                        onChanged: (value){},
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Ionicons.calendar),
                          labelText: "Birth Date",
                        ),
                        readOnly: true,
                        onTap: () async{
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100),
                          );
                          if(pickedDate !=null){
                            if (kDebugMode) {
                              print(pickedDate);
                            }
                            String formattedDate=
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            if (kDebugMode) {
                              print(formattedDate);
                            }
                            setState(() {
                            });
                          }else{}
                        },
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: GestureDetector(
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Cancel"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: GestureDetector(
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Save"),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
