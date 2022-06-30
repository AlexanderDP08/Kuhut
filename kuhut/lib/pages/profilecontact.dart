import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

import '../main.dart';

class profilnya extends StatefulWidget {
  final String siswaNameResetProfile;
  const profilnya({ Key? key , required this.siswaNameResetProfile}) : super(key: key);

  @override
  State<profilnya> createState() => _profilnyaState();
  
}

class _profilnyaState extends State<profilnya> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Profile"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:[
                Text(widget.siswaNameResetProfile)
              ],
            ),
          ),
      ),
    );
  }
}