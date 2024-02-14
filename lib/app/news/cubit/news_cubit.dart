import 'package:tofan/app/news/data/models/news_response.dart';
import 'package:tofan/app/news/data/repos/news_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_state.dart';
part 'news_cubit.freezed.dart';

// var logger = Logger();

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState.initial()) {
    //logger.d("Logger is working!");
    init();
  }
  Future<void> init() async {
    getNews();
  }

  void getNews() async {
    emit(const NewsState.loading());
    final login = await NewsRepo().getNews();
    login.when(
      success: (res) {
        try {
          emit(NewsState.success(res
              .map<NewsResponse>(
                (e) => NewsResponse.fromJson(e),
              )
              .toList()));
        } catch (e) {
          //logger.e(e);
        }
      },
      failure: (error) {
        emit(const NewsState.error());
      },
    );
  }
}
