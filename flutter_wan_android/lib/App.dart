import 'package:flutter/material.dart';
import 'package:wanandroid/pages/AboutUsPage.dart';
import 'package:wanandroid/pages/FindListPage.dart';
import 'package:wanandroid/pages/HomeListPage.dart';

class ApplicationPage extends StatefulWidget {

  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  static final appBarTitles = ["首页", "发现", "我的"];
  int _currentIndex = 0;

  var _navigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text(appBarTitles[0])
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.dashboard), title: Text(appBarTitles[1])
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text(appBarTitles[2])
    ),
  ];

  var _homeBody = <Widget>[HomeListPage(), FindListPage(), AboutUsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_currentIndex]),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){

              }
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _homeBody,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _navigationBarItems,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}