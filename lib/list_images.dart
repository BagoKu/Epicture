import 'package:flutter/widgets.dart';
import './ImgurImage.dart';
import 'package:flutter/material.dart';

class ListImages extends StatefulWidget {

  final List<ImgurImage> imageList;
  final int itemType;
  final ScrollController _controller;

  ListImages(this.imageList, this.itemType, this._controller);
  @override
  State<StatefulWidget> createState() {
    return _ListImagesState();
  }
}
class _ListImagesState extends State<ListImages> {
  List<ImgurImage> imageList = [];
  int itemType;
  ScrollController _controller;
  @override
  void initState() {
    imageList = (widget.imageList);
    itemType = widget.itemType;
    _controller = widget._controller;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(10),
            //crossAxisCount: 1,
            controller: _controller,
            children: List.generate(
              imageList.length,
              (index) {
                var image = imageList[index];
                if (image.itemType == ImgurImage.TYPE_ITEM) {
                  return Center(
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/load.jpeg', image: image.link),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        _showIndicator(),
      ],
    );
  }

  Widget _showIndicator() {
    if (itemType == ImgurImage.TYPE_PROGRESS) {
      return Container(
        margin: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Container();
    }
  }
}
