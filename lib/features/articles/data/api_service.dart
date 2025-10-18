import 'package:dio/dio.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';
import 'package:news_app_c16_7pm/common/network/network_consts.dart';

class ApiService {
  static Dio _dio = Dio(BaseOptions(baseUrl: NetworkConsts.baseUrl));
  //get sources ->category
  //get news list ->source
  static Future<SourcesModel> getSources(String category) async {
    try {
      Response response = await _dio.get(
        NetworkConsts.sourcesEndPoint,
        queryParameters: {'apiKey': NetworkConsts.apiKey, 'category': category},
      );
      SourcesModel sourcesModel = SourcesModel.fromJson(response.data);

      if (response.statusCode == 200 && sourcesModel.status == 'ok') {
        return sourcesModel;
      } else {
        throw sourcesModel.message ?? 'something went wrong';
      }
    } on DioException catch (e) {
      throw e.message ?? 'something went wrong';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ArticlesListModel> getArticles(String sourceID) async {
    try {
      Response response = await _dio.get(
        NetworkConsts.newsEndPoint,
        queryParameters: {'sources': sourceID, 'apiKey': NetworkConsts.apiKey},
      );
      ArticlesListModel newsModel = ArticlesListModel.fromJson(response.data);
      if (newsModel.status == 'ok' && response.statusCode == 200) {
        return newsModel;
      } else {
        throw newsModel.message ?? 'someThegn went wrong';
      }
    } on DioException catch (e) {
      throw e.message ?? 'something went wrong';
    } catch (e) {
      throw e.toString();
    }
  }
}
