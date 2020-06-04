import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:learn/routes/routes.dart';

void main() {
  var router = Routes.init();
  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final Router _router;

  MyApp(this._router, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _router.generator,
    );
  }
}
