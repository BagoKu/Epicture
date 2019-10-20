import 'package:flutter/material.dart';
import './api/utils/DrawTiles.dart';
import './api/ApiRequests.dart';
import './api/models/GalleryTags.dart';

class TagList extends StatefulWidget {
  TagList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _TagListState();
  }
}

class _TagListState extends State<TagList> {
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
          body: FutureBuilder<List<GalleryTags>>(
              future: imgurapi.loadTags(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  }
                  if (snapshot.hasData) {
                    return ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Column(
                          children: <Widget>[
                            Expanded(
                              child: GridView.count(
                                  childAspectRatio:1,
                                crossAxisCount: 3,
                                  controller: _controller,
                                  padding: const EdgeInsets.all(0.0),
                                  children: snapshot.data.where((it) =>
                                  it.name != null)
                                      .map((it) =>
                                      DrawTiles(content: it.name, color: Colors.transparent, followers: it.followers.toString(), textcolor: Colors.blue, radius: 0, url: 'https://i.imgur.com/' + it.backgroundHash + '.jpg'))
                                      .toList()
                                ),
                            )
                          ]
                      ),
                    );
                  }
                }
                return Center(child: CircularProgressIndicator());
              }));
    }
  }
