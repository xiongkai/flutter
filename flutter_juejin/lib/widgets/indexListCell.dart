import 'dart:core';

import 'package:flutter/material.dart';

import '../model/indexCell.dart';
import '../routers/navigatoUtil.dart';
import '../widgets/goodAndCommentCell.dart';
import '../widgets/inTextDot.dart';

class IndexListCell extends StatelessWidget {
  final IndexCell cellInfo;

  IndexListCell({Key key, this.cellInfo}) : super(key: key);

  TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0,
  );

  List<Widget> _buildFirstRow() {
    List<Widget> _listRow = new List();
    if (cellInfo.hot) {
      _listRow.add(Text('热',
        style: TextStyle(
          color: Color(0xFFF53040),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }
    if (cellInfo.isCollection == 'post') {
      _listRow.add(Text(
        '专栏',
        style: TextStyle(
          color: Color(0xFFBC30DA),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }
    _listRow.add(Text(cellInfo.username, style: titleTextStyle));
    _listRow.add(InTextDot());
    _listRow.add(Text(cellInfo.createdTime, style: titleTextStyle));
    _listRow.add(InTextDot());
    _listRow.add(Expanded(
      //防止文本超长
      child: Text(
        cellInfo.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return _listRow;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtil.goDetailPage(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildFirstRow(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9.0),
              child: Text(
                cellInfo.title,
                style: TextStyle(
                  color: Color(0xFF393C3F),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GoodAndCommentCell(cellInfo.collectionCount, cellInfo.commentCount),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}