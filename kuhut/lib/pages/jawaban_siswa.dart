import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

import 'package:flutter/material.dart';

class ListSoal extends StatefulWidget {
  final String nama;

  const ListSoal({
    Key? key,
    required this.nama,
  }) : super(key: key);

  @override
  State<ListSoal> createState() => _ListSoalState();
}

class _ListSoalState extends State<ListSoal> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    return DataBaseSoal.getEventTeacher(widget.nama);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show List Soal"),
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
                  String dtNamaSoal = dsData['title'];
                  return ElevatedButton(
                      onPressed: () {
                        print(dtNamaSoal);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => pageJawabanSiswaDetail(
                                nama: widget.nama, namaSoal: dtNamaSoal)),
                          ),
                        );
                      },
                      child: Text("Soal ${dtNamaSoal.toUpperCase()}"));
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

class pageJawabanSiswaDetail extends StatefulWidget {
  final String nama;
  final String namaSoal;

  const pageJawabanSiswaDetail({
    Key? key,
    required this.nama,
    required this.namaSoal,
  }) : super(key: key);

  @override
  State<pageJawabanSiswaDetail> createState() => pageJawabanSiswaDetailState();
}

class pageJawabanSiswaDetailState extends State<pageJawabanSiswaDetail> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    if (widget.nama == "alex") {
      return DatabaseTeacher.getListSiswa("9");
    } else if (widget.nama == "andrew") {
      return DatabaseTeacher.getListSiswa("7");
    }
    return DatabaseTeacher.getListSiswa("0");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show List Siswa"),
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
                  String dtNama = dsData['nama'];
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => pageJawabanSiswa(
                                    namaSiswa: dtNama, nama_soal: widget.namaSoal))));
                      },
                      child: Text("Siswa: $dtNama"));
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

class pageJawabanSiswa extends StatefulWidget {
  final String namaSiswa;
  final String nama_soal;

  const pageJawabanSiswa({
    Key? key,
    required this.namaSiswa,
    required this.nama_soal,
  }) : super(key: key);

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
    return DatabaseTeacher.getJawabanSiswa(widget.namaSiswa, widget.nama_soal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("History Jawaban Siswa")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Siswa: ${widget.namaSiswa.toUpperCase()}"),
            Text("Nama Soal: ${widget.nama_soal.toUpperCase()}"),
            SizedBox(
              height: 20,
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
                        DocumentSnapshot dsData = snapshot.data!.docs[index];
                        String dtNamaSoal = dsData['nama_soal'];
                        String dtNama = dsData['nama_siswa'];
                        String dtJawabanSiswa = dsData['jawaban_siswa'];
                        String dtSoal = dsData['soal'];
                        Text("Nama Soal: $dtNamaSoal");
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Soal: $dtSoal"),
                              Text("Jawaban: $dtJawabanSiswa"),
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
    ));
  }
}
