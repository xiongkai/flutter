import "package:flutter/material.dart";
import '../common/touch_callback.dart';

class MessageItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageItemSate();
  }
}

class MessageItemSate extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 64.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9)))),
        child: TouchCallBack(
          isFeed: true,
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: Image.asset(
                  "images/tutu.png",
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "大耳朵图图",
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                      maxLines: 1,
                    ),
                    Offstage(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                    ),
                    Text(
                      "突然想到的....",
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(right: 12.0, top: 12.0),
                child: Text(
                  "14:29",
                  style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                ),
              ),
            ],
          ),
        ));
  }
}
