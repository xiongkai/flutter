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
  static final _appBarTitles = ["首页", "体系", "公众号", "导航", "项目"];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_currentIndex]),
        actions: _currentIndex!=0?null:<Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomeListPage(),
          FindListPage(),
          AboutUsPage(),
          AboutUsPage(),
          AboutUsPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(_appBarTitles[0])
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.gamepad),
              title: Text(_appBarTitles[1])
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account),
              title: Text(_appBarTitles[2])
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigation),
              title: Text(_appBarTitles[3])
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text(_appBarTitles[4])
          )
        ],
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