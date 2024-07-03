import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsRemoteDataSource {
  final http.Client _client = http.Client();
  final dioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
  );

  Future<List<ArticleModel>> fetchNews() async {
    // dioLogger.requestLogger.clear();
    final response = await _client.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?apiKey=YOUR_API_KEY'),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> jsonNews = jsonBody['articles'];
      return jsonNews.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<ArticleModel>> getNewsSample() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return [
      ArticleModel(
        author: "Author 1",
        title: "Title 1",
        description: "Description 1",
        url: "https://example.com/article1",
        urlToImage: "https://example.com/image1",
        publishedAt: "2022-01-01T12:00:00Z",
        content: "Content 1",
      ),
      ArticleModel(
        author: "Author 2",
        title: "Title 2",
        description: "Description 2",
        url: "https://example.com/article2",
        urlToImage: "https://example.com/image2",
        publishedAt: "2022-01-02T12:00:00Z",
        content: "Content 2",
      ),
      ArticleModel(
        author: "Author 3",
        title: "Title 3",
        description: "Description 3",
        url: "https://example.com/article3",
        urlToImage: "https://example.com/image3",
        publishedAt: "2022-01-03T12:00:00Z",
        content: "Content 3",
      ),
      ArticleModel(
        author: "Author 4",
        title: "Title 4",
        description: "Description 4",
        url: "https://example.com/article4",
        urlToImage: "https://example.com/image4",
        publishedAt: "2022-01-04T12:00:00Z",
        content: "Content 4",
      ),
      ArticleModel(
        author: "Author 5",
        title: "Title 5",
        description: "Description 5",
        url: "https://example.com/article5",
        urlToImage: "https://example.com/image5",
        publishedAt: "2022-01-05T12:00:00Z",
        content: "Content 5",
      ),
    ];
  }
}
