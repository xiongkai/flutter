import "package:flutter/material.dart";
import 'contact_header.dart';
import 'contact_item.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactState();
  }
}

class ContactState extends State<Contact> {
  List<String> _list = [
    "A",
    "A",
    "B",
    "B",
    "B",
    "D",
    "E",
    "F",
    "F",
    "G",
    "G",
    "G",
    "H",
    "H",
    "H",
    "H"
  ];

  @override
  Widget build(BuildContext context) {
    print("ContactState : build");
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    () {
                      if (index == 0) {
                        return Offstage(
                          offstage: false,
                          child: ContactHeader(),
                        );
                      }
                      return Container();
                    }(),
                    Offstage(
                      offstage: !(index == 1 ||
                          (index > 1 && _list[index - 1] != _list[index - 2])),
                      child: Container(
                        color: Colors.grey[400],
                        height: 32.0,
                        padding: EdgeInsets.only(left: 14.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          index == 0 ? "" : _list[index - 1],
                          style: TextStyle(
                              color: Color(0xff909090), fontSize: 14.0),
                        ),
                      ),
                    ),
                    () {
                      if (index > 0) {
                        return ContactItem();
                      }
                      return Container();
                    }()
                  ],
                ),
              );
            }),
        Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              width: 32.0,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: ListView.builder(
                  itemCount: siderBarKey.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(siderBarKey[index]),
                    );
                  }),
            ))
      ],
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ContactState : initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("ContactState : didChangeDependencies");
  }

  @override
  void didUpdateWidget(Contact oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("ContactState : didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("ContactState : deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("ContactState : dispose");
  }
}

const siderBarKey = <String>[
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];
