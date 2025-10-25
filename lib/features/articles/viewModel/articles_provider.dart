import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/common/error/failure_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/api_service.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';

class ArticlesProvider extends ChangeNotifier {
  SourcesModel? sourcesModel;
  ArticlesListModel? abstracts;
  bool sourcesLoading = false, articlesLoading = false;
  FailureModel? sourcesError, articleError;
  getSources(String categoryName) async {
    sourcesError = null;
    sourcesLoading = true;
    notifyListeners();
    try {
      SourcesModel sources = await ApiService.getSources(categoryName);
      sourcesModel = sources;
    } on FailureModel catch (e) {
      sourcesError = e;
    }
    sourcesLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articleError = null;
    articlesLoading = true;
    notifyListeners();
    try {
      ArticlesListModel articlesListModel = await ApiService.getArticles(
        sourceId,
      );
      abstracts = articlesListModel;
    } on FailureModel catch (e) {
      articleError = e;
    }

    articlesLoading = false;
    notifyListeners();
  }
}
