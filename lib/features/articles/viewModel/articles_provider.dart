import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/features/articles/data/api_service.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';

class ArticlesProvider extends ChangeNotifier {
  SourcesModel? sourcesModel;
  ArticlesListModel? abstracts;
  bool sourcesLoading = false, articlesLoading = false;
  String? sourcesError, articleError;
  getSources(String categoryName) async {
    sourcesLoading = true;
    notifyListeners();
    try {
      SourcesModel sources = await ApiService.getSources(categoryName);
      sourcesModel = sources;
    } catch (e) {
      sourcesError = e.toString();
    }
    sourcesLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articlesLoading = true;
    notifyListeners();
    try {
      ArticlesListModel articlesListModel = await ApiService.getArticles(
        sourceId,
      );
      abstracts = articlesListModel;
    } catch (e) {
      articleError = e.toString();
    }

    articlesLoading = false;
    notifyListeners();
  }
}
