import 'package:flutter/material.dart';
import 'package:learn/routes/routes.dart';

class HomePage extends StatelessWidget {
  final data = [{
    "text": "状态管理：Provider",
    "path": Routes.provider
  },{
    "text": "原生通信",
    "path": Routes.plugin
  }, {
    "text": "Widget组件",
    "path": Routes.widget
  }];

  Widget _renderItem(context, index){
    var item = data[index];
    return InkWell(
      onTap: (){
        Routes.navigateTo(context, item["path"]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 10
        ),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              )
          )
        ),
        child: Center(
          child: Text(item["text"],
            style: TextStyle(
                fontSize: 24,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demos"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: _renderItem,
          itemCount: data.length,
        ),
      ),
    );
  }
}