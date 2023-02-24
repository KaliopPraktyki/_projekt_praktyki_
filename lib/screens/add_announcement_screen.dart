import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ProjektPraktyki/screens/home_page.dart';
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

  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';


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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value){
                        _title = value;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Title is required please enter';
                        }else if(_title.length < 3){
                          return 'Min. lenght title is 3';
                        }
                        else {
                          return null;
                        }
                      },
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Enter title',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value){
                          _content = value;
                        },
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Content is required please enter';
                          }else if(_content.length < 10){
                            return 'Min. lenght content is 10';
                          }
                          else {
                            return null;
                          }
                        },
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
                      if (_formKey.currentState!.validate()) {
                        getNewAnnouncement();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Something is wrong"),)
                        );
                      }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  }


