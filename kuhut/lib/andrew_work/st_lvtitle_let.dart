import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuhut/database_services/db_crud.dart';

class LetterListView extends StatefulWidget {
  final String getSiswaKelas;
  const LetterListView({Key? key, required this.getSiswaKelas}) : super(key: key);

  @override
  State<LetterListView> createState() => _LetterListViewState();
}

class _LetterListViewState extends State<LetterListView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Letter View")),
        body: Column(
          children: [
            Text("Kelas " + widget.getSiswaKelas),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseLetter.getAllLetter(widget.getSiswaKelas),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                        itemBuilder: ((context, index) {
                          DocumentSnapshot dsData = snapshot.data!.docs[index];
                          String lvJudul = dsData['judul'];
                          String lvDesc = dsData['deskripsi'];
                          return ListTile(
                            onTap: () {
                              //edit
                            },
                            onLongPress: () {
                              //delete
                            },
                            title: Text(lvJudul),
                            subtitle: Text(lvDesc),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(
                                          msg: "This is Center Short Toast",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                    icon: Icon(Icons.remove_red_eye))
                              ],
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8.0,
                            ),
                        itemCount: snapshot.data!.docs.length);
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
            ),
            Text("All Letter"),
            Letter("All")
          ],
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
            return ListView.separated(
                itemBuilder: ((context, index) {
                  DocumentSnapshot dsData = snapshot.data!.docs[index];
                  String lvJudul = dsData['judul'];
                  String lvDesc = dsData['deskripsi'];
                  return ListTile(
                    onTap: () {
                      //edit
                    },
                    onLongPress: () {
                      //delete
                    },
                    title: Text(lvJudul),
                    subtitle: Text(lvDesc),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: "This is Center Short Toast",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            icon: Icon(Icons.remove_red_eye))
                      ],
                    ),
                  );
                }),
                separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                itemCount: snapshot.data!.docs.length);
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.pinkAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
