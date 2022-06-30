import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/main.dart';
import 'package:kuhut/pages/viewcontact.dart';

class AddContact extends StatefulWidget {
  final String siswaNameResetProfile2;
  const AddContact({Key? key, required this.siswaNameResetProfile2})
      : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

TextEditingController get_namas = TextEditingController();
TextEditingController get_telps = TextEditingController();
DateTime selectedDate = DateTime(1500);
String formattedDate = "";
String expDate = "Date";
var stateOfDisable = true;
String labelJudul = "Judul (Disabled, set date first)";
String labelKeterangan = "Keterangan (Disabled, set date first)";

class _AddContactState extends State<AddContact> {
  void createToast(String message, Color warna, int time) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: warna,
        fontSize: 16.0);
  }

  Future<void> _selectDate(BuildContext context) async {
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
        labelJudul = "Judul";
      });
    }
  }

  void gantiPassword() {
    if (get_namas.text.toString() == "") {
      if (get_telps.text.toString() == "") {
        if (formattedDate.toString() == "") {
          //
        } else {
          //day
          final dtbaru = editprofileday(
              abirthday: formattedDate.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfileday(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        }
      } else {
        if (formattedDate.toString() == "") {
          //telp
          final dtbaru = editprofiletelp(
              atelp: get_telps.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfiletelp(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        } else {
          //telp day
          final dtbaru = editprofileday(
              abirthday: formattedDate.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfileday(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);

          final dtbaru2 = editprofiletelp(
              atelp: get_telps.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfiletelp(item: dtbaru2);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        }
      }
    } else {
      if (get_telps.text.toString() == "") {
        if (formattedDate.toString() == "") {
          //nama
          final dtbaru = editprofilenama(
              anama: get_namas.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfilenama(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        } else {
          //nama day
          final dtbaru = editprofilenama(
              anama: get_namas.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfilenama(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);

          final dtbaru2 = editprofileday(
              abirthday: formattedDate.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfileday(item: dtbaru2);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        }
      } else {
        if (formattedDate.toString() == "") {
          //nama telp
          final dtbaru = editprofilenama(
              anama: get_namas.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfilenama(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);

          final dtbaru2 = editprofiletelp(
              atelp: get_telps.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfiletelp(item: dtbaru2);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        } else {
          //nama telp day
          final dtbaru = editprofilenama(
              anama: get_namas.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfilenama(item: dtbaru);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);

          final dtbaru2 = editprofiletelp(
              atelp: get_telps.text.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfiletelp(item: dtbaru2);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);

          final dtbaru3 = editprofileday(
              abirthday: formattedDate.toString(),
              aemail: get_user.text.toString());
          DatabaseUser.ubahDataProfileday(item: dtbaru3);
          dismiss();
          createToast("Data berhasil dirubah", Colors.green, 2);
        }
      }
    }
    //   final dtbaru = editprofile(anama: namaf, abirthday: "12/01/2005", atelp: telpf, aemail: get_user.text.toString());
    //   DatabaseUser.ubahDataProfile(item: dtbaru);
    //   dismiss();
    //   createToast("Data berhasil dirubah", Colors.green, 2);
  }

  void dismiss() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void continueDialog(String text, String content) {
    Widget cancelButton = TextButton(
      child: const Text("Batal"),
      onPressed: () {
        dismiss();
      },
    );
    Widget confirmButton = TextButton(
      child: const Text("Ubah"),
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
          title: const Text("add contact "),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("EDIT PROFILE",
              style: TextStyle(fontSize: 30),),
              SizedBox(height: 40),
              ElevatedButton.icon(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(Icons.date_range),
                  label: Text(expDate)),
                  SizedBox(height: 20),
              TextField(
                showCursor: true,
                controller: get_namas,
                decoration: const InputDecoration(
                  icon: Icon(
                        Icons.account_circle,
                        size: 35,
                      ),
                  border: OutlineInputBorder(),
                  hintText: "Edit Name",
                  labelText: "Name",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                showCursor: true,
                controller: get_telps,
                decoration: const InputDecoration(
                  icon: Icon(
                        Icons.contact_page_rounded,
                        size: 35,
                      ),
                  border: const OutlineInputBorder(),
                  hintText: "Edit Number",
                  labelText: "Contact",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    continueDialog("Change Password",
                        "Apakah anda yakin ingin mengganti password anda?");
                  },
                  child: const Text("EDIT")),
            ],
          ),
        ),
      ),
    );
  }
}
