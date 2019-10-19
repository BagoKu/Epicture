import 'package:flutter/material.dart';

class DrawTitle extends StatefulWidget {
  DrawTitle({Key key, this.info, this.size, this.color, this.radius})
      : super(key: key);

  final String info;
  final double size;
  final Color color;
  final double radius;

  @override
  State<StatefulWidget> createState() {
    return _DrawTitleState();
  }
}

class _DrawTitleState extends State<DrawTitle> {
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
                padding: EdgeInsets.all(10), child: Text(widget.info, style: TextStyle(color: Colors.white)))));
  }
}
