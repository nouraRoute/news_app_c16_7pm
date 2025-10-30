import 'package:news_app_c16_7pm/common/error/failure_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';

sealed class ArticlesState {}

class ArticlesInitialState extends ArticlesState {}

class SourcesLoadingState extends ArticlesState {}

class SourcesSuccessState extends ArticlesState {
  final List<SourceEntity> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesEmptyState extends ArticlesState {}

class SourcesErrorState extends ArticlesState {
  final FailureModel failureModel;

  SourcesErrorState({required this.failureModel});
}

//loading articles
//articles success
//empty articles
//articles error

class ArticlesLoadingState extends ArticlesState {
  final List<SourceEntity> sources;

  ArticlesLoadingState({required this.sources});
}

class ArticlesSuccessState extends ArticlesState {
  final List<SourceEntity> sources;
  final List<ArticleEntity> articles;

  ArticlesSuccessState({required this.sources, required this.articles});
}

class ArticlesEmptyState extends ArticlesState {
  final List<SourceEntity> sources;

  ArticlesEmptyState({required this.sources});
}

class ArticlesError extends ArticlesState {
  final List<SourceEntity> sources;
  final FailureModel failureModel;

  ArticlesError({required this.sources, required this.failureModel});
}
