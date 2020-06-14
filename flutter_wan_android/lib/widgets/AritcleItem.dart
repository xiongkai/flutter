import 'package:flutter/material.dart';
import 'package:wanandroid/model/article_entity.dart';
import 'package:wanandroid/routers/NavigatorUtil.dart';

class ArticleItem extends StatelessWidget{
  static final BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
          top: BorderSide(
              color: Colors.grey,
              width: 0.5
          )
      ),
  );
  final ArticleData articleData;

  const ArticleItem({Key key, this.articleData}) : super(key: key);

  _getAuthor(){
    var author = articleData.author;
    if(author != null && author.length != 0){
      return "作者：$author";
    }
    var shareUser = articleData.shareUser;
    return "分享者：$shareUser";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: InkWell(
          onTap: (){
            NavigatorUtil.getWebViewPage(context, articleData.title, articleData.link);
          },
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Offstage(
                      offstage: !articleData.fresh,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.red,
                                width: 0.5
                            )
                        ),
                        child: Text(
                          "新",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          child: Text(
                              articleData.title,
                              style: TextStyle(
                                  fontSize: 15
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                          ),
                        )
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    articleData.title*20,
                    style: TextStyle(
                        fontSize: 10,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        _getAuthor(),
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: Text(
                        "分类：${articleData.superChapterName}/${articleData.chapterName}",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: Text(
                        articleData.niceDate,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

}