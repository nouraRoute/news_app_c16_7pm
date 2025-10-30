import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/network/response_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/usecase/get_articles_usecase.dart';
import 'package:news_app_c16_7pm/features/articles/domain/usecase/get_sources_usecase.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/viewModel/articles_state.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this._getArticlesUsecase, this._getSourcesUsecase)
    : super(ArticlesInitialState());
  final GetArticlesUsecase _getArticlesUsecase;
  final GetSourcesUsecase _getSourcesUsecase;
  getSources(String categoryName) async {
    emit(SourcesLoadingState());
    Response<List<SourceEntity>> response = await _getSourcesUsecase(
      categoryName,
    );
    switch (response) {
      case Success<List<SourceEntity>>():
        emit(SourcesSuccessState(sources: response.data));

      case Failure<List<SourceEntity>>():
        emit(SourcesErrorState(failureModel: response.failure));
    }
  }

  getArticles(String sourceId, List<SourceEntity> sources) async {
    emit(ArticlesLoadingState(sources: sources));
    Response<List<ArticleEntity>> response = await _getArticlesUsecase(
      sourceId,
    );
    switch (response) {
      case Success<List<ArticleEntity>>():
        emit(ArticlesSuccessState(sources: sources, articles: response.data));
      case Failure<List<ArticleEntity>>():
        emit(ArticlesError(sources: sources, failureModel: response.failure));
    }
  }
}
