import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contact.dart';
import 'personal/personal.dart';
import 'found/found.dart';

enum MenuType { a, b, c, d, e }

class MyAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppPageState();
  }
}

class MyAppPageState extends State<MyAppPage> {
  MessagePage _message;
  Contact _contact;
  Found _found;
  Personal _me;
  int _currentIndex = 0;

  Widget _getCurrentWidget(int index){
    Widget currentWidget;
    switch(index){
      case 0:
        if(_message == null){
          _message = MessagePage();
        }
        currentWidget = _message;
        break;
      case 1:
        if(_contact == null){
          _contact = Contact();
        }
        currentWidget = _contact;
        break;
      case 2:
        if(_found == null){
          _found = Found();
        }
        currentWidget = _found;
        break;
      case 3:
        if(_me == null){
          _me = Personal();
        }
        currentWidget = _me;
        break;
    }
    return currentWidget;
  }

  void _bottomNavigationBarOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PopupMenuItem<MenuType> _createPopupMenuItem(
      {@required String title,
      @required MenuType menuType,
      IconData icon,
      String path}) {
    return PopupMenuItem<MenuType>(
      value: menuType,
      child: Row(
        children: <Widget>[
          icon == null
              ? Image.asset(
                  path,
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.fill,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, "search");
            },
          ),
          PopupMenuButton(
              offset: Offset(0, 75.0),
              icon: Icon(Icons.add),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<MenuType>>[
                  _createPopupMenuItem(
                      title: "发起群聊",
                      menuType: MenuType.a,
                      path: "images/icon_menu_group.png"),
                  _createPopupMenuItem(
                      title: "添加朋友",
                      menuType: MenuType.b,
                      path: "images/icon_menu_addfriend.png"),
                  _createPopupMenuItem(
                      title: "扫一扫",
                      menuType: MenuType.c,
                      path: "images/icon_menu_scan.png"),
                  _createPopupMenuItem(
                      title: "收付款",
                      menuType: MenuType.d,
                      icon: Icons.crop_free),
                  _createPopupMenuItem(
                      title: "帮助与反馈", menuType: MenuType.e, icon: Icons.email)
                ];
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text(
                "微信",
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xff46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 0
                  ? Image.asset("images/weixin_pressed.png",
                      width: 32.0, height: 28.0)
                  : Image.asset("images/weixin_normal.png",
                      width: 32.0, height: 28.0)),
          BottomNavigationBarItem(
              title: Text(
                "联系人",
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xff46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset("images/contact_list_pressed.png",
                      width: 32.0, height: 28.0)
                  : Image.asset("images/contact_list_normal.png",
                      width: 32.0, height: 28.0)),
          BottomNavigationBarItem(
              title: Text(
                "发现",
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xff46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset("images/find_pressed.png",
                      width: 32.0, height: 28.0)
                  : Image.asset("images/find_normal.png",
                      width: 32.0, height: 28.0)),
          BottomNavigationBarItem(
              title: Text(
                "我的",
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xff46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 3
                  ? Image.asset("images/profile_pressed.png",
                      width: 32.0, height: 28.0)
                  : Image.asset("images/profile_normal.png",
                      width: 32.0, height: 28.0))
        ],
        onTap: _bottomNavigationBarOnTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
      ),
      body: _getCurrentWidget(_currentIndex),
    );
  }
}
