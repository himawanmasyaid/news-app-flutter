import 'package:news_app_flutter/data/model/article_model.dart';

abstract class NewsUseCase {
  Future<List<ArticleModel>> execute();
}
