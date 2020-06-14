import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/routers/Routes.dart';

class NavigatorUtil{
  static Router router;

  static void back(BuildContext context){
    router.pop(context);
  }

  static void goHomePage(BuildContext context, {bool replace = false, bool clearStack = false}) {
    router.navigateTo(context, Routes.home, replace: replace, clearStack: clearStack);
  }

  static void getWebViewPage(BuildContext context, String title, String url, {bool replace = false, bool clearStack = false}){
    String routerPath = '${Routes.webview}?title=${Uri.encodeComponent(title)}&&url=${Uri.encodeComponent(url)}';
    router.navigateTo(context, routerPath, replace: replace, clearStack: clearStack);
  }
}