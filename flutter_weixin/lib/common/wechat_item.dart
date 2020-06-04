import "package:flutter/material.dart";
import 'touch_callback.dart';

class WeChartItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final VoidCallback onPress;

  WeChartItem({@required this.imagePath, @required this.name, this.onPress});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(
        isFeed: true,
        onPressed: onPress,
        child: Container(
          color: Colors.transparent,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 22.0, right: 22.0),
                child: Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 16.0, color: Color(0xff353535)),
              )
            ],
          ),
        ));
  }
}
