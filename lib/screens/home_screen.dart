import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:loginscreen/read%20data/get_announcement.dart';
import 'package:loginscreen/screens/add_announcement_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  //document ids
  List<String> docIds = [];

  //get document ids
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('announcement').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              // print(document.reference);
              docIds.add(document.reference.id);
            },
            ),
    );
  }

  String? firstName = "";
  String? lastName = "";
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future <void> getUserName() async {
    await FirebaseFirestore.instance.collection('users').where('userId', isEqualTo: uid).get().then((user) async {
      user.docs.forEach((result) {
        firstName = result.data()['firstName'];
        lastName = result.data()['lastName'];
      });
    });
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    style: const TextStyle(
                        fontSize: 25),
                  ),
                  FutureBuilder(
                    future: getUserName(),
                    builder: (_ , AsyncSnapshot snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center( child: CircularProgressIndicator());
                      }
                      return Text(firstName!,style:
                        TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 25),);
                    },
                  ),
                 SizedBox(height: 20,),
                  ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffbbcae5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const addAnnouncement()),
                      );
                    },
                    child:
                    const Text(
                      'Add Announcement',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(
              height: 530,
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot){
                  return Card(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12, right: 20, left: 20),
                          child: ListTile(
                            title: GetAnnouncement(documentId: docIds[index]),
                            tileColor: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      )

    );
  }

}

