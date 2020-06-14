import 'package:flutter/material.dart';
import 'package:wanandroid/http/ApiService.dart';
import 'package:wanandroid/model/BaseModel.dart';
import 'package:wanandroid/model/article_entity.dart';
import 'package:wanandroid/model/banner_entity.dart';
import 'package:wanandroid/widgets/AritcleItem.dart';
import 'package:wanandroid/widgets/ListFooter.dart';
import 'package:wanandroid/widgets/PageLoading.dart';
import 'package:wanandroid/widgets/SlideView.dart';

class HomeListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage>{
  static final int none = 0;
  static final int refresh = 1;
  static final int loadMore = 2;
  ScrollController _scrollController = ScrollController();
  List<ArticleData> _articleList = [];
  SlideView _slideView;
  int _pageState = none;
  int _pageCount = 999;
  int _currPage = 0;

  @override
  void initState() {
    super.initState();
    _initPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getArticles();
      }
    });
  }

  void _initPage() async {
    List<Future> initList = [];
    initList.add(ApiService.getBannerList());
    initList.add(ApiService.getArticleList(_currPage));
    List result = await Future.wait(initList);
    BaseModel<List<BannerEntity>>  bannerListModel = result[0];
    if(bannerListModel.errorCode == 0){
      _slideView = SlideView(data: bannerListModel.data);
    }
    BaseModel<ArticleEntity>  articleModel = result[1];
    if(articleModel.errorCode == 0){
      var data = articleModel.data;
      _articleList = data.datas;
      _pageCount = data.pageCount;
      _currPage = _currPage + 1;
    }
    if(bannerListModel.errorCode == 0 || articleModel.errorCode == 0){
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    await _getBanner();
    await _getArticles(isRefresh: true);
  }

  Future<void> _getBanner() async {
    BaseModel<List<BannerEntity>> model = await ApiService.getBannerList();
    if(model.errorCode == 0){
      setState(() {
        _slideView = SlideView(data: model.data);
      });
    }
  }

  Future<void> _getArticles({bool isRefresh=false}) async {
    if(isRefresh){
      if(_pageState == refresh){
        return;
      }
      _pageState = refresh;
    }else{
      if(_currPage == _pageCount){
        return;
      }
      if(_pageState == loadMore){
        return;
      }
      _pageState = loadMore;
    }
    int currPage = isRefresh?0:_currPage;
    BaseModel<ArticleEntity> model = await ApiService.getArticleList(currPage);
    if(isRefresh){
      if(_pageState != refresh){
        return;
      }
    }else if(_pageState != loadMore){
      return;
    }
    if(model.errorCode == 0){
      var data = model.data;
      if(isRefresh){
        _articleList.clear();
      }
      _articleList.addAll(data.datas);
      _pageCount = data.pageCount;
      setState(() {
        _pageState = none;
        _currPage = currPage+1;
      });
    }else{
      setState(() {
        _pageState = none;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int length = _articleList==null?0:_articleList.length;
    if(_slideView == null && length == 0){
      return PageLoading();
    }
    if(length != 0) length += 1;
    if(_slideView != null) length += 1;
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: length,
          itemBuilder: _buildItem,
          controller: _scrollController,
        ),
        onRefresh: _onRefresh,
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
    if(_articleList != null && index == _articleList.length){
      return ListFooter(noMore: _currPage == _pageCount);
    }
    ArticleData item = _articleList[index];
    return ArticleItem(key: ValueKey(item.id), articleData: item);
  }
}