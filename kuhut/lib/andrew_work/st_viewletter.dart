import 'package:flutter/material.dart';
import 'package:kuhut/imagePath.dart';

class ViewLetter extends StatefulWidget {
  final String title;
  final String message;
  final String letterOption;
  const ViewLetter(
      {Key? key,
      required this.title,
      required this.message,
      required this.letterOption})
      : super(key: key);

  @override
  State<ViewLetter> createState() => _ViewLetterState();
}

class _ViewLetterState extends State<ViewLetter> {
  var LetterPath = ImageLetterPath();
  final now = DateTime.now();
  late List<Widget> imageWidgetList;
  @override
  Widget build(BuildContext context) {
    var getLetterPath = "images/iconLetter/" + widget.letterOption + ".png";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("View Letter"),
        ),
        body: Container(
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    imageLetter(getLetterPath, widget.title, widget.message),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget imageLetter(String imgPath, String title, String message) {
    return Stack(
      children: [
        Image.asset(imgPath,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover),
        Positioned(
          // The Positioned widget is used to position the text inside the Stack widget
          bottom: 460,
          right: 30,
          left: 30,
          top: 30,

          child: Container(
            // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
            width: 300,
            //color: Colors.black54,
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          // The Positioned widget is used to position the text inside the Stack widget
          bottom: 130,
          right: 40,
          left: 35,
          top: 120,

          child: Container(
            // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
            width: 200,
            //color: Colors.black54,
            padding: const EdgeInsets.all(10),
            child: Text(
              message,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
