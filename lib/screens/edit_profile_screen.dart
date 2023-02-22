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

  String? _firstName;
  String? _lastName;
  String? _birthday;
  File? _profileImage;
  TextEditingController dateInput = TextEditingController();
  displayProfileImage(){
    if(_profileImage == null){
      return const AssetImage('assets/images/prof.jpg');
    }else{
      return FileImage(_profileImage!);
    }
  }
  saveProfile(){

  }
  void initState() {
     //set the initial value of text field
    if(_birthday == null){
      dateInput.text = "";

    }else{
      dateInput.text = _birthday!;
    }
    super.initState();
  }

  final  _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
                    backgroundImage: displayProfileImage(),
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
                        initialValue: _firstName,
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
                          _firstName = value;
                        },
                        onChanged: (value){},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,),
                      child: TextFormField(
                        initialValue: _lastName,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Last name",
                        ),
                        validator: (input){
                         if(input == null){
                           return "Please enter last name";
                         }else if(input.length <2 ){
                           return "Please enter valid last name";
                         }
                        },
                        onSaved: (value){
                          _lastName = value;
                        },
                        onChanged: (value){},
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
                    _isLoading?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Theme.of(context).cardColor),
                        )
                        :SizedBox.shrink()
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
                      onTap: saveProfile(),
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
