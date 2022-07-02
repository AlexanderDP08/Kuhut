import 'package:flutter/material.dart';

import '../database_services/dataClass.dart';
import '../database_services/db_crud.dart';

class GantiNilai extends StatefulWidget {
  final String emailguru;
  final String score;
  final String namaanak;
  final String judul;
  const GantiNilai(
      {Key? key,
      required this.emailguru,
      required this.score,
      required this.namaanak,
      required this.judul})
      : super(key: key);

  @override
  State<GantiNilai> createState() => _GantiNilaiState();
}

TextEditingController get_nilai_baru = TextEditingController();

class _GantiNilaiState extends State<GantiNilai> {
  void dismiss() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Siswa "),
        ),
        body: Container(
          child: Column(
            children: [
              Text(widget.namaanak),
              Text(widget.judul),
              Text(widget.emailguru),
              TextField(
                showCursor: true,
                controller: get_nilai_baru,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.account_circle,
                    size: 35,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Edit nilai baru",
                  labelText: "nilai",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final dtbaru = editprofilenilai(
                      aemailguru: widget.emailguru,
                      atitle: widget.judul,
                      anama: widget.namaanak,
                      anilai: get_nilai_baru.text.toString(),
                    );
                    DatabaseUser.ubahDataProfilenilai(item: dtbaru);
                    dismiss();
                  },
                  child: const Text("EDIT")),
            ],
          ),
        ),
      ),
    );
  }
}
