import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../database_services/db_crud.dart';

class LihatNilai extends StatefulWidget {
  final String getNama;
  final String getKelas;
  const LihatNilai({Key? key, required this.getNama, required this.getKelas})
      : super(key: key);

  @override
  State<LihatNilai> createState() => _LihatNilaiState();
}

class _LihatNilaiState extends State<LihatNilai> {
  Stream<QuerySnapshot<Map<String, dynamic>>> onSearch() {
    setState(() {});
    if (widget.getKelas == "9") {
      return DataBaseSoal.getScoreSiswaFromTeacher1(
          "alex", widget.getNama); //nan
    } else if (widget.getKelas == "7") {
      return DataBaseSoal.getScoreSiswaFromTeacher1(
          "alex", widget.getNama); //nan
    }
    return DataBaseSoal.getScoreSiswaFromTeacher1(
        "noname", widget.getNama); //nan
  }

  @override
  Widget build(BuildContext context) {
    print(widget.getNama);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Lihat Nilai"),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: onSearch(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error');
                        } else if (snapshot.hasData || snapshot.data != null) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              DocumentSnapshot dsData =
                                  snapshot.data!.docs[index];
                              String dtMapel = dsData['mapel'];
                              String dtNama = dsData['nama'];
                              String dtNilai = dsData['score'];
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nama Tes: ${dtMapel.toUpperCase()}"),
                                    Text("Nama: $dtNama"),
                                    Text("Nilai: $dtNilai"),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 8),
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
            )));
  }
}
