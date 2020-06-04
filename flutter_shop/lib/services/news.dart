import 'package:get_ip/get_ip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//获取新闻数据
getNewsResult() async {
  var address = await GetIp.ipAddress;

  String url = 'http://' + address + ':' + Config.PORT + '/?action=getNews';

  var res = await http.get(url);
  String body = res.body;

  var json= jsonDecode(body);
  print(json);

  return json['items'] as List;

}