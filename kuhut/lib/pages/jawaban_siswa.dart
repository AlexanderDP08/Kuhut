import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

import 'package:flutter/material.dart';

class pageJawabanSiswa extends StatefulWidget {
  const pageJawabanSiswa({Key? key}) : super(key: key);

  @override
  State<pageJawabanSiswa> createState() => _pageJawabanSiswaState();
}

class _pageJawabanSiswaState extends State<pageJawabanSiswa> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

  Stream<QuerySnapshot<Object?>> onSearch() {
    return DatabaseTeacher.getJawabanSiswa();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: onSearch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              itemBuilder: (context, index) {
                DocumentSnapshot dsData = snapshot.data!.docs[index];
                String dtNamaSoal = dsData['nama_soal'];
                String dtNama = dsData['nama_siswa'];
                String dtJawabanSiswa = dsData['jawaban_siswa'];
                String dtSoal = dsData['soal'];
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Soal: $dtNamaSoal"),
                      Text("Nama: $dtNama"),
                      Text("Jawaban: $dtJawabanSiswa"),
                      Text("Soal: $soal")
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
    ));
  }
}
