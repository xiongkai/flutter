import 'package:flutter/material.dart';
import 'package:learn/provider/CounterModel.dart';
import 'package:learn/routes/routes.dart';
import 'package:provider/provider.dart';

var counter = CounterModel();

class ConsumerDemoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: counter,
      child: ConsumerDemo(),
    );
  }
}

class ConsumerDemo extends StatelessWidget{

  ConsumerDemo({Key key}): super(key: key){
    debugPrint("ConsumerDemo construct");
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
          title: Text("Consumer")
      ),
      body: Consumer<CounterModel>(
        builder: (context, counter, _){
          return Text("count = ${counter.count}",
            style: TextStyle(
                fontSize: 30
            ),
          );
        }
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, counter, child){
          return FloatingActionButton(
            onPressed: (){
              counter.increment();
            },
            child: child,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}