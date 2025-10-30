import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c16_7pm/common/error/failure_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';
import 'package:news_app_c16_7pm/common/network/network_consts.dart';

@LazySingleton(as: ArticlesDataSource)
class ArticlesApiDataSource extends ArticlesDataSource {
  final Dio _dio;

  ArticlesApiDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<SourcesModel> getSources(String category) async {
    try {
      Response response = await _dio.get(
        NetworkConsts.sourcesEndPoint,
        queryParameters: {'apiKey': NetworkConsts.apiKey, 'category': category},
      );
      SourcesModel sourcesModel = SourcesModel.fromJson(response.data);

      if (response.statusCode == 200 && sourcesModel.status == 'ok') {
        return sourcesModel;
      } else {
        throw BaseError(
          errorMessage: sourcesModel.message ?? 'something went wrong',
          errorCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkMessage(e);
    }
  }

  @override
  Future<ArticlesListModel> getArticles(String sourceID) async {
    try {
      Response response = await _dio.get(
        NetworkConsts.newsEndPoint,
        queryParameters: {'sources': sourceID, 'apiKey': NetworkConsts.apiKey},
      );
      ArticlesListModel articleModel = ArticlesListModel.fromJson(
        response.data,
      );
      if (articleModel.status == 'ok' && response.statusCode == 200) {
        return articleModel;
      } else {
        throw BaseError(
          errorMessage: articleModel.message ?? 'something went wrong',
          errorCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkMessage(e);
    }
  }
}
