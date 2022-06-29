import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuhut/database_services/dataClass.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:kuhut/imagePath.dart';
import 'package:kuhut/main.dart';
import 'package:photo_view/photo_view.dart';

class SendLetter extends StatefulWidget {
  const SendLetter({Key? key}) : super(key: key);

  @override
  State<SendLetter> createState() => _SendLetterState();
}

class _SendLetterState extends State<SendLetter> {
  var t_path = teacherImagePath();
  var letter_path = ImageLetterPath();
  var stateOfDisable = true;
  String labelJudul = "Judul (Disabled, set date first)";
  String labelKeterangan = "Keterangan (Disabled, set date first)";
  TextEditingController get_title = TextEditingController();
  TextEditingController get_desc = TextEditingController();
  TextEditingController get_date = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";

  var ChoosenImage = ""; //image yang akan dipilih
  //setting warna button
  Color redColor = Colors.red;Color redColor2 = Colors.red;Color redColor3 = Colors.red;Color redColor4 = Colors.red;Color redColor5 = Colors.red;Color redColor6 = Colors.red;

  void changePicked(Color warna){
      warna = Colors.green;
  }
  
  void ContinueDialog(String tipe){
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: (){
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    var random = new Random().nextInt(2);
    print("Random Value : " + random.toString());
  }

  showAlertDialog(BuildContext context, String title, String message) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
         Navigator.of(context, rootNavigator: true).pop();
       },
    );

    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showImageDialog (BuildContext context, String pathImage, String title, String message){
    Widget get_img = Image.asset(pathImage, width: 500, height: 300,);
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
         Navigator.of(context, rootNavigator: true).pop();
       },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        get_img,
        okButton
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alert;
    });
  }
  

  String expDate = "set expired date";
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
        labelJudul = "Judul";
        labelKeterangan = "Keterangan";
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
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children : [
                    Column(
                      children: [
                        GestureDetector(child: Image.asset(letter_path.LetterImage01, width: 50, height: 100,), onTap: (){
                          showImageDialog(context, letter_path.LetterImage01, "Preview Template 1", "Zoomed Image");
                        },), 
                        ElevatedButton(onPressed: (){
                         setState(() {//gak bisa di parsing function
                           redColor = Colors.green;

                           redColor2 = Colors.red;
                           redColor3 = Colors.red;
                           redColor4 = Colors.red;
                           redColor5 = Colors.red;
                           redColor6 = Colors.red;
                             ChoosenImage = "1";
                         });
                           
                        }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor)))
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(child: Image.asset(letter_path.LetterImage02, width: 50, height: 100,), onTap: (){
                          showImageDialog(context, letter_path.LetterImage02, "Preview Template 2", "Zoomed Image");
                        },),
                        ElevatedButton(onPressed: (){
                           setState(() {//gak bisa di parsing function
                           redColor2 = Colors.green;

                           redColor = Colors.red;
                           redColor3 = Colors.red;
                           redColor4 = Colors.red;
                           redColor5 = Colors.red;
                           redColor6 = Colors.red;
                             ChoosenImage = "2";
                         });
                        }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor2)))
                      ],
                    )
                      
                  ]
                ),
              ),
                Container(
                   decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children : [
                    Column(
                      children: [
                        GestureDetector(child: Image.asset(letter_path.LetterImage03, width: 50, height: 100,), onTap: (){
                          showImageDialog(context,letter_path.LetterImage03, "Preview Template 3", "Zoomed Image");
                        },),
                        ElevatedButton(onPressed: (){
                           setState(() {//gak bisa di parsing function
                           redColor3 = Colors.green;

                           redColor = Colors.red;
                           redColor2 = Colors.red;
                           redColor4 = Colors.red;
                           redColor5 = Colors.red;
                           redColor6 = Colors.red;

                          ChoosenImage = "3";
                         });
                        }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor3)))
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(child: Image.asset(letter_path.LetterImage04, width: 50, height: 100,), onTap: (){
                          showImageDialog(context, letter_path.LetterImage04, "Preview Template 4", "Zoomed Image");
                        },),
                        ElevatedButton(onPressed: (){
                           setState(() {//gak bisa di parsing function
                           redColor4 = Colors.green;

                           redColor = Colors.red;
                           redColor2 = Colors.red;
                           redColor3 = Colors.red;
                           redColor5 = Colors.red;
                           redColor6 = Colors.red;
                             ChoosenImage = "4";
                         });
                        }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor4)))
                      ],
                    )
                  ]
                  ),
                ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children : [
                    Column(
                      children: [
                       GestureDetector(child: Image.asset(letter_path.LetterImage05, width: 50, height: 100,), onTap: (){
                          //showImageDialog(context, letter_path.LetterImage05, "Preview Template 5", "Zoomed Image");
                            Expanded(child: showImageDialog(context, letter_path.LetterImage05, "Preview Template 5", "Zoomed Image"));
                        },),
                        ElevatedButton(onPressed: (){
                          changePicked(redColor5);
                           setState(() {//gak bisa di parsing function
                           redColor5 = Colors.green;

                           redColor = Colors.red;
                           redColor2 = Colors.red;
                           redColor3 = Colors.red;
                           redColor4 = Colors.red;
                           redColor6 = Colors.red;
                              ChoosenImage = "5";
                         });
                        }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor5)))
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(child: Image.asset(t_path.attendance, width: 50, height: 100,), onTap: (){
                          Expanded(child: showImageDialog(context, t_path.attendance, "Preview Template 6", "Zoomed Image"));
                          
                        },),
                       ElevatedButton(onPressed: (){
                         setState(() {//gak bisa di parsing function
                           redColor6 = Colors.green;

                           redColor  = Colors.red;
                           redColor2 = Colors.red;
                           redColor3 = Colors.red;
                           redColor4 = Colors.red;
                           redColor5 = Colors.red;

                           ChoosenImage = "6";
                         });
                       }, child: Text("Pick"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor6)))
                      ],
                    )
                      
                  ]
                ),
              ),
              
              ElevatedButton(
                  onPressed: () {
                    if (isiCek(get_title, get_desc, formattedDate) && ChoosenImage!="") {
                      print("Get Judul : " + get_title.text);
                      print("Get description : " + get_desc.text);
                      print("Get Exprire Date : " + formattedDate);
                      print("Choosen Image : " + ChoosenImage);

                      LetterGuru choosenLetter = LetterGuru(judul: get_title.text, deskripsi: get_desc.text, expireDate: formattedDate, templateImage: ChoosenImage);
                      DatabaseLetter.addLetter(letterGuru: choosenLetter);
                    } else {
                      showAlertDialog(context, "Fill all field", "Please fill out all the field here");
                    }
                    setState(() {
                      stateOfDisable = false;
                      labelKeterangan = "absdad";
                    });
                  },
                  child: Text("Input Letter")),
            ],
          ),
        ),
      ),
    ));
  }
}