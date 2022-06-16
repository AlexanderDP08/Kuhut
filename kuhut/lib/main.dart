// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuhut"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username"
              ),
              
            ),
             TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password"
              ),
            ),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.login), label: Text("Login"))
          ],
        ),
      ),
    );
  }
}
