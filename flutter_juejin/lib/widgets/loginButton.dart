import 'package:flutter/material.dart';
import 'package:juejin/routers/navigatoUtil.dart';

class LoginButton extends StatelessWidget {
  final String userName;
  final String userPic;

  LoginButton({Key key, this.userPic, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userName == null || userName == '') {
      return FlatButton(
          onPressed: () {
            NavigatorUtil.goLoginPage(context);
          },
          child: Text('登陆 . 注册',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
            ),
          ));
    }
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(userPic),
            child: Text(userName),
          ),
        ],
      ),
    );
  }
}