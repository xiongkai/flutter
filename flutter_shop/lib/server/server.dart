import 'package:get_ip/get_ip.dart';
import 'dart:convert';
import 'dart:io';
import 'data.dart';



startServer() async {
  var address = await GetIp.ipAddress;
  var requestServer = await HttpServer.bind(address, 8080);
  print('http服务启动起来$address');
  //处理请求
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      handleGET(request);
    }
  } catch (e) {
    print('捕获了一个异常: $e');
  }
}

void handleGET(HttpRequest request) {
  //获取请求参数
  var action = request.uri.queryParameters['action'];

  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];

    print('第$page页数据:' + json.encode(products));

    print('获取产品数据...');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  } else if (action == 'getNews') {
    print('获取新闻数据...');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(news))
      ..close();
  } else if (action == 'contactCompany') {
    var msg = request.uri.queryParameters['msg'];

    print('客户留言为:$msg');
    request.response
      ..statusCode = HttpStatus.ok
      ..write('提交成功:$msg')
      ..close();
  }
}

void handlePOST(HttpRequest request) {
  //处理POST请求
}

abstract class HttpStatus {
//继续
  static const int continue_ = 100;
//交换协议
  static const int switchingProtocols = 101;
//可以
  static const int ok = 200;
//已创建
  static const int created = 201;
//认可的
  static const int accepted = 202;
//非授权信息
  static const int nonAuthoritativeInformation = 203;
//没有内容
  static const int noContent = 204;
//重置内容
  static const int resetContent = 205;
//部分内容
  static const int partialContent = 206;
//多项选择
  static const int multipleChoices = 300;
//永久迁移
  static const int movedPermanently = 301;
//已发现
  static const int found = 302;
//临时迁移
  static const int movedTemporarily = 302; // Common alias for found.
//查看其它
  static const int seeOther = 303;
//未修改的
  static const int notModified = 304;
//使用代理
  static const int useProxy = 305;
//暂时重定向
  static const int temporaryRedirect = 307;
//请求失败
  static const int badRequest = 400;
//没有授权
  static const int unauthorized = 401;
//要求付款
  static const int paymentRequired = 402;
//被禁止
  static const int forbidden = 403;
//未找到
  static const int notFound = 404;
//请求方法不允许
  static const int methodNotAllowed = 405;
//不接受
  static const int notAcceptable = 406;
//需要代理身份认证
  static const int proxyAuthenticationRequired = 407;
//请求超时
  static const int requestTimeout = 408;
//冲突
  static const int conflict = 409;
//过去了
  static const int gone = 410;
//长度要求
  static const int lengthRequired = 411;
//先决条件失败
  static const int preconditionFailed = 412;
//请求实体过大
  static const int requestEntityTooLarge = 413;
//请求地址过长
  static const int requestUriTooLong = 414;
//非支持的媒体类型
  static const int unsupportedMediaType = 415;
//请求范围不可满足
  static const int requestedRangeNotSatisfiable = 416;
//期望失败
  static const int expectationFailed = 417;
//升级要求
  static const int upgradeRequired = 426;
//内部服务器错误
  static const int internalServerError = 500;
//未实现
  static const int notImplemented = 501;
//网关坏了
  static const int badGateway = 502;
//服务不可用
  static const int serviceUnavailable = 503;
//网关超时
  static const int gatewayTimeout = 504;
//http版本不支持
  static const int httpVersionNotSupported = 505;
// 连接超时
  static const int networkConnectTimeoutError = 599;
}
