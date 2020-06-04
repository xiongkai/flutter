import "package:flutter/material.dart";
import '../common/touch_callback.dart';
import '../common/wechat_item.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
                isFeed: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Image.asset(
                        "images/tutu.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "图图",
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff353535)),
                        ),
                        Text(
                          "微信号：tutu123",
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xffa9a9a9)),
                        )
                      ],
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Image.asset(
                        "images/code.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    )
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_money.png", name: "钱包"),
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_collect.png", name: "收藏"),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            color: Colors.white,
            child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
          ),
          Container(
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_photo.png", name: "相册"),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            color: Colors.white,
            child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
          ),
          Container(
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_card.png", name: "卡包"),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            color: Colors.white,
            child: Divider(height: 0.5, color: Color(0xffd9d9d9),),
          ),
          Container(
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_smile.png", name: "表情"),
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: WeChartItem(imagePath: "images/icon_me_setting.png", name: "设置"),
          )
        ],
      ),
    );
  }
}
