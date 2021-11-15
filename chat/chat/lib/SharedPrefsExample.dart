import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsExample extends StatefulWidget {
  @override
  _SharedPrefsExampleState createState() => _SharedPrefsExampleState();
}

class _SharedPrefsExampleState extends State<SharedPrefsExample> {
  SharedPreferences preferences;
  var flag = 0;

  sharedprefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  getname() async {
    final data = preferences.getString("data");
    print(data);
  }

  @override
  void initState() {
    sharedprefs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text("Click to fetch"),
                onPressed: () {
                  getname();
                },
              ),
              TextButton(
                child: Text("Click to change"),
                onPressed: () async {
                  flag == 0
                      ? await preferences.setString("data", "Pranav")
                      : await preferences.setString("data", "Amir");
                  flag = 1;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
