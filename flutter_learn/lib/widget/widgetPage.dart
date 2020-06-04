import 'package:flutter/material.dart';
import 'package:learn/routes/routes.dart';

class WidgetPage extends StatelessWidget {
  final data = [{
    "text": "StatelessWidget组件的更新",
    "path": Routes.widget_stateless
  }, {
    "text": "StatefulWidget组件的更新",
    "path": Routes.widget_stateful
  }, {
    "text": "InhertWidget组件",
    "path": Routes.widget_inhert
  }, {
    "text": "交换两个StatelessWidget无key",
    "path": Routes.widget_exchange
  }, {
    "text": "交换两个StatelessWidget有key",
    "path": Routes.widget_exchange2
  }, {
    "text": "交换两个StatefulWidget无key",
    "path": Routes.widget_exchange3
  }, {
    "text": "交换两个StatefulWidget有key",
    "path": Routes.widget_exchange4
  }, {
    "text": "刷新StatelessWidget变化key",
    "path": Routes.widget_exchange5
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
        title: Text("状态管理：Provider"),
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