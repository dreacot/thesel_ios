import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theselios/helper/Colors.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the homepage',
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