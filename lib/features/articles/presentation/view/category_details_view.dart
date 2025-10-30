import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/source_entity.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/viewModel/articles_cubit.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/viewModel/articles_state.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_cubit.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/view/widgets/article_card.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, ArticlesState viewModel) {
        switch (viewModel) {
          case ArticlesInitialState():
          case SourcesLoadingState():
            return Center(child: CircularProgressIndicator());

          case SourcesEmptyState():
            return Center(child: Text('no sources found'));

          case SourcesErrorState():
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(viewModel.failureModel.toString()),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      String catName = context
                          .read<CategoryCubit>()
                          .state!
                          .name;
                      context.read<ArticlesCubit>().getSources(catName);
                    },
                    label: Text('reload'),
                    icon: Icon(Icons.replay_outlined),
                  ),
                ],
              ),
            );

          case SourcesSuccessState():
          case ArticlesLoadingState():
          case ArticlesSuccessState():
          case ArticlesEmptyState():
          case ArticlesError():
            late List<SourceEntity> sources;

            if (viewModel is SourcesSuccessState) {
              sources = viewModel.sources;
            } else if (viewModel is ArticlesLoadingState) {
              sources = viewModel.sources;
            } else if (viewModel is ArticlesSuccessState) {
              sources = viewModel.sources;
            } else if (viewModel is ArticlesEmptyState) {
              sources = viewModel.sources;
            } else if (viewModel is ArticlesError) {
              sources = viewModel.sources;
            }

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
                        (index) => NewsList(
                          sourceId: sources[index].id!,
                          sources: sources,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId, required this.sources});
  final String sourceId;
  final List<SourceEntity> sources;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticlesCubit>().getArticles(
        widget.sourceId,
        widget.sources,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, ArticlesState viewModel) {
        if (viewModel is ArticlesLoadingState ||
            viewModel is SourcesSuccessState) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel is ArticlesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(viewModel.failureModel.toString()),
                ),
                TextButton.icon(
                  onPressed: () {
                    // context.read<ArticlesProvider>().getArticles(
                    //   widget.sourceId,
                    // );
                  },
                  label: Text('reload'),
                  icon: Icon(Icons.replay_outlined),
                ),
              ],
            ),
          );
        } else if (viewModel is ArticlesEmptyState) {
          return Center(child: Text('no Articles found!'));
        }
        late List<ArticleEntity> articles;
        if (viewModel is ArticlesSuccessState) {
          articles = viewModel.articles;
        }
        if (articles.isEmpty) {
          return Center(child: Text('No articles'));
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesCubit>().getArticles(
              widget.sourceId,
              widget.sources,
            );
          },
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                ArticleCard(article: articles[index]),
          ),
        );
      },
    );
  }
}
