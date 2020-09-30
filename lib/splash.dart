
import 'package:flutter/cupertino.dart';

import 'testt.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:listview/pages/team_member_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(Splash());
class Splash extends StatefulWidget {
//
//  final QuerySnapshot qn;
//
//  const Splash({Key key,@required this.qn}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
String title;
String subtitle;

QuerySnapshot qn;

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      print(value.documents.length);

     setState(() {
       qn = value;
     });

      print(qn.documents[0].data["title"]);
    });
    super.initState();
  }

 Future<QuerySnapshot> getData()async{
    return await Firestore.instance.collection("posts").getDocuments();
  }

  @override
    Widget build(BuildContext context) {

      return SplashScreen.navigate(
        name: "assets/intro.flr",
        next: Test(qn:qn),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
      until: () => Future.delayed(Duration(seconds: 2)),
        backgroundColor: Colors.blue,
        startAnimation: "coding",
      );



  }
}


