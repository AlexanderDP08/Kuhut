

import 'package:flutter/material.dart';

class MainMenuTeacher extends StatefulWidget {
  const MainMenuTeacher({Key? key}) : super(key: key);

  @override
  State<MainMenuTeacher> createState() => _MainMenuTeacherState();
}

class _MainMenuTeacherState extends State<MainMenuTeacher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teacher Home"),
        ),
      ),
    );
  }
}