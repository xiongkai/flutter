import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideView extends StatefulWidget{
  final List<dynamic> data;

  SlideView({Key key, this.data}): super(key: key);

  @override
  State<StatefulWidget> createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    List<dynamic> data = widget.data;
    _controller = TabController(length: data==null?0:data.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<dynamic> data = widget.data;
    if(data != null && data.isNotEmpty){
      data.forEach((element) {
        int id = element["id"];
        String url = element["imagePath"];
        String title = element["title"];
        widgets.add(GestureDetector(
          key: ValueKey(id),
          onTap: (){},
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(url,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0x50000000)
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
      });
    }
    return TabBarView(
      children: widgets,
      controller: _controller,
    );
  }
}