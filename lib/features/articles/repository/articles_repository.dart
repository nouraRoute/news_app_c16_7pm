import 'package:news_app_c16_7pm/common/error/failure_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/articles_data_source.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';

class ArticlesRepository {
  final ArticlesDataSource articlesDataSource;

  ArticlesRepository({required this.articlesDataSource});
  Future<SourcesModel> getSources(String categoryName) async {
    try {
      return await articlesDataSource.getSources(categoryName);
    } catch (e) {
      throw FailureModel.getBaseErrors();
    }
  }

  Future<ArticlesListModel> getArticles(String sourceID) async {
    try {
      return await articlesDataSource.getArticles(sourceID);
    } catch (e) {
      throw FailureModel.getBaseErrors();
    }
  }
}
