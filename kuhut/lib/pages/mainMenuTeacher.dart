import 'package:flutter/material.dart';
import 'package:kuhut/imagePath.dart';
import 'package:kuhut/pages/PageAddSoal.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/pageSetExamDate.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';

import '../andrew_work/make_letter.dart';

class MainMenuTeacher extends StatefulWidget {
  final String name;
  const MainMenuTeacher({Key? key, required this.name}) : super(key: key);

  @override
  State<MainMenuTeacher> createState() => _MainMenuTeacherState();
}

class _MainMenuTeacherState extends State<MainMenuTeacher> {
  var fontsize = 20.0;

  var t_path = teacherImagePath();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Teacher Home"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeWidget(),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: fontsize - 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Image.asset("images/kuhutExam.png"),
                    // Image.asset("images/kuhutExam.png"),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(t_path.attendance),
                      iconSize: 100,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(t_path.changePassword),
                      iconSize: 100,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Image.asset("images/kuhutExam.png"),
                    // Image.asset("images/kuhutExam.png"),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const pageSetExamDate()));
                      },
                      icon: Image.asset(t_path.calender),
                      iconSize: 100,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageAddSoal()));
                      },
                      icon: Image.asset(t_path.createExam),
                      iconSize: 100,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Image.asset("images/kuhutExam.png"),
                    // Image.asset("images/kuhutExam.png"),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(t_path.editContact),
                      iconSize: 100,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(t_path.profileLogo),
                      iconSize: 100,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Image.asset("images/kuhutExam.png"),
                    // Image.asset("images/kuhutExam.png"),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SendLetter()));
                      },
                      icon: Image.asset(t_path.sendLetter),
                      iconSize: 100,
                    ),
                  ],
                ),
                ElevatedButton(onPressed: (){
                {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ResetPass(siswaNameReset : widget.name )));
                  }
              }, 
              child: const Text("reset password")),

              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> AddContact(siswaNameResetProfile: widget.name)));
                  }
              }, 
              child: const Text("add contact")),

              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact_View()));
                  }
              }, 
              child: const Text("View Contact")),

              ElevatedButton(onPressed: (){
                {
                    Navigator.push(context,MaterialPageRoute(
                    builder: (context) => profilnya(siswaNameResetProfile : widget.name )));
                  }
              }, 
              child: const Text("profile")),
              ],
            ),
          )),
    );
  }

  Row Menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Image.asset("images/kuhutExam.png"),
        // Image.asset("images/kuhutExam.png"),
        IconButton(
          onPressed: () {},
          icon: Image.asset("images/kuhutExam.png"),
          iconSize: 100,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("images/kuhutExam.png"),
          iconSize: 100,
        ),
      ],
    );
  }

  Text WelcomeWidget() => Text(
        "Welcome,",
        style: TextStyle(fontSize: fontsize),
      );
}
