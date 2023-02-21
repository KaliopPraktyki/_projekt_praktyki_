import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  class GetAnnouncement extends StatelessWidget {
  final String documentId;

  GetAnnouncement({required this.documentId});

  @override
  Widget build(BuildContext context){
    CollectionReference announcement = FirebaseFirestore.instance.collection('announcement');

    return FutureBuilder<DocumentSnapshot>(
        future:  announcement.doc(documentId).get(),
        builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('${data['title']}',
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
            Text('${data['content']}',
            style: TextStyle(
              fontSize: 15,
            ),
            )
          ],
        );
      }
      return Text('loading..');
    }
    );
  }
}