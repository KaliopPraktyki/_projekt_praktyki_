import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ProjektPraktyki/auth/auth_page.dart';
import 'package:ProjektPraktyki/auth/main_screen.dart';
import 'login_screen.dart';
import 'settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  String? firstName = '';
  String? lastName = '';
  String? email = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid).get()
        .then((snapshot) async {
          if(snapshot.exists){
            setState(() {
              firstName = snapshot.data()!['firstName'];
              lastName = snapshot.data()!['lastName'];
              email = snapshot.data()!['email'];
            });
          }
    });
  }

@override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 325,
                      top: 40
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,),
                      child: SizedBox(width: 200,
                        child: IconButton(
                          iconSize: 25,
                          icon: const Icon(Ionicons.settings),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/user.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                   Text(
                    firstName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    "Profession",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25,),

                      listProfile(Ionicons.person, AppLocalizations.of(context)!.fullname, "${firstName} ${lastName}", Colors.greenAccent),
                      listProfile(Ionicons.mail, "Email", "${email}", Colors.amberAccent),

                      SizedBox(width: 200,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 80,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Theme.of(context).secondaryHeaderColor,),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(onPressed: (){
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                            },
                              child: Text(AppLocalizations.of(context)!.logout, style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 20,),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2, Color iconColor) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: iconColor,
                  ),
            child:Icon(
              icon,
            ),
          ),

          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}