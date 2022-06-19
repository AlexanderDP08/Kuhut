import 'package:flutter/material.dart';
import 'package:kuhut/pages/resetpass.dart';

class MainMenuSiswas extends StatefulWidget {
  final String siswa_name;
  const MainMenuSiswas({Key? key, required this.siswa_name}) : super(key: key);

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
        ),
        body : Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome, "),
              Text(widget.siswa_name),
              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ResetPass(siswaNameReset : widget.siswa_name )));
                  }
              }, child: Text("reset password"))
            ],
          ),
        )
      ),
    );
  }
}