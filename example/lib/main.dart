import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_griffon/flutter_griffon.dart';
import 'package:flutter_acpcore/flutter_acpcore.dart';
import 'package:flutter_acpanalytics/flutter_acpanalytics.dart';
import 'package:flutter_griffon/src/acpgriffon_uilogcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _url_text = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String griffonVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      griffonVersion = await FlutterGriffon.extensionVersion;
    } on PlatformException {
      log("Failed to get extension versions");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = griffonVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(shrinkWrap: true, children: <Widget>[
            Text('ACPGriffon version = $_platformVersion\n'),
            RaisedButton(
              child: Text("ACPCore.trackState(...)"),
              onPressed: () => FlutterACPCore.trackState("myState",
                  data: {"key1": "value1"}),
            ),
            RaisedButton(
              child: Text("ACPCore.trackAction(...)"),
              onPressed: () => FlutterACPCore.trackAction("myAction",
                  data: {"key1": "value1"}),
            ),
            TextField(
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: 'Enter a griffon url'),
              onChanged: (text) {
                _url_text = text;
              },
            ),
            RaisedButton(
              child: Text("ACPGriffon.startSession(...)"),
              onPressed: () => FlutterGriffon.startSession(_url_text),
            ),
            RaisedButton(
              child: Text("ACPGriffon.endSession(...)"),
              onPressed: () => FlutterGriffon.endSession(),
            ),
            RaisedButton(
              child: Text("ACPGriffon.sendEvent(...)"),
              onPressed: () => FlutterGriffon.sendEvent("com.adobe.griffon",
                  "Shared State Contents", {'state.data': "state"}),
            ),
            RaisedButton(
              child: Text("ACPGriffon.attemptReconnect()"),
              onPressed: () => FlutterGriffon.attemptReconnect(),
            ),
            RaisedButton(
              child: Text("ACPGriffon.logLocalUI()"),
              onPressed: () => FlutterGriffon.logLocalUILevel(
                  ACPGriffonUILogColor.VISIBILITY_HIGH, "Log UI test message"),
            ),
          ]),
        ),
      ),
    );
  }
}
