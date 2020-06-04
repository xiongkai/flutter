import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset("images/company.jpg"),
          FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.pushNamed(context, "company_info");
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("公司介绍"),
              )),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.pushNamed(context, "company_info");
              },
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("公司优势"),
              )),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.pushNamed(context, "company_info");
              },
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("联系我们"),
              )),
        ],
      ),
    );
  }
}
