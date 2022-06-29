import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuhut/main.dart';

class SendLetter extends StatefulWidget {
  const SendLetter({Key? key}) : super(key: key);

  @override
  State<SendLetter> createState() => _SendLetterState();
}

class _SendLetterState extends State<SendLetter> {
  var stateOfDisable = true;
  String labelJudul = "Judul (Disabled, set date first)";
  String labelKeterangan = "Keterangan (Disabled, set date first)";
  TextEditingController get_title = TextEditingController();
  TextEditingController get_desc = TextEditingController();
  TextEditingController get_date = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";

  String expDate = "null, pls set";
  var _text = '';

  var _text2 = '';
  void dispose(){
    get_title.dispose(); get_desc.dispose();
  }
  Future<void> _selectDate(BuildContext context, TextEditingController x,
      TextEditingController y) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, //initial hari
        firstDate: selectedDate, //limit awal hari
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        //x.text = "okkke";
        stateOfDisable = false;
        print("Hari yang dipilih : " + formattedDate);
        expDate = "Expiring : " + formattedDate;
      });
    }
  }

  bool isiCek(
      TextEditingController title, TextEditingController desc, String xyz) {
    if (title.text != "" && desc.text != "" && xyz != "") {
      return true;
    }
    return false;
  }
  String? get _errorText {
      final text = get_title.text;
      if (text.isEmpty) {
        return 'Can\'t be empty';
      }
      if (formattedDate == ""){
        return "Inputkan tanggal terlebih dahulu";
      }
      // return null if the text is valid
      return null;
    }

  String? get _errorTextKeterangan{
     final text = get_desc.text;
      if (text.isEmpty) {
        return 'Can\'t be empty';
      }
      if (formattedDate == ""){
        return "Inputkan tanggal terlebih dahulu";
      }
      // return null if the text is valid
      return null;
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Add Letter"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Text("Send Letter"),
              ElevatedButton.icon(
                  onPressed: () {
                    _selectDate(context, get_title, get_desc);
                  },
                  icon: Icon(Icons.date_range),
                  label: Text(expDate)),
              TextField(
                enabled: true,
                controller: get_title,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: labelJudul, //dibawa naik
                    hintText: "Input title here",
                    errorText: _errorText),
                    onChanged: (text) => setState(() => _text),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                enabled: true,
                controller: get_desc,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: labelKeterangan,
                    hintText: "Input Keterangan Here",
                    contentPadding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    errorText: _errorTextKeterangan),
                    onChanged: (text) => setState(() => _text2),
              ),
              Text("Expired Date : "),
              ElevatedButton(
                  onPressed: () {
                    // print("formatted date : " + formattedDate);
                    // if (formattedDate!=""){
                    //   setState(() {
                    //     stateOfDisable = false;
                    //   });
                    // }
                    // if (isiCek(get_title, get_desc, formattedDate)) {
                    //   print("Get Judul : " + get_title.text);
                    //   print("Get description : " + get_desc.text);
                    //   print("Get Exprire Date : " + formattedDate);
                    // } else {
                    //   print("Masukkan semua input terlebih dahulu");
                    // }
                    setState(() {
                      stateOfDisable = false;
                      labelKeterangan = "absdad";
                    });
                  },
                  child: Text("Input Letter"))
            ],
          ),
        ),
      ),
    ));
  }
}