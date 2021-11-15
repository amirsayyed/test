import 'package:chat/chatpage.dart';
import 'package:chat/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'contact.dart';
import 'home.dart';
import 'chatpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (uri, param) => MaterialPage(child: Home()),
          "/contact": (uri, param) => MaterialPage(child: Contact()),
          "/chatpage": (uri, param) => MaterialPage(child: Chatpage()),
          //"/sharedpref": (uri, param) => MaterialPage(child: SharedPref()),
        },
      ),
    );
  }
}
