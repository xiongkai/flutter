import 'package:flutter/material.dart';
import 'package:wanandroid/http/Api.dart';
import 'package:wanandroid/http/BaseModel.dart';
import 'package:wanandroid/http/HttpUtils.dart';
import 'package:wanandroid/widgets/SlideView.dart';

class HomeListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage>{
  List<dynamic> _articleList;
  SlideView _slideView;
  bool _isRefresh = false;
  int _pageCount = 999;
  int _currPage = 0;

  @override
  void initState() {
    super.initState();
    getBanner();
    getArticles();
  }

  void getBanner() async {
    BaseModel model = await HttpUtils.get(Api.BANNER);
    if(model.errorCode == 0){
      setState(() {
        _slideView = SlideView(data: model.data);
      });
    }
  }

  void getArticles() async {
    if(_isRefresh){
      return;
    }
    if(_currPage > _pageCount){
      return;
    }
    _isRefresh = true;
    String articleUrl = "${Api.ARTICLE_LIST}/$_currPage/json";
    BaseModel model = await HttpUtils.get(articleUrl);
    if(model.errorCode == 0){
      var data = model.data;
      if(data != null){
        _articleList = data["datas"];
      }
      _pageCount = data["pageCount"];
      setState(() {
        _isRefresh = false;
        _currPage++;
      });
    }else{
      setState(() {
        _isRefresh = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_articleList == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    int length = _articleList==null?0:_articleList.length;
    if(_slideView != null) length += 1;
    return ListView.builder(
        itemCount: length,
        itemBuilder: _buildItem
    );
  }

  Widget _buildItem(context, index){
    if(_slideView != null){
      if(index == 0) {
        return Container(
          child: _slideView,
          height: 200,
        );
      }else{
        index -= 1;
      }
    }
    Map<String, dynamic> item = _articleList[index];
    return Container(
      height: 60,
      child: Text(
        item["chapterName"],
        style: TextStyle(
          color: Colors.redAccent
        ),
      ),
    );
  }
}