import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

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
