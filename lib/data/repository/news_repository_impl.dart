import 'package:news_app_flutter/data/datasources/news_remote_data_source.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/network/network_provider.dart';

class NewsRepositoryImpl implements NewsRepository {
  // final NetworkProvider _networkProvider;
  // final NewsRemoteDataSource _dataSource;

  // NewsRepositoryImpl(this._networkProvider, this._dataSource);

  // @override
  // Future<List<ArticleModel>> fetchNews() async {
  //   final response = await _networkProvider.fetchTopHeadlines();
  //   return response['articles']
  //       .map((json) => ArticleModel.fromJson(json))
  //       .toList();
  // }

  // @override
  // Future<List<ArticleModel>> fetchNewsByCategory(String category) async {
  //   final response = await _networkProvider.fetchNewsByCategory(category);
  //   return response['articles']
  //       .map((json) => ArticleModel.fromJson(json))
  //       .toList();
  // }

  // @override
  // Future<List<ArticleModel>> fetchNewsByCountry(String country) async {
  //   final response = await _networkProvider.fetchNewsByCountry(country);
  //   return response['articles']
  //       .map((json) => ArticleModel.fromJson(json))
  //       .toList();
  // }

  @override
  Future<List<ArticleModel>> getNewsSample() {
    throw UnimplementedError();
    // return _dataSource.getNewsSample();
  }

  @override
  Future<List<ArticleModel>> getArticles() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ArticleModel(
        author: 'Author 1',
        title: 'Title 1',
        description: 'Description 1',
        url: 'https://example.com/article1',
        urlToImage: 'https://example.com/image1',
        publishedAt: '2022-01-01',
        content: 'Content 1',
      ),
      ArticleModel(
        author: 'Author 2',
        title: 'Title 2',
        description: 'Description 2',
        url: 'https://example.com/article2',
        urlToImage: 'https://example.com/image2',
        publishedAt: '2022-01-02',
        content: 'Content 2',
      ),
      // Add more articles here
    ];
  }
}
