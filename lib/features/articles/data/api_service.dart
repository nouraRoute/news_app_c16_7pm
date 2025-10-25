import 'package:dio/dio.dart';
import 'package:news_app_c16_7pm/common/error/failure_model.dart';
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
        throw BaseError(
          errorMessage: sourcesModel.message ?? 'something went wrong',
          errorCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkMessage(e);
    } catch (e) {
      throw BaseError(errorMessage: e.toString());
    }
  }

  static Future<ArticlesListModel> getArticles(String sourceID) async {
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
    } catch (e) {
      throw BaseError(errorMessage: e.toString());
    }
  }
}
