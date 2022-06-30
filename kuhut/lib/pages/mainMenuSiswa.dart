import 'package:flutter/material.dart';
import 'package:kuhut/pages/addcontact.dart';
import 'package:kuhut/pages/profilecontact.dart';
import 'package:kuhut/pages/resetpass.dart';
import 'package:kuhut/pages/viewcontact.dart';

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
          title: const Text("Siswa "),
        ),
        body : Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome, "),
              Text(widget.siswa_name),
              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ResetPass(siswaNameReset : widget.siswa_name )));
                  }
              }, 
              child: const Text("reset password")),

              ElevatedButton(onPressed: (){
                {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> AddContact(siswaNameResetProfile: widget.siswa_name)));
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
                    Navigator.push(context,MaterialPageRoute(
                    builder: (context) => profilnya(siswaNameResetProfile : widget.siswa_name )));
                  }
              }, 
              child: const Text("profile")),
            ],
          ),
        )
      ),
    );
  }
}
