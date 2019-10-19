import 'package:flutter/material.dart';

class DrawTiles extends StatefulWidget {
  DrawTiles({Key key, this.content, this.size, this.color, this.radius, this.url})
      : super(key: key);

  final String content;
  final String url;
  final double size;
  final Color color;
  final double radius;

  @override
  State<StatefulWidget> createState() {
    return _DrawTilesState();
  }
}

class _DrawTilesState extends State<DrawTiles> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            color: widget.color,
            semanticContainer: true,
            child: Padding(
                padding: EdgeInsets.all(10), child: Text(widget.content, style: TextStyle(color: Colors.white)))));
  }
}
