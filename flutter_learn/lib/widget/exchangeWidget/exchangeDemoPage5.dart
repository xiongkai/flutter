import 'package:flutter/material.dart';

class ExchangeDemoPage5 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExchangeDemoPageState();
}

class _ExchangeDemoPageState extends State<ExchangeDemoPage5>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交换两个StatelessWidget有key"),
      ),
      body: _StatelessDemoBox(color: Colors.red, key: UniqueKey(),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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
    return _StatelessElement2(this);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }
}

class _StatelessElement2 extends StatelessElement{
  _StatelessElement2(StatelessWidget widget) : super(widget);



  @override
  void performRebuild() {
    super.performRebuild();
  }

  @override
  Element updateChild(Element child, Widget newWidget, newSlot) {
    debugPrint("0");
    if (newWidget == null) {
      if (child != null)
        deactivateChild(child);
      return null;
    }
    Element newChild;
    if (child != null) {
      bool hasSameSuperclass = true;
      if (hasSameSuperclass && child.widget == newWidget) {
        if (child.slot != newSlot)
          updateSlotForChild(child, newSlot);
        newChild = child;
        debugPrint("1");
      } else if (hasSameSuperclass && Widget.canUpdate(child.widget, newWidget)) {
        if (child.slot != newSlot)
          updateSlotForChild(child, newSlot);
        child.update(newWidget);
        newChild = child;
        debugPrint("2");
      } else {
        deactivateChild(child);
        newChild = inflateWidget(newWidget, newSlot);
        debugPrint("3");
      }
    } else {
      newChild = inflateWidget(newWidget, newSlot);
      debugPrint("4");
    }
    return newChild;
  }
}