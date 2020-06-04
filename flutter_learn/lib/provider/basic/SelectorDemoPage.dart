import 'package:flutter/material.dart';
import 'package:learn/provider/basic/CounterModel.dart';
import 'package:learn/provider/basic/GoodsListModel.dart';
import 'package:learn/routes/routes.dart';
import 'package:provider/provider.dart';

var goodsList = GoodsListModel();

class SelectorDemoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoodsListModel>.value(
      value: goodsList,
      child: SelectorDemo(),
    );
  }
}

class SelectorDemo extends StatelessWidget{

  SelectorDemo({Key key}): super(key: key){
    debugPrint("SelectorDemo construct");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Routes.pop(context);
              }
          ),
          title: Text("Selector")
      ),
      body: ListView.builder(
          itemCount: goodsList.total,
          itemBuilder: (context, index){
            return Selector<GoodsListModel, Map<String, dynamic>>(
                selector: (context, provider) => provider.goodsList[index],
                builder: (context, data, child){
                  var isSaved = data["save"] as bool;
                  return ListTile(
                    title: Text(data["text"]),
                    trailing: GestureDetector(
                      onTap: () => goodsList.collect(index),
                      child: Icon(
                          isSaved ? Icons.star : Icons.star_border),
                    ),
                  );
                },
            );
          }
      ),
    );
  }
}