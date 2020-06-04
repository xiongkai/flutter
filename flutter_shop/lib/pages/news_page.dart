import 'package:flutter/material.dart';
import '../pages/news_detail_page.dart';
import '../model/news.dart';
import '../services/news.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  ScrollController _controller = ScrollController();
  NewsListModal _news = NewsListModal([]);

  void getNextPage() async {
    var data = await getNewsResult();
    var news = NewsListModal.fromJson(data);
    setState(() {
      _news.data.addAll(news.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNextPage();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑动到了最底部');
        getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.separated(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: _news.data.length,
        itemBuilder: (context, index) {
          NewsItemModal news = _news.data[index];
          return FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailPage(news)));
              },
              child: ListTile(
                enabled: true,
                title: Text(news.title),
                subtitle: Text(news.content),
                leading: Icon(Icons.fiber_new),
                contentPadding: EdgeInsets.all(5.0),
              ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
