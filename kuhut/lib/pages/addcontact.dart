import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({ Key? key }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("add contact "),
          ),
          body: Container(
            child: Column(
              children: const [
                Text("add contact ini")
              ],
            ),
          ),
      ),
    );
  }
}