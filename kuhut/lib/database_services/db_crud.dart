import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuhut/database_services/dataClass.dart';

CollectionReference tbUser = FirebaseFirestore.instance.collection("tbUser");

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData() {
    return tbUser.snapshots(); //returning snapshot data
  }

    static Future<void> ubahData({required Login item})async{
    DocumentReference docRef = tbUser.doc(item.email);

    await docRef
    .update(item.toJson())
    .whenComplete(() => print("data berhasil diubah"))
    .catchError((e) => print(e));
  }

}
