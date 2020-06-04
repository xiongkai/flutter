import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/product_page.dart';
import 'pages/news_page.dart';
import 'pages/about_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  Map<int, Widget> _mapPages = {};
  var _currentIndex = 0;

  Widget _currentPage(int index) {
    Widget widget = _mapPages[index];
    if (widget == null) {
      switch (index) {
        case 0:
          widget = _mapPages[index] = MainPage();
          break;
        case 1:
          widget = _mapPages[index] = ProductPage();
          break;
        case 2:
          widget = _mapPages[index] = NewsPage();
          break;
        case 3:
          widget = _mapPages[index] = AboutPage();
          break;
      }
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter企业站"),
        leading: IconButton(icon: Icon(Icons.home), onPressed: (){
          setState(() {
            _currentIndex = 0;
          });
        },),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: IconButton(icon: Icon(Icons.search), onPressed: (){},),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("产品")),
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new), title: Text("新闻")),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_comment), title: Text("关于")),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _currentPage(_currentIndex),
    );
  }
}
