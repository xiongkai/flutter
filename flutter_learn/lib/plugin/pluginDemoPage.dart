import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/plugin/pluginDemo.dart';
import 'package:learn/plugin/pluginDemo2.dart';
import 'package:learn/routes/routes.dart';

class PluginDemoPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _PluginDemoState();
}

class _PluginDemoState extends State<PluginDemoPage>{
  String platformVersion = "";
  String platformVersion2 = "";
  String platformVersion3 = "";
  StreamSubscription subscription;

  Future<void> getPlatformVersion() async {
    platformVersion = await PluginDemo.platformVersion;
    setState((){});
  }

  @override
  void initState() {
    super.initState();
    subscription = PluginDemo2.addListener((event) {
      debugPrint(event);
      platformVersion2 = event;
      setState(() {});
    });
    PluginDemo.addListener((MethodCall call) async {
      if(call.method == "getPlatformVersion"){
        platformVersion3 = call.arguments as String;
        setState(() {});
      }
      return "finish";
    });
  }

  @override
  void dispose() {
    super.dispose();
    PluginDemo2.removeListener(subscription);
    PluginDemo.addListener(null);
  }

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
          title: Text("原生通信")
      ),
      body: Column(
        children: <Widget>[
          Text("通过MathodChannel由Flutter访问原生：$platformVersion",
            style: TextStyle(
                fontSize: 30
            ),
          ),
          Divider(
            height: 20,
          ),
          Text("通过MathodChannel由原生访问Flutter：$platformVersion3",
            style: TextStyle(
                fontSize: 30
            ),
          ),
          Divider(
            height: 20,
          ),
          Text("通过EventChannel由原生访问Flutter：$platformVersion2",
            style: TextStyle(
                fontSize: 30
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getPlatformVersion();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}