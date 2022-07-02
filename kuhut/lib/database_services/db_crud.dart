import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
CollectionReference tbJawaban =
    FirebaseFirestore.instance.collection("tbJawaban");

String kelas = "";
String kelass = "";
String birthdays = "";
String namas = "";
String telps = "";
String kelamins = "";
CollectionReference tbSoal = FirebaseFirestore.instance.collection("tbSoal");
String jenjang = "";
String scoree = "";
String teacherName = get_user.text.substring(0, get_user.text.indexOf('@'));

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData(String text) {
    return tbUser.snapshots(); //returning snapshot data
  }

  static Stream<QuerySnapshot> getUserDataProfile() {
    return tbUser.snapshots(); //returning snapshot data
  }

  static Future<String> getUserProfile(String atext) async {
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
    return kelass;
  }

  static Future<void> dapatprofile(String a) async {
    await db.collection("tbUser").doc(a).get().then((DocumentSnapshot ds) {
      kelass = ds['kelas'];
      print(kelass);

      birthdays = ds['birthday'];
      print(birthdays);

      telps = ds['telp'];
      print(telps);

      namas = ds['nama'];
      print(namas);

      kelamins = ds['kelamin'];
      print(kelamins);
    }).catchError((e) {
      print(e);
    });
  }

  static Future<void> getIsiScore(String a, String mapel) async {
    await db
        .collection("tbUser")
        .doc(a)
        .collection("tbScore")
        .doc(mapel)
        .get()
        .then((DocumentSnapshot ds) {
      scoree = ds['score'];
      print(scoree);
    }).catchError((e) {
      print(e);
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

  static Future<void> ubahDataProfilenilai(
      {required editprofilenilai item}) async {
    DocumentReference docRef = tbUser
        .doc(item.aemailguru)
        .collection("tbScore")
        .doc(item.atitle + item.anama);

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

  static Stream<QuerySnapshot> getJenjang() {
    // return events.snapshots();
    if (teacherName == "") {
      return tbUser.snapshots();
    } else {
      return tbUser
          // .where("judulCat", isEqualTo: judul)
          .orderBy("nama")
          .startAt([teacherName]).endAt([teacherName + '\uf8ff']).snapshots();
    }
  }

  static Stream<QuerySnapshot> getJawabanSiswa() {
    // return events.snapshots();
    if (teacherName == "") {
      return tbJawaban.snapshots();
    } else {
      return tbJawaban
          // .where("judulCat", isEqualTo: judul)
          .orderBy("nama_siswa")
          .startAt([teacherName]).endAt([teacherName + '\uf8ff']).snapshots();
    }
  }

  static Future<void> inputJawabanSiswa({required addJawabanSiswa data}) async {
    await tbJawaban
        .add(data.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }
}

// class DatabaseLetter {
//   //add letter
//   static Future<void> addLetter({required LetterGuru letterGuru}) async {
//     CollectionReference pathLetter =
//         FirebaseFirestore.instance.collection("Letter");
// // CollectionReference allSoal = FirebaseFirestore.instance
// //     .collection("tbTeacher")
// //     .doc("alex")
// //     .collection("tbSoal")
// //     .doc("fisika_9_tgl")
// //     .collection("soal");
//   }
// }

CollectionReference allSoal = FirebaseFirestore.instance.collection("tbSoal");
CollectionReference allEvent = FirebaseFirestore.instance.collection("events");
CollectionReference tbScore = FirebaseFirestore.instance.collection("tbUser");
CollectionReference tbAbsen = FirebaseFirestore.instance.collection("tbAbsen");

class DataBaseSoal {
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getSoal(
  //   String namaGuru,
  //   String namaSubjek,
  //   String kelas,
  //   String tanggal,
  // ) {
  //   return tbTeacher
  //       .doc(namaGuru)
  //       .collection("tbSoal")
  //       .doc("fisika_9_tgl")
  //       .collection("soal")
  //       .snapshots();
  // }
  static Stream<QuerySnapshot<Object?>> getSoal(String nama_guru) {
    return allSoal.orderBy("guru").startAt([nama_guru]).endAt(
        [nama_guru + '\uf8ff']).snapshots(); //returning snapshot data
  }

  static Stream<QuerySnapshot<Object?>> getHistoryKerja(String nama_siswa) {
    return allSoal.orderBy("nama").startAt([nama_siswa]).endAt(
        [nama_siswa + '\uf8ff']).snapshots(); //returning snapshot data
  }

  static Stream<QuerySnapshot<Object?>> getEvent(String jenjang) {
    return events
        .orderBy("jenjang")
        .startAt([jenjang]).endAt([jenjang + '\uf8ff']).snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getEventTeacher(String jenjang) {
    return events
        .orderBy("teacher")
        .startAt([jenjang]).endAt([jenjang + '\uf8ff']).snapshots();
  }

  static Future<void> addScore({required Score item}) async {
    DocumentReference docRef = tbScore
        .doc("${item.guru}@teacher")
        .collection("tbScore")
        .doc(item.mapel + item.nama);

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("Data Added"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot<Object?>> getScore(String nama) {
    return tbScore.doc(nama + "@teacher").collection("tbScore").snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getScoreCheck(
      String guru, String nama) {
    return tbScore
        .doc(guru + "@teacher")
        .collection("tbScore")
        .orderBy("nama")
        .startAt([nama]).endAt([nama + '\uf8ff']).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getScoreSiswaFromTeacher1(
      String guru, String nama) {
    return tbUser
        .doc(guru + "@teacher")
        .collection("tbScore")
        .orderBy("nama")
        .startAt([nama]).endAt([nama + '\uf8ff']).snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getScoreSiswaFromTeacher2(String nama) {
    return tbScore
        .doc("andrew@teacher")
        .collection("tbScore")
        .orderBy("nama")
        .startAt([nama]).endAt([nama + '\uf8ff']).snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getAbsen(String nama) {
    return tbScore.doc(nama + "@teacher").collection("tbScore").snapshots();
  }
}

CollectionReference pathLetterz =
    FirebaseFirestore.instance.collection("Letter");

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

  //view letter with specified class
  static Stream<QuerySnapshot> getAllLetter(String kelas) {
    //return pathLetterz.snapshots();
    if (kelas == " ")
      return pathLetterz.snapshots();
    else
      return pathLetterz
          .orderBy("kelas")
          .startAt([kelas]).endAt([kelas + '\uf8ff']).snapshots();
  }
}
