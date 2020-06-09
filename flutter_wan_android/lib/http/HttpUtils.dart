import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/http/Api.dart';
import 'package:wanandroid/http/BaseModel.dart';

BaseOptions _options = BaseOptions(
    connectTimeout:5000,
    sendTimeout: 5000,
    receiveTimeout:3000
);

class HttpUtils{
  static const String GET = "get";
  static const String POST = "post";
  static final Dio _dio = Dio(_options);

  static Future<BaseModel> get(String url, {Map<String, String> params, Map<String, String> headers}) async {
    return await _request(url, GET, params: params, headers: headers);
  }

  static Future<BaseModel> post(String url, {Map<String, String> params, Map<String, String> headers}) async {
    return await _request(url, POST, params: params, headers: headers);
  }

  static Future<BaseModel> _request(String url, String method, {Map<String, String> params, Map<String, String> headers}) async {
    if(!url.startsWith(Api.baseUrl)){
      url = Api.baseUrl + url;
    }
    debugPrint(url);
    BaseModel model = new BaseModel();
    try{
      Response<Map<String, dynamic>>  res;
      if(POST == method){
        res = await _dio.post<Map<String, dynamic>>(url, data: params, options: Options(headers: headers));
      }else{
        res = await _dio.get<Map<String, dynamic>>(url, queryParameters: params, options: Options(headers: headers));
      }
      debugPrint(res.toString());
      model.errorCode = res?.data["errorCode"];
      model.errorMsg = res?.data["errorMsg"];
      model.data = res?.data["data"];
    }catch(e, s){
      model.errorCode = 1;
      model.errorMsg = "exception";
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    return model;
  }
}


