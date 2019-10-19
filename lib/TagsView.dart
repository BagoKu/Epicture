import 'package:flutter/material.dart';
import 'package:flutter_app/api/utils/DrawTitle.dart';
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
                    return Column(
                        children: <Widget>[
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 4,
                                controller: _controller,
                                padding: const EdgeInsets.all(10),
                                children: snapshot.data.where((it) =>
                                it.name != null)
                                    .map((it) =>
                                    DrawTiles(content: it.name, color: Colors.green, radius: 10))
                                    .toList()
                              //children: snapshot.data.where((it) =>it.images != null && it.images.length > 0 && it.images.first.type.contains("image")).map((it) => FadeInImage.assetNetwork(placeholder: 'assets/load.jpeg',image: it.images.first.link)).toList()
                            ),
                          )
                        ]
                    );
                  }
                }
                return CircularProgressIndicator();
              }));
    }
  }
