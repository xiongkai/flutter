import "package:flutter/material.dart";
import 'contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ContactItem(imagePath: "images/icon_addfriend.png", name: "新朋友",),
        ContactItem(imagePath: "images/icon_groupchat.png", name: "群聊",),
        ContactItem(imagePath: "images/icon_public.png", name: "公众号",),
      ],
    );
  }
}
