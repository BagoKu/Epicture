import 'package:flutter/material.dart';
import '../models/GalleryAlbum.dart';
import './DrawTitle.dart';

class ShowInfo extends StatefulWidget {
  ShowInfo({Key key, this.info, this.size, this.color, this.radius, this.icon})
      : super(key: key);
  final String info;
  final double size;
  final Color color;
  final double radius;
  final IconData icon;

  @override
  State<StatefulWidget> createState() {
    return _ShowInfoState();
  }
}

class _ShowInfoState extends State<ShowInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            color: widget.color,
            semanticContainer: true,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  height: 30,
                  width: 75,
                  child: FlatButton.icon(
                    icon: Icon(widget.icon, size: 10),
                    onPressed: () {
                      /*...*/
                    },
                    label: Text(widget.info, style: TextStyle(fontSize: 10.0, color: Colors.black)),
                  ),
                )));
  }
}

class ShowInfos extends StatefulWidget {
  ShowInfos({Key key, this.content}) : super(key: key);
  final GalleryAlbum content;

  @override
  State<StatefulWidget> createState() {
    return _ShowInfosState();
  }
}

class _ShowInfosState extends State<ShowInfos> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        DrawTitle(
            info: widget.content.title,
            size: 70,
            color: Colors.blue,
            radius: 10),
        FadeInImage.assetNetwork(
            placeholder: 'assets/load.jpeg',
            image: widget.content.images.first.link),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ShowInfo(
              info: widget.content.ups.toString(),
              size: 50,
              color: Colors.blue,
              radius: 50,
              icon: Icons.arrow_upward),
          ShowInfo(
              info: widget.content.downs.toString(),
              size: 50,
              color: Colors.orange,
              radius: 50,
              icon: Icons.arrow_downward),
          ShowInfo(
              info: widget.content.commentCount.toString(),
              size: 50,
              color: Colors.green,
              radius: 50,
              icon: Icons.comment),
          ShowInfo(
              info: widget.content.views.toString(),
              size: 50,
              color: Colors.white,
              radius: 50,
              icon: Icons.panorama_fish_eye)
        ])
      ],
    ));
  }
}
