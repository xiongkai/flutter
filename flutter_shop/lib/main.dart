import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'app.dart';
import 'pages/server_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      routes: <String, WidgetBuilder>{
        "app": (context) => App(),
        "server": (context) => ServerPage(),
        "company_info": (context) => WebviewScaffold(
              url: "https://www.baidu.com",
              withLocalStorage: true,
              withZoom: true,
              appBar: AppBar(
                title: Text("公司介绍"),
                leading: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
            ),
      },
      home: ServerPage(),
    );
  }
}
