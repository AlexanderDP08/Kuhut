import 'package:flutter/material.dart';

class MainMenuSiswas extends StatefulWidget {
  const MainMenuSiswas({Key? key}) : super(key: key);

  @override
  State<MainMenuSiswas> createState() => _MainMenuSiswasState();
}

class _MainMenuSiswasState extends State<MainMenuSiswas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: Text("Siswa "),
      ), ),
    );
  }
}
