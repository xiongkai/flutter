import 'dart:async';

import 'package:flutter/services.dart';

class PluginDemo2{
  static const EventChannel _channel = EventChannel("pluginDemo2");

  static StreamSubscription addListener(void onData(event)){
    return _channel.receiveBroadcastStream().listen(onData);
  }

  static void removeListener(StreamSubscription subscription){
    subscription.cancel();
  }
}