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

class ButtonSoal extends StatelessWidget {
  final String namaGuru;
  final String namaSoal;

  const ButtonSoal({
    Key? key,
    required this.namaGuru,
    required this.namaSoal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => viewAbsensi(
                  nama: namaGuru,
                  soal: namaSoal,
                ),
              ),
            );
          },
          child: Text("Absensi Tes $namaSoal"),
        ),
      ],
    );
  }
}

class AbsensiDetail extends StatefulWidget {
  final String namaGuru;
  final String kelasGuru;

  const AbsensiDetail({
    Key? key,
    required this.namaGuru,
    required this.kelasGuru,
  }) : super(key: key);

  @override
  State<AbsensiDetail> createState() => _AbsensiDetailState();
}

class _AbsensiDetailState extends State<AbsensiDetail> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getEventTeacher(widget.namaGuru);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih Absensi Tes"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: onSearch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  DocumentSnapshot dsData = snapshot.data!.docs[index];
                  String dtGuru = dsData['teacher'];
                  if (widget.namaGuru == dtGuru) {
                    String dtTitle = dsData['title'];
                    const SizedBox(height: 8);
                    return ButtonSoal(namaGuru: dtGuru, namaSoal: dtTitle);
                  }
                  return const Text("Data Not Found");
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: snapshot.data!.docs.length,
              );
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
      ),
    );
  }
}

class viewAbsensi extends StatefulWidget {
  final String nama;
  final String soal;

  const viewAbsensi({Key? key, required this.nama, required this.soal}) : super(key: key);

  @override
  State<viewAbsensi> createState() => viewAbsensiState();
}

class viewAbsensiState extends State<viewAbsensi> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getAbsen(widget.nama);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List Absensi Siswa"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Absensi Test ${widget.soal.toUpperCase()}",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: onSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          print(widget.nama);
                          DocumentSnapshot dsData = snapshot.data!.docs[index];
                          String dtMapel = dsData['mapel'];
                          String dtNama = dsData['nama'];
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama Tes: ${dtMapel.toUpperCase()}"),
                                Text("Nama Peserta: $dtNama"),
                                Text("Sudah Absen"),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 8),
                        itemCount: snapshot.data!.docs.length,
                      );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
