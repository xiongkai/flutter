import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import '../model/indexCell.dart';

class DataUtils {
  static Future<String> _loadIndexListAsset() async {
    return await rootBundle.loadString('assets/indexListData.json');
  }

  static Future<List<IndexCell>> getIndexListData() async {
    List<IndexCell> resultList = new List();
    String jsonString = await _loadIndexListAsset();
    final jsonResponseList = json.decode(jsonString)['indexListData'];
    for(int i = 0;i<jsonResponseList.length;i++){
      // resultList.add();
      IndexCell cellData = new IndexCell.fromJson(jsonResponseList[i]);
      resultList.add(cellData);
    }
    return resultList;
  }
}