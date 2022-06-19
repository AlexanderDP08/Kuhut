import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tbUser = FirebaseFirestore.instance.collection("tbUser");

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData() {
    return tbUser.snapshots(); //returning snapshot data
  }
}
