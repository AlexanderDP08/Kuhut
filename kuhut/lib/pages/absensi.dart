import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/pages/mainMenuSiswa.dart';
import 'package:kuhut/pages/mainMenuTeacher.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class Absensi extends StatefulWidget {
  final String siswaNameAbsen;
  final String siswaKelasAbsen;
  const Absensi(
      {Key? key, required this.siswaNameAbsen, required this.siswaKelasAbsen})
      : super(key: key);

  @override
  State<Absensi> createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  int _jumlah = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("View Absen"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: DatabaseUser.getUserDataProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('ERROR');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            DocumentSnapshot dsData =
                                snapshot.data!.docs[index];
                            String lvJudul = dsData['nama'];
                            _jumlah = snapshot.data!.docs.length;
                            // return ListTile(
                            //   title: Text(lvJudul),
                            // );
                            return Card(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text("data"),
                                        Spacer(),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text("data2"),
                                        Spacer(),
                                        Text("data3")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length);
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pinkAccent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
