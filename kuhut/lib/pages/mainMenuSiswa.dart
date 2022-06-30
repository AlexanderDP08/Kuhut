import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';

class MainMenuSiswas extends StatefulWidget {
  final String siswa_name;
  const MainMenuSiswas({Key? key, required this.siswa_name}) : super(key: key);

  @override
  State<MainMenuSiswas> createState() => _MainMenuSiswasState();
}

class _MainMenuSiswasState extends State<MainMenuSiswas> {
  @override
  Widget build(BuildContext context) {
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
                                siswaNameResetProfile: widget.siswa_name)));
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
                            builder: (context) => const Contact_View()));
                  }
                },
              ),
            ],
          )),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('images/iconMenuSiswa/header.png')
                    )
                  ),
                ),

                Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsPbdWDUpeZ30VDHDOK9p-prcV2W2eogx6E2scfS7LjkZLn8-U4re9geKbvvR0lhR1olA&usqp=CAU'),
                          )
                        ],
                      ),
                    )
                  ],
                )
                // const Text("Welcome, "),
                // Text(widget.siswa_name),
                // ElevatedButton(
                //     onPressed: () {
                //       {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => ResetPass(
                //                     siswaNameReset: widget.siswa_name)));
                //       }
                //     },
                //     child: const Text("reset password")),
                // ElevatedButton(
                //     onPressed: () {
                //       {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => AddContact(
                //                     siswaNameResetProfile: widget.siswa_name)));
                //       }
                //     },
                //     child: const Text("add contact")),
                // ElevatedButton(
                //     onPressed: () {
                //       {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const Contact_View()));
                //       }
                //     },
                //     child: const Text("View Contact")),
                // ElevatedButton(
                //     onPressed: () {
                //       {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => profilnya(
                //                     siswaNameResetProfile: widget.siswa_name)));
                //       }
                //     },
                //     child: const Text("profile")),
              ],
            ),
          )),
    );
  }
}
