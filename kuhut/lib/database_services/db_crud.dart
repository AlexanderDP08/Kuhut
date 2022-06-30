import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/main.dart';

final db = FirebaseFirestore.instance;
CollectionReference tbUser = FirebaseFirestore.instance.collection("tbUser");
CollectionReference tbTeacher = FirebaseFirestore.instance.collection("tbTeacher");
CollectionReference tbUser2 = FirebaseFirestore.instance.collection("tbUser");
CollectionReference events = FirebaseFirestore.instance.collection("events");
CollectionReference soal = FirebaseFirestore.instance.collection("soal");
CollectionReference pathLetterz = FirebaseFirestore.instance.collection("Letter");
String kelas = "";
String teacherName = get_user.text.substring(0, get_user.text.indexOf('@'));

class DatabaseUser {
  //write, read
  static Stream<QuerySnapshot> getUserData(String text) {
    return tbUser.snapshots(); //returning snapshot data
  }

  static Stream<QuerySnapshot> getUserDataSiswa(String namanya) {
    //return tbSiswa.snapshots(); //returning snapshot data
    if(namanya == " ")
      return tbUser2.snapshots();
    else
      return tbUser2
      .orderBy("nama")
      .startAt([namanya]).endAt([namanya + '\uf8ff'])
      .snapshots();
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
  static Future<void> tambahSoal({required addSoal dataSoal}) async {
    await db
        .collection('tbUser')
        .doc(get_user.text.toString())
        .get()
        .then((DocumentSnapshot dsData) {
      kelas = dsData['mengajar_kelas'];
      tbTeacher
          .doc(teacherName)
          .set({"mengajar_kelas": kelas, "name": teacherName})
          .whenComplete(() => print("Data berhasil di input"))
          .catchError((e) => print(e));

      tambahSoalGuruX(item: dataSoal);
    });
  }

  static Future<void> tambahSoalGuruX({required addSoal item}) async {
    DocumentReference docRef = tbTeacher.doc(teacherName);

    await docRef
        .collection("Soal_Matematika_tgl9")
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
}

class DatabaseLetter{
  //add letter
    static Future<void> addLetter({required LetterGuru letterGuru}) async {
    CollectionReference pathLetter = FirebaseFirestore.instance.collection("Letter");
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
       if(kelas == " ")
      return pathLetterz.snapshots();
    else
      return pathLetterz
      .orderBy("kelas")
      .startAt([kelas]).endAt([kelas + '\uf8ff'])
      .snapshots();
  }
  }