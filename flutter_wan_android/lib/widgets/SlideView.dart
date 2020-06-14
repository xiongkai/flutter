import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/model/banner_entity.dart';
import 'package:wanandroid/routers/NavigatorUtil.dart';

class SlideView extends StatefulWidget{
  final List<BannerEntity> data;

  SlideView({Key key, this.data}): super(key: key);

  @override
  State<StatefulWidget> createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    List<BannerEntity> data = widget.data;
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
    List<BannerEntity> data = widget.data;
    if(data != null && data.isNotEmpty){
      data.forEach((element) {
        widgets.add(GestureDetector(
          key: ValueKey(element.id),
          onTap: (){
            NavigatorUtil.getWebViewPage(context, element.title, element.url);
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                element.imagePath,
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
                  child: Text(
                    element.title,
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