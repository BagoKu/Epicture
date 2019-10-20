import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';
import './api/utils/DrawTiles.dart';
import './api/ApiRequests.dart';
import './api/models/GalleryTags.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  bool isLoading = false;
  final myController = TextEditingController();
  ImgurAPi imgurapi = new ImgurAPi();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: myController.text, tag: myController.text)));
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.search),
      ),
    );
  }
}
