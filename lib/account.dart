import 'package:flutter_app/AccountView.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

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
                return IsConnected();
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

class _getSecondArg extends StatefulWidget {
  _getSecondArg(this.username);
  final String username;

  @override
  State<StatefulWidget> createState() {
    return getSecondArg();
  }
}


class getSecondArg extends State<_getSecondArg> {

  Future<String> getSharedKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return(prefs.getString(key));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : FutureBuilder<String>(
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            print(widget.username);
            return AccountView(title: 'Your account', username: widget.username, refreshtoken: snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        },
        future: this.getSharedKey("refresh_token"),
      ),
    );
  }
}


class IsConnected extends StatelessWidget {

  Future<String> getSharedKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return(prefs.getString(key));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'is connected',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : FutureBuilder<String>(
        builder: (builder, snapshot) {
      if (snapshot.hasData) {
          return _getSecondArg(snapshot.data);
      } else {
        return CircularProgressIndicator();
      }
    },
    future: this.getSharedKey("account_username"),
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