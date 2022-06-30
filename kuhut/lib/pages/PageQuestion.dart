import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

class ButtonSoal extends StatelessWidget {
  final String dmapel;
  final String djenjang;
  final String dtgl;
  final String dguru;

  const ButtonSoal({
    Key? key,
    required this.dmapel,
    required this.djenjang,
    required this.dtgl,
    required this.dguru,
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
                builder: (context) =>
                    Soal(mapel: dmapel, jenjang: djenjang, tgl: dtgl, guru: dguru),
              ),
            );
          },
          child: Text("Tes ${dmapel.toUpperCase()}"),
        ),
      ],
    );
  }
}

class MenuSoal extends StatefulWidget {
  const MenuSoal({Key? key}) : super(key: key);

  @override
  State<MenuSoal> createState() => _MenuSoalState();
}

class _MenuSoalState extends State<MenuSoal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih Soal"),
        ),
        body: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const ButtonSoal(
                    dmapel: "fisika", djenjang: "9", dtgl: "20-05-2022", dguru: "alex");
              },
              separatorBuilder: ((context, index) => SizedBox(height: 8)),
              itemCount: 10),
        ),
      ),
    );
  }
}

class Soal extends StatefulWidget {
  final String mapel;
  final String jenjang;
  final String tgl;
  final String guru;

  const Soal({
    Key? key,
    required this.mapel,
    required this.jenjang,
    required this.tgl,
    required this.guru,
  }) : super(key: key);

  @override
  State<Soal> createState() => _SoalState();
}

class _SoalState extends State<Soal> {
  late String _character = "";
  int nomer = 0;
  final String _soal = "";
  final List<String>? _ans = ["", "", "", ""];

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return DataBaseSoal.getSoal(widget.mapel, widget.jenjang, widget.tgl, widget.guru);
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
                  String _soal = dsData['soal'];
                  String CAns = dsData['c_ans'];
                  _ans![0] = dsData['ans_0'];
                  _ans![1] = dsData['ans_1'];
                  _ans![2] = dsData['ans_2'];
                  _ans![3] = dsData['ans_3'];
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
                      ListTile(
                        title: Text(_ans![3]),
                        leading: Radio(
                          value: _ans![3],
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
                                } else {
                                  print("Max Array Size: ${snapshot.data!.docs.length}");
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
