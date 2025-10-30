import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';

abstract class ArticlesDataSource {
  Future<SourcesModel> getSources(String category);
  Future<ArticlesListModel> getArticles(String sourceID);
}
