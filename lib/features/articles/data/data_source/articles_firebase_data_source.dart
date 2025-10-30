import 'package:news_app_c16_7pm/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';

class ArticlesFirebaseDataSource extends ArticlesDataSource {
  @override
  Future<ArticlesListModel> getArticles(String sourceID) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<SourcesModel> getSources(String category) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
