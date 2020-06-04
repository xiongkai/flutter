import 'package:flutter/material.dart';
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";
import 'app.dart';
import "loading.dart";
import "common/search.dart";

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WeChat",
      theme: defaultTheme,
      routes: routes,
      home: LoadingPage(),
    ));

final ThemeData defaultTheme = ThemeData(
    primaryColor: Color(0xff303030),
    scaffoldBackgroundColor: Color(0xffebebeb),
    cardColor: Color(0xff393a3f));

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "app": (BuildContext context) => MyAppPage(),
  "friends": (BuildContext context) {
    return WebviewScaffold(
      url: "http://weixin.qq.com",
      withZoom: true,
      withLocalStorage: true,
      appBar: AppBar(
        title: Text("微信朋友圈"),
      ),
    );
  },
  "search": (BuildContext context) => SearchPage(),
};
