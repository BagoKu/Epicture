import 'package:flutter/material.dart';
import 'package:flutter_app/api/models/UserAccount.dart';
import 'package:flutter_app/api/utils/DrawTitle.dart';
import './api/ApiRequests.dart';

class AccountView extends StatefulWidget {
  AccountView({Key key, this.title, this.username, this.refreshtoken}) : super(key: key);
  final String title;
  final String username;
  final String refreshtoken;

  @override
  State<StatefulWidget> createState() {
    return _AccountViewState();
  }
}

class _AccountViewState extends State<AccountView> {
  bool isLoading = false;
  ScrollController _controller;
  ImgurAPi imgurapi = new ImgurAPi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.black87,
        //body: _homePage(),
        body: FutureBuilder<List<UserAccount>>(
            future: imgurapi.loadUserAccountInfo(widget.username, widget.refreshtoken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error', style: TextStyle(color: Colors.red)));
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      childAspectRatio:1,
                      crossAxisCount: 3,
                      controller: _controller,
                      padding: const EdgeInsets.all(0.0),
                      children: snapshot.data.where((it) =>
                      it.avatarName != null)
                          .map((it) =>
                          DrawTitle(info: it.avatarName, color: Colors.transparent))
                          .toList()
                   );
                } else {
                  return CircularProgressIndicator();
                }
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
