import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/pages/mainMenuTeacher.dart';
import 'package:kuhut/pages/viewcontact.dart';

import '../main.dart';
import 'addcontact.dart';
import 'mainMenuSiswa.dart';
import 'resetpass.dart';

class profilnya extends StatefulWidget {
  final String siswaNameResetProfile;
  final String siswaKelasResetProfile;
  const profilnya(
      {Key? key,
      required this.siswaNameResetProfile,
      required this.siswaKelasResetProfile})
      : super(key: key);

  @override
  State<profilnya> createState() => _profilnyaState();
}

final db = FirebaseFirestore.instance;

class _profilnyaState extends State<profilnya> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPass(
                            siswaNameReset: widget.siswaNameResetProfile)));
              }
            },
            backgroundColor: Colors.purple,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddContact(
                              siswaNameResetProfile2:
                                  widget.siswaNameResetProfile,
                            )));
              }
            },
            backgroundColor: Colors.purple,
          )
        ]),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.all(0.0),
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
                  if(widget.siswaKelasResetProfile == "0"){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainMenuTeacher(name: widget.siswaNameResetProfile, kelaslah: widget.siswaKelasResetProfile,)));
                  } else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainMenuSiswas(siswa_name: widget.siswaNameResetProfile, siswa_kelas: widget.siswaKelasResetProfile)));
                  }
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
                                siswaNameResetProfile:
                                    widget.siswaNameResetProfile,
                                siswaKelasResetProfile:
                                    widget.siswaKelasResetProfile,
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
                          builder: (context) => Contact_View(siswaNameResetcontact: widget.siswaNameResetProfile, siswaKelasResetContact: widget.siswaNameResetProfile,)));
                }
              },
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: Text("LOG OUT"),
                onTap: () {
                  {
                  Navigator.pop(
                        context,);
                  }
                },
              ),
          ],
        )),
        body: Container(
          child: Stack(children: [
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "PROFILE",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                        future:
                            DatabaseUser.dapatprofile(get_user.text.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Load");
                          }
                          if (kelass == "7" || kelass == "8" || kelass == "9") {
                            return CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsPbdWDUpeZ30VDHDOK9p-prcV2W2eogx6E2scfS7LjkZLn8-U4re9geKbvvR0lhR1olA&usqp=CAU'),
                            );
                          } else {
                            return CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  'https://sdnsusukan07.sch.id/asset/images/guru.png'),
                            );
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future:
                            DatabaseUser.dapatprofile(get_user.text.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Load");
                          }
                          return Text(
                            namas,
                            style: TextStyle(fontSize: 25),
                          );
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                        future:
                            DatabaseUser.dapatprofile(get_user.text.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Load");
                          }
                          return Text(
                            birthdays,
                            style: TextStyle(fontSize: 20),
                          );
                        }),
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      FutureBuilder(
                          future: DatabaseUser.dapatprofile(
                              get_user.text.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("Load");
                            }
                            if (kelass == "7" ||
                                kelass == "8" ||
                                kelass == "9") {
                              return Text(
                                kelass,
                                style: TextStyle(fontSize: 15),
                              );
                            } else {
                              return Text(
                                "Guru",
                                style: TextStyle(fontSize: 15),
                              );
                            }
                          }),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                        future:
                            DatabaseUser.dapatprofile(get_user.text.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Load");
                          }
                          return Text(
                            kelamins,
                            style: TextStyle(fontSize: 20),
                          );
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                        future:
                            DatabaseUser.dapatprofile(get_user.text.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text("Load");
                          }
                          return Text(
                            telps,
                            style: TextStyle(fontSize: 20),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
