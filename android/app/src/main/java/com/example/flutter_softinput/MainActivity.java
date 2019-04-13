package com.example.flutter_softinput;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.view.MotionEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.Toast;


import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        KeyboardUtils.app = this;
       // Utils.init(this);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), "softInput").setMethodCallHandler(
                (methodCall, result) -> {
                    String method = methodCall.method;
                    switch (method) {
                        case "show":
                            KeyboardUtils.showSoftInput(this);
                            break;
                        case "cancel":
                            KeyboardUtils.hideSoftInput(this);
                            break;
                        case "toast":
                            Toast.makeText(this, methodCall.argument("massage"), Toast.LENGTH_SHORT).show();
                            break;
                    }
                }
        );
    }
}
