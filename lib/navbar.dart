import 'package:flutter/material.dart';
import 'package:flutter_app/TagsView.dart';
import './homePage.dart';
import './SearchBar.dart';
import 'account.dart';

class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavBarStata();
  }
}

class _NavBarStata extends State<NavBar> {
  int _selectedTab = 0;
  final _pageOptions = [
    TagList(title: 'Tags'),
    MyHomePage(
      title: 'Top Contents', tag: 'epitech'),
   SearchBar(title: 'Search'),
    MyAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
          ],
          selectedFontSize: 10,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
