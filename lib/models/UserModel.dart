import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? first_name;
  String? last_name;
  String? profilePicture;
  String? email;

  UserModel(
      {this.id,
        this.first_name,
        this.last_name,
        this.profilePicture,
        this.email,
    });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      first_name: doc['first name'],
      last_name: doc['last name'],
      email: doc['email'],
      profilePicture: doc['profilePicture'],
    );
  }
}
