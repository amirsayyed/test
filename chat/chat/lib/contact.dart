import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075e54),
          title: Text(
            'Select contact',
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
        ),
      ),
    );
  }
}
