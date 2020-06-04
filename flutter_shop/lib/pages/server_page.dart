import 'package:flutter/material.dart';
import '../server/server.dart';

class ServerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    startServer();
    return Scaffold(
      appBar: AppBar(
        title: Text("启动Server用的"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.0, color: Colors.redAccent),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              onPressed: () {
                Navigator.pushNamed(context, "app");
              },
              child: Text("启动"))
        ],
      ),
    );
  }
}
