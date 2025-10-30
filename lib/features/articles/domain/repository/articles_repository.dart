import 'package:news_app_c16_7pm/common/network/response_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';

abstract class ArticlesRepository {
  Future<Response<List<ArticleEntity>>> getArticles(String sourceID);
  Future<Response<List<SourceEntity>>> getSources(String catId);
}
