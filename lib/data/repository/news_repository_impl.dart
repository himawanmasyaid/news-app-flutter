import 'package:news_app_flutter/data/datasources/news_remote_data_source.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/network/network_provider.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkProvider _networkProvider;
  final NewsRemoteDataSource _dataSource;

  NewsRepositoryImpl(this._networkProvider, this._dataSource);

  @override
  Future<List<ArticleModel>> fetchNews() async {
    final response = await _networkProvider.fetchTopHeadlines();
    return response['articles']
        .map((json) => ArticleModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ArticleModel>> fetchNewsByCategory(String category) async {
    final response = await _networkProvider.fetchNewsByCategory(category);
    return response['articles']
        .map((json) => ArticleModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ArticleModel>> fetchNewsByCountry(String country) async {
    final response = await _networkProvider.fetchNewsByCountry(country);
    return response['articles']
        .map((json) => ArticleModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ArticleModel>> getNewsSample() {
    return _dataSource.getNewsSample();
  }
}
