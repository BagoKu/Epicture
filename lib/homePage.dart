import './ImgurImage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
  // _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  var mPageCount = 0;
  bool isLoading = false;
  int itemType = ImgurImage.TYPE_PROGRESS;
  List<ImgurImage> imageList = [];
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _fetchImages();
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    _fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _homePage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _homePage() {
    if (imageList.length == 0 ||
        (imageList.length == 1 &&
            imageList[0].itemType == ImgurImage.TYPE_PROGRESS)) {
      return Center(child: CircularProgressIndicator());
    } else if (imageList.length == 1 &&
        imageList[0].itemType == ImgurImage.TYPE_ERROR) {
      return Center(
        child: RaisedButton(
          onPressed: () {
            _fetchImages();
          },
          child: Text('Try Again'),
        ),
      );
    } else {
      itemType = imageList[imageList.length - 1].itemType;
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
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(image.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          FadeInImage.assetNetwork(
                              placeholder: 'assets/load.jpeg',
                              image: image.link,
                              fit: BoxFit.fill),
                          Text(image.upvote),
                        ]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 10,
                        margin: EdgeInsets.all(10),
                      ),
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

  void _fetchImages() async {
    if (!isLoading) {
      mPageCount++;
      isLoading = true;

      if (imageList.length == 1) imageList.removeLast();
      imageList.add(
          ImgurImage(link: "", itemType: ImgurImage.TYPE_PROGRESS, title: "", upvote: ""));
      //setState(() {});

      await fetchImages(mPageCount).then((imgurImages) {
        imageList.removeLast();
        for (var value in imgurImages.images) {
          if (value != null) {
            imageList.add(value);
          }
        }
      }).catchError((error) {
        imageList.removeLast();
        if (imageList.length == 0)
          imageList.add(
              ImgurImage(link: "", itemType: ImgurImage.TYPE_ERROR, title: "", upvote: ""));
        if (mPageCount > 0) {
          mPageCount--;
        }
      }).whenComplete(() {
        isLoading = false;
        setState(() {});
      });
    }
  }
}
