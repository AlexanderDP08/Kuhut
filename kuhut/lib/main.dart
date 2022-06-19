// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kuhut/pages/PageAddSoal.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuhut/pages/main_menu.dart';
>>>>>>> 9cd6877d67861ebbcdb83563eeca58a4cfaa553b

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

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp> _initFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  TextEditingController get_user = TextEditingController();
  TextEditingController get_pass = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuhut"),
      ),
<<<<<<< HEAD
      body: Column(
        children: [
          Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PageAddSoal();
                  }));
                },
                child: Text("Go to page buat soal")),
          )
        ],
=======
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image.asset(
              "images/kuhutExam.png",
            ),
            TextField(
              controller: get_user,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Username"),
            ),
            TextField(
              controller: get_pass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("Login"),
              onPressed: () {
                final db = FirebaseFirestore.instance;
                if (check_text(
                        get_user.text.toString(), get_pass.text.toString()) ==
                    true) {
                  db
                      .collection('tbUser')
                      .doc(get_user.text.toString())
                      .get()
                      .then((DocumentSnapshot dsData)  {
                    String email = dsData['email'];
                    String password = dsData['password'];

                     if (get_user.text.toString() == email &&
                          get_pass.text.toString() == password) {
                        Navigator.push(context,MaterialPageRoute(
                                builder: (context) => MainMenu())        
                        );
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
>>>>>>> 9cd6877d67861ebbcdb83563eeca58a4cfaa553b
      ),
    );
  }
}
