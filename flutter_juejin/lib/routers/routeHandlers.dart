import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/detailPage.dart';
import '../pages/myApp.dart';
import '../pages/notFoundPage.dart';

/// NotFound
var notFoundHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return NotFoundPage();
    }
);

/// 跳转到主页
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MyApp();
    }
);

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String articleUrl = params['articleUrl']?.first;
      String title = params['title']?.first;
      return DetailPage(title: title, articleUrl: articleUrl);
    }
);
