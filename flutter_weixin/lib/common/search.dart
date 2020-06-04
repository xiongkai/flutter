import "package:flutter/material.dart";

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 25.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 45.0,
                        height: 45.0,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: 45.0,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.green))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              decoration: InputDecoration(
                                  hintText: "搜索", border: InputBorder.none),
                                  focusNode: (){
                                    FocusNode focusNode = FocusNode();
                                    FocusScope.of(context).requestFocus(focusNode);
                                    return focusNode;
                                  }(),
                            )),
                            SizedBox(
                              width: 45.0,
                              height: 45.0,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.mic,
                                    color: Color(0xffaaaaaa),
                                  ),
                                  onPressed: () {}),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Text(
                      "搜索指定文章",
                      style:
                          TextStyle(color: Color(0xffb5b5b5), fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "朋友圈",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                        Text(
                          "文章",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                        Text(
                          "公众号",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "小程序",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                        Text(
                          "音乐",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                        Text(
                          "表情",
                          style: TextStyle(
                              color: Color(0xff1aad19), fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
