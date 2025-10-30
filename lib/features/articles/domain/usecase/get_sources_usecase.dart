import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/network/response_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/repository/articles_repository.dart';

@injectable
class GetSourcesUsecase {
  final ArticlesRepository _articlesRepository;

  GetSourcesUsecase({required ArticlesRepository articlesRepository})
    : _articlesRepository = articlesRepository;
  Future<Response<List<SourceEntity>>> call(String catId) async =>
      _articlesRepository.getSources(catId);
}
