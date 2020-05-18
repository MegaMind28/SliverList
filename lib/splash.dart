
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:listview/pages/team_member_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
/*
    Future data;
    Future getsData()async{
      var firestore =Firestore.instance;
      QuerySnapshot qp=await firestore.collection("posts").getDocuments();
*/

  return  SplashScreen.navigate(
      name: "assets/intro.flr",
      next: Search(),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      until: () => Future.delayed(Duration(seconds: 5)),
      backgroundColor: Colors.white,
      startAnimation: "coding",
    );

  }
}