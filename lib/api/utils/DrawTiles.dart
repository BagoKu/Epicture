import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';

class DrawTiles extends StatefulWidget {
  DrawTiles({Key key, this.content, this.followers, this.color, this.radius, this.url, this.textcolor})
      : super(key: key);

  final String content;
  final String url;
  final String followers;
  final Color color;
  final Color textcolor;
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
          child: FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: widget.content, tag: widget.content)));
            },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              color: widget.color,
              child: Column(
                    children: <Widget>[
                      Image.network(widget.url),
                      Text(widget.content, style: TextStyle(color: widget.textcolor)),
                      Row(
                        children: <Widget>[
                          Icon (Icons.person, color: Colors.deepOrange),
                          Text(widget.followers, style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  )
              ),
        );
  }
}
