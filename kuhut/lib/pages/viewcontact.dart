import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kuhut/database_services/db_crud.dart';


class Contact_View extends StatefulWidget {

  const Contact_View({ Key? key }) : super(key: key);

  @override
  State<Contact_View> createState() => _Contact_ViewState();
}

class _Contact_ViewState extends State<Contact_View> {
  final _searhText = TextEditingController();
  @override

  void dispose(){
    _searhText.dispose();
    super.dispose();
  }

  @override
  void initState(){
    _searhText.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch(){
    setState(() {
      
    });
    return DatabaseUser.getUserDataSiswa(_searhText.text);
  }

  int _jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("View Contact"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Contact", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20),
                TextField(
                  controller: _searhText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    )
                  ),
                ),
            Expanded(
              child:StreamBuilder<QuerySnapshot>(
                stream: onSearch(),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text('ERROR');
                  }else if (snapshot.hasData || snapshot.data != null){
                    return ListView.separated(
                      itemBuilder: (context, index){
                        DocumentSnapshot dsData = snapshot.data!.docs[index];
                        String lvnama = dsData['nama'];
                        String lvtelp = dsData['telp'];
                        _jumlah = snapshot.data!.docs.length;
                        return ListTile(
                          title: Text(lvnama),
                          subtitle: Text(lvtelp),
                        );
                      }, 
                      separatorBuilder: (context, index) => SizedBox(height: 8.0,), 
                      itemCount: snapshot.data!.docs.length);
                  }
                  return Center(
                    child:  CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color> (
                        Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
            
            )
              ],
            ),
          ),
      ),
    );
  }
}