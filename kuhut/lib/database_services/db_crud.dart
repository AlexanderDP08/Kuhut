import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuhut/database_services/dataClass.dart';

CollectionReference tbUser = FirebaseFirestore.instance.collection("tbUser");
CollectionReference tbTeacher =
    FirebaseFirestore.instance.collection("tbTeacher");
CollectionReference soal = FirebaseFirestore.instance.collection("soal");

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData() {
    return tbUser.snapshots(); //returning snapshot data
  }

  static Future<void> ubahData({required Login item}) async {
    DocumentReference docRef = tbUser.doc(item.email);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("data berhasil diubah"))
        .catchError((e) => print(e));
  }
}

class DatabaseTeacher {
  //add soal
  static Future<void> tambahSoal({required addSoal item}) async {
    DocumentReference docRef = tbTeacher.doc("Soal Test");

    // await tbTeacher
    //     .add({
    //       "id": "15",
    //       "name": "Bank Soal"
    //     })
    //     .whenComplete(() => print("Data berhasil di input"))
    //     .catchError((e) => print(e));

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }
}
