import 'package:news_app_flutter/data/model/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> fetchNews();
  Future<List<ArticleModel>> fetchNewsByCategory(String category);
  Future<List<ArticleModel>> fetchNewsByCountry(String country);
  Future<List<ArticleModel>> getNewsSample();
}
