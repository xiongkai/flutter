import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/App.dart';
import 'package:wanandroid/pages/NotFoundPage.dart';
import 'package:wanandroid/pages/WebViewPage.dart';
import 'package:wanandroid/routers/NavigatorUtil.dart';

class Routes{
  static final Router _router = Router();
  static const String home = "/";
  static const String webview = "/webview";

  static void pop(BuildContext context){
    _router.pop(context);
  }

  static Router init(){
    _router.notFoundHandler = Handler(handlerFunc: _handleNotFound);
    _router.define(home, handler: Handler(handlerFunc: _handleApplicationPage));
    _router.define(webview, handler: Handler(handlerFunc: _handleWebViewPage));
    NavigatorUtil.router = _router;
    return _router;
  }

  static Widget _handleNotFound(BuildContext context, Map<String, List<String>> parameters){
    return NotFoundPage();
  }

  static Widget _handleApplicationPage(BuildContext context, Map<String, List<String>> parameters){
    return ApplicationPage();
  }

  static Widget _handleWebViewPage(BuildContext context, Map<String, List<String>> parameters){
    String title = parameters["title"]?.first;
    String url = parameters["url"]?.first;
    return WebViewPage(title, url);
  }
}