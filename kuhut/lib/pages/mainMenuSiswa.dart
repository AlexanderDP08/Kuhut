import 'package:flutter/material.dart';
import 'package:kuhut/andrew_work/st_lvtitle_let.dart';
import 'package:kuhut/pages/PageScore.dart';
import 'package:kuhut/main.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';
import 'package:kuhut/pages/PageQuestion.dart';

import '../andrew_work/st_viewletter.dart';

class MainMenuSiswas extends StatefulWidget {
  final String siswa_name;
  final String siswa_kelas;
  const MainMenuSiswas({Key? key, required this.siswa_name, required this.siswa_kelas})
      : super(key: key);

  @override
  State<MainMenuSiswas> createState() => _MainMenuSiswasState();
}

class _MainMenuSiswasState extends State<MainMenuSiswas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Siswa "),
          ),
          body: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    "MENU",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.house),
                title: Text("HOME"),
                onTap: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenuSiswas(
                                  siswa_name: widget.siswa_name,
                                  siswa_kelas: widget.siswa_kelas,
                                )));
                  }
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
                                  siswaNameResetProfile: widget.siswa_name,
                                  siswaKelasResetProfile: widget.siswa_kelas,
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
                                  siswaNameResetcontact: widget.siswa_name,
                                  siswaKelasResetContact: widget.siswa_kelas,
                                )));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: Text("LOG OUT"),
                onTap: () {
                  {
                    Navigator.pop(
                      context,
                    );
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
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsPbdWDUpeZ30VDHDOK9p-prcV2W2eogx6E2scfS7LjkZLn8-U4re9geKbvvR0lhR1olA&usqp=CAU'),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.siswa_name,
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "kelas : " + widget.siswa_kelas,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LetterListView(
                                                getSiswaKelas: widget.siswa_kelas,
                                              )));
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
                                        'Letter',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
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
                                        'Exam',
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
      // appBar: AppBar(
      //   title: const Text("Siswa "),
      // ),
      // body: Container(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text("Welcome, "),
      //       Text(widget.siswa_name + "Kelas : " + widget.siswa_kelas),
      //       ElevatedButton(onPressed: (){
      //         {
      //           Navigator.push(context,MaterialPageRoute(
      //             builder: (context) => ResetPass(siswaNameReset : widget.siswa_name )));
      //           }
      //       },
      //       child: const Text("reset password")),

      //       ElevatedButton(onPressed: (){
      //         {
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddContact()));
      //           }
      //       },
      //       child: const Text("add contact")),

      //       ElevatedButton(onPressed: (){
      //         {
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact_View()));
      //           }
      //       },
      //       child: const Text("View Contact")),

      //       ElevatedButton(onPressed: (){
      //         {
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact_View()));
      //           }
      //       },
      //       child: const Text("profile")),

      //       ElevatedButton(onPressed: (){
      //         {
      //            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewLetter()));
      //         }
      //       },
      //       child: const Text("cek letter")),

      //        ElevatedButton(onPressed: (){
      //         {
      //            Navigator.push(context, MaterialPageRoute(builder: (context)=>  LetterListView(getSiswaKelas: widget.siswa_kelas,)));
      //         }
      //       },
      //       child: const Text("Letter List View")),
      //       Text(widget.siswa_name),
      //       ElevatedButton(
      //           onPressed: () {
      //             {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           ResetPass(siswaNameReset: widget.siswa_name)));
      //             }
      //           },
      //           child: const Text("reset password")),
      //       ElevatedButton(
      //           onPressed: () {
      //             {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           AddContact(siswaNameResetProfile: widget.siswa_name)));
      //             }
      //           },
      //           child: const Text("add contact")),
      //       ElevatedButton(
      //           onPressed: () {
      //             {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => const Contact_View()));
      //             }
      //           },
      //           child: const Text("View Contact")),
      //       ElevatedButton(
      //           onPressed: () {
      //             {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           profilnya(siswaNameResetProfile: widget.siswa_name)));
      //             }
      //           },
      //           child: const Text("profile")),
      //       ElevatedButton(
      //         onPressed: () {
      //           String soal = "Soal Nomer";
      //           List<String>? ans = [];
      //           ans.add("Ans 1");
      //           ans.add("Ans 2");
      //           ans.add("Ans 3");
      //           ans.add("Ans 4");
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: ((context) => Soal(soal: soal, ans: ans))));
      //         },
      //         child: const Text("Kerja Soal"),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
