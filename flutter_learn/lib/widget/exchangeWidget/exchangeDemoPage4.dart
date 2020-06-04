import 'package:flutter/material.dart';

class ExchangeDemoPage4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExchangeDemoPageState();
}

class _ExchangeDemoPageState extends State<ExchangeDemoPage4>{
  List<_StatefulDemoBox> childList = [
    _StatefulDemoBox(color: Colors.red, key: UniqueKey()),
    _StatefulDemoBox(color: Colors.green, key: UniqueKey())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交换两个StatefulWidget有key"),
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

class _StatefulDemoBox extends StatefulWidget{
  final Color color;

  const _StatefulDemoBox({Key key, this.color}) : super(key: key);

  @override
  StatefulElement createElement() {
    debugPrint("createElement --- " + color.toString());
    return super.createElement();
  }

  @override
  State<StatefulWidget> createState() => _StatefulDemoBoxState();
}

class _StatefulDemoBoxState extends State<_StatefulDemoBox>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: widget.color
      ),
    );
  }
}
