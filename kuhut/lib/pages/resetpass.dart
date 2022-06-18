import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';

class ResetPass extends StatefulWidget {
  final String siswaNameReset;
  const ResetPass({Key? key, required this.siswaNameReset}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetpassState();
}

TextEditingController get_pass = TextEditingController();

TextEditingController get_pass2 = TextEditingController();
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
                TextField(
                  controller: get_pass2,
                  obscureText: hide,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(),
                      hintText: "Repeat new password",
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
                  if (get_pass.text.toString() == get_pass2.text.toString()){
                     final dtbaru = Login(email: widget.siswaNameReset+("@siswa"), password: get_pass.text.toString());
                     DatabaseUser.ubahData(item: dtbaru);
                  }
                  else{
                     Fluttertoast.showToast(
                        msg: "Repeat password tidak sama dengan set password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.red,
                        fontSize: 16.0
                    );
                  }
                 
                  // final dtBaru = Login(itemJudul: lvJudul, itemIsi: lvIsi+" oke");
                  // Database.ubahData(item: dtBaru);
                }, child: Text("RESET")),
              ],
            ),
          )),
    );
  }
}
