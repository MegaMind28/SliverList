import 'package:flutter/material.dart';
import 'package:listview/myflexiableappbar.dart';
import 'package:listview/myappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:listview/splash.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Search(),
      theme: ThemeData(
        accentColor: Colors.cyan[600],
      ),
    );
  }
}


class Search extends StatefulWidget {
  Search({Key key, this.title}) : super(key: key);
  final String title;


  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Future _data;
  Future getsData()async{
    var firestore =Firestore.instance;
    QuerySnapshot qp=await firestore.collection("posts").getDocuments();

   return qp.documents;
  }
  navigateToDetail (DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)),);
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      _data=getsData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:FutureBuilder(
          future: _data,
          builder: (_,snapshot){
            return  CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                    title: MyAppBar(),
                    backgroundColor: Colors.white,
                    pinned: true,
                    expandedHeight: 280.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: MyFlexiableAppBar(),
                    )
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate ((context,index){
                    return InkWell(
                      onTap: (){                                    //===============================================================================
                        navigateToDetail(snapshot.data[index]);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Column (children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 195.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                        child: Stack(
                                          children: <Widget>[
                                            Center(child: CircularProgressIndicator()),
                                            Center(
                                              child: Hero(
                                                tag: snapshot.data[index],
                                                child: FadeInImage.memoryNetwork(
                                                  placeholder: kTransparentImage,
                                                  image: snapshot.data[index].data["image"],
                                                  width: MediaQuery.of(context).size.width,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0,bottom: 15.0),
                                    child: Column
                                      ( crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                      SizedBox(height: 10),
                                      Text(snapshot.data[index].data["title"],textAlign: TextAlign.justify,maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          letterSpacing: 0.27,
                                          // color: DesignCourseAppTheme.darkerText,
                                        ),overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 10.0),
                                      Text (snapshot.data[index].data["subtitle"],
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          /*fontFamily: ,*/
                                          fontWeight: FontWeight.w200,
                                          fontSize: 14,
                                          letterSpacing: 0.27,
                                          // color: DesignCourseAppTheme.darkerText,
                                        ),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],),
                                  ),
                                ],),
                              ),
                            ),
                          )
                        ],
                      ),


                    );

                  },
                      childCount:snapshot.data.length
                  ),

                )
              ],
            );
          },
        )

    );
  }
}

class DetailPage extends StatefulWidget {

  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
   // print(widget.post.data["id"]);
    Firestore.instance.collection("posts").getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        Firestore.instance
            .collection("posts")
            .document(widget.post.data["id"])
            .collection("exampleSubcollection")
            .getDocuments()
            .then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            print(result.data);
          });
        });
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.post.data["title"]),
        ),
        body: Center(
          child: Hero(transitionOnUserGestures: true,
            tag: widget.post,child: Transform.scale(scale: 1.5,child: Image.network(widget.post.data["image"]),),
          ),
        ));
  }
}

