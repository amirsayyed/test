import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tab = [
    Center(
      child: IconButton(
          icon: Icon(
            Icons.camera_alt,
          ),
          onPressed: () {}),
    ),
    Center(
      child: Text(
        'CHATS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        'STATUS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ),
    Center(
      child: Text(
        'CALLS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075e54),
          title: Text(
            'WhatsApp',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white),
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            Padding(
              padding: EdgeInsets.all(5.0),
            )
          ],
          bottom: TabBar(indicatorColor: Colors.white, tabs: tab),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            VxNavigator.of(context).push(
              Uri(path: '/chatpage'),
            );
          },
          child: Icon(Icons.message),
          backgroundColor: Colors.greenAccent[400],
        ),
      ),
    );
  }
}
