import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/models/news_list_model.dart';
import 'package:news_app_c16_7pm/models/sources_model.dart';
import 'package:news_app_c16_7pm/network/api_service.dart';
import 'package:news_app_c16_7pm/providers/category_provider.dart';
import 'package:news_app_c16_7pm/screens/widgets/article_card.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesModel>(
      future: ApiService.getSources(
        context.read<CategoryProvider>().selectedCategory!.name,
      ),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        SourcesModel sourcesModel = asyncSnapshot.data!;
        List<Sources> sources = sourcesModel.sources ?? [];

        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    sources.length,
                    (index) => NewsList(sourceId: sources[index].id!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(widget.sourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(asyncSnapshot.error.toString()),
                ),
                TextButton.icon(
                  onPressed: () {
                    setState(() {});
                  },
                  label: Text('reload'),
                  icon: Icon(Icons.replay_outlined),
                ),
              ],
            ),
          );
        }
        NewsListModel newsListModel = asyncSnapshot.data!;
        List<Articles> articles = newsListModel.articles ?? [];
        if (articles.isEmpty) {
          return Center(child: Text('No articles'));
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleCard(articles: articles[index]),
        );
      },
    );
  }
}
