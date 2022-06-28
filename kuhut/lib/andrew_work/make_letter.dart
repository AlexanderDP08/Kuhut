import 'package:flutter/material.dart';

class MakeLetter extends StatefulWidget {
  const MakeLetter({Key? key}) : super(key: key);

  @override
  State<MakeLetter> createState() => _MakeLetterState();
}

class _MakeLetterState extends State<MakeLetter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("Make Letter Feature"),
        ),
      )
    )
  }
}