import 'package:flutter/material.dart';
import 'package:wanandroid/routers/routes.dart';

class NotFoundPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Routes.pop(context);
            }
        ),
        title: Text("NotFound"),
      ),
      body: Container(
        child: Center(
          child: Text("404 Not Found!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red
            ),
          ),
        ),
      ),
    );
  }
}