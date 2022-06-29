// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuhut/pages/mainMenuSiswa.dart';
import 'package:kuhut/pages/mainMenuTeacher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Kuhut',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController get_user = TextEditingController();
TextEditingController get_pass = TextEditingController();

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp> _initFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  void continueDialog(String text, String content) {
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alerting = AlertDialog(
      title: Text(text),
      content: Text(content),
      actions: [cancelButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerting;
      },
    );
  }

  bool check_text(String email, String pass) {
    if (email != "" && pass != "") {
      return true;
    }
    return false;
  }

  bool hide = true;
  void createToast(String message, Color warna, int time) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0);
  }

  String getInstance(String email, String tipe) {
    int i = 0;
    while (i < email.length) {
      i++;
      if (email[i] == "@") {
        if (tipe == "reverse") {
          return email.substring(0, i);
        }
        return email.substring(i + 1, email.length);
      }
    }
    return "teacherorsiswa";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Kuhut"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                "images/kuhutExam.png",
              ),
              TextField(
                controller: get_user,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    hintText: "Username"),
              ),
              TextField(
                controller: get_pass,
                obscureText: hide,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
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
              ElevatedButton.icon(
                icon: Icon(Icons.login),
                label: Text("Login"),
                onPressed: () {
                  final db = FirebaseFirestore.instance;
                  if (check_text(
                          get_user.text.toString(), get_pass.text.toString()) ==
                      true) {
                    String getStats =
                        (getInstance(get_user.text.toString(), "standard"));
                    print(getStats);
                    String reserved =
                        (getInstance(get_user.text.toString(), "reverse"));
      
                    db
                        .collection('tbUser')
                        .doc(get_user.text.toString())
                        .get()
                        .then((DocumentSnapshot dsData) {
                      String email = dsData['email'];
                      String password = dsData['password'];
                      if (get_user.text.toString() == email) {
                        if (get_pass.text.toString() == password) {
                          //cek if guru or siswa based on email
                          if (getStats == "teacher") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainMenuTeacher(
                                          name: reserved,
                                        )));
                          } else if (getStats == "siswa") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainMenuSiswas(
                                          siswa_name: reserved,
                                        )));
                          } else {
                            createToast("Input instance", Colors.red, 1);
                          }
                        } else {
                          //flutter toast Invalid Password/ganti di text
                          createToast("Invalid Password", Colors.red, 1);
                        }
                      }
                    });
                  } else {
                    continueDialog(
                        "Input All", "Please Input all the Field Here");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
