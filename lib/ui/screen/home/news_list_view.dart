import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/bloc/article/article_event.dart';
import 'package:news_app_flutter/common/logger.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/bloc/article/article_state.dart';
import 'package:news_app_flutter/ui/screen/home/news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ArticleBloc>().add(LoadArticlesEvent());

    setLog("halo news list view");
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state.isLoading) {
          setLog("loading state");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              setLog("success state");
              return ArticleItem(article: state.articles[index]);
            },
          );
        }
      },
    );
  }
}
