import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MyAccount extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetCurrentURLWebView()
    );
  }
}

class GetCurrentURLWebView extends StatefulWidget {
  @override
  ConnectToImgur createState() {
    return new ConnectToImgur();
  }
}

class ConnectToImgur extends State<GetCurrentURLWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription<String> _onUrlChanged;

  void newUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  void initState() {
    super.initState();

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        prefs.setString(url);
        print("Current URL: $url");
      }
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      key: scaffoldKey,
      url: 'https://api.imgur.com/oauth2/authorize?client_id=759705448d0ff69&response_type=token&state=',
      hidden: true,
      appBar: AppBar(title: Text("Connection"),),
    );
  }
}