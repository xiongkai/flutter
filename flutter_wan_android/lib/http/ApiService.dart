import 'package:wanandroid/generated/json/article_entity_helper.dart';
import 'package:wanandroid/generated/json/banner_entity_helper.dart';
import 'package:wanandroid/http/Ack.dart';
import 'package:wanandroid/http/Api.dart';
import 'package:wanandroid/http/HttpUtils.dart';
import 'package:wanandroid/model/BaseModel.dart';
import 'package:wanandroid/model/article_entity.dart';
import 'package:wanandroid/model/banner_entity.dart';

class ApiService{

  static Future<BaseModel<List<BannerEntity>>> getBannerList() async {
    ACK ack = await HttpUtils.get(Api.BANNER);
    BaseModel<List<BannerEntity>> model = BaseModel.fromJson(ack);
    if(ack.errorCode == 0){
      List bannerListJson = ack.data;
      List<BannerEntity>  bannerList = List();
      bannerListJson.forEach((json) {
        bannerList.add(bannerEntityFromJson(BannerEntity(), json));
      });
      model.data = bannerList;
    }
    return model;
  }

  static Future<BaseModel<ArticleEntity>> getArticleList(int pageIndex) async {
    String articleUrl = "${Api.ARTICLE_LIST}$pageIndex/json";
    ACK ack = await HttpUtils.get(articleUrl);
    BaseModel<ArticleEntity> model = BaseModel.fromJson(ack);
    if(ack.errorCode == 0){
      Map<String, dynamic> articleJson = ack.data;
      model.data = articleEntityFromJson(ArticleEntity(), articleJson);
    }
    return model;
  }
}