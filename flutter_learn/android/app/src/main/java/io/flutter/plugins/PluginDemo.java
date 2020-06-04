package io.flutter.plugins;

import android.os.AsyncTask;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.Log;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class PluginDemo implements MethodChannel.MethodCallHandler {
    private static MethodChannel channel;

    public static void register(@NonNull FlutterEngine flutterEngine){
        DartExecutor dartExecutor = flutterEngine.getDartExecutor();
        channel = new MethodChannel(dartExecutor.getBinaryMessenger(), "pluginDemo");
        channel.setMethodCallHandler(new PluginDemo());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.equals("getPlatformVersion")){
            result.success("Android "+Build.VERSION.RELEASE);
            PluginDemo2.eventSink.success("Android "+Build.VERSION.RELEASE);
            channel.invokeMethod("getPlatformVersion", "Android " + Build.VERSION.RELEASE, new MethodChannel.Result() {
                @Override
                public void success(@Nullable Object result) {
                    Log.e("xiongkai", result.toString());
                }

                @Override
                public void error(String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {

                }

                @Override
                public void notImplemented() {

                }
            });
        }else {
            result.notImplemented();
        }
    }
}