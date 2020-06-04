import 'package:flutter/material.dart';

class StatefulDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StatefulDemoPageState();
}

class _StatefulDemoPageState extends State<StatefulDemoPage>{
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatelessWidget组件的更新"),
      ),
      body: Container(
        child: Center(
          child: _StatefulDemoText(count: _count),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _count ++;
          setState((){});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _StatefulDemoText extends StatefulWidget{
  final int count;

  const _StatefulDemoText({Key key, this.count}) : super(key: key);

  @override
  State<StatefulWidget> createState() => __StatefulDemoTextState(count);
}

class __StatefulDemoTextState extends State<_StatefulDemoText>{
  int count = 0;

  __StatefulDemoTextState(this.count);

  @override
  Widget build(BuildContext context) {
    int count2 = widget.count;
    return Text(
      "stateful-$count-$count2",
      style: TextStyle(
          fontSize: 30
      ),
    );
  }
}