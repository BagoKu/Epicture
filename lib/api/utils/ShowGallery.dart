import 'package:flutter/material.dart';
import '../models/GalleryAlbum.dart';
import './ShowInfos.dart';

class ShowGallery extends StatefulWidget {
   ShowGallery({Key key, this.url}) : super(key: key);
  final GalleryAlbum url;

  @override
  State<StatefulWidget> createState() {
    return _ShowGalleryState();
  }
}


class _ShowGalleryState extends State<ShowGallery> {
   @override
  Widget build(BuildContext context) {
    return Center (child: Card(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),semanticContainer: true, clipBehavior: Clip.antiAliasWithSaveLayer,child:  Column(children: <Widget>[
                          Padding(padding: EdgeInsets.all(8.0), child: ShowInfos(content: widget.url))
                        ],)));
  }
}
