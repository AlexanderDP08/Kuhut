import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

import '../main.dart';
import 'gantinilai.dart';

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
                  builder: (context) => ScorePage(
                        nama: namaGuru,
                      )),
            );
          },
          child: Text("Score Tes $namaSoal"),
        ),
      ],
    );
  }
}

class ScoreDetailPage extends StatefulWidget {
  final String namaGuru;
  final String kelasGuru;

  const ScoreDetailPage({
    Key? key,
    required this.namaGuru,
    required this.kelasGuru,
  }) : super(key: key);

  @override
  State<ScoreDetailPage> createState() => _ScoreDetailPageState();
}

class _ScoreDetailPageState extends State<ScoreDetailPage> {
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
          title: const Text("Pilih Tes"),
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

class ScorePage extends StatefulWidget {
  final String nama;

  const ScorePage({
    Key? key,
    required this.nama,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getScore(widget.nama);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Your Score"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Test Score",
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
                          DocumentSnapshot dsData = snapshot.data!.docs[index];
                          String dtMapel = dsData['mapel'];
                          String dtNama = dsData['nama'];
                          String dtNilai = dsData['score'];
                          // return Container(
                          //   alignment: Alignment.center,
                          //   padding: const EdgeInsets.all(20),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Nama Tes: ${dtMapel.toUpperCase()}"),
                          //       Text("Nama: $dtNama"),
                          //       Text("Nilai: $dtNilai"),
                          //     ],
                          //   ),
                          // );
                          return ListTile(
                            title: Text(dtNama),
                            subtitle: Text(dtMapel + " " + dtNilai),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GantiNilai(
                                                    emailguru: get_user.text
                                                        .toString(),
                                                    namaanak: dtNama,
                                                    score: dtNilai,
                                                    judul: dtMapel,
                                                  )));
                                    },
                                    icon: Icon(Icons.edit_attributes_outlined)),
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
        ),
      ),
    );
  }
}
