import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/main.dart';

final db = FirebaseFirestore.instance;
CollectionReference tbUser = FirebaseFirestore.instance.collection("tbUser");
CollectionReference tbTeacher =
    FirebaseFirestore.instance.collection("tbTeacher");
CollectionReference tbUser2 = FirebaseFirestore.instance.collection("tbUser");
CollectionReference tbSiswaProfile =
    FirebaseFirestore.instance.collection("tbUser");
CollectionReference events = FirebaseFirestore.instance.collection("events");
CollectionReference soal = FirebaseFirestore.instance.collection("soal");
String kelas = "";
String kelass = "";
String birthdays = "";
String namas = "";
String telps = "";
String kelamins = "";
CollectionReference tbSoal = FirebaseFirestore.instance.collection("tbSoal");
// String kelas = "";
// String mapel = "";
String jenjang = "";
String teacherName = get_user.text.substring(0, get_user.text.indexOf('@'));

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData(String text) {
    return tbUser.snapshots(); //returning snapshot data
  }

  static Future<void> getUserProfile(String atext) async {
    await db
        .collection('tbUser')
        .doc(atext)
        .get()
        .then((DocumentSnapshot dsData) {
      kelass = dsData['kelas'];
      birthdays = dsData['bithday'];
      telps = dsData['telp'];
      namas = dsData['nama'];
      kelamins = dsData['kelamin'];
    });
  }

  static Stream<QuerySnapshot> getUserDataSiswa(String namanya) {
    //return tbSiswa.snapshots(); //returning snapshot data
    if (namanya == " ")
      return tbUser2.snapshots();
    else
      return tbUser2
          .orderBy("nama")
          .startAt([namanya]).endAt([namanya + '\uf8ff']).snapshots();
  }

  static Future<void> ubahData({required Login item}) async {
    DocumentReference docRef = tbUser.doc(item.email);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("data berhasil diubah"))
        .catchError((e) => print(e));
  }

  static Future<void> ubahDataProfilenama(
      {required editprofilenama item}) async {
    DocumentReference docRef = tbUser.doc(item.aemail);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("data berhasil diubah"))
        .catchError((e) => print(e));
  }

  static Future<void> ubahDataProfileday({required editprofileday item}) async {
    DocumentReference docRef = tbUser.doc(item.aemail);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("data berhasil diubah"))
        .catchError((e) => print(e));
  }

  static Future<void> ubahDataProfiletelp(
      {required editprofiletelp item}) async {
    DocumentReference docRef = tbUser.doc(item.aemail);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("data berhasil diubah"))
        .catchError((e) => print(e));
  }
}

class DatabaseTeacher {
  //add soal
  static Future<void> tambahSoal(
      {required addSoal dataSoal, required String tanggal}) async {
    DocumentReference docRef = tbTeacher.doc(teacherName);

    await db
        .collection('tbUser')
        .doc(get_user.text.toString())
        .get()
        .then((DocumentSnapshot dsData) {
      String kelas = dsData['mengajar_kelas'];
      tbSoal
          .add(dataSoal.toJson())
          .whenComplete(() => print("Data berhasil di input" + teacherName))
          .catchError((e) => print(e));
      // docRef.collection('tbSoal').doc(kelas + "_" + tanggal);

      // tambahSoalGuruX(item: dataSoal, kelas_: kelas, date_: tanggal);
    });
  }

  static Future<void> tambahSoalGuruX(
      {required addSoal item,
      required String kelas_,
      required String date_}) async {
    await db
        .collection('tbTeacher')
        .doc(teacherName)
        .collection('tbSoal')
        .doc(kelas_ + "_" + date_)
        .collection('soal')
        .add(item.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }

  //set date
  static Future<void> setDate({required Event event}) async {
    await events
        .add(event.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }

  //get event by date
  static Stream<QuerySnapshot> getDate(String date) {
    // return events.snapshots();
    if (date == "") {
      return events.snapshots();
    } else {
      return events
          // .where("judulCat", isEqualTo: judul)
          .orderBy("date")
          .startAt([date]).endAt([date + '\uf8ff']).snapshots();
    }
  }

  //get event by name
  static Stream<QuerySnapshot> getTitleEvent() {
    // return events.snapshots();
    if (teacherName == "") {
      return events.snapshots();
    } else {
      return events
          // .where("judulCat", isEqualTo: judul)
          .orderBy("teacher")
          .startAt([teacherName]).endAt([teacherName + '\uf8ff']).snapshots();
    }
  }
}

class DatabaseLetter {
  //add letter
  static Future<void> addLetter({required LetterGuru letterGuru}) async {
    CollectionReference pathLetter =
        FirebaseFirestore.instance.collection("Letter");
    DocumentReference docRef = pathLetter.doc();

    await pathLetter
        //.collection("asd")
        .add(letterGuru.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }
}
