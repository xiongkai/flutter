import 'package:dio/dio.dart';
import 'package:wanandroid/http/Api.dart';

BaseOptions _options = BaseOptions(
    connectTimeout:5000,
    sendTimeout: 5000,
    receiveTimeout:3000
);

class HttpUtils{
  static const String GET = "get";
  static const String POST = "post";
  static final Dio _dio = Dio(_options);

  static Future get(String url, {Map<String, String> params, Map<String, String> headers}) async {
    if(!url.startsWith(Api.baseUrl)){
      url += Api.baseUrl;
    }
    if(params != null && params.isNotEmpty){
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key=$value&");
      });
      String paramsStr = sb.toString();
      paramsStr = paramsStr.substring(0, paramsStr.length - 1);
      url += paramsStr;
    }

  }

  static Future post(String url, {Map<String, String> params, Map<String, String> headers}) async {
    if(!url.startsWith(Api.baseUrl)){
      url += Api.baseUrl;
    }
  }

  static Future _request(String url, String method, {Map<String, String> params, Map<String, String> headers}) async {
    String errorMsg = "";
    int errorCode = 0;

    Map<String, String> headerMap = headers == null ? new Map() : headers;
    Map<String, String> paramMap = params == null ? new Map() : params;

    if(POST == method){

    }else{
      return
    }
  }
}


