// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Kuhut',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuhut"),
      ),
      body: Column(
        children: [
          Container(
            child: ElevatedButton(
                onPressed: () {}, child: Text("Go to page buat soal")),
          )
        ],
      ),
    );
  }
}
