import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/domain/usecase/news_use_case.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_event.dart';
import 'package:news_app_flutter/ui/screen/home/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase _newsUseCase;

  NewsBloc({required NewsUseCase newsUseCase})
      : _newsUseCase = newsUseCase,
        super(NewsState());

  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    yield* _mapGetNewsEventToState();
  }

  Stream<NewsState> _mapGetNewsEventToState() async* {
    yield NewsState.loading();

    try {
      final articles = await _newsUseCase.execute();
      yield NewsState.success(articles);
    } catch (e) {
      yield NewsState.error(e.toString());
    }
  }
}
