import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkProvider {
  final http.Client _client = http.Client();
  final String _apiKey = 'YOUR_API_KEY';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<dynamic> get(String url) async {
    final response = await _client.get(Uri.parse('$_baseUrl/$url'), headers: {
      'Authorization': 'Bearer $_apiKey',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }

  // Services

  Future<dynamic> fetchTopHeadlines() async {
    return get('top-headlines');
  }

  Future<dynamic> fetchNewsByCategory(String category) async {
    return get('top-headlines?category=$category');
  }

  Future<dynamic> fetchNewsByCountry(String country) async {
    return get('top-headlines?country=$country');
  }
}

// final newsApiProvider = NetworkProvider();

// Future<void> main() async {
//   final topHeadlines = await newsApiProvider.fetchTopHeadlines();
//   print(topHeadlines);

//   final techNews = await newsApiProvider.fetchNewsByCategory('technology');
//   print(techNews);

//   final usNews = await newsApiProvider.fetchNewsByCountry('us');
//   print(usNews);
// }
