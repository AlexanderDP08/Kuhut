// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Add Soal"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
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
                  final soalBaru = addSoal(
                      soal: _soal.text,
                      ansA: _ansA.text,
                      ansB: _ansB.text,
                      ansC: _ansC.text,
                      righAns: _rightAns.text);
                  DatabaseTeacher.tambahSoal(dataSoal: soalBaru);
                  Navigator.pop(context);
                },
                child: Text("Add Soal"))
          ],
        ),
      ),
    );
  }
}
