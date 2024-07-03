import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/ui/screen/home/news_item.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleItem(article: articles[index]);
      },
    );
  }
}
