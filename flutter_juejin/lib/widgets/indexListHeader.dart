import 'package:flutter/material.dart';

class IndexListHeader extends StatelessWidget{
  final bool hasLogin;

  const IndexListHeader({Key key, this.hasLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(!hasLogin){
      return null;
    }else{
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    '热门文章',
                    style: TextStyle(
                        color: Color(0xFF434343),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  FlatButton(
                    child: Text('查看更多', style: TextStyle(color: Color(0xFF757575))),
                    onPressed: () {
                      print('查看更多');
                    },
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.0,
            )
          ],
        ),
      );
    }
  }
}