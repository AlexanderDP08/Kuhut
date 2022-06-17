// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PageAddSoal extends StatefulWidget {
  const PageAddSoal({Key? key}) : super(key: key);

  @override
  State<PageAddSoal> createState() => _PageAddSoalState();
}

class _PageAddSoalState extends State<PageAddSoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Add Soal"),
      ),
      body: Column(
        children: [
          Text("Add Soal"),
        ],
      ),
    );
  }
}
