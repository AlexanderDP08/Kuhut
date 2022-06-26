// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class pageSetExamDate extends StatefulWidget {
  const pageSetExamDate({Key? key}) : super(key: key);

  @override
  State<pageSetExamDate> createState() => _pageSetExamDateState();
}

class _pageSetExamDateState extends State<pageSetExamDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page Set Exam Date"),
        ),
        body: Column());
  }
}
