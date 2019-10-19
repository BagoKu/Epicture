import 'package:flutter_app/AccountView.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import './api/ApiRequests.dart';
import './api/models/UserAccount.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class MyAccount extends StatelessWidget {
  // This widget is the root of your application.

    Future<bool> isLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("newUrl") == null)
      return false;
    else
      return true;
  }

  void splitString() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String url = prefs.getString("newUrl");
      List<String> infos = url.split('&');
      List<String> data;

      for (var i = 0; i < infos.length; i++) {
        data = infos[i].split('=');
        prefs.setString(data[0], data[1]);
      }
      print(prefs.getKeys());
  }

  Future<String> getSharedKey(String key) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return(prefs.getString(key));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect to Imgur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
          builder: (builder, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                splitString();
                return AccountView(title: 'Your account', username: "LittleBagz" /*getSharedKey("account_username")*/, refreshtoken: "" /*getSharedKey("refresh_token")*/);
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

class homeAccount extends StatelessWidget {
  void Disconnect() async {

  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString("account_username"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {
                  Disconnect();
                }),
          ],
        ),
    );
  }
}

class IsConnected extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'is connected',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : homeAccount(),
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