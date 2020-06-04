import 'package:flutter/material.dart';

class GoodsListModel with ChangeNotifier{
  List<Map<String, dynamic>> goods = List.generate(3, (index) => {
    "save": false, "text": "Good No.$index"
  });

  List<Map<String, dynamic>> get goodsList => goods;

  int get total => goods.length;

  void collect(index){
    var good = goods[index];
    goods[index] = {"save": !good["save"], "text": good["text"]};
    notifyListeners();
  }
}