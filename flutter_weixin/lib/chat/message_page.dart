import "package:flutter/material.dart";
import 'message_item.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    print("MessagePageState : build");
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return MessageItem();
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("MessagePageState : initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("MessagePageState : didChangeDependencies");
  }

  @override
  void didUpdateWidget(MessagePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("MessagePageState : didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("MessagePageState : deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("MessagePageState : dispose");
  }
}
