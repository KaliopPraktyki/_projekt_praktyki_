import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final _fireStore = FirebaseFirestore.instance;

final usersRef = _fireStore.collection('users');


