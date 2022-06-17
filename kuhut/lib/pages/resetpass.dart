import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';

class ResetPass extends StatefulWidget {
  final String siswaNameReset;
  const ResetPass({Key? key, required this.siswaNameReset}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetpassState();
}

TextEditingController get_pass = TextEditingController();
bool hide = true;

class _ResetpassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Siswa "),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, "),
                Text(widget.siswaNameReset),
                TextField(
                  controller: get_pass,
                  obscureText: hide,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            //hide =true?  hide = false : hide = true
                            if (hide == true) {
                              hide = false;
                            } else {
                              hide = true;
                            }
                          });
                        },
                      )),
                ),
                
                ElevatedButton(onPressed: (){
                  final dtbaru = Login(email: widget.siswaNameReset+("@siswa"), password: get_pass.text.toString());
                  DatabaseUser.ubahData(item: dtbaru);
                  // final dtBaru = Login(itemJudul: lvJudul, itemIsi: lvIsi+" oke");
                  // Database.ubahData(item: dtBaru);
                }, child: Text("RESET")),
              ],
            ),
          )),
    );
  }
}
