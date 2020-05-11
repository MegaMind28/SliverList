import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    'What',
                    style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 50.0,
                        color: Color(0xFFFD6F4F)),
                  ),
                  Text(
                    'are you',
                    style: TextStyle(
                      fontFamily: 'Opensans',
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    'Doing!',
                    style: TextStyle(
                      fontFamily: 'Opensans',
                      fontSize: 50.0,
                    ),
                  ),
                  SizedBox(height: 20.0,)




                ],),
            ),),

        ],),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}