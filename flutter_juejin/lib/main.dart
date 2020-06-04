import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routers/application.dart';
import 'routers/routes.dart';

void main() {
  var router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColorDark: const Color(0xFF0000FF),
      primaryColor: const Color.fromRGBO(77, 145, 253, 1.0),
      accentColor: const Color(0xFFB2BAC2),
    ),
    onGenerateRoute: Application.router.generator,
  ));
}