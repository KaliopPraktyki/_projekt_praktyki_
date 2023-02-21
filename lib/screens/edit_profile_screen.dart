import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile'),

      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child:Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(Ionicons.camera, size: 40,),
                ) ,
              ),
            ],
            )



          ],
        ),

      ),
    );
  }
}
