import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsItemModal _news;

  NewsDetailPage(this._news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_news.title),
      ),
      body: Column(
        children: <Widget>[
          Text(_news.content)
        ],
      ),
    );
  }
}
