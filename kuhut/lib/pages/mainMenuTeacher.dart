

import 'package:flutter/material.dart';

class MainMenuTeacher extends StatefulWidget {
  final String name;
  const MainMenuTeacher({Key? key, required this.name}) : super(key: key);

  @override
  State<MainMenuTeacher> createState() => _MainMenuTeacherState();
}

class _MainMenuTeacherState extends State<MainMenuTeacher> {
  var fontsize = 20.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teacher Home"),
        ),
        body : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeWidget(),
              Text(widget.name, style: TextStyle(fontSize: fontsize-2, ),),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset("images/kuhutExam.png"),
                // Image.asset("images/kuhutExam.png"),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset("images/kuhutExam.png"),
                // Image.asset("images/kuhutExam.png"),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset("images/kuhutExam.png"),
                // Image.asset("images/kuhutExam.png"),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
              ],
            ),
            ],
          ),
        )
      ),
    );
  }

  Row Menu() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset("images/kuhutExam.png"),
                // Image.asset("images/kuhutExam.png"),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
                IconButton(onPressed: (){

                }, icon: Image.asset("images/kuhutExam.png"), iconSize: 100,),
              ],
            );
  }

  Text WelcomeWidget() => Text("Welcome,", style: TextStyle(fontSize: fontsize),);
}
