import 'package:flutter/material.dart';

import '../constants/Constants.dart';
import '../model/indexCell.dart';
import '../utils/DataUtil.dart';
import '../widgets/indexListCell.dart';
import '../widgets/indexListHeader.dart';
import '../widgets/loadMore.dart';

const pageIndexArray = Constants.RANK_BEFORE;

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin {
  List<IndexCell> _listData;
  int _pageIndex = 0;
  Map<String, dynamic> _params = {"src": 'web', "category": "all", "limit": 20};
  bool _isRequesting = false; //是否正在请求数据的flag
  bool _hasMore = true;
  ScrollController _scrollController = new ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getList(true);
      }
    });
    _getList(false);
  }

  Future<void> _getList(bool isLoadMore) async {
    if(_isRequesting){
      return;
    }
    if(isLoadMore && !_hasMore){
      return;
    }
    _isRequesting = true;
    await Future.delayed(
        Duration(milliseconds: 1000),
        (){}
    );
    var pageIndex = _pageIndex;
    if(!isLoadMore){
      pageIndex = 0;
    }
    DataUtils.getIndexListData().then((result) {
      _pageIndex = pageIndex + 1;
      _isRequesting = false;
      List<IndexCell> resultList = new List();
      if (isLoadMore) {
        resultList.addAll(_listData);
      }
      resultList.addAll(result);
      if (this.mounted) {
        setState(() {
          _listData = resultList;
          _hasMore = _pageIndex<pageIndexArray.length;
        });
      }
    });
    return null;
  }

  Widget _renderList(context, index){
    if(index + 1 == _listData.length){
      return LoadMore(hasMore: this._hasMore);
    }
    return IndexListCell(cellInfo: _listData[index]);
  }

  Future<void> _onRefresh() async {
    await _getList(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if(_listData == null || _listData.isEmpty){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
        child: Column(
          children: [
            IndexListHeader(
                hasLogin: true
            ),
            Expanded(
                child: Scrollbar(
                    child: ListView.builder(
                      itemCount: _listData.length,
                      itemBuilder: _renderList,
                      controller: _scrollController,
                    )
                )
            )
          ],
        ),
        onRefresh: _onRefresh
    );
  }
}