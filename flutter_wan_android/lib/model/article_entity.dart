import 'package:wanandroid/generated/json/base/json_convert_content.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	int curPage;
	List<ArticleData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ArticleData with JsonConvert<ArticleData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<ArticleTag> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class ArticleTag with JsonConvert<ArticleTag> {
	String name;
	String url;
}
