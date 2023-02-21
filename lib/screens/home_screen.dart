import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loginscreen/screens/add_announcement_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  String? email = '';
  String? firstName = '';
  String? lastName = '';


  Future _getDataFromDatabase() async {

    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
          setState(() {
            final data = snapshot.data()!;
            email = data['email'];
            firstName = data['first name'];
            lastName = data['last name'];
          });
    });

    print("name: ${firstName!}");
    print("lastname: ${lastName!}");
    print("email: ${email!}");
  }

  @override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 40 ),),
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          style: const TextStyle(
                              fontSize: 25),
                        ),
                        Text(
                          user.email!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                       SizedBox(height: 20,),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffbbcae5),
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
                      ],

                    ),
                  ),

                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30 ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 180),),
                  Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Theme.of(context).secondaryHeaderColor,
                    ),

                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:20, top:6, bottom: 5, right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Company Birthday',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 15,
                            thickness: 1,
                            endIndent: 200,
                          ),
                          Text(
                            'Jubileusz firmy to święto, celebracja rocznicy założenia firmy. Najbardziej prestiżowe są jubileusze 10-, 20-, 30-lecia i więcej firmy.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 180),),
                  Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left:20, top:6, bottom: 5, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Company Birthday',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 15,
                              thickness: 1,
                              endIndent: 200,
                            ),
                            Text(
                              'Jubileusz firmy to święto, celebracja rocznicy założenia firmy. Najbardziej prestiżowe są jubileusze 10-, 20-, 30-lecia i więcej firmy.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                          ],
                        ),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 180),),
                  Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left:20, top:6, bottom: 5, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Company Birthday',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 15,
                              thickness: 1,
                              endIndent: 200,
                            ),
                            Text(
                              'Jubileusz firmy to święto, celebracja rocznicy założenia firmy. Najbardziej prestiżowe są jubileusze 10-, 20-, 30-lecia i więcej firmy.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 180),),
                  Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left:20, top:6, bottom: 5, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Company Birthday',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 15,
                              thickness: 1,
                              endIndent: 200,
                            ),

                            Text(
                              'Jubileusz firmy to święto, celebracja rocznicy założenia firmy. Najbardziej prestiżowe są jubileusze 10-, 20-, 30-lecia i więcej firmy.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                          ],
                        ),
                      )
                  ),
                ],
              ),
            ],
          ),

        ),
      )

    );
  }

}

