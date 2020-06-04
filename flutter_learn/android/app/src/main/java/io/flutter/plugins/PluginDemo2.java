package io.flutter.plugins;

import androidx.annotation.NonNull;
import io.flutter.Log;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.EventChannel;

/**
 * Created by Administrator on 2020/5/28 0028
 */
public class PluginDemo2 implements EventChannel.StreamHandler {
    public static EventChannel.EventSink eventSink;

    public static void register(@NonNull FlutterEngine flutterEngine){
        DartExecutor dartExecutor = flutterEngine.getDartExecutor();
        EventChannel eventChannel = new EventChannel(dartExecutor.getBinaryMessenger(), "pluginDemo2");
        eventChannel.setStreamHandler(new PluginDemo2());
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        Log.e("xiongkai", (events == null)+"");
        this.eventSink = events;
    }

    @Override
    public void onCancel(Object arguments) {

    }
}
