import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chat.dart';

class Chatpage extends StatefulWidget {
  Chatpage({Key key}) : super(key: key);

  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  Messages messages;
  List<Result> data = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/chat.json');
    print(response);

    messages = messagesFromJson(response);
    data = messages.result;
    setState(() {});
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Widget rightbubble(String msg) {
    return Wrap(
      alignment: WrapAlignment.end,
      children: [
        Card(
          color: Colors.lightGreen[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          margin: EdgeInsets.only(right: 20.0, top: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Container(
              child: Text(
                msg,
                style: TextStyle(
                  backgroundColor: Colors.lightGreen[100],
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget leftbubble(String msg) {
    return Wrap(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          margin: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: Container(
              child: Text(
                msg,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075e54),
        title: Text(
          'Chat',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.video_call), onPressed: () {}),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          IconButton(icon: Icon(Icons.phone), onPressed: () {}),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
        ],
      ),
      body: Container(
        child: data.length != 0
            ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Result result = data[index];
                  return Container(
                    child: result.isSent == 0
                        ? rightbubble(result.message)
                        : leftbubble(result.message),
                  );
                },
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
