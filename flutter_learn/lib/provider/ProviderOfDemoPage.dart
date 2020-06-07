import 'package:flutter/material.dart';
import 'package:learn/provider/CounterModel.dart';
import 'package:learn/routes/routes.dart';
import 'package:provider/provider.dart';

var counter = CounterModel();

class ProviderOfDemoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: counter,
      child: ProviderOfDemo(),
    );
  }
}

class ProviderOfDemo extends StatelessWidget{

  ProviderOfDemo({Key key}): super(key: key){
    debugPrint("ProviderOfDemo construct");
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context);
    var count = counter.count;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Routes.pop(context);
              }
          ),
          title: Text("Provider.of")
      ),
      body: Text("count = $count",
        style: TextStyle(
          fontSize: 30
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}