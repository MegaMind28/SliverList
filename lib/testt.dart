
import 'package:flutter/material.dart';
import 'package:listview/myflexiableappbar.dart';
import 'package:listview/myappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:listview/splash.dart';

class Test extends StatefulWidget {
  final QuerySnapshot qn;

  const Test({Key key,@required this.qn}) : super(key: key);


  _TestState createState() => _TestState();
}

class _TestState extends State<Test>{

  String title;
  String subtitle;

//  QuerySnapshot qn;

//  @override
//  void initState() {
//    super.initState();
//    getData().then((value) {
//      print(value.documents.length);
//
//     setState(() {
//       qn = value;
//     });
//
//      print(qn.documents[0].data["title"]);
//    });
//    super.initState();
//  }
//
// Future<QuerySnapshot> getData()async{
//    return await Firestore.instance.collection("posts").getDocuments();
//  }


  @override
  Widget build(BuildContext context) {

    if (widget.qn == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount:widget.qn.documents.length,
              itemBuilder: (context,i) {

               return ListTile(
                    title: Text(widget.qn.documents[i].data['title']),
                  );
          }),
      ),
    );
  }
}
