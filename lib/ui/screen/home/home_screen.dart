import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/data/constants.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_bloc.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_event.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_state.dart';
import 'package:news_app_flutter/ui/screen/home/news_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('${Asset.image}news_api_logo.png',
            width: 70, height: 60),
        elevation: 1.0,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage!.isNotEmpty) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return NewsListView(articles: state.articles);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NewsBloc>().add(GetNewsEventSample());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
