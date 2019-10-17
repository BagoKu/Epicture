import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MyAccount extends StatelessWidget {
  // This widget is the root of your application.

  void test() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("AAAAAAAAAAAAAAAAAAAAAAAA");
    print(prefs.getString("newUrl"));
  }

  Future<String> getNetworkString() async {
    await Future.delayed(Duration(seconds: 1));

    return "AAAAA";
  }

  Future<bool> isLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("newUrl") == null)
      return false;
    else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    getNetworkString().then((response) {
      print(response);
    });

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
          builder: (builder, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return Text('Je suis connecté');
              } else {
                return GetCurrentURLWebView();
              }
            } else {
              return CircularProgressIndicator();
            }
          },
         future: this.isLogIn(),
      ),
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
  final String _newUrl = "newUrl";

  Future<bool> saveNewUrl(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_newUrl, value);
  }

    @override
  void initState() {
    super.initState();

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        saveNewUrl(url);
        //print("Current URL: $url");
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