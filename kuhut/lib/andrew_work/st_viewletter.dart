import 'package:flutter/material.dart';
import 'package:kuhut/imagePath.dart';

class ViewLetter extends StatefulWidget {
  const ViewLetter({ Key? key }) : super(key: key);

  @override
  State<ViewLetter> createState() => _ViewLetterState();
}

class _ViewLetterState extends State<ViewLetter> {
  var LetterPath = ImageLetterPath();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("View Letter"),
        ),
        body : Container(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                        children: [
                          Image.asset(
                  LetterPath.LetterImage01,
                  width: MediaQuery.of(context).size.width,
                  //height: 250,
                  fit: BoxFit.cover),
                
                Positioned(
                // The Positioned widget is used to position the text inside the Stack widget
                bottom: 460,
                right: 30,
                left: 30,
                top: 0,
              
                child: Container(
                  // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                  width: 300,
                  //color: Colors.black54,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'I Like Potatoes And Oranges',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ),
                Positioned(
                // The Positioned widget is used to position the text inside the Stack widget
                bottom: 130 ,
                right: 40,
                left: 35,
                top: 70,
              
                child: Container(
                  // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                  width: 200 ,
                  //color: Colors.black54,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Halo teman-teman apa kabarnya semuanya, semoga semuanya baik baik saja ya',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ),

              ],
              ),
              )
            ]
          ),
        )
      )
    );
  }
}