import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final platform = const MethodChannel("softInput");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("软键盘"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(),
            RaisedButton(
              child: Text("Toast"),
              onPressed: () => {platform.invokeMethod("toast",{
                "massage":"哈哈哈哈哈是"
              })},
            ),
            RaisedButton(
              child: Text("show"),
              onPressed: () => {platform.invokeMethod("show")},
            ),
            RaisedButton(
              child: Text("cancel"),
              onPressed: () => {platform.invokeMethod("cancel")},
            ),
          ],
        ),
      ),
    );
  }
}
