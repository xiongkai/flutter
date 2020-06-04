import "package:flutter/material.dart";

class TouchCallBack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TouchCallBackState();
  }

  final bool isFeed;
  final Color background;
  final VoidCallback onPressed;
  final Widget child;

  TouchCallBack({
    this.isFeed = false,
    this.background = const Color(0xffd8d8d8),
    this.onPressed,
    @required this.child,
  });
}

class TouchCallBackState extends State<TouchCallBack> {
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Container(
          child: widget.child,
          color: _color,
        ),
        onTap: widget.onPressed??(){
          print("zzzzzzzzzzzzzzzzzzzz");
        },
        onPanDown: (DragDownDetails param) {
          print("yyyyyyyyyyyyyyyyyyyyy");
          if (!widget.isFeed) return;
          setState(() {
            _color = widget.background;
          });
        },
        onPanCancel: () {
          setState(() {
            _color = Colors.transparent;
          });
        },
        onTapCancel: () {
          setState(() {
            _color = Colors.transparent;
          });
        },
        onTapUp: (TapUpDetails param) {
          setState(() {
            _color = Colors.transparent;
          });
        });
  }
}
