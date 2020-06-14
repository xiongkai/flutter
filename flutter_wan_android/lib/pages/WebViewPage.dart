import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wanandroid/widgets/PageLoading.dart';

class WebViewPage extends StatefulWidget{
  final String title;
  final String url;

  WebViewPage(this.title, this.url);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

const kAndroidUserAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

final flutterWebViewPlugin = FlutterWebviewPlugin();

class _WebViewPageState extends State<WebViewPage>{
  static final BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
          top: BorderSide(
              color: Colors.grey,
              width: 0.5
          )
      )
  );

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      hidden: true,
      withZoom: true,
      withLocalStorage: true,
      initialChild: PageLoading(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        flutterWebViewPlugin.goBack();
                      },
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        flutterWebViewPlugin.goForward();
                      },
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.autorenew),
                      onPressed: () {
                        flutterWebViewPlugin.reload();
                      },
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}