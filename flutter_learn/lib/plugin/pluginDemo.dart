import 'dart:async';

import 'package:flutter/services.dart';

class PluginDemo{
  static const MethodChannel _channel = MethodChannel("pluginDemo");

  static Future<String> get platformVersion async{
    final String version = await _channel.invokeMethod("getPlatformVersion");
    return version;
  }

  static void addListener(Future<dynamic> handler(MethodCall call)){
    _channel.setMethodCallHandler(handler);
  }
}