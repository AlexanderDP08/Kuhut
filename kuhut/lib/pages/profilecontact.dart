import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/db_crud.dart';

import '../main.dart';

class profilnya extends StatefulWidget {
  final String siswaNameResetProfile;
  const profilnya({Key? key, required this.siswaNameResetProfile})
      : super(key: key);

  @override
  State<profilnya> createState() => _profilnyaState();
}

final db = FirebaseFirestore.instance;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.siswaNameResetProfile),
              FutureBuilder(
                future: DatabaseUser.dapatprofile(get_user.text.toString()),
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text("Load");}
                  return Text(namas);
                }
              ),
              FutureBuilder(
                future: DatabaseUser.dapatprofile(get_user.text.toString()),
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text("Load");}
                  return Text(birthdays);
                }
              ),
              FutureBuilder(
                future: DatabaseUser.dapatprofile(get_user.text.toString()),
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text("Load");}
                  return Text(kelass);
                }
              ),
              FutureBuilder(
                future: DatabaseUser.dapatprofile(get_user.text.toString()),
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text("Load");}
                  return Text(kelamins);
                }
              ),
              FutureBuilder(
                future: DatabaseUser.dapatprofile(get_user.text.toString()),
                builder: (context, snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text("Load");}
                  return Text(telps);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
