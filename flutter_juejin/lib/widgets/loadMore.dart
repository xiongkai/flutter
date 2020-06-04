import "package:flutter/material.dart";

class LoadMore extends StatelessWidget{

  const LoadMore({Key key, this.hasMore}) : super(key: key);

  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    if(hasMore){
      return Container(
        height: 60,
        child: Center(
          child: Opacity(
            opacity: 1.0,
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      height: 60,
      child: Center(
        child: Text("亲，我也是有底线的",
          style: TextStyle(
              color: Theme.of(context).accentColor
          ),
        ),
      ),
    );
  }
}