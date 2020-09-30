import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:listview/splash.dart';
import 'pages/team_member_pages.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() => runApp(MyApp()
);

@override

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          canvasColor: Colors.white
      ),
      home: Splash(),
    );
  }
}
