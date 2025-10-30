import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';

extension ArticlesMapper on Articles {
  ArticleEntity get getEntity => ArticleEntity(
    description: this.description,
    publishedAt: this.publishedAt,
    title: this.title,
    url: this.url,
    urlToImage: this.urlToImage,
  );
}
