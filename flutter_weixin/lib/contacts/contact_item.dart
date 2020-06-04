import "package:flutter/material.dart";

class ContactItem extends StatelessWidget {
  final String imagePath;
  final String name;

  ContactItem({this.imagePath, this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 52.0,
      decoration: BoxDecoration(
        color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9)))),
      child: FlatButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath??"images/tutu.png",
                width: 36.0,
                height: 36.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  name??"图图",
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              )
            ],
          )),
    );
  }
}
