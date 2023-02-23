import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/Constants.dart';
import '../models/UserModel.dart';


class DatabaseServices {

  static void updateUserData(UserModel user) {
    usersRef.doc(user.id).update({
      'first name': user.first_name,
      'last name': user.last_name,
      'profilePicture': user.profilePicture,
    });
  }

}