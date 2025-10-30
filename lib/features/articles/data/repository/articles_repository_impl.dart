import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/error/failure_model.dart';
import 'package:news_app_c16_7pm/common/network/response_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app_c16_7pm/features/articles/data/mapper/articles_mapper.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/repository/articles_repository.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesDataSource _articlesDataSource;

  ArticlesRepositoryImpl({required ArticlesDataSource articlesDataSource})
    : _articlesDataSource = articlesDataSource;
  @override
  Future<Response<List<ArticleEntity>>> getArticles(String sourceID) async {
    ArticlesListModel articlesListModel = await _articlesDataSource.getArticles(
      sourceID,
    );
    return Success<List<ArticleEntity>>(
      data: (articlesListModel.articles ?? []).map((e) => e.getEntity).toList(),
    );
    // try {
    //   ArticlesListModel articlesListModel = await _articlesDataSource
    //       .getArticles(sourceID);
    //   return Success<List<ArticleEntity>>(
    //     data: (articlesListModel.articles ?? [])
    //         .map((e) => e.getEntity)
    //         .toList(),
    //   );
    // } on FailureModel catch (e) {
    //   return Failure(failure: e);
    // } catch (e) {
    //   return Failure(failure: BaseError(errorMessage: e.toString()));
    // }
  }

  @override
  Future<Response<List<SourceEntity>>> getSources(String catId) async {
    try {
      SourcesModel sourcesModel = await _articlesDataSource.getSources(catId);
      return Success(data: sourcesModel.sources ?? []);
    } on FailureModel catch (e) {
      return Failure(failure: e);
    } catch (e) {
      return Failure(failure: BaseError(errorMessage: e.toString()));
    }
  }
}
