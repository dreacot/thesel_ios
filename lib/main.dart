import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theselios/helper/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomAppbarExample(title: 'Thesel'),
    );
  }
}

class BottomAppbarExample extends StatefulWidget {
  const BottomAppbarExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomAppbarExampleState createState() => _BottomAppbarExampleState();
}

class _BottomAppbarExampleState extends State<BottomAppbarExample> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  bool _isBottomBarNotched = true;
  TextEditingController nameController = TextEditingController();
  String fullName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset('assets/images/thesel.png', height: 10,
          width: 10),
        title: Text(widget.title, style: TextStyle(
            color: PrimaryColor
        ),),
      ),
      body: Container(
        color: PostColor,
        height:480,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white, height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                        CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                        CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                        CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                      ]
                  ),
                  Divider(color: PrimaryColor,),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                      ),
                      SizedBox(
                          width: 275,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(width: 2,color: Colors.orangeAccent),
                              ),
                              labelText: "What's on your mind?",
                            ),
                            onChanged: (text) {
                              setState(() {
                                fullName = text;
                                //you can access nameController in its scope to get
                                // the value of text entered as shown below
                                //fullName = nameController.text;
                              });
                            },
                          )
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    onPressed: () {
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Anonymousyl7n", style: TextStyle(fontSize: 22, color: Colors.yellow))
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                  children: <Widget> [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 35,
                          child: CircleAvatar(backgroundImage: AssetImage('assets/images/thesel.png')),
                        ),
                        Container()
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Confused", style: TextStyle(fontSize: 18, color: Colors.white, backgroundColor: Colors.black),),
                          Container(
                            child: Row(
                              children: <Widget>[
                              Text("07/08/2020", style: TextStyle(fontSize: 18, color: Colors.white)),
                              Text("  "),
                              Text("01:32 am", style: TextStyle(fontSize: 18, color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                  children: <Widget> [
                    Text("I've been postponing my business thinking that everything else is more important but I haven't done anything that I postponed it for. I'm trying to balance it but it just leads to more confusion", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        Text("2 ", style: TextStyle(fontSize: 18, color: Colors.white)),
                        Icon(Icons.favorite, color: Colors.white, size: 30,),
                        Text("    "),
                        Text("7 ", style: TextStyle(fontSize: 18, color: Colors.white)),
                        Icon(Icons.comment, color: Colors.white, size: 30,),
                      ]
                  ),
                  Divider(color: PrimaryColor,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                  children: <Widget> [
                    Text("Business", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ]
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.people),
        onPressed: () =>
          Fluttertoast.showToast(msg: 'FAB Clicked',
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: PrimaryColor),
      ),
      floatingActionButtonLocation: this._fabLocation,
      bottomNavigationBar: this._buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: this._isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          // Bottom that pops up from the bottom of the screen.
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("Post")),
                PopupMenuItem(child: Text("Video Library")),
                PopupMenuItem(child: Text("Settings")),
              ];
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () =>
              Fluttertoast.showToast(msg: 'Notification button clicked',
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: PrimaryColor),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () =>
              Fluttertoast.showToast(msg: 'options button clicked',
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: PrimaryColor),
          ),
        ],
      ),
    );
  }
}