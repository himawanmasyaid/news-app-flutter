import 'package:news_app_flutter/data/model/article_model.dart';

class NewsState {
  final List<ArticleModel> articles;
  final bool isLoading;
  final String? errorMessage;

  NewsState(
      {this.articles = const [], this.isLoading = false, this.errorMessage});

  factory NewsState.initial() => NewsState();

  factory NewsState.loading() => NewsState(isLoading: true);

  factory NewsState.success(List<ArticleModel> articles) {
    return NewsState(articles: articles);
  }

  factory NewsState.error(String error) {
    return NewsState(errorMessage: error);
  }
}
