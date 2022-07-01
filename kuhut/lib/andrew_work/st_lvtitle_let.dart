import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuhut/andrew_work/st_viewletter.dart';
import 'package:kuhut/database_services/db_crud.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LetterListView extends StatefulWidget {
  final String getSiswaKelas;
  const LetterListView({Key? key, required this.getSiswaKelas}) : super(key: key);

  @override
  State<LetterListView> createState() => _LetterListViewState();
}

class _LetterListViewState extends State<LetterListView> {

  bool isExpired(DateTime now, DateTime expired){
    if(DateTime.now().isAfter(expired)){
      return true;
    }
    return false;
  }
  void deleteExpired(String id_firestore){
    FirebaseFirestore.instance.collection('Letter').doc(id_firestore).delete();
  }

  void dismiss(){
     Navigator.of(context, rootNavigator: true).pop();
  }
  showAlertDialog(BuildContext context, String option, String delete_id) {

  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
       dismiss();
    },
  );
  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed:  () {
      deleteExpired(delete_id);
      dismiss();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Delete data"),
    content: Text("Are you sure want to delete the expired data?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  AlertDialog alert_ok = AlertDialog(
    title: Text("Cannot"),
    content: Text("Cannot delete if the letter isn't expired!"),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (option =="two_opt"){
        return alert;
      }
      else{
        return alert_ok;
      }
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Letter View")),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Text("Kelas " + widget.getSiswaKelas),
              SizedBox(height: 20,),
              Letter(widget.getSiswaKelas),
             SizedBox(height: 20,),
              Text("All Letter"),
               SizedBox(height: 20,),
              Letter("All")
            ],
          ),
        ),
      ),
    );
  }

  Widget Letter(String kelas) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: DatabaseLetter.getAllLetter(kelas),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return Card(
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.deepOrangeAccent), borderRadius: BorderRadius.circular(20)),
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    DocumentSnapshot dsData = snapshot.data!.docs[index];
                    String lvJudul = dsData['judul'];
                    String lvDesc = dsData['deskripsi'];
                    String expireDate = dsData['expiredDateForamtted'];
                    Color listTileWarna = Colors.white;
                    print(DateTime.now());
                    // if (DateTime.now().isAfter(DateTime.parse(expireDate))){
                    //   listTileWarna = Colors.grey;
                    //   lvJudul += "(expired)";
                    // }
                    bool is_not_valid= isExpired(DateTime.now(), DateTime.parse(expireDate));
                    if (is_not_valid){
                       listTileWarna = Colors.grey;
                       lvJudul += "(expired)";
                    }
                    return ListTile(
                      tileColor: listTileWarna,
                      leading: Icon(Icons.mail_sharp),
                      onTap: () {
                        
                      },
                      onLongPress: () {
                        
                      },
                      title: Text(lvJudul),
                      subtitle: Text("Click details to see letter"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewLetter(title: dsData['judul'], message: dsData['deskripsi'], letterOption: dsData['templateImage'], )));
                              },
                              icon: Icon(Icons.remove_red_eye)),
                                IconButton(
                              onPressed: () {
                                if (is_not_valid){
                                  print("Bisa di delete");
                                  showAlertDialog(context, "two_opt", dsData.id);
                                }
                                else{
                                  showAlertDialog(context, "else", "null");
                                }
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                  itemCount: snapshot.data!.docs.length),
            );
          }
          return LoadingIndicator(
            indicatorType: Indicator.pacman, /// Required, The loading type of the widget
            colors: const [Colors.white],       /// Optional, The color collections
            strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.black,      /// Optional, Background of the widget
            pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
          );
        },
      ),
    );
  }
}
