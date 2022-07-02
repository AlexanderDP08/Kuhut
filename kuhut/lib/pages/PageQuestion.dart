// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/main.dart';
import 'package:kuhut/pages/mainMenuSiswa.dart';

class ButtonSoal extends StatefulWidget {
  final String djenjang;
  final String dnamaSoal;
  final String dnama;
  final String dkelas;
  final String dguru;
  final String dtgl;

  const ButtonSoal({
    Key? key,
    required this.djenjang,
    required this.dnamaSoal,
    required this.dnama,
    required this.dkelas,
    required this.dguru,
    required this.dtgl,
  }) : super(key: key);

  @override
  State<ButtonSoal> createState() => _ButtonSoalState();
}

class _ButtonSoalState extends State<ButtonSoal> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getScoreCheck(widget.dguru, widget.dnama);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: onSearch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData || snapshot.data != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Nama Guru: " + widget.dguru);
                  print("Nama Siswa: " + widget.dnama);
                  print("Belom Kerja");
                  //masukan absen ke db
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Soal(
                        jenjang: widget.djenjang,
                        namaSoal: widget.dnamaSoal,
                        kelas: widget.dkelas,
                        nama: widget.dnama,
                        guru: widget.dguru,
                      ),
                    ),
                  );
                },
                child: Text("Tes ${widget.dnamaSoal}"),
              ),
            ],
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
    );
  }
}

class MenuSoal extends StatefulWidget {
  final String nama;
  final String kelas;

  const MenuSoal({
    Key? key,
    required this.nama,
    required this.kelas,
  }) : super(key: key);

  @override
  State<MenuSoal> createState() => _MenuSoalState();
}

class _MenuSoalState extends State<MenuSoal> {
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getEvent(widget.kelas);
  }

  @override
  Widget build(BuildContext context) {
    int listSize = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih Soal"),
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
                  String dtJenjang = dsData['jenjang'];
                  if (widget.kelas == dtJenjang) {
                    String dtTitle = dsData['title'];
                    String dtGuru = dsData['teacher'];
                    String dtTgl = dsData['date'];
                    const SizedBox(height: 8);
                    return ButtonSoal(
                      djenjang: widget.kelas,
                      dnamaSoal: dtTitle,
                      dnama: widget.nama,
                      dkelas: widget.kelas,
                      dguru: dtGuru,
                      dtgl: dtTgl,
                    );
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

class Soal extends StatefulWidget {
  final String jenjang;
  final String namaSoal;
  final String nama;
  final String kelas;
  final String guru;

  const Soal({
    Key? key,
    required this.jenjang,
    required this.namaSoal,
    required this.nama,
    required this.kelas,
    required this.guru,
  }) : super(key: key);

  @override
  State<Soal> createState() => _SoalState();
}

class _SoalState extends State<Soal> {
  late String _character = "";
  int nomer = 0;
  String _soal = "";
  final List<String>? _ans = ["", "", ""];
  String kunciJwb = "";
  int dscore = 0;

  int listSize = 0;

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getSoal(widget.guru);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Soal No ${nomer + 1}"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: onSearch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  DocumentSnapshot dsData = snapshot.data!.docs[nomer];
                  _soal = dsData['soal'];
                  _ans![0] = dsData['ans_0'];
                  _ans![1] = dsData['ans_1'];
                  _ans![2] = dsData['ans_2'];
                  kunciJwb = dsData['c_ans'];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "${nomer + 1}. $_soal",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: Text(_ans![0]),
                        leading: Radio(
                          value: _ans![0],
                          groupValue: _character,
                          onChanged: (value) {
                            setState(() {
                              _character = value.toString();
                            });
                            print(value);
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(_ans![1]),
                        leading: Radio(
                          value: _ans![1],
                          groupValue: _character,
                          onChanged: (value) {
                            setState(() {
                              _character = value.toString();
                            });
                            print(value);
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(_ans![2]),
                        leading: Radio(
                          value: _ans![2],
                          groupValue: _character,
                          onChanged: (value) {
                            setState(() {
                              _character = value.toString();
                            });
                            print(value);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (nomer <= 0) {
                                } else {
                                  nomer--;
                                  print("Nomer: $nomer");
                                  _character = "";
                                }
                              });
                            },
                            child: const Text("<< Back"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (nomer >= snapshot.data!.docs.length - 1) {
                                  if (_character == kunciJwb) {
                                    setState(() {
                                      dscore++;
                                    });
                                  }
                                  final item = Score(
                                      guru: widget.guru,
                                      mapel: widget.namaSoal,
                                      nama: widget.nama,
                                      score: dscore.toString());
                                  DataBaseSoal.addScore(item: item);
                                  final data = addJawabanSiswa(
                                      jawabanSiswa: _character,
                                      namaSiswa: widget.nama,
                                      namaSoal: widget.namaSoal,
                                      soal: _soal);
                                  DatabaseTeacher.inputJawabanSiswa(data: data);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EndMenuSoal(
                                              score: dscore.toString(),
                                              dnama: widget.nama,
                                              dkelas: widget.kelas)));
                                } else {
                                  if (_character == kunciJwb) {
                                    setState(() {
                                      dscore++;
                                    });
                                  }
                                  final data = addJawabanSiswa(
                                      jawabanSiswa: _character,
                                      namaSiswa: widget.nama,
                                      namaSoal: widget.namaSoal,
                                      soal: _soal);
                                  DatabaseTeacher.inputJawabanSiswa(data: data);
                                  print(
                                      "Max Array Size: ${snapshot.data!.docs.length}");
                                  nomer++;
                                  print("Nomer: $nomer");
                                  _character = "";
                                }
                              });
                            },
                            child: const Text("Next >>"),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: 1,
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

class EndMenuSoal extends StatefulWidget {
  final String score;
  final String dnama;
  final String dkelas;

  const EndMenuSoal({
    Key? key,
    required this.score,
    required this.dnama,
    required this.dkelas,
  }) : super(key: key);

  @override
  State<EndMenuSoal> createState() => _EndMenuSoalState();
}

class _EndMenuSoalState extends State<EndMenuSoal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tes Selesai"),
        ),
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                Text("Tes Selesai"),
                Text("Nilai mu: ${widget.score}"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainMenuSiswas(
                                  siswa_name: widget.dnama,
                                  siswa_kelas: widget.dkelas)));
                    },
                    child: Text("Back To MainMenu"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
