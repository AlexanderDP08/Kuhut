import 'package:flutter/material.dart';

class Contact_View extends StatefulWidget {
  const Contact_View({ Key? key }) : super(key: key);

  @override
  State<Contact_View> createState() => _Contact_ViewState();
}

TextEditingController get_contact = TextEditingController();

class _Contact_ViewState extends State<Contact_View> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("View Contact"),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text("view contact ini"),
                TextField(
                  showCursor: true,
                  controller: get_contact,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Input Your Line Contact",
                      labelText: "Line",),
                ),
                const SizedBox(height: 20),
                TextField(
                  showCursor: true,
                  controller: get_contact,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Input Your WhatsApp Contact",
                      labelText: "WhatsApp",),
                ),
              ],
            ),
          ),
      ),
    );
  }
}