
import 'package:flutter/material.dart';
import 'package:listview/myflexiableappbar.dart';
import 'package:listview/myappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());
var number;
var mypost;
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
    QuerySnapshot qn=await firestore.collection("posts").getDocuments();
    return qn.documents;
  }
  navigateToDetail (DocumentSnapshot post){
    /* Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseInfoScreen=(post: post,)));*/
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
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
                      onTap: (){
                        print('${snapshot.data[index].data["image"]}');
                        navigateToDetail(snapshot.data[index]);
                      },
                      child: Center(
                      /*  child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          *//*image: '${snapshot.data[index].data["image"]}',*//*
                          height: 250.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),*/
                        child: Hero(tag: snapshot.data[index],
                          child: Image.network(snapshot.data[index].data["image:"]),
                        ),
                      ),
                    );

                  },
                    childCount:snapshot.data.length
                    /* childCount: 3*/
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
    return Container(
      child: Column(
        children: <Widget>[
         Hero(
           transitionOnUserGestures: true,
           tag: widget.post,child: Transform.scale(scale: 2.0,child: Image.network(widget.post.data["image"]),),
         ),
          Text(widget.post.data["title"]),
          Text(widget.post.data["subtitle"])
        ],
      ),
    );
  }
}