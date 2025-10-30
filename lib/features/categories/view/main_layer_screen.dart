import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16_7pm/common/service_locator/di/di.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/viewModel/articles_cubit.dart';
import 'package:news_app_c16_7pm/features/categories/data/enums/category_enum.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_cubit.dart';
import 'package:news_app_c16_7pm/features/articles/presentation/view/category_details_view.dart';
import 'package:news_app_c16_7pm/features/categories/view/views/category_list_view.dart';
import 'package:news_app_c16_7pm/features/categories/view/views/home_drawer_view.dart';

class MainLayerScreen extends StatelessWidget {
  static const String routeName = '/mainLayerScreen';
  const MainLayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => getIt<ArticlesCubit>(param1: true)),
      ],
      child: BlocBuilder<CategoryCubit, CategoryEnum?>(
        builder: (BuildContext context, CategoryEnum? state) => Scaffold(
          drawer: HomeDrawerView(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(state == null ? 'Home' : state.name),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          body: state == null ? CategoryListView() : CategoryDetailsView(),
        ),
      ),
    );
  }
}
//bloc builder->set state
//bloc listener->call function
//bloc consumer->