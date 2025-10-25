import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/features/articles/viewModel/articles_provider.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/news_list_model.dart';
import 'package:news_app_c16_7pm/features/articles/data/models/sources_model.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_provider.dart';
import 'package:news_app_c16_7pm/features/articles/view/widgets/article_card.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.sourcesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.sourcesError != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(viewModel.sourcesError!.toString()),
                ),
                TextButton.icon(
                  onPressed: () {
                    String catName = context
                        .read<CategoryProvider>()
                        .selectedCategory!
                        .name;
                    context.read<ArticlesProvider>().getSources(catName);
                  },
                  label: Text('reload'),
                  icon: Icon(Icons.replay_outlined),
                ),
              ],
            ),
          );
        }
        SourcesModel sourcesModel = viewModel.sourcesModel!;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticlesProvider>().getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.articlesLoading || viewModel.abstracts == null) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.articleError != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(viewModel.articleError.toString()),
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<ArticlesProvider>().getArticles(
                      widget.sourceId,
                    );
                  },
                  label: Text('reload'),
                  icon: Icon(Icons.replay_outlined),
                ),
              ],
            ),
          );
        }
        ArticlesListModel newsListModel = viewModel.abstracts!;
        List<Articles> articles = newsListModel.articles ?? [];
        if (articles.isEmpty) {
          return Center(child: Text('No articles'));
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesProvider>().getArticles(widget.sourceId);
          },
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                ArticleCard(articles: articles[index]),
          ),
        );
      },
    );
  }
}
