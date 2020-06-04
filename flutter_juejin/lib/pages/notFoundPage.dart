import 'package:flutter/material.dart';

import '../routers/navigatoUtil.dart';

class NotFoundPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            NavigatorUtil.back(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text('404',
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("404 Not Found!",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}