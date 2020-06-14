import 'package:flutter/material.dart';

class ListFooterLoading extends StatelessWidget{
  final bool noMore;

  const ListFooterLoading({Key key, this.noMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: noMore?
        Text(
          "没有更多",
          style: TextStyle(
              color: Colors.grey
          ),
        ):
        Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}