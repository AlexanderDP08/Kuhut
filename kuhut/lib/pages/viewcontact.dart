import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/pages/mainMenuSiswa.dart';
import 'package:kuhut/pages/mainMenuTeacher.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class Contact_View extends StatefulWidget {
  final String siswaNameResetcontact;
  final String siswaKelasResetContact;
  const Contact_View(
      {Key? key,
      required this.siswaNameResetcontact,
      required this.siswaKelasResetContact})
      : super(key: key);

  @override
  State<Contact_View> createState() => _Contact_ViewState();
}

//String lvtelp = "";

class _Contact_ViewState extends State<Contact_View> {
  List<bool> _selections = List.generate(4, (index) => false);
  final _searhText = TextEditingController();
  @override
  void dispose() {
    _searhText.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searhText.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DatabaseUser.getUserDataSiswa(_searhText.text);
  }

  Future<void> whatsAppOpen(String no) async {
    await launch('tel:$no');
  }

  Future<void> emailOpen(String mail) async {
    await launch('mailto:$mail');
  }

  int _jumlah = 0;
  int groupValues = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("View Contact"),
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
                  if (widget.siswaKelasResetContact == "7" ||
                      widget.siswaKelasResetContact == "8" ||
                      widget.siswaKelasResetContact == "9") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenuSiswas(
                                siswa_name: widget.siswaNameResetcontact,
                                siswa_kelas: widget.siswaKelasResetContact)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenuTeacher(
                                  name: widget.siswaNameResetcontact,
                                  kelaslah: widget.siswaKelasResetContact,
                                )));
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
                                    widget.siswaNameResetcontact,
                                siswaKelasResetProfile:
                                    widget.siswaKelasResetContact,
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
                                siswaNameResetcontact:
                                    widget.siswaNameResetcontact,
                                siswaKelasResetContact:
                                    widget.siswaKelasResetContact,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Contact",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _searhText,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    )),
              ),
              // Row(
              //   children: [
              //   ],
              // ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: onSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('ERROR');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            DocumentSnapshot dsData =
                                snapshot.data!.docs[index];
                            String lvnama = dsData['nama'];
                            String lvtelp = dsData['telp'];
                            String lvkelas = dsData['kelas'];
                            String lvmail = dsData['email'];
                            _jumlah = snapshot.data!.docs.length;

                            // return ListTile(
                            //   title: Text(lvnama),
                            //   subtitle: Text(lvtelp),
                            // );

                            if (lvkelas == "7") {
                              return ListTile(
                                title: Text(lvnama),
                                subtitle: Text(lvtelp),
                                leading: CircleAvatar(
                                  child: Text("7"),
                                  backgroundColor: Colors.blue,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          emailOpen(lvmail);
                                        },
                                        icon:
                                            Icon(Icons.attach_email_outlined)),
                                    IconButton(
                                        onPressed: () {
                                          whatsAppOpen(lvtelp);
                                        },
                                        icon: Icon(Icons.call_outlined)),
                                  ],
                                ),
                              );
                            } else if (lvkelas == "8") {
                              return ListTile(
                                title: Text(lvnama),
                                subtitle: Text(lvtelp),
                                leading: CircleAvatar(
                                  child: Text("8"),
                                  backgroundColor: Colors.blue,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          emailOpen(lvmail);
                                        },
                                        icon:
                                            Icon(Icons.attach_email_outlined)),
                                    IconButton(
                                        onPressed: () {
                                          whatsAppOpen(lvtelp);
                                        },
                                        icon: Icon(Icons.call_outlined)),
                                  ],
                                ),
                              );
                            } else if (lvkelas == "9") {
                              return ListTile(
                                title: Text(lvnama),
                                subtitle: Text(lvtelp),
                                leading: CircleAvatar(
                                  child: Text("9"),
                                  backgroundColor: Colors.blue,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          emailOpen(lvmail);
                                        },
                                        icon:
                                            Icon(Icons.attach_email_outlined)),
                                    IconButton(
                                        onPressed: () {
                                          whatsAppOpen(lvtelp);
                                        },
                                        icon: Icon(Icons.call_outlined)),
                                  ],
                                ),
                              );
                            } else {
                              return ListTile(
                                title: Text(lvnama),
                                subtitle: Text(lvtelp),
                                leading: CircleAvatar(
                                  child: Text("T"),
                                  backgroundColor: Colors.blue,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          emailOpen(lvmail);
                                        },
                                        icon:
                                            Icon(Icons.attach_email_outlined)),
                                    IconButton(
                                        onPressed: () {
                                          whatsAppOpen(lvtelp);
                                        },
                                        icon: Icon(Icons.call_outlined)),
                                  ],
                                ),
                              );
                            }
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 8.0,
                              ),
                          itemCount: snapshot.data!.docs.length);
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pinkAccent,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
