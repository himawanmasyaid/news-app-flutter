import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/domain/usecase/news_use_case.dart';

class NewsUseCaseImpl implements NewsUseCase {
  final NewsRepository _repository;

  NewsUseCaseImpl(this._repository);

  @override
  Future<List<ArticleModel>> execute() {
    return _repository.getNewsSample();
  }
}
