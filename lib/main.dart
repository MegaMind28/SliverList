import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/team_member_pages.dart';

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
          primarySwatch: Colors.blue,
          canvasColor: Colors.white
      ),
      home: Search(),
    );
  }
}
