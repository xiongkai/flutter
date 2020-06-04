import "package:flutter/material.dart";
import '../common/wechat_item.dart';

class Found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: WeChartItem(
                onPress: (){
                  Navigator.pushNamed(context, "friends");
                },
                  imagePath: "images/icon_friends.png", name: "朋友圈"),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  WeChartItem(imagePath: "images/icon_scan.png", name: "扫一扫"),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
                  ),
                  WeChartItem(imagePath: "images/icon_shake.png", name: "摇一摇")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  WeChartItem(imagePath: "images/icon_look.png", name: "看一看"),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
                  ),
                  WeChartItem(imagePath: "images/icon_search.png", name: "搜一搜")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  WeChartItem(imagePath: "images/icon_near.png", name: "附近的人"),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
                  ),
                  WeChartItem(imagePath: "images/icon_bottle.png", name: "漂流瓶")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  WeChartItem(imagePath: "images/icon_shop.png", name: "购物"),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
                  ),
                  WeChartItem(imagePath: "images/icon_game.png", name: "游戏")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              color: Colors.white,
              child: WeChartItem(
                  imagePath: "images/icon_link.png", name: "小程序"),
            )
          ],
        ),
      ),
    );
  }
}
