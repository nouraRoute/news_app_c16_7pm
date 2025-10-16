import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/providers/category_provider.dart';
import 'package:news_app_c16_7pm/screens/views/category_details_view.dart';
import 'package:news_app_c16_7pm/screens/views/category_list_view.dart';
import 'package:news_app_c16_7pm/screens/views/home_drawer_view.dart';
import 'package:provider/provider.dart';

class MainLayerScreen extends StatelessWidget {
  static const String routeName = '/mainLayerScreen';
  const MainLayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
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
