import 'package:flutter/material.dart';

class InhertDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InhertWidget组件"),
      ),
      body: Container(
        child: Center(
          child: Text("inhertWidget"),
        ),
      ),
    );
  }
}