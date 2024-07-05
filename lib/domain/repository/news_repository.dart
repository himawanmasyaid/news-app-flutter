import 'package:news_app_flutter/data/model/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> getNewsSample();
  Future<List<ArticleModel>> getArticles();
}
