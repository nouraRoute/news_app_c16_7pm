import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/common/service_locator/service_locator.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_provider.dart';
import 'package:news_app_c16_7pm/features/articles/view/category_details_view.dart';
import 'package:news_app_c16_7pm/features/categories/view/views/category_list_view.dart';
import 'package:news_app_c16_7pm/features/categories/view/views/home_drawer_view.dart';
import 'package:provider/provider.dart';

class MainLayerScreen extends StatelessWidget {
  static const String routeName = '/mainLayerScreen';
  const MainLayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(
          create: (context) => ServiceLocator.articlesProvider,
        ),
      ],
      child: Consumer<CategoryProvider>(
        builder:
            (BuildContext context, CategoryProvider provider, Widget? child) =>
                Scaffold(
                  drawer: HomeDrawerView(),
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      provider.selectedCategory == null
                          ? 'Home'
                          : provider.selectedCategory!.name,
                    ),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ],
                  ),
                  body: provider.selectedCategory == null
                      ? CategoryListView()
                      : CategoryDetailsView(),
                ),
      ),
    );
  }
}
