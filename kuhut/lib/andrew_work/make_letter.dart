import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SendLetter extends StatefulWidget {
  const SendLetter({Key? key}) : super(key: key);

  @override
  State<SendLetter> createState() => _SendLetterState();
}

class _SendLetterState extends State<SendLetter> {
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";

  Future<void> _selectDate(BuildContext context, TextEditingController x,
      TextEditingController y) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        x.text = "okkke";
        print("Hari yang dipilih : " + formattedDate);
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

  @override
  Widget build(BuildContext context) {
    TextEditingController get_title = TextEditingController();
    TextEditingController get_desc = TextEditingController();
    TextEditingController get_date = TextEditingController();
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
                  label: Text("Expire Date : ")),
              TextField(
                controller: get_title,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Judul",
                    hintText: "Inputkan Judul"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: get_desc,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Keterangan",
                    hintText: "Inputkan Deskripsi",
                    contentPadding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
              ),
              Text("Expired Date : "),
              ElevatedButton(
                  onPressed: () {
                    if (isiCek(get_title, get_desc, formattedDate)) {
                      print("Get Judul : " + get_title.text);
                      print("Get description : " + get_desc.text);
                      print("Get Exprire Date : " + formattedDate);
                    } else {
                      print("Masukkan semua input terlebih dahulu");
                    }
                  },
                  child: Text("Input Letter"))
            ],
          ),
        ),
      ),
    ));
  }
}