import 'package:flutter/material.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/imagePath.dart';
import 'package:kuhut/pages/PageAddSoal.dart';
import 'package:kuhut/pages/PageQuestion.dart';
import 'package:kuhut/pages/PageScore.dart';
import 'package:kuhut/pages/absensi.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/pageSetExamDate.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';
import 'package:kuhut/pages/jawaban_siswa.dart';

import '../andrew_work/make_letter.dart';
import 'mainMenuSiswa.dart';

class MainMenuTeacher extends StatefulWidget {
  final String name;
  final String kelaslah;
  const MainMenuTeacher({Key? key, required this.name, required this.kelaslah})
      : super(key: key);

  @override
  State<MainMenuTeacher> createState() => _MainMenuTeacherState();
}

class _MainMenuTeacherState extends State<MainMenuTeacher> {
  var fontsize = 20.0;

  var t_path = teacherImagePath();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Teacher Home"),
    //       ),
    //       body: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             WelcomeWidget(),
    //             Text(
    //               widget.name,
    //               style: TextStyle(
    //                 fontSize: fontsize - 2,
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 // Image.asset("images/kuhutExam.png"),
    //                 // Image.asset("images/kuhutExam.png"),
    //                 IconButton(
    //                   onPressed: () {},
    //                   icon: Image.asset(t_path.attendance),
    //                   iconSize: 100,
    //                 ),
    //                 IconButton(
    //                   onPressed: () {},
    //                   icon: Image.asset(t_path.changePassword),
    //                   iconSize: 100,
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 // Image.asset("images/kuhutExam.png"),
    //                 // Image.asset("images/kuhutExam.png"),
    //                 IconButton(
    //                   onPressed: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => const pageSetExamDate()));
    //                   },
    //                   icon: Image.asset(t_path.calender),
    //                   iconSize: 100,
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => const PageAddSoal()));
    //                   },
    //                   icon: Image.asset(t_path.createExam),
    //                   iconSize: 100,
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 // Image.asset("images/kuhutExam.png"),
    //                 // Image.asset("images/kuhutExam.png"),
    //                 IconButton(
    //                   onPressed: () {},
    //                   icon: Image.asset(t_path.editContact),
    //                   iconSize: 100,
    //                 ),
    //                 IconButton(
    //                   onPressed: () {},
    //                   icon: Image.asset(t_path.profileLogo),
    //                   iconSize: 100,
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 // Image.asset("images/kuhutExam.png"),
    //                 // Image.asset("images/kuhutExam.png"),
    //                 IconButton(
    //                   onPressed: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => const SendLetter()));
    //                   },
    //                   icon: Image.asset(t_path.sendLetter),
    //                   iconSize: 100,
    //                 ),
    //               ],
    //             ),
    //             ElevatedButton(onPressed: (){
    //             {
    //               Navigator.push(context,MaterialPageRoute(
    //                 builder: (context) => ResetPass(siswaNameReset : widget.name )));
    //               }
    //           },
    //           child: const Text("reset password")),

    //           ElevatedButton(onPressed: (){
    //             {
    //               Navigator.push(context, MaterialPageRoute(
    //                 builder: (context)=> AddContact(siswaNameResetProfile2: widget.name)));
    //               }
    //           },
    //           child: const Text("add contact")),

    //           ElevatedButton(onPressed: (){
    //             {
    //               Navigator.push(context, MaterialPageRoute(builder: (context)=>  Contact_View(siswaNameResetcontact: widget.name, siswaKelasResetContact: widget.kelaslah,)));
    //               }
    //           },
    //           child: const Text("View Contact")),

    //           ElevatedButton(onPressed: (){
    //             {
    //                 Navigator.push(context,MaterialPageRoute(
    //                 builder: (context) => profilnya(siswaNameResetProfile : widget.name, siswaKelasResetProfile: widget.kelaslah, )));
    //               }
    //           },
    //           child: const Text("profile")),
    //           ],
    //         ),
    //       )),
    // );
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(""),
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.all(0.0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://png.pngtree.com/thumb_back/fw800/background/20201223/pngtree-purple-minimalist-watercolor-education-background-image_512200.jpg"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    "KuhutExam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.house),
                title: Text("HOME"),
                onTap: () {
                  // {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MainMenuTeacher(
                  //                 name: widget.name,
                  //                 kelaslah: widget.kelaslah,
                  //               )));
                  // }
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("PROFILE"),
                onTap: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profilnya(
                                  siswaNameResetProfile: widget.name,
                                  siswaKelasResetProfile: widget.kelaslah,
                                )));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("CONTACT"),
                onTap: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contact_View(
                                  siswaNameResetcontact: widget.name,
                                  siswaKelasResetContact: widget.kelaslah,
                                )));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: Text("LOG OUT"),
                onTap: () {
                  {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                },
              ),
            ],
          )),
          body: Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('images/iconMenuSiswa/top.png'))),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    'https://sdnsusukan07.sch.id/asset/images/guru.png'),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Guru",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            primary: false,
                            crossAxisCount: 2,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => pageSetExamDate()));
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.calendar_today,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Scheduling Exam',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PageAddSoal()));
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.format_list_numbered,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Exam Questions',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AbsensiDetail(
                                          namaGuru: widget.name,
                                          kelasGuru: widget.kelaslah),
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.check,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'View Absent',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScoreDetailPage(
                                              namaGuru: widget.name,
                                              kelasGuru: widget.kelaslah)));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.score,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'View Score',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SendLetter()));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.mail,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Send Letter',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListSoal(nama: widget.name)));
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.format_list_numbered,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'View Jawaban Siswa',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  // Row Menu() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       // Image.asset("images/kuhutExam.png"),
  //       // Image.asset("images/kuhutExam.png"),
  //       IconButton(
  //         onPressed: () {},
  //         icon: Image.asset("images/kuhutExam.png"),
  //         iconSize: 100,
  //       ),
  //       IconButton(
  //         onPressed: () {},
  //         icon: Image.asset("images/kuhutExam.png"),
  //         iconSize: 100,
  //       ),
  //     ],
  //   );
  // }

  // Text WelcomeWidget() => Text(
  //       "Welcome,",
  //       style: TextStyle(fontSize: fontsize),
  //     );
}
