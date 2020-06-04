import 'package:flutter/material.dart';

import '../routers/navigatoUtil.dart';

class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            NavigatorUtil.back(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text('详情页',
          style: TextStyle(
              color: Theme.of(context).primaryColor
          ),
        ),
      ),
    );
  }
}