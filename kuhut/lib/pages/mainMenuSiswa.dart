import 'package:flutter/material.dart';
import 'package:kuhut/andrew_work/st_lvtitle_let.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';

import '../andrew_work/st_viewletter.dart';

class MainMenuSiswas extends StatefulWidget {
  final String siswa_name;
  final String siswa_kelas;
  const MainMenuSiswas({Key? key, required this.siswa_name, required this.siswa_kelas}) : super(key: key);

  @override
  State<MainMenuSiswas> createState() => _MainMenuSiswasState();
}

class _MainMenuSiswasState extends State<MainMenuSiswas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Siswa "),
        ),
        body : Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome, "),
              Text(widget.siswa_name + "Kelas : " + widget.siswa_kelas),
              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ResetPass(siswaNameReset : widget.siswa_name )));
                  }
              }, 
              child: const Text("reset password")),

              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddContact()));
                  }
              }, 
              child: const Text("add contact")),

              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact_View()));
                  }
              }, 
              child: const Text("View Contact")),

              ElevatedButton(onPressed: (){
                {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact_View()));
                  }
              }, 
              child: const Text("profile")),

              ElevatedButton(onPressed: (){
                {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewLetter()));
                }
              }, 
              child: const Text("cek letter")),

               ElevatedButton(onPressed: (){
                {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  LetterListView(getSiswaKelas: widget.siswa_kelas,)));
                }
              }, 
              child: const Text("Letter List View")),
            ],
          ),
        )
      ),
    );
  }
}
