import 'package:flutter/material.dart';
import 'package:learn/routes/routes.dart';

class ProviderPage extends StatelessWidget {
  final data = [{
    "text": "Provider.of",
    "path": Routes.provider_providerOf
  }, {
    "text": "Consumer",
    "path": Routes.provider_consumer
  }, {
    "text": "Selector",
    "path": Routes.provider_selector
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