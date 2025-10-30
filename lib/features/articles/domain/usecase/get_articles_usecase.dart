import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/network/response_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/repository/articles_repository.dart';

@injectable
class GetArticlesUsecase {
  final ArticlesRepository _articlesRepository;

  GetArticlesUsecase({required ArticlesRepository articlesRepository})
    : _articlesRepository = articlesRepository;
  Future<Response<List<ArticleEntity>>> call(String sourceID) async =>
      _articlesRepository.getArticles(sourceID);
}
