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
  void createToast(String message, Color warna, int time){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: warna,
        fontSize: 16.0
    );
  }
  void gantiPassword(){
      final dtbaru = Login(email: widget.siswaNameReset+("@siswa"), password: get_pass.text.toString());
      DatabaseUser.ubahData(item: dtbaru);
      dismiss();
      createToast("Data berhasil dirubah", Colors.green, 2);
  }
  void dismiss(){
    Navigator.of(context, rootNavigator: true).pop();
  }
   void continueDialog(String text, String content) {
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: () {
       dismiss();
      },
    );
     Widget confirmButton = TextButton(
      child: Text("Ubah"),
      onPressed: () {
        gantiPassword();
      },
    );

    AlertDialog alerting = AlertDialog(
      title: Text(text),
      content: Text(content),
      actions: [cancelButton, confirmButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerting;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Siswa "),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, "),
                Text(widget.siswaNameReset),
                TextField(
                  showCursor: true,
                  controller: get_pass,
                  obscureText: hide,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                      size: 35,
                    ),
                      border: OutlineInputBorder(),
                      hintText: "Input Your New Password",
                      labelText: "New Password",
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
                SizedBox(height: 20),
                TextField(
                  controller: get_pass2,
                  obscureText: hide,
                  showCursor: true,
                  decoration: InputDecoration(
                      icon: const Icon(
                      Icons.lock,
                      size: 35,
                    ),
                      border: OutlineInputBorder(),
                      hintText: "Input Your Repeat New Password",
                      labelText: "Repeat New Password",
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
                    continueDialog("Change Password", "Apakah anda yakin ingin mengganti password anda?");
                    //  final dtbaru = Login(email: widget.siswaNameReset+("@siswa"), password: get_pass.text.toString());
                    //  DatabaseUser.ubahData(item: dtbaru);
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
