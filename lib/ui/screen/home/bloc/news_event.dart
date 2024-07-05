import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/data/model/article_model.dart';

abstract class NewsEvent {
  final List<ArticleModel> article;

  NewsEvent(this.article);
}
