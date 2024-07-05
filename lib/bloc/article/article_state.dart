import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_flutter/data/model/article_model.dart';

class ArticleState {
  final List<ArticleModel> articles;
  final String? error;
  final bool isLoading;

  const ArticleState(
      {this.articles = const [], this.isLoading = false, this.error});

  factory ArticleState.loading() => const ArticleState(isLoading: true);
  factory ArticleState.success(List<ArticleModel> articles) =>
      ArticleState(articles: articles);
  factory ArticleState.error(String error) => ArticleState(error: error);
}
