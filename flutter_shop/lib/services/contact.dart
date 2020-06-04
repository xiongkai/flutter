import 'package:http/http.dart' as http;
import 'package:get_ip/get_ip.dart';
import 'dart:convert';
import '../conf/configure.dart';

//给我们留言
contactCompany(String msg) async {
  var address = await GetIp.ipAddress;

  String url = 'http://' + address + ':' + Config.PORT + '/?action=contactCompany&msg=$msg';

  var res = await http.get(url);
  String body = res.body;

  var info = body;
  print(info);

  return info;

}