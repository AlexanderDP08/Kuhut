import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({ Key? key }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
  
}

TextEditingController get_contacts = TextEditingController();

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("add contact "),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:[
                const Text("add contact ini"),
                TextField(
                  showCursor: true,
                  controller: get_contacts,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Input Your Line Contact",
                      labelText: "Line",),
                ),
                const SizedBox(height: 20),
                TextField(
                  showCursor: true,
                  controller: get_contacts,
                  decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
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