import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/data/constants.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/data/repository/news_repository_impl.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/bloc/article/article_event.dart';
import 'package:news_app_flutter/bloc/article/article_state.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_bloc.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_event.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_state.dart';
import 'package:news_app_flutter/ui/screen/home/news_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // context.read<ArticleBloc>().add(LoadArticlesEvent());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('${Asset.image}news_api_logo.png',
            width: 70, height: 60),
        elevation: 1.0,
        backgroundColor: Colors.black,
      ),

      // to show sample list data
      // body: NewsListView(
      //   articles: [
      //     ArticleModel(
      //       author: "Author 1",
      //       title: "Title 1",
      //       description: "Description 1",
      //       url: "https://example.com/article1",
      //       urlToImage: "https://example.com/image1",
      //       publishedAt: "2022-01-01T12:00:00Z",
      //       content: "Content 1",
      //     ),
      //     ArticleModel(
      //       author: "Author 1",
      //       title: "Title 1",
      //       description: "Description 1",
      //       url: "https://example.com/article1",
      //       urlToImage: "https://example.com/image1",
      //       publishedAt: "2022-01-01T12:00:00Z",
      //       content: "Content 1",
      //     ),
      //   ],
      // ),

      // to show data sample form news repository
      body: BlocProvider(
        create: (_) => ArticleBloc(NewsRepositoryImpl()),
        // child: const Center(child: CircularProgressIndicator()),
        child: const NewsListView(),
      ),
    );
  }
}
