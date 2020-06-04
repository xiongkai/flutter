package com.example.learn;

import android.os.Bundle;

import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.PluginDemo;
import io.flutter.plugins.PluginDemo2;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FlutterEngine flutterEngine = getFlutterEngine();
        if (flutterEngine != null) {
            PluginDemo.register(flutterEngine);
            PluginDemo2.register(flutterEngine);
        }
    }
}
