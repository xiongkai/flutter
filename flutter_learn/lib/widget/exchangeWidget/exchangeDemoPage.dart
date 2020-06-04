import 'package:flutter/material.dart';

class ExchangeDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExchangeDemoPageState();
}

class _ExchangeDemoPageState extends State<ExchangeDemoPage>{
  List<_StatelessDemoBox> childList = [
    _StatelessDemoBox(color: Colors.red),
    _StatelessDemoBox(color: Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交换两个StatelessWidget无key"),
      ),
      body: Column(
        children: childList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          childList = [childList[1], childList[0]];
          setState((){});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _StatelessDemoBox extends StatelessWidget{
  final Color color;

  const _StatelessDemoBox({Key key, this.color}) : super(key: key);

  @override
  StatelessElement createElement() {
    debugPrint("createElement --- " + color.toString());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }
}