import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/screens/settings_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  String? _firstName = '';
  String? _lastName = '';
  File? _profileImage;
  String? _imagePickedType;
  TextEditingController dateInput = TextEditingController();
  displayProfileImage() {
    if (_profileImage == null) {
        return AssetImage('assets/profil.jpg');
      }else{
      return FileImage(_profileImage!);
    }
  }
  Future<dynamic> _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid).get()
        .then((snapshot) async {
      if(snapshot.exists){
        setState(() {
          _firstName = snapshot.data()!['firstName'];
          _lastName = snapshot.data()!['lastName'];
          dateInput.text =  snapshot.data()!['birthday'];
          _profileImage = snapshot.data()!['profileImage'];
        });
      }
    });
  }
  @override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

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
                      padding: EdgeInsets.only(top: 10, bottom: 10,),
                      child: TextFormField(
                       controller: TextEditingController(text: _firstName),
                        decoration:  InputDecoration(
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
                        onChanged: (value){
                          _firstName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Last name",
                        ),
                        controller: TextEditingController(text: _lastName),
                        validator: (input){
                         if(input == null){
                           return "Please enter last name";
                         }else if(input.length <2 ){
                           return "Please enter valid last name";
                         }
                        },
                        onChanged: (value){
                          _lastName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: TextField(
                        controller: dateInput,
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
                              dateInput.text = formattedDate;
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
                        onPressed: (){
                          print(_firstName);
                          print(_lastName);
                          print(dateInput.text);
                            final userId = FirebaseAuth.instance.currentUser!.uid;
                            FirebaseFirestore.instance.collection('users').doc(userId).update({
                              'firstName': _firstName,
                              'lastName': _lastName,
                              'birthday': dateInput.text,
                            });
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const SettingsScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Your profile has been successfully Changed.."),

                          ));
                        },
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
