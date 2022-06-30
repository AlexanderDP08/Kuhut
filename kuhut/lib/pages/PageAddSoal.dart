// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/main.dart';

class PageAddSoal extends StatefulWidget {
  const PageAddSoal({Key? key}) : super(key: key);

  @override
  State<PageAddSoal> createState() => _PageAddSoalState();
}

class _PageAddSoalState extends State<PageAddSoal> {
  final _soal = TextEditingController();
  final _ansA = TextEditingController();
  final _ansB = TextEditingController();
  final _ansC = TextEditingController();
  final _rightAns = TextEditingController();
  final db = FirebaseFirestore.instance;
  var selected;
  int _jumlah = 0;
  String pickDate = "";
  String pickTitle = "";

  // final Stream<QuerySnapshot> _streamDropDown = FirebaseFirestore.instance
  //     .collection('events')
  //     .snapshots(includeMetadataChanges: true);

  @override
  void dispose() {
    // TODO: implement dispose
    _soal.dispose();
    _ansA.dispose();
    _ansB.dispose();
    _ansC.dispose();
    _rightAns.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot<Object?>> _streamDrop() {
    setState(() {});
    return DatabaseTeacher.getTitleEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Add Soal"),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _streamDrop(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text("Loading.....");
                else {
                  List<DropdownMenuItem> titleSoal = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data!.docs[i];
                    String lvTitle = snap['title'];
                    String lvDate = snap['date'];
                    titleSoal.add(
                      DropdownMenuItem(
                        child: Text(
                          lvTitle + "_" + lvDate,
                          style: TextStyle(color: Color(0xff11b719)),
                        ),
                        value: lvTitle + "_" + lvDate,
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Icon(FontAwesomeIcons.coins,
                      //     size: 25.0, color: Color(0xff11b719)),
                      SizedBox(width: 50.0),
                      DropdownButton<dynamic>(
                        items: titleSoal,
                        onChanged: (currentSoal) {
                          final snackBar = SnackBar(
                            content: Text(
                              'Selected event is $currentSoal',
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                          setState(() {
                            selected = currentSoal;
                            pickDate = selected.toString().substring(
                                selected.toString().indexOf('_') + 1);
                            pickTitle = selected
                                .toString()
                                .substring(0, selected.toString().indexOf('_'));
                            print(selected);
                            print(pickDate);
                            print(pickTitle);
                          });
                        },
                        value: selected,
                        isExpanded: false,
                        hint: new Text(
                          "Choose Event",
                          style: TextStyle(color: Color(0xff11b719)),
                        ),
                      ),
                    ],
                  );
                }
              }),
          Text("Add Soal"),
          TextField(
            controller: _soal,
            decoration: InputDecoration(hintText: "Pertanyaan"),
          ),
          TextField(
            controller: _ansA,
            decoration: InputDecoration(hintText: "Jawaban A"),
          ),
          TextField(
            controller: _ansB,
            decoration: InputDecoration(hintText: "Jawaban B"),
          ),
          TextField(
            controller: _ansC,
            decoration: InputDecoration(hintText: "Jawaban C"),
          ),
          TextField(
            controller: _rightAns,
            decoration: InputDecoration(hintText: "Jawaban Benar"),
          ),
          ElevatedButton(
              onPressed: () {
                db
                    .collection("tbUser")
                    .doc(get_user.text.toString())
                    .get()
                    .then((DocumentSnapshot data) {
                  String jenjang = data['mengajar_kelas'];
                  final soalBaru = addSoal(
                      soal: _soal.text,
                      ansA: _ansA.text,
                      ansB: _ansB.text,
                      ansC: _ansC.text,
                      righAns: _rightAns.text,
                      namaGuru: teacherName);
                  DatabaseTeacher.tambahSoal(
                      dataSoal: soalBaru, tanggal: pickDate);
                });
                Navigator.pop(context);
              },
              child: Text("Add Soal"))
        ],
      ),
    );
  }
}
