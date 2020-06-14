import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/routers/Routes.dart';


void main() {
  var router = Routes.init();
  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final Router router;

  MyApp(this.router, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generator,
    );
  }
}
