import 'package:flutter/material.dart';
import "dart:async";

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadingPageState();
  }
}

class LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1000),
        (){
          Navigator.pushReplacementNamed(context, "app");
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset(
        "images/loading.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
