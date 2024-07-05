import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:news_app_flutter/common/logger.dart';
import 'package:news_app_flutter/data/model/article_model.dart';
import 'package:news_app_flutter/data/repository/news_repository_impl.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';
import 'package:news_app_flutter/bloc/article/article_event.dart';
import 'package:news_app_flutter/bloc/article/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NewsRepositoryImpl _repository;

  ArticleBloc(this._repository) : super(const ArticleState()) {
    on<LoadArticlesEvent>(_mapLoadArticlesEventToState);
  }

  Future<void> _mapLoadArticlesEventToState(
    LoadArticlesEvent event,
    Emitter<ArticleState> emit,
  ) async {
    setLog('loading');
    emit(ArticleState.loading());
    try {
      final articles = await _repository.getArticles();
      setLog('success : $articles');
      emit(ArticleState.success(articles));
    } catch (e) {
      final error = e.toString();
      setLog('error : $error');
      emit(ArticleState.error(e.toString()));
    }
  }
}
