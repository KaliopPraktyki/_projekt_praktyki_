import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/screens/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class addAnnouncement extends StatefulWidget {
  const addAnnouncement ({Key? key,}) : super(key: key);

  @override
  State<addAnnouncement> createState() => _addAnnouncementState();
}

class _addAnnouncementState extends State<addAnnouncement> {

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override

  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future getNewAnnouncement () async {
      //add user details
    addNewAnnouncement(
          _titleController.text.trim(),
          _contentController.text.trim(),
      );
    }

  Future addNewAnnouncement(
      String title, String content,) async {
    await FirebaseFirestore.instance.collection('announcement').add({
      'title': title,
      'content': content,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 60),),
            Text('Add your announcement',
            style: TextStyle(
              fontSize: 30,
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 60),),
            Container(
              height: 340,
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Enter title',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Enter content'),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      expands: true,
                      controller: _contentController,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getNewAnnouncement();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.add,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  }


