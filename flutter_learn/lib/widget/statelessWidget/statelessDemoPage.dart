import 'package:flutter/material.dart';

class StatelessDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StatelessDemoPageState();
}

class _StatelessDemoPageState extends State<StatelessDemoPage>{
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatelessWidget组件的更新"),
      ),
      body: Container(
        child: Center(
          child: _StatelessDemoText(count: _count),
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

class _StatelessDemoText extends StatelessWidget{
  final int count;

  const _StatelessDemoText({Key key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "stateless-$count",
      style: TextStyle(
        fontSize: 30
      ),
    );
  }
}