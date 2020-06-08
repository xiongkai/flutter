import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../routers/navigatoUtil.dart';

class DetailPage extends StatefulWidget{
  final String articleUrl;
  final String title;

  DetailPage({Key key, this.articleUrl, this.title}): super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((event) {
      if(event.type == WebViewState.finishLoad){
        setState(() {
          hasLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            NavigatorUtil.back(context);
          },
          icon: Icon(Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(widget.title,
          style: TextStyle(
              color: Theme.of(context).primaryColor
          ),
        ),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
      hidden: !hasLoaded,
      url: widget.articleUrl,
    );
  }
}